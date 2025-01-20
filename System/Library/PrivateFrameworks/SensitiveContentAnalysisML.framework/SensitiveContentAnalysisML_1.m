void sub_25BFDC244(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::internal::LogMessage::LogMessage(uint64_t result, int a2, uint64_t a3, int a4)
{
  *(_DWORD *)result = a2;
  *(void *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(void *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  *(void *)(result + 24) = 0;
  return result;
}

std::string *google::protobuf::internal::LogMessage::operator<<(std::string *a1, const std::string::value_type *a2)
{
  return a1;
}

{
  std::string *v3;
  std::string::size_type v4;
  std::string::size_type v5;

  v3 = a1 + 1;
  v4 = *((void *)a2 + 1);
  if (a2[23] >= 0)
  {
    v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(const std::string::value_type **)a2;
    v5 = v4;
  }
  std::string::append(v3, a2, v5);
  return a1;
}

void *google::protobuf::internal::VersionString@<X0>(google::protobuf::internal *this@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%d.%d.%d", (int)this / 1000000, (int)this / 1000 % 1000, (int)this % 1000);
  __str[127] = 0;
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

const char **google::protobuf::internal::LogFinisher::operator=(int a1, const char **this)
{
  return google::protobuf::internal::LogMessage::Finish(this);
}

void google::protobuf::internal::LogMessage::~LogMessage(void **this)
{
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
}

uint64_t google::protobuf::internal::DefaultLogHandler(uint64_t result, const char *a2, int a3, uint64_t a4)
{
  if ((result & 0x80000000) == 0)
  {
    v4 = (FILE **)MEMORY[0x263EF8348];
    if (*(char *)(a4 + 23) >= 0) {
      uint64_t v5 = (const char *)a4;
    }
    else {
      uint64_t v5 = *(const char **)a4;
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "[libprotobuf %s %s:%d] %s\n", google::protobuf::internal::DefaultLogHandler(google::protobuf::LogLevel,char const*,int,std::string const&)::level_names[result], a2, a3, v5);
    v6 = *v4;
    return fflush(v6);
  }
  return result;
}

std::string *google::protobuf::internal::LogMessage::operator<<(std::string *a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%d", a2);
  __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

std::string *google::protobuf::internal::LogMessage::operator<<(std::string *a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%lu", a2);
  __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

const char **google::protobuf::internal::LogMessage::Finish(const char **this)
{
  v1 = this;
  if (*(_DWORD *)this == 3)
  {
    uint64_t v2 = 3;
  }
  else
  {
    int v3 = atomic_load((unsigned int *)&google::protobuf::internal::log_silencer_count_);
    if (v3 > 0) {
      goto LABEL_6;
    }
    uint64_t v2 = *(unsigned int *)this;
  }
  this = (const char **)google::protobuf::internal::log_handler_(v2, v1[1], *((_DWORD *)v1 + 4), (uint64_t)(v1 + 3));
LABEL_6:
  if (*(_DWORD *)v1 == 3)
  {
    exception = __cxa_allocate_exception(0x30uLL);
    google::protobuf::FatalException::FatalException(exception, v1[1], *((unsigned int *)v1 + 4), v1 + 3);
  }
  return this;
}

void sub_25BFDC670(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void google::protobuf::FatalException::~FatalException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_2709733B8;
  if (SHIBYTE(this[5].__vftable) < 0) {
    operator delete(this[3].__vftable);
  }

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  google::protobuf::FatalException::~FatalException(this);

  JUMPOUT(0x26117ABD0);
}

uint64_t google::protobuf::FatalException::what(google::protobuf::FatalException *this)
{
  uint64_t result = (uint64_t)this + 24;
  if (*((char *)this + 47) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t google::protobuf::FatalException::FatalException(uint64_t a1, uint64_t a2, int a3, long long *a4)
{
  *(void *)a1 = &unk_2709733B8;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  uint64_t v5 = (std::string *)(a1 + 24);
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v6 = *a4;
    v5->__r_.__value_.__r.__words[2] = *((void *)a4 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return a1;
}

void sub_25BFDC7AC(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::GeneratedExtensionFinder::Find(uint64_t a1, int a2, _OWORD *a3)
{
  {
    if (v3)
    {
      unint64_t v4 = *(void *)(a1 + 8);
      unint64_t v5 = 0x9DDFEA08EB382D69 * (((8 * v4) + 8) ^ HIDWORD(v4));
      unint64_t v6 = 0x9DDFEA08EB382D69 * (HIDWORD(v4) ^ (v5 >> 47) ^ v5);
      unint64_t v7 = (0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47))) ^ a2;
      uint8x8_t v8 = (uint8x8_t)vcnt_s8(v3);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        unint64_t v9 = v7;
        if (v7 >= *(void *)&v3) {
          unint64_t v9 = v7 % *(void *)&v3;
        }
      }
      else
      {
        unint64_t v9 = (*(void *)&v3 - 1) & v7;
      }
      if (v10)
      {
        for (i = *v10; i; i = (uint64_t *)*i)
        {
          unint64_t v12 = i[1];
          if (v7 == v12)
          {
            if (i[2] == v4 && *((_DWORD *)i + 6) == a2)
            {
              long long v14 = *((_OWORD *)i + 3);
              *a3 = *((_OWORD *)i + 2);
              a3[1] = v14;
              return 1;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v12 >= *(void *)&v3) {
                v12 %= *(void *)&v3;
              }
            }
            else
            {
              v12 &= *(void *)&v3 - 1;
            }
            if (v12 != v9) {
              return 0;
            }
          }
        }
      }
    }
  }
  return 0;
}

uint64_t google::protobuf::internal::ExtensionSet::ExtensionSet(uint64_t result, uint64_t a2)
{
  *(void *)uint64_t result = a2;
  *(_DWORD *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  return result;
}

void google::protobuf::internal::ExtensionSet::~ExtensionSet(google::protobuf::internal::ExtensionSet *this)
{
  if (!*(void *)this)
  {
    uint64_t v2 = (google::protobuf::internal::ArenaImpl ****)*((void *)this + 2);
    if (*((unsigned __int16 *)this + 4) >= 0x101u)
    {
      google::protobuf::internal::ExtensionSet::ForEach<std::__map_iterator<std::__tree_iterator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__tree_node<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,void *> *,long>>,google::protobuf::internal::ExtensionSet::~()::$_0>(*v2, v2 + 1);
    }
    else if (*((_WORD *)this + 5))
    {
      uint64_t v3 = 32 * *((unsigned __int16 *)this + 5);
      unint64_t v4 = (google::protobuf::internal::ArenaImpl ***)(v2 + 1);
      do
      {
        google::protobuf::internal::ExtensionSet::Extension::Free(v4);
        v4 += 4;
        v3 -= 32;
      }
      while (v3);
    }
    uint64_t v5 = *((void *)this + 2);
    if (*((unsigned __int16 *)this + 4) >= 0x101u)
    {
      if (v5)
      {
        uint64_t v6 = *((void *)this + 2);
        std::__tree<std::__value_type<std::string_view,int>,std::__map_value_compare<std::string_view,std::__value_type<std::string_view,int>,std::less<std::string_view>,true>,std::allocator<std::__value_type<std::string_view,int>>>::destroy(v5, *(void **)(v5 + 8));
        MEMORY[0x26117ABD0](v6, 0x1020C4062D53EE8);
      }
    }
    else if (v5)
    {
      MEMORY[0x26117ABA0](v5, 0x1062C802AB6010CLL);
    }
  }
}

void google::protobuf::internal::ExtensionSet::Extension::Clear(google::protobuf::internal::ExtensionSet::Extension *this)
{
  if (*((unsigned char *)this + 9))
  {
    uint64_t v2 = *((unsigned __int8 *)this + 8);
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v3 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v3->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    switch(v2)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
        **(_DWORD **)this = 0;
        break;
      case 9:
      case 12:
        google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(*(void *)this);
        break;
      case 10:
      case 11:
        google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(*(void *)this);
        break;
      default:
        return;
    }
  }
  else if ((*((unsigned char *)this + 10) & 1) == 0)
  {
    uint64_t v4 = *((unsigned __int8 *)this + 8);
    if ((v4 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v5 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v5->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    int v6 = google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v4];
    if (v6 == 10)
    {
      uint64_t v8 = **(void **)this;
      if ((*((unsigned char *)this + 10) & 0x10) != 0) {
        (*(void (**)(void))(v8 + 112))();
      }
      else {
        (*(void (**)(void))(v8 + 40))();
      }
    }
    else if (v6 == 9)
    {
      uint64_t v7 = *(void *)this;
      if (*(char *)(*(void *)this + 23) < 0)
      {
        **(unsigned char **)uint64_t v7 = 0;
        *(void *)(v7 + 8) = 0;
      }
      else
      {
        *(unsigned char *)uint64_t v7 = 0;
        *(unsigned char *)(v7 + 23) = 0;
      }
    }
    *((unsigned char *)this + 10) = *((unsigned char *)this + 10) & 0xF0 | 1;
  }
}

void sub_25BFDCB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::ExtensionSet::SetInt32(google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4, const FieldDescriptor *a5)
{
  uint64_t v8 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  char v9 = v8;
  v8[2] = (uint64_t *)&a5->MangledTypeName;
  if (v10)
  {
    *((unsigned char *)v8 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 1)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      unint64_t v12 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT32): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v9 + 9) = 0;
  }
  else
  {
    if (*((unsigned char *)v8 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v13 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    uint64_t v14 = *((unsigned __int8 *)v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v14] != 1)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v16 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT32): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
  }
  *((unsigned char *)v9 + 10) &= 0xF0u;
  *(_DWORD *)char v9 = a4;
}

void sub_25BFDCDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::AddInt32(google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4, int a5, const FieldDescriptor *a6)
{
  v11 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  unint64_t v12 = v11;
  v11[2] = (uint64_t *)&a6->MangledTypeName;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 1)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v15 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT32): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *(void *)this;
    if (!*(void *)this) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
    AlignedAndAddCleanup = (uint64_t *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v16, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<int>>);
    }
    uint64_t *AlignedAndAddCleanup = 0;
    AlignedAndAddCleanup[1] = v16;
    *unint64_t v12 = AlignedAndAddCleanup;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v18 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v19] != 1)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v21 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT32): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v22 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
  }
  v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    google::protobuf::RepeatedField<int>::Reserve(v23, v24 + 1);
    uint64_t result = google::protobuf::RepeatedField<int>::elements((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
  }
  else
  {
    uint64_t result = google::protobuf::RepeatedField<int>::elements((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_25BFDD0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::ExtensionSet::SetInt64(google::protobuf::internal::ExtensionSet *this, int a2, int a3, uint64_t *a4, const FieldDescriptor *a5)
{
  uint64_t v8 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  char v9 = v8;
  v8[2] = (uint64_t *)&a5->MangledTypeName;
  if (v10)
  {
    *((unsigned char *)v8 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 2)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      unint64_t v12 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT64): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v9 + 9) = 0;
  }
  else
  {
    if (*((unsigned char *)v8 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      char v13 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    uint64_t v14 = *((unsigned __int8 *)v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v14] != 2)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      uint64_t v16 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT64): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
  }
  *((unsigned char *)v9 + 10) &= 0xF0u;
  *char v9 = a4;
}

void sub_25BFDD310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::AddInt64(google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4, uint64_t a5, const FieldDescriptor *a6)
{
  v11 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  unint64_t v12 = v11;
  v11[2] = (uint64_t *)&a6->MangledTypeName;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 2)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      v15 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT64): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *(void *)this;
    if (!*(void *)this) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
    AlignedAndAddCleanup = (uint64_t *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v16, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<long long>>);
    }
    uint64_t *AlignedAndAddCleanup = 0;
    AlignedAndAddCleanup[1] = v16;
    *unint64_t v12 = AlignedAndAddCleanup;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      v18 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v19] != 2)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      v21 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT64): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      v22 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
  }
  v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    google::protobuf::RepeatedField<long long>::Reserve(v23, v24 + 1);
    uint64_t result = google::protobuf::RepeatedField<long long>::elements((uint64_t)v23);
    *(void *)(result + 8 * v24) = a5;
  }
  else
  {
    uint64_t result = google::protobuf::RepeatedField<long long>::elements((uint64_t)v23);
    *(void *)(result + 8 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_25BFDD64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::ExtensionSet::SetUInt32(google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4, const FieldDescriptor *a5)
{
  uint64_t v8 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  char v9 = v8;
  v8[2] = (uint64_t *)&a5->MangledTypeName;
  if (v10)
  {
    *((unsigned char *)v8 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 3)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      unint64_t v12 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v9 + 9) = 0;
  }
  else
  {
    if (*((unsigned char *)v8 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      char v13 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    uint64_t v14 = *((unsigned __int8 *)v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v14] != 3)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      uint64_t v16 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
  }
  *((unsigned char *)v9 + 10) &= 0xF0u;
  *(_DWORD *)char v9 = a4;
}

void sub_25BFDD86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::AddUInt32(google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4, int a5, const FieldDescriptor *a6)
{
  v11 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  unint64_t v12 = v11;
  v11[2] = (uint64_t *)&a6->MangledTypeName;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 3)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      v15 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *(void *)this;
    if (!*(void *)this) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
    AlignedAndAddCleanup = (uint64_t *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v16, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<unsigned int>>);
    }
    uint64_t *AlignedAndAddCleanup = 0;
    AlignedAndAddCleanup[1] = v16;
    *unint64_t v12 = AlignedAndAddCleanup;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      v18 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v19] != 3)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      v21 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      v22 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
  }
  v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    google::protobuf::RepeatedField<unsigned int>::Reserve(v23, v24 + 1);
    uint64_t result = google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
  }
  else
  {
    uint64_t result = google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_25BFDDBA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::ExtensionSet::SetUInt64(google::protobuf::internal::ExtensionSet *this, int a2, int a3, uint64_t *a4, const FieldDescriptor *a5)
{
  uint64_t v8 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  char v9 = v8;
  v8[2] = (uint64_t *)&a5->MangledTypeName;
  if (v10)
  {
    *((unsigned char *)v8 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      unint64_t v12 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v9 + 9) = 0;
  }
  else
  {
    if (*((unsigned char *)v8 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      char v13 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    uint64_t v14 = *((unsigned __int8 *)v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v14] != 4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      uint64_t v16 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
  }
  *((unsigned char *)v9 + 10) &= 0xF0u;
  *char v9 = a4;
}

void sub_25BFDDDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::AddUInt64(google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4, uint64_t a5, const FieldDescriptor *a6)
{
  v11 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  unint64_t v12 = v11;
  v11[2] = (uint64_t *)&a6->MangledTypeName;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      v15 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *(void *)this;
    if (!*(void *)this) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
    AlignedAndAddCleanup = (uint64_t *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v16, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<unsigned long long>>);
    }
    uint64_t *AlignedAndAddCleanup = 0;
    AlignedAndAddCleanup[1] = v16;
    *unint64_t v12 = AlignedAndAddCleanup;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      v18 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v19] != 4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      v21 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      v22 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
  }
  v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    google::protobuf::RepeatedField<unsigned long long>::Reserve(v23, v24 + 1);
    uint64_t result = google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)v23);
    *(void *)(result + 8 * v24) = a5;
  }
  else
  {
    uint64_t result = google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)v23);
    *(void *)(result + 8 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_25BFDE104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::ExtensionSet::SetFloat(google::protobuf::internal::ExtensionSet *this, int a2, int a3, float a4, const FieldDescriptor *a5)
{
  uint64_t v8 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  char v9 = v8;
  v8[2] = (uint64_t *)&a5->MangledTypeName;
  if (v10)
  {
    *((unsigned char *)v8 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 6)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      unint64_t v12 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v9 + 9) = 0;
  }
  else
  {
    if (*((unsigned char *)v8 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      char v13 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    uint64_t v14 = *((unsigned __int8 *)v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v14] != 6)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      uint64_t v16 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
  }
  *((unsigned char *)v9 + 10) &= 0xF0u;
  *(float *)char v9 = a4;
}

void sub_25BFDE32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::AddFloat(google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4, float a5, const FieldDescriptor *a6)
{
  v11 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  unint64_t v12 = v11;
  v11[2] = (uint64_t *)&a6->MangledTypeName;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 6)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      v15 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *(void *)this;
    if (!*(void *)this) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
    AlignedAndAddCleanup = (uint64_t *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v16, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<float>>);
    }
    uint64_t *AlignedAndAddCleanup = 0;
    AlignedAndAddCleanup[1] = v16;
    *unint64_t v12 = AlignedAndAddCleanup;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      v18 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v19] != 6)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      v21 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      v22 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
  }
  v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    google::protobuf::RepeatedField<float>::Reserve(v23, v24 + 1);
    uint64_t result = google::protobuf::RepeatedField<float>::elements((uint64_t)v23);
    *(float *)(result + 4 * v24) = a5;
  }
  else
  {
    uint64_t result = google::protobuf::RepeatedField<float>::elements((uint64_t)v23);
    *(float *)(result + 4 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_25BFDE670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::ExtensionSet::SetDouble(google::protobuf::internal::ExtensionSet *this, int a2, int a3, double a4, const FieldDescriptor *a5)
{
  uint64_t v8 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  char v9 = v8;
  v8[2] = (uint64_t *)&a5->MangledTypeName;
  if (v10)
  {
    *((unsigned char *)v8 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 5)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      unint64_t v12 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v9 + 9) = 0;
  }
  else
  {
    if (*((unsigned char *)v8 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      char v13 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    uint64_t v14 = *((unsigned __int8 *)v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v14] != 5)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      uint64_t v16 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
  }
  *((unsigned char *)v9 + 10) &= 0xF0u;
  *(double *)char v9 = a4;
}

void sub_25BFDE898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::AddDouble(google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4, double a5, const FieldDescriptor *a6)
{
  v11 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  unint64_t v12 = v11;
  v11[2] = (uint64_t *)&a6->MangledTypeName;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 5)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      v15 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *(void *)this;
    if (!*(void *)this) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
    AlignedAndAddCleanup = (uint64_t *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v16, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<double>>);
    }
    uint64_t *AlignedAndAddCleanup = 0;
    AlignedAndAddCleanup[1] = v16;
    *unint64_t v12 = AlignedAndAddCleanup;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      v18 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v19] != 5)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      v21 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      v22 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
  }
  v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    google::protobuf::RepeatedField<double>::Reserve(v23, v24 + 1);
    uint64_t result = google::protobuf::RepeatedField<double>::elements((uint64_t)v23);
    *(double *)(result + 8 * v24) = a5;
  }
  else
  {
    uint64_t result = google::protobuf::RepeatedField<double>::elements((uint64_t)v23);
    *(double *)(result + 8 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_25BFDEBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::ExtensionSet::SetBool(google::protobuf::internal::ExtensionSet *this, int a2, int a3, char a4, const FieldDescriptor *a5)
{
  uint64_t v8 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  char v9 = v8;
  v8[2] = (uint64_t *)&a5->MangledTypeName;
  if (v10)
  {
    *((unsigned char *)v8 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 7)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      unint64_t v12 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    v9[9] = 0;
  }
  else
  {
    if (*((unsigned char *)v8 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      char v13 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    uint64_t v14 = v9[8];
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v14] != 7)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      uint64_t v16 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
  }
  v9[10] &= 0xF0u;
  *char v9 = a4;
}

void sub_25BFDEDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::AddBool(google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4, char a5, const FieldDescriptor *a6)
{
  v11 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  unint64_t v12 = v11;
  v11[2] = (uint64_t *)&a6->MangledTypeName;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 7)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      v15 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *(void *)this;
    if (!*(void *)this) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
    AlignedAndAddCleanup = (uint64_t *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v16, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<BOOL>>);
    }
    uint64_t *AlignedAndAddCleanup = 0;
    AlignedAndAddCleanup[1] = v16;
    *unint64_t v12 = AlignedAndAddCleanup;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      v18 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v19] != 7)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      v21 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      v22 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
  }
  v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    google::protobuf::RepeatedField<BOOL>::Reserve(v23, v24 + 1);
    uint64_t result = google::protobuf::RepeatedField<BOOL>::elements((uint64_t)v23);
    *(unsigned char *)(result + v24) = a5;
  }
  else
  {
    uint64_t result = google::protobuf::RepeatedField<BOOL>::elements((uint64_t)v23);
    *(unsigned char *)(result + v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_25BFDF138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t *google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(google::protobuf::internal::ExtensionSet *this, int a2, int a3, char a4, const FieldDescriptor *a5)
{
  char v9 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  char v10 = v9;
  v9[2] = (uint64_t *)&a5->MangledTypeName;
  if (v11)
  {
    *((unsigned char *)v9 + 9) = 1;
    *((unsigned char *)v9 + 8) = a3;
    *((unsigned char *)v9 + 11) = a4;
    switch(a3)
    {
      case 1:
        uint64_t v12 = *(void *)this;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
        char v13 = (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<double>>;
        }
        goto LABEL_31;
      case 2:
        uint64_t v12 = *(void *)this;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
        char v13 = (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<float>>;
        }
        goto LABEL_31;
      case 3:
      case 16:
      case 18:
        uint64_t v12 = *(void *)this;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
        char v13 = (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<long long>>;
        }
        goto LABEL_31;
      case 4:
      case 6:
        uint64_t v12 = *(void *)this;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
        char v13 = (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<unsigned long long>>;
        }
        goto LABEL_31;
      case 5:
      case 14:
      case 15:
      case 17:
        uint64_t v12 = *(void *)this;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
        char v13 = (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<int>>;
        }
        goto LABEL_31;
      case 7:
      case 13:
        uint64_t v12 = *(void *)this;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
        char v13 = (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<unsigned int>>;
        }
        goto LABEL_31;
      case 8:
        uint64_t v12 = *(void *)this;
        if (!v12) {
LABEL_32:
        }
          operator new();
        if (*(unsigned char *)(v12 + 24)) {
        char v13 = (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<BOOL>>;
        }
LABEL_31:
        AlignedAndAddCleanup = (uint64_t *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v12, (google::protobuf::internal::SerialArena::Block *)0x10, v13);
        uint64_t *AlignedAndAddCleanup = 0;
        AlignedAndAddCleanup[1] = v12;
        goto LABEL_43;
      case 9:
      case 12:
        uint64_t v15 = *(void *)this;
        if (!v15) {
          goto LABEL_42;
        }
        if (*(unsigned char *)(v15 + 24)) {
        uint64_t v16 = (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedPtrField<std::string>>;
        }
        goto LABEL_41;
      case 10:
      case 11:
        uint64_t v15 = *(void *)this;
        if (!v15) {
LABEL_42:
        }
          operator new();
        if (*(unsigned char *)(v15 + 24)) {
        uint64_t v16 = (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>>;
        }
LABEL_41:
        AlignedAndAddCleanup = (uint64_t *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v15, (google::protobuf::internal::SerialArena::Block *)0x18, v16);
        AlignedAndAddCleanup[2] = 0;
        uint64_t *AlignedAndAddCleanup = v15;
        AlignedAndAddCleanup[1] = 0;
LABEL_43:
        *char v10 = AlignedAndAddCleanup;
        break;
      default:
        return *v10;
    }
  }
  return *v10;
}

void google::protobuf::internal::ExtensionSet::SetEnum(google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4, const FieldDescriptor *a5)
{
  uint64_t v8 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  char v9 = v8;
  v8[2] = (uint64_t *)&a5->MangledTypeName;
  if (v10)
  {
    *((unsigned char *)v8 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      char v11 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 8)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 460);
      uint64_t v12 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v9 + 9) = 0;
  }
  else
  {
    if (*((unsigned char *)v8 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 463);
      char v13 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    uint64_t v14 = *((unsigned __int8 *)v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v15 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v14] != 8)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 463);
      uint64_t v16 = google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    }
  }
  *((unsigned char *)v9 + 10) &= 0xF0u;
  *(_DWORD *)char v9 = a4;
}

void sub_25BFDF7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::AddEnum(google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4, int a5, const FieldDescriptor *a6)
{
  char v11 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  uint64_t v12 = v11;
  v11[2] = (uint64_t *)&a6->MangledTypeName;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 8)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 488);
      uint64_t v15 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v12 + 9) = 1;
    *((unsigned char *)v12 + 11) = a4;
    uint64_t v16 = *(void *)this;
    if (!*(void *)this) {
      operator new();
    }
    if (*(unsigned char *)(v16 + 24)) {
    AlignedAndAddCleanup = (uint64_t *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v16, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<int>>);
    }
    uint64_t *AlignedAndAddCleanup = 0;
    AlignedAndAddCleanup[1] = v16;
    *uint64_t v12 = AlignedAndAddCleanup;
  }
  else
  {
    if (!*((unsigned char *)v11 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 494);
      v18 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    uint64_t v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v19] != 8)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 494);
      v21 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 495);
      v22 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    }
  }
  v23 = (int *)*v12;
  uint64_t v24 = *v23;
  if (v24 == v23[1])
  {
    int v25 = v24 + 1;
    google::protobuf::RepeatedField<int>::Reserve(v23, v24 + 1);
    uint64_t result = google::protobuf::RepeatedField<int>::elements((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
  }
  else
  {
    uint64_t result = google::protobuf::RepeatedField<int>::elements((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
    int v25 = v24 + 1;
  }
  int *v23 = v25;
  return result;
}

void sub_25BFDFB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::MutableString(google::protobuf::internal::ExtensionSet *this, int a2, int a3, const FieldDescriptor *a4)
{
  uint64_t v7 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  uint64_t v8 = (unsigned __int8 *)v7;
  v7[2] = (uint64_t *)&a4->MangledTypeName;
  if (v9)
  {
    *((unsigned char *)v7 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      char v10 = google::protobuf::internal::LogMessage::operator<<(v20, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v19, (const char **)&v10->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v20[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 9)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 520);
      char v11 = google::protobuf::internal::LogMessage::operator<<(v20, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_STRING): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v19, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v20[0].__r_.__value_.__l.__data_);
    }
    v8[9] = 0;
    uint64_t v12 = *(void *)this;
    if (!v12) {
      operator new();
    }
    if (*(unsigned char *)(v12 + 24)) {
    AlignedAndAddCleanup = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v12, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<std::string>);
    }
    void *AlignedAndAddCleanup = 0;
    AlignedAndAddCleanup[1] = 0;
    AlignedAndAddCleanup[2] = 0;
    *(void *)uint64_t v8 = AlignedAndAddCleanup;
  }
  else
  {
    if (*((unsigned char *)v7 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 524);
      uint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v20, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v19, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v20[0].__r_.__value_.__l.__data_);
    }
    uint64_t v15 = v8[8];
    if ((v15 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v16 = google::protobuf::internal::LogMessage::operator<<(v20, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v19, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v20[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v15] != 9)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 524);
      char v17 = google::protobuf::internal::LogMessage::operator<<(v20, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_STRING): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v19, (const char **)&v17->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v20[0].__r_.__value_.__l.__data_);
    }
  }
  v8[10] &= 0xF0u;
  return *(void *)v8;
}

void sub_25BFDFDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void *google::protobuf::internal::ExtensionSet::AddString(google::protobuf::internal::ExtensionSet *this, int a2, int a3, const FieldDescriptor *a4)
{
  uint64_t v7 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  uint64_t v8 = v7;
  v7[2] = (uint64_t *)&a4->MangledTypeName;
  if (v9)
  {
    *((unsigned char *)v7 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      char v10 = google::protobuf::internal::LogMessage::operator<<(v27, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v26, (const char **)&v10->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v27[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 9)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 550);
      char v11 = google::protobuf::internal::LogMessage::operator<<(v27, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_STRING): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v26, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v27[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v8 + 9) = 1;
    *((unsigned char *)v8 + 11) = 0;
    uint64_t v12 = *(void *)this;
    if (!v12) {
      operator new();
    }
    if (*(unsigned char *)(v12 + 24)) {
    AlignedAndAddCleanup = (uint64_t *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v12, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedPtrField<std::string>>);
    }
    AlignedAndAddCleanup[2] = 0;
    uint64_t *AlignedAndAddCleanup = v12;
    AlignedAndAddCleanup[1] = 0;
    *uint64_t v8 = AlignedAndAddCleanup;
  }
  else
  {
    if (!*((unsigned char *)v7 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 556);
      uint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v27, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v26, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v27[0].__r_.__value_.__l.__data_);
    }
    uint64_t v15 = *((unsigned __int8 *)v8 + 8);
    if ((v15 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v16 = google::protobuf::internal::LogMessage::operator<<(v27, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v26, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v27[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v15] != 9)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 556);
      char v17 = google::protobuf::internal::LogMessage::operator<<(v27, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_STRING): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v26, (const char **)&v17->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v27[0].__r_.__value_.__l.__data_);
    }
  }
  v18 = *v8;
  char v19 = (int *)v18[2];
  if (!v19)
  {
    int v21 = *((_DWORD *)v18 + 3);
LABEL_22:
    google::protobuf::internal::RepeatedPtrFieldBase::Reserve((unsigned int *)v18, v21 + 1);
    char v19 = (int *)v18[2];
    int v21 = *v19;
    goto LABEL_23;
  }
  uint64_t v20 = *((int *)v18 + 2);
  int v21 = *v19;
  if ((int)v20 < *v19)
  {
    *((_DWORD *)v18 + 2) = v20 + 1;
    return *(void **)&v19[2 * v20 + 2];
  }
  if (v21 == *((_DWORD *)v18 + 3)) {
    goto LABEL_22;
  }
LABEL_23:
  *char v19 = v21 + 1;
  uint64_t v23 = *v18;
  if (!*v18) {
    operator new();
  }
  if (*(unsigned char *)(v23 + 24)) {
  uint64_t result = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v23, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<std::string>);
  }
  *uint64_t result = 0;
  result[1] = 0;
  result[2] = 0;
  uint64_t v24 = v18[2];
  uint64_t v25 = *((int *)v18 + 2);
  *((_DWORD *)v18 + 2) = v25 + 1;
  *(void *)(v24 + 8 * v25 + 8) = result;
  return result;
}

void sub_25BFE0168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t *google::protobuf::internal::ExtensionSet::MutableMessage(google::protobuf::internal::ExtensionSet *this, int a2, int a3, const google::protobuf::MessageLite *a4, const FieldDescriptor *a5)
{
  char v9 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  char v10 = v9;
  v9[2] = (uint64_t *)&a5->MangledTypeName;
  if (v11)
  {
    *((unsigned char *)v9 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v12 = google::protobuf::internal::LogMessage::operator<<(v21, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v20, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v21[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 10)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 591);
      char v13 = google::protobuf::internal::LogMessage::operator<<(v21, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v20, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v21[0].__r_.__value_.__l.__data_);
    }
    *((unsigned char *)v10 + 9) = 0;
    *((unsigned char *)v10 + 10) &= 0xFu;
    uint64_t result = (uint64_t *)(*(uint64_t (**)(const google::protobuf::MessageLite *, void))(*(void *)a4 + 32))(a4, *(void *)this);
    *char v10 = result;
    *((unsigned char *)v10 + 10) &= 0xF0u;
  }
  else
  {
    if (*((unsigned char *)v9 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 598);
      uint64_t v15 = google::protobuf::internal::LogMessage::operator<<(v21, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v20, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v21[0].__r_.__value_.__l.__data_);
    }
    uint64_t v16 = *((unsigned __int8 *)v10 + 8);
    if ((v16 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      char v17 = google::protobuf::internal::LogMessage::operator<<(v21, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v20, (const char **)&v17->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v21[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v16] != 10)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 598);
      v18 = google::protobuf::internal::LogMessage::operator<<(v21, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v20, (const char **)&v18->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v21[0].__r_.__value_.__l.__data_);
    }
    char v19 = *((unsigned char *)v10 + 10);
    *((unsigned char *)v10 + 10) = v19 & 0xF0;
    uint64_t result = *v10;
    if ((v19 & 0x10) != 0) {
      return (uint64_t *)(*(uint64_t (**)(uint64_t *, const google::protobuf::MessageLite *))(*result + 32))(result, a4);
    }
  }
  return result;
}

void sub_25BFE0400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::AddMessage(google::protobuf::internal::ExtensionSet *this, int a2, int a3, const google::protobuf::MessageLite *a4, const FieldDescriptor *a5)
{
  char v9 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  char v10 = (unsigned __int8 *)v9;
  v9[2] = (uint64_t *)&a5->MangledTypeName;
  if (v11)
  {
    *((unsigned char *)v9 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v12 = google::protobuf::internal::LogMessage::operator<<(v26, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v25, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v26[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 10)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 762);
      char v13 = google::protobuf::internal::LogMessage::operator<<(v26, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v25, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v26[0].__r_.__value_.__l.__data_);
    }
    v10[9] = 1;
    uint64_t v14 = *(void *)this;
    if (!*(void *)this) {
      operator new();
    }
    if (*(unsigned char *)(v14 + 24)) {
    AlignedAndAddCleanup = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v14, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>>);
    }
    AlignedAndAddCleanup[2] = 0;
    void *AlignedAndAddCleanup = v14;
    AlignedAndAddCleanup[1] = 0;
    *(void *)char v10 = AlignedAndAddCleanup;
  }
  else
  {
    if (!*((unsigned char *)v9 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 767);
      uint64_t v16 = google::protobuf::internal::LogMessage::operator<<(v26, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v25, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v26[0].__r_.__value_.__l.__data_);
    }
    uint64_t v17 = v10[8];
    if ((v17 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v18 = google::protobuf::internal::LogMessage::operator<<(v26, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v25, (const char **)&v18->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v26[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v17] != 10)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 767);
      char v19 = google::protobuf::internal::LogMessage::operator<<(v26, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v25, (const char **)&v19->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v26[0].__r_.__value_.__l.__data_);
    }
  }
  uint64_t v20 = *(void *)v10;
  int v21 = *(_DWORD **)(*(void *)v10 + 16);
  if (!v21
    || (uint64_t v22 = *(int *)(v20 + 8), (int)v22 >= *v21)
    || (*(_DWORD *)(v20 + 8) = v22 + 1, (uint64_t v23 = *(void *)&v21[2 * v22 + 2]) == 0))
  {
    uint64_t v23 = (*(uint64_t (**)(const google::protobuf::MessageLite *, void))(*(void *)a4 + 32))(a4, *(void *)this);
    google::protobuf::internal::RepeatedPtrFieldBase::AddAllocatedInternal<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(*(unsigned int **)v10, v23);
  }
  return v23;
}

void sub_25BFE0724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::ExtensionSet::Clear(google::protobuf::internal::ExtensionSet *this)
{
  v1 = (void *)*((void *)this + 2);
  if (*((unsigned __int16 *)this + 4) >= 0x101u)
  {
    int v6 = (void *)*v1;
    uint64_t v4 = v1 + 1;
    uint64_t v5 = v6;
    if (v6 != v4)
    {
      do
      {
        google::protobuf::internal::ExtensionSet::Extension::Clear((google::protobuf::internal::ExtensionSet::Extension *)(v5 + 5));
        uint64_t v7 = (void *)v5[1];
        if (v7)
        {
          do
          {
            uint64_t v8 = v7;
            uint64_t v7 = (void *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            uint64_t v8 = (void *)v5[2];
            BOOL v9 = *v8 == (void)v5;
            uint64_t v5 = v8;
          }
          while (!v9);
        }
        uint64_t v5 = v8;
      }
      while (v8 != v4);
    }
  }
  else if (*((_WORD *)this + 5))
  {
    uint64_t v2 = 32 * *((unsigned __int16 *)this + 5);
    uint64_t v3 = (google::protobuf::internal::ExtensionSet::Extension *)(v1 + 1);
    do
    {
      google::protobuf::internal::ExtensionSet::Extension::Clear(v3);
      uint64_t v3 = (google::protobuf::internal::ExtensionSet::Extension *)((char *)v3 + 32);
      v2 -= 32;
    }
    while (v2);
  }
}

void google::protobuf::internal::ExtensionSet::MergeFrom(google::protobuf::internal::ExtensionSet *this, const google::protobuf::internal::ExtensionSet *a2)
{
  if (*((unsigned __int16 *)this + 4) <= 0x100u)
  {
    unsigned int v4 = *((unsigned __int16 *)a2 + 4);
    uint64_t v5 = (char *)*((void *)this + 2);
    uint64_t v6 = *((unsigned __int16 *)this + 5);
    uint64_t v7 = &v5[32 * v6];
    uint64_t v8 = *((void *)a2 + 2);
    if (v4 > 0x100)
    {
    }
    else
    {
      uint64_t v9 = *((unsigned __int16 *)a2 + 5);
      uint64_t v10 = v8 + 32 * v9;
      BOOL v12 = v6 == 0;
      uint64_t v11 = 0;
      BOOL v12 = v12 || v9 == 0;
      if (!v12)
      {
        do
        {
          if (*(_DWORD *)v5 == *(_DWORD *)v8) {
            char v13 = v5 + 32;
          }
          else {
            char v13 = v5;
          }
          if (*(_DWORD *)v5 < *(_DWORD *)v8)
          {
            v5 += 32;
          }
          else
          {
            v8 += 32;
            uint64_t v5 = v13;
          }
          ++v11;
        }
        while (v5 != v7 && v8 != v10);
      }
      unint64_t v14 = v11 + ((v10 - v8) >> 5) + ((v7 - v5) >> 5);
    }
    google::protobuf::internal::ExtensionSet::GrowCapacity(this, v14);
  }
  uint64_t v15 = *((void *)a2 + 2);
  if (*((unsigned __int16 *)a2 + 4) >= 0x101u)
  {
    char v19 = *(void **)v15;
    google::protobuf::internal::ExtensionSet::ForEach<std::__map_iterator<std::__tree_iterator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__tree_node<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,void *> *,long>>,google::protobuf::internal::ExtensionSet::MergeFrom(google::protobuf::internal::ExtensionSet const&)::$_0>(v19, (void *)(v15 + 8), this);
  }
  else if (*((_WORD *)a2 + 5))
  {
    uint64_t v16 = v15 + 32 * *((unsigned __int16 *)a2 + 5);
    do
    {
      uint64_t v17 = (const google::protobuf::internal::ExtensionSet::Extension *)(v15 + 8);
      int v18 = *(_DWORD *)v15;
      v15 += 32;
      google::protobuf::internal::ExtensionSet::InternalExtensionMergeFrom(this, v18, v17);
    }
    while (v15 != v16);
  }
}

void *google::protobuf::internal::ExtensionSet::GrowCapacity(void *this, unint64_t a2)
{
  unint64_t v2 = *((unsigned __int16 *)this + 4);
  if (v2 <= 0x100 && v2 < a2)
  {
    unsigned int v4 = this;
    do
    {
      if ((_WORD)v2) {
        LOWORD(v2) = 4 * v2;
      }
      else {
        LOWORD(v2) = 1;
      }
    }
    while ((unsigned __int16)v2 < a2);
    uint64_t v5 = (char *)this[2];
    uint64_t v6 = *((unsigned __int16 *)this + 5);
    uint64_t v7 = *this;
    if ((unsigned __int16)v2 < 0x101u)
    {
      unint64_t v8 = 32 * (unsigned __int16)v2;
      if (v7)
      {
        if (*(unsigned char *)(v7 + 24))
        {
          unint64_t v8 = 32 * (unsigned __int16)v2;
        }
        this = (void *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v7, v8);
      }
      else
      {
        this = operator new[](v8);
      }
      uint64_t v9 = (uint64_t **)this;
      if (v6) {
        this = memmove(this, v5, 32 * v6);
      }
    }
    else
    {
      if (!v7) {
        operator new();
      }
      if (*(unsigned char *)(v7 + 24)) {
      this = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v7, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<std::map<int,google::protobuf::internal::ExtensionSet::Extension>>);
      }
      uint64_t v9 = (uint64_t **)this;
      this[1] = 0;
      uint64_t v10 = this + 1;
      this[2] = 0;
      *this = this + 1;
      if (v6)
      {
        uint64_t v11 = &v5[32 * v6];
        BOOL v12 = v5;
        do
        {
          int v15 = *(_DWORD *)v12;
          long long v13 = *(_OWORD *)(v12 + 8);
          uint64_t v17 = *((void *)v12 + 3);
          long long v16 = v13;
          this = std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_hint_unique_key_args<int,std::pair<int const,google::protobuf::internal::ExtensionSet::Extension>>(v9, v10, &v15, &v15);
          uint64_t v10 = this;
          v12 += 32;
        }
        while (v12 != v11);
      }
    }
    if (*v4) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v5 == 0;
    }
    if (!v14) {
      this = (void *)MEMORY[0x26117ABA0](v5, 0x1062C802AB6010CLL);
    }
    *((_WORD *)v4 + 4) = v2;
    v4[2] = v9;
    if ((unsigned __int16)v2 >= 0x101u) {
      *((_WORD *)v4 + 5) = 0;
    }
  }
  return this;
}

uint64_t google::protobuf::internal::anonymous namespace'::SizeOfUnion<google::protobuf::internal::ExtensionSet::KeyValue *,std::__map_iterator<std::__tree_iterator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__tree_node<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,void *> *,long>>>(char *a1, char *a2, void *a3, void *a4)
{
  uint64_t v4 = 0;
  if (a1 != a2 && a3 != a4)
  {
    uint64_t v4 = 0;
    do
    {
      int v5 = *((_DWORD *)a3 + 8);
      if (*(_DWORD *)a1 >= v5)
      {
        if (*(_DWORD *)a1 == v5)
        {
          a1 += 32;
          uint64_t v6 = (void *)a3[1];
          if (v6)
          {
            do
            {
              a3 = v6;
              uint64_t v6 = (void *)*v6;
            }
            while (v6);
          }
          else
          {
            do
            {
              uint64_t v7 = a3;
              a3 = (void *)a3[2];
            }
            while ((void *)*a3 != v7);
          }
        }
        else
        {
          unint64_t v8 = (void *)a3[1];
          if (v8)
          {
            do
            {
              a3 = v8;
              unint64_t v8 = (void *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              uint64_t v9 = a3;
              a3 = (void *)a3[2];
            }
            while ((void *)*a3 != v9);
          }
        }
      }
      else
      {
        a1 += 32;
      }
      ++v4;
    }
    while (a1 != a2 && a3 != a4);
  }
  if (a3 == a4)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = (void *)a3[1];
      if (v11)
      {
        do
        {
          BOOL v12 = v11;
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          BOOL v12 = (void *)a3[2];
          BOOL v13 = *v12 == (void)a3;
          a3 = v12;
        }
        while (!v13);
      }
      ++v10;
      a3 = v12;
    }
    while (v12 != a4);
  }
  return v4 + ((a2 - a1) >> 5) + v10;
}

void google::protobuf::internal::ExtensionSet::InternalExtensionMergeFrom(google::protobuf::internal::ExtensionSet *this, int a2, const google::protobuf::internal::ExtensionSet::Extension *a3)
{
  if (!*((unsigned char *)a3 + 9))
  {
    if (*((unsigned char *)a3 + 10)) {
      return;
    }
    uint64_t v11 = *((unsigned __int8 *)a3 + 8);
    if ((v11 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v62, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      BOOL v12 = google::protobuf::internal::LogMessage::operator<<(v62, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v61, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v62[0].__r_.__value_.__l.__data_);
    }
    switch(v11)
    {
      case 1:
        google::protobuf::internal::ExtensionSet::SetDouble(this, a2, *((unsigned __int8 *)a3 + 8), *(double *)a3, *((const FieldDescriptor **)a3 + 2));
        return;
      case 2:
        google::protobuf::internal::ExtensionSet::SetFloat(this, a2, *((unsigned __int8 *)a3 + 8), *(float *)a3, *((const FieldDescriptor **)a3 + 2));
        return;
      case 3:
      case 16:
      case 18:
        google::protobuf::internal::ExtensionSet::SetInt64(this, a2, *((unsigned __int8 *)a3 + 8), *(uint64_t **)a3, *((const FieldDescriptor **)a3 + 2));
        return;
      case 4:
      case 6:
        google::protobuf::internal::ExtensionSet::SetUInt64(this, a2, *((unsigned __int8 *)a3 + 8), *(uint64_t **)a3, *((const FieldDescriptor **)a3 + 2));
        return;
      case 5:
      case 15:
      case 17:
        google::protobuf::internal::ExtensionSet::SetInt32(this, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, *((const FieldDescriptor **)a3 + 2));
        return;
      case 7:
      case 13:
        google::protobuf::internal::ExtensionSet::SetUInt32(this, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, *((const FieldDescriptor **)a3 + 2));
        return;
      case 8:
        google::protobuf::internal::ExtensionSet::SetBool(this, a2, *((unsigned __int8 *)a3 + 8), *(unsigned char *)a3, *((const FieldDescriptor **)a3 + 2));
        return;
      case 9:
      case 12:
        int v36 = *((unsigned __int8 *)a3 + 8);
        v37 = *(long long **)a3;
        if (*(char *)(*(void *)a3 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v37, *((void *)v37 + 1));
        }
        else
        {
          long long v38 = *v37;
          __p.__r_.__value_.__r.__words[2] = *((void *)v37 + 2);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v38;
        }
        google::protobuf::internal::ExtensionSet::SetString(this, a2, v36, (__n128 *)&__p, *((FieldDescriptor **)a3 + 2));
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        return;
      case 10:
      case 11:
        v39 = (uint64_t *)*((void *)a3 + 2);
        v40 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
        v41 = v40;
        v40[2] = v39;
        if (v42)
        {
          *((unsigned char *)v40 + 8) = *((unsigned char *)a3 + 8);
          *((unsigned char *)v40 + 11) = *((unsigned char *)a3 + 11);
          *((unsigned char *)v40 + 9) = 0;
          char v43 = *((unsigned char *)v40 + 10) & 0xF;
          if ((*((unsigned char *)a3 + 10) & 0x10) == 0)
          {
            *((unsigned char *)v40 + 10) = v43;
            uint64_t v44 = (*(uint64_t (**)(void, void))(**(void **)a3 + 32))(*(void *)a3, *(void *)this);
            void *v41 = v44;
LABEL_120:
            (*(void (**)(uint64_t, void))(*(void *)v44 + 64))(v44, *(void *)a3);
            goto LABEL_126;
          }
          *((unsigned char *)v40 + 10) = v43 | 0x10;
          uint64_t v59 = (*(uint64_t (**)(void, void))(**(void **)a3 + 16))(*(void *)a3, *(void *)this);
          void *v41 = v59;
          (*(void (**)(uint64_t, void))(*(void *)v59 + 104))(v59, *(void *)a3);
        }
        else
        {
          if (*((unsigned __int8 *)v40 + 8) != *((unsigned __int8 *)a3 + 8))
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v62, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1026);
            v53 = google::protobuf::internal::LogMessage::operator<<(v62, "CHECK failed: (extension->type) == (other_extension.type): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v61, (const char **)&v53->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v62[0].__r_.__value_.__l.__data_);
          }
          if (*((unsigned __int8 *)v41 + 11) != *((unsigned __int8 *)a3 + 11))
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v62, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1027);
            v54 = google::protobuf::internal::LogMessage::operator<<(v62, "CHECK failed: (extension->is_packed) == (other_extension.is_packed): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v61, (const char **)&v54->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v62[0].__r_.__value_.__l.__data_);
          }
          if (*((unsigned char *)v41 + 9))
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v62, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1028);
            v55 = google::protobuf::internal::LogMessage::operator<<(v62, "CHECK failed: !extension->is_repeated: ");
            google::protobuf::internal::LogFinisher::operator=((int)&v61, (const char **)&v55->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v62[0].__r_.__value_.__l.__data_);
          }
          v56 = (uint64_t *)*v41;
          uint64_t v57 = *(void *)a3;
          if ((*((unsigned char *)a3 + 10) & 0x10) != 0)
          {
            if ((*((unsigned char *)v41 + 10) & 0x10) != 0)
            {
              (*(void (**)(void, uint64_t))(*v56 + 104))(*v41, v57);
              goto LABEL_126;
            }
            uint64_t v57 = (*(uint64_t (**)(void, void))(*(void *)v57 + 24))(*(void *)a3, *v41);
            uint64_t v58 = *v56;
          }
          else
          {
            uint64_t v58 = *v56;
            if ((*((unsigned char *)v41 + 10) & 0x10) != 0)
            {
              uint64_t v44 = (*(uint64_t (**)(void, uint64_t))(v58 + 32))(*v41, v57);
              goto LABEL_120;
            }
          }
          (*(void (**)(uint64_t *, uint64_t))(v58 + 64))(v56, v57);
        }
LABEL_126:
        *((unsigned char *)v41 + 10) &= 0xF0u;
        return;
      case 14:
        google::protobuf::internal::ExtensionSet::SetEnum(this, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, *((const FieldDescriptor **)a3 + 2));
        return;
      default:
        return;
    }
  }
  uint64_t v6 = (uint64_t *)*((void *)a3 + 2);
  uint64_t v7 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  unint64_t v8 = (unsigned int **)v7;
  v7[2] = v6;
  uint64_t v10 = v9;
  if (v9)
  {
    *((unsigned char *)v7 + 8) = *((unsigned char *)a3 + 8);
    *((unsigned char *)v7 + 11) = *((unsigned char *)a3 + 11);
    *((unsigned char *)v7 + 9) = 1;
  }
  else
  {
    if (*((unsigned __int8 *)v7 + 8) != *((unsigned __int8 *)a3 + 8))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v62, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 931);
      BOOL v13 = google::protobuf::internal::LogMessage::operator<<(v62, "CHECK failed: (extension->type) == (other_extension.type): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v61, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v62[0].__r_.__value_.__l.__data_);
    }
    if (*((unsigned __int8 *)v8 + 11) != *((unsigned __int8 *)a3 + 11))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v62, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 932);
      BOOL v14 = google::protobuf::internal::LogMessage::operator<<(v62, "CHECK failed: (extension->is_packed) == (other_extension.is_packed): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v61, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v62[0].__r_.__value_.__l.__data_);
    }
    if (!*((unsigned char *)v8 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v62, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 933);
      int v15 = google::protobuf::internal::LogMessage::operator<<(v62, "CHECK failed: extension->is_repeated: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v61, (const char **)&v15->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v62[0].__r_.__value_.__l.__data_);
    }
  }
  uint64_t v16 = *((unsigned __int8 *)a3 + 8);
  if ((v16 - 19) <= 0xFFFFFFED)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v62, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    uint64_t v17 = google::protobuf::internal::LogMessage::operator<<(v62, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v61, (const char **)&v17->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v62[0].__r_.__value_.__l.__data_);
  }
  switch(v16)
  {
    case 1:
      if (v10)
      {
        uint64_t v26 = *(void *)this;
        if (!v26) {
          operator new();
        }
        if (*(unsigned char *)(v26 + 24)) {
        AlignedAndAddCleanup = (unsigned int *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v26, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<double>>);
        }
        *(void *)AlignedAndAddCleanup = 0;
        *((void *)AlignedAndAddCleanup + 1) = v26;
        *unint64_t v8 = AlignedAndAddCleanup;
      }
      else
      {
        AlignedAndAddCleanup = *v8;
      }
      google::protobuf::RepeatedField<double>::MergeFrom((int *)AlignedAndAddCleanup, *(int **)a3);
      break;
    case 2:
      if (v10)
      {
        uint64_t v28 = *(void *)this;
        if (!v28) {
          operator new();
        }
        if (*(unsigned char *)(v28 + 24)) {
        v29 = (unsigned int *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v28, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<float>>);
        }
        *(void *)v29 = 0;
        *((void *)v29 + 1) = v28;
        *unint64_t v8 = v29;
      }
      else
      {
        v29 = *v8;
      }
      google::protobuf::RepeatedField<float>::MergeFrom((int *)v29, *(int **)a3);
      break;
    case 3:
    case 16:
    case 18:
      if (v10)
      {
        uint64_t v20 = *(void *)this;
        if (!v20) {
          operator new();
        }
        if (*(unsigned char *)(v20 + 24)) {
        int v21 = (unsigned int *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v20, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<long long>>);
        }
        *(void *)int v21 = 0;
        *((void *)v21 + 1) = v20;
        *unint64_t v8 = v21;
      }
      else
      {
        int v21 = *v8;
      }
      google::protobuf::RepeatedField<long long>::MergeFrom((int *)v21, *(int **)a3);
      break;
    case 4:
    case 6:
      if (v10)
      {
        uint64_t v24 = *(void *)this;
        if (!v24) {
          operator new();
        }
        if (*(unsigned char *)(v24 + 24)) {
        char v25 = (unsigned int *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v24, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<unsigned long long>>);
        }
        *(void *)char v25 = 0;
        *((void *)v25 + 1) = v24;
        *unint64_t v8 = v25;
      }
      else
      {
        char v25 = *v8;
      }
      google::protobuf::RepeatedField<unsigned long long>::MergeFrom((int *)v25, *(int **)a3);
      break;
    case 5:
    case 14:
    case 15:
    case 17:
      if (v10)
      {
        uint64_t v18 = *(void *)this;
        if (!v18) {
          operator new();
        }
        if (*(unsigned char *)(v18 + 24)) {
        char v19 = (unsigned int *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v18, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<int>>);
        }
        *(void *)char v19 = 0;
        *((void *)v19 + 1) = v18;
        *unint64_t v8 = v19;
      }
      else
      {
        char v19 = *v8;
      }
      google::protobuf::RepeatedField<int>::MergeFrom((int *)v19, *(int **)a3);
      break;
    case 7:
    case 13:
      if (v10)
      {
        uint64_t v22 = *(void *)this;
        if (!v22) {
          operator new();
        }
        if (*(unsigned char *)(v22 + 24)) {
        uint64_t v23 = (unsigned int *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v22, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<unsigned int>>);
        }
        *(void *)uint64_t v23 = 0;
        *((void *)v23 + 1) = v22;
        *unint64_t v8 = v23;
      }
      else
      {
        uint64_t v23 = *v8;
      }
      google::protobuf::RepeatedField<unsigned int>::MergeFrom((int *)v23, *(int **)a3);
      break;
    case 8:
      if (v10)
      {
        uint64_t v30 = *(void *)this;
        if (!v30) {
          operator new();
        }
        if (*(unsigned char *)(v30 + 24)) {
        v31 = (unsigned int *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v30, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<BOOL>>);
        }
        *(void *)v31 = 0;
        *((void *)v31 + 1) = v30;
        *unint64_t v8 = v31;
      }
      else
      {
        v31 = *v8;
      }
      google::protobuf::RepeatedField<BOOL>::MergeFrom((int *)v31, *(int **)a3);
      break;
    case 9:
    case 12:
      if (v10)
      {
        uint64_t v32 = *(void *)this;
        if (!v32) {
          operator new();
        }
        if (*(unsigned char *)(v32 + 24)) {
        v33 = (unsigned int *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v32, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedPtrField<std::string>>);
        }
        *((void *)v33 + 2) = 0;
        *(void *)v33 = v32;
        *((void *)v33 + 1) = 0;
        *unint64_t v8 = v33;
      }
      else
      {
        v33 = *v8;
      }
      google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)v33, *(void *)a3);
      break;
    case 10:
    case 11:
      if (v10)
      {
        uint64_t v34 = *(void *)this;
        if (!*(void *)this) {
          operator new();
        }
        if (*(unsigned char *)(v34 + 24)) {
        v35 = (unsigned int *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((atomic_ullong *)v34, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>>);
        }
        *((void *)v35 + 2) = 0;
        *(void *)v35 = v34;
        *((void *)v35 + 1) = 0;
        *unint64_t v8 = v35;
      }
      uint64_t v45 = *(void *)a3;
      if (*(int *)(v45 + 8) >= 1)
      {
        int v46 = 0;
        do
        {
          uint64_t v47 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v45, v46);
          uint64_t v48 = v47;
          v49 = *v8;
          v50 = (_DWORD *)*((void *)*v8 + 2);
          if (!v50
            || (uint64_t v51 = (int)v49[2], (int)v51 >= *v50)
            || (v49[2] = v51 + 1, (uint64_t v52 = *(void *)&v50[2 * v51 + 2]) == 0))
          {
            uint64_t v52 = (*(uint64_t (**)(uint64_t, void))(*(void *)v47 + 32))(v47, *(void *)this);
            google::protobuf::internal::RepeatedPtrFieldBase::AddAllocatedInternal<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(*v8, v52);
          }
          (*(void (**)(uint64_t, uint64_t))(*(void *)v52 + 64))(v52, v48);
          ++v46;
        }
        while (v46 < *(_DWORD *)(v45 + 8));
      }
      break;
    default:
      return;
  }
}

void sub_25BFE1968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16)
{
}

__n128 google::protobuf::internal::ExtensionSet::SetString(google::protobuf::internal::ExtensionSet *a1, int a2, int a3, __n128 *a4, FieldDescriptor *a5)
{
  uint64_t v6 = google::protobuf::internal::ExtensionSet::MutableString(a1, a2, a3, a5);
  uint64_t v7 = (__n128 *)v6;
  if (*(char *)(v6 + 23) < 0) {
    operator delete(*(void **)v6);
  }
  __n128 result = *a4;
  v7[1].n128_u64[0] = a4[1].n128_u64[0];
  *uint64_t v7 = result;
  a4[1].n128_u8[7] = 0;
  a4->n128_u8[0] = 0;
  return result;
}

void google::protobuf::internal::ExtensionSet::Swap(google::protobuf::internal::ExtensionSet *this, google::protobuf::internal::ExtensionSet *a2)
{
  if (*(void *)this == *(void *)a2)
  {
    __int16 v4 = *((_WORD *)this + 4);
    *((_WORD *)this + 4) = *((_WORD *)a2 + 4);
    *((_WORD *)a2 + 4) = v4;
    __int16 v5 = *((_WORD *)this + 5);
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((_WORD *)a2 + 5) = v5;
    uint64_t v6 = *((void *)this + 2);
    *((void *)this + 2) = *((void *)a2 + 2);
    *((void *)a2 + 2) = v6;
  }
  else
  {
    uint64_t v7 = 0;
    int v8 = 0;
    uint64_t v9 = 0;
    google::protobuf::internal::ExtensionSet::MergeFrom((google::protobuf::internal::ExtensionSet *)&v7, a2);
    google::protobuf::internal::ExtensionSet::Clear(a2);
    google::protobuf::internal::ExtensionSet::MergeFrom(a2, this);
    google::protobuf::internal::ExtensionSet::Clear(this);
    google::protobuf::internal::ExtensionSet::MergeFrom(this, (const google::protobuf::internal::ExtensionSet *)&v7);
    google::protobuf::internal::ExtensionSet::~ExtensionSet((google::protobuf::internal::ExtensionSet *)&v7);
  }
}

void sub_25BFE1B2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  google::protobuf::internal::ExtensionSet::~ExtensionSet((google::protobuf::internal::ExtensionSet *)va);
  _Unwind_Resume(a1);
}

uint64_t **google::protobuf::internal::ExtensionSet::Insert(google::protobuf::internal::ExtensionSet *this, int a2)
{
  unsigned int v3 = *((unsigned __int16 *)this + 4);
  __int16 v4 = (uint64_t **)*((void *)this + 2);
  if (v3 >= 0x101)
  {
    *((void *)&v14 + 1) = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    LODWORD(v14) = a2;
    return std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int const,google::protobuf::internal::ExtensionSet::Extension>>(v4, (int *)&v14, &v14)+ 5;
  }
  uint64_t v6 = *((unsigned __int16 *)this + 5);
  uint64_t v7 = &v4[4 * v6];
  if (!*((_WORD *)this + 5))
  {
    if (!*((_WORD *)this + 4)) {
      goto LABEL_18;
    }
    LOWORD(v6) = 0;
LABEL_17:
    *((_WORD *)this + 5) = v6 + 1;
    *(_DWORD *)uint64_t v7 = a2;
    v7[1] = 0;
    __n128 result = v7 + 1;
    v7[2] = 0;
    v7[3] = 0;
    return result;
  }
  unint64_t v8 = *((unsigned __int16 *)this + 5);
  do
  {
    unint64_t v9 = v8 >> 1;
    uint64_t v10 = &v4[4 * (v8 >> 1)];
    int v12 = *(_DWORD *)v10;
    uint64_t v11 = v10 + 4;
    v8 += ~(v8 >> 1);
    if (v12 < a2) {
      __int16 v4 = v11;
    }
    else {
      unint64_t v8 = v9;
    }
  }
  while (v8);
  if (v4 != v7)
  {
    if (*(_DWORD *)v4 == a2) {
      return v4 + 1;
    }
    if (v6 < v3)
    {
      memmove(v4 + 4, v4, (char *)v7 - (char *)v4);
      LOWORD(v6) = *((_WORD *)this + 5);
      uint64_t v7 = v4;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (v6 < v3) {
    goto LABEL_17;
  }
LABEL_18:
  google::protobuf::internal::ExtensionSet::GrowCapacity(this, v6 + 1);
  return (uint64_t **)google::protobuf::internal::ExtensionSet::Insert(this, a2);
}

uint64_t google::protobuf::internal::ExtensionSet::IsInitialized(google::protobuf::internal::ExtensionSet *this)
{
  v1 = (void *)*((void *)this + 2);
  if (*((unsigned __int16 *)this + 4) >= 0x101u)
  {
    unint64_t v8 = (void *)*v1;
    uint64_t v7 = v1 + 1;
    uint64_t v6 = v8;
    if (v8 == v7)
    {
      return 1;
    }
    else
    {
      do
      {
        uint64_t IsInitialized = google::protobuf::internal::ExtensionSet::Extension::IsInitialized((google::protobuf::internal::ExtensionSet::Extension *)(v6 + 5));
        if (!IsInitialized) {
          break;
        }
        unint64_t v9 = (void *)v6[1];
        if (v9)
        {
          do
          {
            uint64_t v10 = v9;
            unint64_t v9 = (void *)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            uint64_t v10 = (void *)v6[2];
            BOOL v11 = *v10 == (void)v6;
            uint64_t v6 = v10;
          }
          while (!v11);
        }
        uint64_t v6 = v10;
      }
      while (v10 != v7);
    }
  }
  else
  {
    while (1)
    {
      uint64_t v3 = *((void *)this + 2) + 32 * *((unsigned __int16 *)this + 5);
      uint64_t IsInitialized = v1 == (void *)v3;
      if (v1 == (void *)v3) {
        break;
      }
      __int16 v5 = (google::protobuf::internal::ExtensionSet::Extension *)(v1 + 1);
      if (!google::protobuf::internal::ExtensionSet::Extension::IsInitialized(v5)) {
        break;
      }
      v1 = (void *)((char *)v5 + 24);
      if (*((unsigned __int16 *)this + 4) > 0x100u) {
        google::protobuf::internal::ExtensionSet::IsInitialized();
      }
    }
  }
  return IsInitialized;
}

uint64_t google::protobuf::internal::ExtensionSet::Extension::IsInitialized(google::protobuf::internal::ExtensionSet::Extension *this)
{
  uint64_t v2 = *((unsigned __int8 *)this + 8);
  if ((v2 - 19) <= 0xFFFFFFED)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    uint64_t v3 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v2] != 10) {
    return 1;
  }
  if (*((unsigned char *)this + 9))
  {
    uint64_t v4 = *(void *)this;
    if (*(int *)(*(void *)this + 8) >= 1)
    {
      int v5 = 0;
      while (1)
      {
        uint64_t v6 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v4, v5);
        if (((*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6) & 1) == 0) {
          break;
        }
        ++v5;
        uint64_t v4 = *(void *)this;
        if (v5 >= *(_DWORD *)(*(void *)this + 8)) {
          return 1;
        }
      }
      return 0;
    }
    return 1;
  }
  if (*((unsigned char *)this + 10)) {
    return 1;
  }
  uint64_t v7 = **(void **)this;
  if ((*((unsigned char *)this + 10) & 0x10) != 0) {
    return ((*(uint64_t (**)(void))(v7 + 72))() & 1) != 0;
  }
  uint64_t result = (*(uint64_t (**)(void))(v7 + 48))();
  if (result) {
    return 1;
  }
  return result;
}

void sub_25BFE1EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::FindExtensionInfoFromFieldNumber(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5, unsigned char *a6)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int8 *))(*(void *)a4 + 16))(a4, a3, a5);
  if (result)
  {
    uint64_t v10 = *a5;
    if ((v10 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      BOOL v11 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    }
    unsigned int v12 = google::protobuf::internal::WireFormatLite::kWireTypeForFieldType[v10];
    *a6 = 0;
    if (a2 == 2 && a5[1])
    {
      if (v12 > 5)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 82);
        BOOL v13 = google::protobuf::internal::LogMessage::operator<<(v15, "can't reach here.");
        google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
      }
      else
      {
        uint64_t result = 1;
        if (((1 << v12) & 0x1C) == 0)
        {
          *a6 = 1;
          return result;
        }
      }
    }
    return v12 == a2;
  }
  return result;
}

void sub_25BFE200C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ExtensionSet::ParseField(google::protobuf::internal::ExtensionSet *a1, unint64_t a2, google::protobuf::internal *a3, uint64_t a4, unint64_t *a5, int32x2_t *a6)
{
  unsigned int v9 = a2;
  v16[0] = &unk_2709733E0;
  v16[1] = a4;
  unint64_t v11 = a2 >> 3;
  unsigned __int8 v15 = 0;
  if (google::protobuf::internal::ExtensionSet::FindExtensionInfoFromFieldNumber((uint64_t)a1, a2 & 7, a2 >> 3, (uint64_t)v16, v14, &v15))return google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo<std::string>(a1, v11, v15, (uint64_t)v14, a5, a3, a6); {
  if (*a5)
  }
    BOOL v13 = (std::string *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
  else {
    BOOL v13 = (std::string *)google::protobuf::internal::InternalMetadata::mutable_unknown_fields_slow<std::string>(a5);
  }
  return google::protobuf::internal::UnknownFieldParse(v9, v13, a3, (google::protobuf::internal::ParseContext *)a6);
}

unsigned __int8 *google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo<std::string>(google::protobuf::internal::ExtensionSet *this, int a2, int a3, uint64_t a4, unint64_t *a5, google::protobuf::internal *a6, int32x2_t *a7)
{
  unint64_t v8 = a6;
  int v11 = a2;
  unsigned int v12 = this;
  if (a3)
  {
    switch(*(unsigned char *)a4)
    {
      case 1:
        uint64_t v34 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 1, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)google::protobuf::internal::PackedDoubleParser((google::protobuf::internal *)v34, v8, (const char *)a7, v35);
        break;
      case 2:
        int v36 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 2, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)google::protobuf::internal::PackedFloatParser((google::protobuf::internal *)v36, v8, (const char *)a7, v37);
        break;
      case 3:
        long long v38 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 3, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = google::protobuf::internal::PackedInt64Parser((google::protobuf::internal *)v38, v8, (const char *)a7, v39);
        break;
      case 4:
        v40 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 4, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = google::protobuf::internal::PackedUInt64Parser((google::protobuf::internal *)v40, v8, (const char *)a7, v41);
        break;
      case 5:
        uint64_t v16 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 5, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = google::protobuf::internal::PackedInt32Parser((google::protobuf::internal *)v16, v8, (const char *)a7, v17);
        break;
      case 6:
        char v42 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 6, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)google::protobuf::internal::PackedFixed64Parser((google::protobuf::internal *)v42, v8, (const char *)a7, v43);
        break;
      case 7:
        uint64_t v44 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 7, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)google::protobuf::internal::PackedFixed32Parser((google::protobuf::internal *)v44, v8, (const char *)a7, v45);
        break;
      case 8:
        int v46 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 8, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = google::protobuf::internal::PackedBoolParser((google::protobuf::internal *)v46, v8, (const char *)a7, v47);
        break;
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/extension_set_inl.h", 79);
        BOOL v13 = google::protobuf::internal::LogMessage::operator<<(&v102, "Non-primitive types can't be packed.");
        google::protobuf::internal::LogFinisher::operator=((int)&v101, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v102.__r_.__value_.__l.__data_);
        goto LABEL_169;
      case 0xD:
        char v19 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 13, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = google::protobuf::internal::PackedUInt32Parser((google::protobuf::internal *)v19, v8, (const char *)a7, v20);
        break;
      case 0xE:
        v102.__r_.__value_.__r.__words[0] = (std::string::size_type)google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 14, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        *(_OWORD *)&v102.__r_.__value_.__r.__words[1] = *(_OWORD *)(a4 + 8);
        v103 = a5;
        int v104 = v11;
        unint64_t v8 = google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>((uint64_t)a7, v8, (uint64_t)&v102);
        goto LABEL_169;
      case 0xF:
        int v21 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 15, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)google::protobuf::internal::PackedSFixed32Parser((google::protobuf::internal *)v21, v8, (const char *)a7, v22);
        break;
      case 0x10:
        uint64_t v48 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 16, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)google::protobuf::internal::PackedSFixed64Parser((google::protobuf::internal *)v48, v8, (const char *)a7, v49);
        break;
      case 0x11:
        uint64_t v23 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 17, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = google::protobuf::internal::PackedSInt32Parser((google::protobuf::internal *)v23, v8, (const char *)a7, v24);
        break;
      case 0x12:
        v50 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 18, *(unsigned char *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        uint64_t result = google::protobuf::internal::PackedSInt64Parser((google::protobuf::internal *)v50, v8, (const char *)a7, v51);
        break;
      default:
        goto LABEL_169;
    }
  }
  else
  {
    switch(*(unsigned char *)a4)
    {
      case 1:
        unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 8);
        double v52 = *(double *)a6;
        if (*(unsigned char *)(a4 + 1)) {
          google::protobuf::internal::ExtensionSet::AddDouble(this, a2, 1, *(unsigned __int8 *)(a4 + 2), v52, *(const FieldDescriptor **)(a4 + 24));
        }
        else {
          google::protobuf::internal::ExtensionSet::SetDouble(this, a2, 1, v52, *(const FieldDescriptor **)(a4 + 24));
        }
        goto LABEL_169;
      case 2:
        unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 4);
        float v53 = *(float *)a6;
        if (*(unsigned char *)(a4 + 1)) {
          google::protobuf::internal::ExtensionSet::AddFloat(this, a2, 2, *(unsigned __int8 *)(a4 + 2), v53, *(const FieldDescriptor **)(a4 + 24));
        }
        else {
          google::protobuf::internal::ExtensionSet::SetFloat(this, a2, 2, v53, *(const FieldDescriptor **)(a4 + 24));
        }
        goto LABEL_169;
      case 3:
        uint64_t v54 = *(unsigned __int8 *)a6;
        if (*(char *)a6 < 0)
        {
          int v80 = v54 + (*((unsigned __int8 *)a6 + 1) << 7);
          uint64_t v54 = (v80 - 128);
          if (*((char *)a6 + 1) < 0)
          {
            unint64_t v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, (v80 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            uint64_t v54 = v97;
          }
          else
          {
            unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 2);
          }
        }
        else
        {
          unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 1);
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v67 = *(unsigned __int8 *)(a4 + 2);
          v68 = *(const FieldDescriptor **)(a4 + 24);
          this = v12;
          a2 = v11;
          int v69 = 3;
          goto LABEL_166;
        }
        v92 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        int v93 = 3;
        goto LABEL_168;
      case 4:
        uint64_t v55 = *(unsigned __int8 *)a6;
        if (*(char *)a6 < 0)
        {
          int v81 = v55 + (*((unsigned __int8 *)a6 + 1) << 7);
          uint64_t v55 = (v81 - 128);
          if (*((char *)a6 + 1) < 0)
          {
            unint64_t v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, (v81 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            uint64_t v55 = v98;
          }
          else
          {
            unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 2);
          }
        }
        else
        {
          unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 1);
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v56 = *(unsigned __int8 *)(a4 + 2);
          uint64_t v57 = *(const FieldDescriptor **)(a4 + 24);
          this = v12;
          a2 = v11;
          int v58 = 4;
          goto LABEL_147;
        }
        v82 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        int v83 = 4;
        goto LABEL_149;
      case 5:
        int v25 = *(unsigned __int8 *)a6;
        if (*(char *)a6 < 0)
        {
          int v76 = v25 + (*((unsigned __int8 *)a6 + 1) << 7);
          int v25 = v76 - 128;
          if (*((char *)a6 + 1) < 0)
          {
            unint64_t v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, (v76 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            int v25 = v94;
          }
          else
          {
            unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 2);
          }
        }
        else
        {
          unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 1);
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v30 = *(unsigned __int8 *)(a4 + 2);
          v31 = *(const FieldDescriptor **)(a4 + 24);
          this = v12;
          a2 = v11;
          int v32 = 5;
          goto LABEL_134;
        }
        v78 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        int v79 = 5;
        int v95 = v25;
        goto LABEL_137;
      case 6:
        unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 8);
        uint64_t v55 = *(void *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v56 = *(unsigned __int8 *)(a4 + 2);
          uint64_t v57 = *(const FieldDescriptor **)(a4 + 24);
          int v58 = 6;
LABEL_147:
          google::protobuf::internal::ExtensionSet::AddUInt64(this, a2, v58, v56, v55, v57);
        }
        else
        {
          v82 = *(const FieldDescriptor **)(a4 + 24);
          int v83 = 6;
LABEL_149:
          google::protobuf::internal::ExtensionSet::SetUInt64(this, a2, v83, (uint64_t *)v55, v82);
        }
        goto LABEL_169;
      case 7:
        unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 4);
        int v29 = *(_DWORD *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v59 = *(unsigned __int8 *)(a4 + 2);
          v60 = *(const FieldDescriptor **)(a4 + 24);
          int v61 = 7;
          goto LABEL_128;
        }
        v84 = *(const FieldDescriptor **)(a4 + 24);
        int v85 = 7;
        int v86 = *(_DWORD *)a6;
        goto LABEL_130;
      case 8:
        unint64_t v62 = *(unsigned __int8 *)a6;
        if (*(char *)a6 < 0)
        {
          unint64_t v62 = v62 + (*((unsigned __int8 *)a6 + 1) << 7) - 128;
          if (*((char *)a6 + 1) < 0)
          {
            unint64_t v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, v62);
            if (!v8) {
              goto LABEL_169;
            }
          }
          else
          {
            unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 2);
          }
        }
        else
        {
          unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 1);
        }
        if (*(unsigned char *)(a4 + 1)) {
          google::protobuf::internal::ExtensionSet::AddBool(v12, v11, 8, *(unsigned __int8 *)(a4 + 2), v62 != 0, *(const FieldDescriptor **)(a4 + 24));
        }
        else {
          google::protobuf::internal::ExtensionSet::SetBool(v12, v11, 8, v62 != 0, *(const FieldDescriptor **)(a4 + 24));
        }
        goto LABEL_169;
      case 9:
      case 0xC:
        char v14 = *(const FieldDescriptor **)(a4 + 24);
        if (*(unsigned char *)(a4 + 1)) {
          uint64_t v15 = (uint64_t)google::protobuf::internal::ExtensionSet::AddString(this, a2, 9, v14);
        }
        else {
          uint64_t v15 = google::protobuf::internal::ExtensionSet::MutableString(this, a2, 9, v14);
        }
        v71 = (std::string *)v15;
        int v72 = *(unsigned __int8 *)v8;
        if (*(char *)v8 < 0)
        {
          SizeFallback = google::protobuf::internal::ReadSizeFallback(v8, (const char *)*(unsigned __int8 *)v8);
          if (!SizeFallback)
          {
LABEL_113:
            unint64_t v8 = 0;
            goto LABEL_169;
          }
          v73 = SizeFallback;
          int v72 = v75;
        }
        else
        {
          v73 = (char *)v8 + 1;
        }
        return (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::ReadString((uint64_t)a7, v73, v72, v71);
      case 0xA:
        v63 = *(const google::protobuf::MessageLite **)(a4 + 8);
        v64 = *(const FieldDescriptor **)(a4 + 24);
        if (*(unsigned char *)(a4 + 1)) {
          uint64_t v65 = google::protobuf::internal::ExtensionSet::AddMessage(this, a2, 10, v63, v64);
        }
        else {
          uint64_t v65 = (uint64_t)google::protobuf::internal::ExtensionSet::MutableMessage(this, a2, 10, v63, v64);
        }
        int v87 = a7[11].i32[0];
        BOOL v88 = __OFSUB__(v87--, 1);
        a7[11].i32[0] = v87;
        if (v87 < 0 != v88) {
          goto LABEL_113;
        }
        ++a7[11].i32[1];
        uint64_t v89 = (*(uint64_t (**)(uint64_t, google::protobuf::internal *, int32x2_t *))(*(void *)v65 + 88))(v65, v8, a7);
        a7[11] = vadd_s32(a7[11], (int32x2_t)0xFFFFFFFF00000001);
        __int32 v90 = a7[10].i32[0];
        a7[10].i32[0] = 0;
        if (v90 == ((8 * v11) | 3)) {
          unint64_t v8 = (google::protobuf::internal *)v89;
        }
        else {
          unint64_t v8 = 0;
        }
        goto LABEL_169;
      case 0xB:
        uint64_t v26 = *(const google::protobuf::MessageLite **)(a4 + 8);
        char v27 = *(const FieldDescriptor **)(a4 + 24);
        if (*(unsigned char *)(a4 + 1)) {
          uint64_t v28 = (google::protobuf::MessageLite *)google::protobuf::internal::ExtensionSet::AddMessage(this, a2, 11, v26, v27);
        }
        else {
          uint64_t v28 = (google::protobuf::MessageLite *)google::protobuf::internal::ExtensionSet::MutableMessage(this, a2, 11, v26, v27);
        }
        return (unsigned __int8 *)google::protobuf::internal::ParseContext::ParseMessage((google::protobuf::internal::ParseContext *)a7, v28, (const char *)v8);
      case 0xD:
        int v29 = *(unsigned __int8 *)a6;
        if (*(char *)a6 < 0)
        {
          int v77 = v29 + (*((unsigned __int8 *)a6 + 1) << 7);
          int v29 = v77 - 128;
          if (*((char *)a6 + 1) < 0)
          {
            unint64_t v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, (v77 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            int v29 = v96;
          }
          else
          {
            unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 2);
          }
        }
        else
        {
          unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 1);
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v59 = *(unsigned __int8 *)(a4 + 2);
          v60 = *(const FieldDescriptor **)(a4 + 24);
          this = v12;
          a2 = v11;
          int v61 = 13;
LABEL_128:
          google::protobuf::internal::ExtensionSet::AddUInt32(this, a2, v61, v59, v29, v60);
        }
        else
        {
          v84 = *(const FieldDescriptor **)(a4 + 24);
          this = v12;
          a2 = v11;
          int v85 = 13;
          int v86 = v29;
LABEL_130:
          google::protobuf::internal::ExtensionSet::SetUInt32(this, a2, v85, v86, v84);
        }
        goto LABEL_169;
      case 0xE:
        unint64_t v66 = *(unsigned __int8 *)a6;
        if (*(char *)a6 < 0)
        {
          int v91 = v66 + (*((unsigned __int8 *)a6 + 1) << 7);
          unint64_t v66 = (v91 - 128);
          if (*((char *)a6 + 1) < 0)
          {
            unint64_t v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, (v91 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            unint64_t v66 = v99;
          }
          else
          {
            unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 2);
          }
        }
        else
        {
          unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 1);
        }
        if ((*(uint64_t (**)(void, unint64_t))(a4 + 8))(*(void *)(a4 + 16), v66))
        {
          if (*(unsigned char *)(a4 + 1)) {
            google::protobuf::internal::ExtensionSet::AddEnum(v12, v11, 14, *(unsigned __int8 *)(a4 + 2), v66, *(const FieldDescriptor **)(a4 + 24));
          }
          else {
            google::protobuf::internal::ExtensionSet::SetEnum(v12, v11, 14, v66, *(const FieldDescriptor **)(a4 + 24));
          }
        }
        else
        {
          if (*a5) {
            v100 = (std::string *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
          }
          else {
            v100 = (std::string *)google::protobuf::internal::InternalMetadata::mutable_unknown_fields_slow<std::string>(a5);
          }
          google::protobuf::internal::WriteVarint(v11, v66, v100);
        }
        goto LABEL_169;
      case 0xF:
        unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 4);
        int v25 = *(_DWORD *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v30 = *(unsigned __int8 *)(a4 + 2);
          v31 = *(const FieldDescriptor **)(a4 + 24);
          int v32 = 15;
          goto LABEL_134;
        }
        v78 = *(const FieldDescriptor **)(a4 + 24);
        int v79 = 15;
        goto LABEL_136;
      case 0x10:
        unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 8);
        uint64_t v54 = *(void *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v67 = *(unsigned __int8 *)(a4 + 2);
          v68 = *(const FieldDescriptor **)(a4 + 24);
          int v69 = 16;
          goto LABEL_166;
        }
        v92 = *(const FieldDescriptor **)(a4 + 24);
        int v93 = 16;
        goto LABEL_168;
      case 0x11:
        LODWORD(v33) = *(unsigned __int8 *)a6;
        if (*(char *)a6 < 0)
        {
          unint64_t v33 = v33 + (*((unsigned __int8 *)a6 + 1) << 7) - 128;
          if (*((char *)a6 + 1) < 0)
          {
            unint64_t v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, v33);
            if (!v8) {
              goto LABEL_169;
            }
          }
          else
          {
            unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 2);
          }
        }
        else
        {
          unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 1);
        }
        int v25 = -(v33 & 1) ^ (v33 >> 1);
        if (*(unsigned char *)(a4 + 1))
        {
          int v30 = *(unsigned __int8 *)(a4 + 2);
          v31 = *(const FieldDescriptor **)(a4 + 24);
          this = v12;
          a2 = v11;
          int v32 = 17;
LABEL_134:
          google::protobuf::internal::ExtensionSet::AddInt32(this, a2, v32, v30, v25, v31);
        }
        else
        {
          v78 = *(const FieldDescriptor **)(a4 + 24);
          this = v12;
          a2 = v11;
          int v79 = 17;
LABEL_136:
          int v95 = v25;
LABEL_137:
          google::protobuf::internal::ExtensionSet::SetInt32(this, a2, v79, v95, v78);
        }
        goto LABEL_169;
      case 0x12:
        unint64_t v70 = *(unsigned __int8 *)a6;
        if (*(char *)a6 < 0)
        {
          unint64_t v70 = v70 + (*((unsigned __int8 *)a6 + 1) << 7) - 128;
          if (*((char *)a6 + 1) < 0)
          {
            unint64_t v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, v70);
            if (!v8) {
              goto LABEL_169;
            }
          }
          else
          {
            unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 2);
          }
        }
        else
        {
          unint64_t v8 = (google::protobuf::internal *)((char *)a6 + 1);
        }
        uint64_t v54 = -(uint64_t)(v70 & 1) ^ (v70 >> 1);
        if (*(unsigned char *)(a4 + 1))
        {
          int v67 = *(unsigned __int8 *)(a4 + 2);
          v68 = *(const FieldDescriptor **)(a4 + 24);
          this = v12;
          a2 = v11;
          int v69 = 18;
LABEL_166:
          google::protobuf::internal::ExtensionSet::AddInt64(this, a2, v69, v67, v54, v68);
        }
        else
        {
          v92 = *(const FieldDescriptor **)(a4 + 24);
          this = v12;
          a2 = v11;
          int v93 = 18;
LABEL_168:
          google::protobuf::internal::ExtensionSet::SetInt64(this, a2, v93, (uint64_t *)v54, v92);
        }
LABEL_169:
        uint64_t result = (unsigned __int8 *)v8;
        break;
      default:
        goto LABEL_169;
    }
  }
  return result;
}

void sub_25BFE2D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ExtensionSet::_InternalSerialize(google::protobuf::internal::ExtensionSet *this, signed int a2, int a3, unsigned __int8 *a4, google::protobuf::io::EpsCopyOutputStream *a5)
{
  uint64_t v7 = (unsigned int *)*((void *)this + 2);
  if (*((unsigned __int16 *)this + 4) >= 0x101u)
  {
    uint64_t v18 = *((void *)v7 + 1);
    uint64_t v17 = v7 + 2;
    uint64_t v16 = v18;
    if (v18)
    {
      char v19 = (int **)v17;
      do
      {
        int v20 = *(_DWORD *)(v16 + 32);
        BOOL v21 = v20 < a2;
        if (v20 >= a2) {
          uint64_t v22 = (uint64_t *)v16;
        }
        else {
          uint64_t v22 = (uint64_t *)(v16 + 8);
        }
        if (!v21) {
          char v19 = (int **)v16;
        }
        uint64_t v16 = *v22;
      }
      while (*v22);
      if (v19 != (int **)v17)
      {
        do
        {
          uint64_t v23 = *((unsigned int *)v19 + 8);
          if ((int)v23 >= a3) {
            break;
          }
          a4 = google::protobuf::internal::ExtensionSet::Extension::InternalSerializeFieldWithCachedSizesToArray(v19 + 5, v23, (char *)a4, a5);
          uint64_t v24 = (unsigned int *)v19[1];
          if (v24)
          {
            do
            {
              int v25 = v24;
              uint64_t v24 = *(unsigned int **)v24;
            }
            while (v24);
          }
          else
          {
            do
            {
              int v25 = (unsigned int *)v19[2];
              BOOL v26 = *(void *)v25 == (void)v19;
              char v19 = (int **)v25;
            }
            while (!v26);
          }
          char v19 = (int **)v25;
        }
        while (v25 != v17);
      }
    }
  }
  else
  {
    unint64_t v8 = *((unsigned __int16 *)this + 5);
    if (*((_WORD *)this + 5))
    {
      unsigned int v9 = &v7[8 * v8];
      do
      {
        unint64_t v10 = v8 >> 1;
        int v11 = &v7[8 * (v8 >> 1)];
        signed int v13 = *v11;
        unsigned int v12 = v11 + 8;
        v8 += ~(v8 >> 1);
        if (v13 < a2) {
          uint64_t v7 = v12;
        }
        else {
          unint64_t v8 = v10;
        }
      }
      while (v8);
      while (v7 != v9)
      {
        uint64_t v14 = *v7;
        if ((int)v14 >= a3) {
          break;
        }
        a4 = google::protobuf::internal::ExtensionSet::Extension::InternalSerializeFieldWithCachedSizesToArray((int **)v7 + 1, v14, (char *)a4, a5);
        v7 += 8;
      }
    }
  }
  return a4;
}

unsigned __int8 *google::protobuf::internal::ExtensionSet::Extension::InternalSerializeFieldWithCachedSizesToArray(int **this, uint64_t a2, char *a3, google::protobuf::io::EpsCopyOutputStream *a4)
{
  int v5 = a3;
  if (*((unsigned char *)this + 9))
  {
    if (*((unsigned char *)this + 11))
    {
      if (*((_DWORD *)this + 3))
      {
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, a3);
        }
        unsigned int v8 = (8 * a2) | 2;
        if (v8 > 0x7F)
        {
          *int v5 = (8 * a2) | 0x82;
          unsigned int v32 = (8 * a2) >> 7;
          if (v8 >> 14)
          {
            unsigned int v9 = v5 + 2;
            do
            {
              *(v9 - 1) = v32 | 0x80;
              unsigned int v33 = v32 >> 7;
              ++v9;
              unsigned int v34 = v32 >> 14;
              v32 >>= 7;
            }
            while (v34);
            *(v9 - 1) = v33;
          }
          else
          {
            v5[1] = v32;
            unsigned int v9 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v8;
          unsigned int v9 = v5 + 1;
        }
        unint64_t v35 = *((int *)this + 3);
        if (v35 > 0x7F)
        {
          *unsigned int v9 = v35 | 0x80;
          unint64_t v36 = v35 >> 7;
          if (v35 >> 14)
          {
            int v5 = v9 + 2;
            do
            {
              *(v5 - 1) = v36 | 0x80;
              unint64_t v37 = v36 >> 7;
              ++v5;
              unint64_t v38 = v36 >> 14;
              v36 >>= 7;
            }
            while (v38);
            *(v5 - 1) = v37;
          }
          else
          {
            v9[1] = v36;
            int v5 = v9 + 2;
          }
        }
        else
        {
          *unsigned int v9 = v35;
          int v5 = v9 + 1;
        }
        int v39 = *((unsigned __int8 *)this + 8);
        if ((v39 - 19) <= 0xFFFFFFED)
        {
          google::protobuf::internal::LogMessage::LogMessage((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
          v40 = google::protobuf::internal::LogMessage::operator<<(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
          google::protobuf::internal::LogFinisher::operator=((int)&v431, (const char **)&v40->__r_.__value_.__l.__data_);
          google::protobuf::internal::LogMessage::~LogMessage((void **)&v432[0].__r_.__value_.__l.__data_);
        }
        switch(v39)
        {
          case 1:
            v63 = *this;
            if (**this >= 1)
            {
              int v64 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v63 = *this;
                }
                *(void *)int v5 = *(void *)google::protobuf::RepeatedField<double>::Get(v63, v64);
                v5 += 8;
                ++v64;
                v63 = *this;
              }
              while (v64 < **this);
            }
            break;
          case 2:
            uint64_t v65 = *this;
            if (**this >= 1)
            {
              int v66 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  uint64_t v65 = *this;
                }
                *(_DWORD *)int v5 = *(_DWORD *)google::protobuf::RepeatedField<float>::Get(v65, v66);
                v5 += 4;
                ++v66;
                uint64_t v65 = *this;
              }
              while (v66 < **this);
            }
            break;
          case 3:
            int v67 = *this;
            if (**this >= 1)
            {
              int v68 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  int v67 = *this;
                }
                unint64_t v69 = *(void *)google::protobuf::RepeatedField<long long>::Get(v67, v68);
                if (v69 > 0x7F)
                {
                  *int v5 = v69 | 0x80;
                  unint64_t v70 = v69 >> 7;
                  if (v69 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v70 | 0x80;
                      unint64_t v71 = v70 >> 7;
                      ++v5;
                      unint64_t v72 = v70 >> 14;
                      v70 >>= 7;
                    }
                    while (v72);
                    *(v5 - 1) = v71;
                  }
                  else
                  {
                    v5[1] = v70;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v69;
                }
                ++v68;
                int v67 = *this;
              }
              while (v68 < **this);
            }
            break;
          case 4:
            v73 = *this;
            if (**this >= 1)
            {
              int v74 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v73 = *this;
                }
                unint64_t v75 = *(void *)google::protobuf::RepeatedField<unsigned long long>::Get(v73, v74);
                if (v75 > 0x7F)
                {
                  *int v5 = v75 | 0x80;
                  unint64_t v76 = v75 >> 7;
                  if (v75 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v76 | 0x80;
                      unint64_t v77 = v76 >> 7;
                      ++v5;
                      unint64_t v78 = v76 >> 14;
                      v76 >>= 7;
                    }
                    while (v78);
                    *(v5 - 1) = v77;
                  }
                  else
                  {
                    v5[1] = v76;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v75;
                }
                ++v74;
                v73 = *this;
              }
              while (v74 < **this);
            }
            break;
          case 5:
            char v42 = *this;
            if (**this >= 1)
            {
              int v43 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  char v42 = *this;
                }
                unint64_t v44 = *(int *)google::protobuf::RepeatedField<int>::Get(v42, v43);
                if (v44 > 0x7F)
                {
                  *int v5 = v44 | 0x80;
                  unint64_t v45 = v44 >> 7;
                  if (v44 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v45 | 0x80;
                      unint64_t v46 = v45 >> 7;
                      ++v5;
                      unint64_t v47 = v45 >> 14;
                      v45 >>= 7;
                    }
                    while (v47);
                    *(v5 - 1) = v46;
                  }
                  else
                  {
                    v5[1] = v45;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v44;
                }
                ++v43;
                char v42 = *this;
              }
              while (v43 < **this);
            }
            break;
          case 6:
            int v79 = *this;
            if (**this >= 1)
            {
              int v80 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  int v79 = *this;
                }
                *(void *)int v5 = *(void *)google::protobuf::RepeatedField<unsigned long long>::Get(v79, v80);
                v5 += 8;
                ++v80;
                int v79 = *this;
              }
              while (v80 < **this);
            }
            break;
          case 7:
            int v81 = *this;
            if (**this >= 1)
            {
              int v82 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  int v81 = *this;
                }
                *(_DWORD *)int v5 = *(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v81, v82);
                v5 += 4;
                ++v82;
                int v81 = *this;
              }
              while (v82 < **this);
            }
            break;
          case 8:
            int v83 = *this;
            if (**this >= 1)
            {
              int v84 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  int v83 = *this;
                }
                *v5++ = *(unsigned char *)google::protobuf::RepeatedField<BOOL>::Get(v83, v84++);
                int v83 = *this;
              }
              while (v84 < **this);
            }
            break;
          case 9:
          case 10:
          case 11:
          case 12:
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1966);
            v41 = google::protobuf::internal::LogMessage::operator<<(v432, "Non-primitive types can't be packed.");
            google::protobuf::internal::LogFinisher::operator=((int)&v431, (const char **)&v41->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v432[0].__r_.__value_.__l.__data_);
            break;
          case 13:
            uint64_t v48 = *this;
            if (**this >= 1)
            {
              int v49 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  uint64_t v48 = *this;
                }
                unsigned int v50 = *(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v48, v49);
                if (v50 > 0x7F)
                {
                  *int v5 = v50 | 0x80;
                  unsigned int v51 = v50 >> 7;
                  if (v50 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v51 | 0x80;
                      unsigned int v52 = v51 >> 7;
                      ++v5;
                      unsigned int v53 = v51 >> 14;
                      v51 >>= 7;
                    }
                    while (v53);
                    *(v5 - 1) = v52;
                  }
                  else
                  {
                    v5[1] = v51;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v50;
                }
                ++v49;
                uint64_t v48 = *this;
              }
              while (v49 < **this);
            }
            break;
          case 14:
            int v85 = *this;
            if (**this >= 1)
            {
              int v86 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  int v85 = *this;
                }
                unint64_t v87 = *(int *)google::protobuf::RepeatedField<int>::Get(v85, v86);
                if (v87 > 0x7F)
                {
                  *int v5 = v87 | 0x80;
                  unint64_t v88 = v87 >> 7;
                  if (v87 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v88 | 0x80;
                      unint64_t v89 = v88 >> 7;
                      ++v5;
                      unint64_t v90 = v88 >> 14;
                      v88 >>= 7;
                    }
                    while (v90);
                    *(v5 - 1) = v89;
                  }
                  else
                  {
                    v5[1] = v88;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v87;
                }
                ++v86;
                int v85 = *this;
              }
              while (v86 < **this);
            }
            break;
          case 15:
            uint64_t v54 = *this;
            if (**this >= 1)
            {
              int v55 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  uint64_t v54 = *this;
                }
                *(_DWORD *)int v5 = *(_DWORD *)google::protobuf::RepeatedField<int>::Get(v54, v55);
                v5 += 4;
                ++v55;
                uint64_t v54 = *this;
              }
              while (v55 < **this);
            }
            break;
          case 16:
            int v91 = *this;
            if (**this >= 1)
            {
              int v92 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  int v91 = *this;
                }
                *(void *)int v5 = *(void *)google::protobuf::RepeatedField<long long>::Get(v91, v92);
                v5 += 8;
                ++v92;
                int v91 = *this;
              }
              while (v92 < **this);
            }
            break;
          case 17:
            int v56 = *this;
            if (**this >= 1)
            {
              int v57 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  int v56 = *this;
                }
                int v58 = (int *)google::protobuf::RepeatedField<int>::Get(v56, v57);
                unsigned int v59 = (2 * *v58) ^ (*v58 >> 31);
                if (v59 > 0x7F)
                {
                  *int v5 = v59 | 0x80;
                  unsigned int v60 = v59 >> 7;
                  if (v59 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v60 | 0x80;
                      unsigned int v61 = v60 >> 7;
                      ++v5;
                      unsigned int v62 = v60 >> 14;
                      v60 >>= 7;
                    }
                    while (v62);
                    *(v5 - 1) = v61;
                  }
                  else
                  {
                    v5[1] = v60;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v59;
                }
                ++v57;
                int v56 = *this;
              }
              while (v57 < **this);
            }
            break;
          case 18:
            int v93 = *this;
            if (**this >= 1)
            {
              int v94 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  int v93 = *this;
                }
                int v95 = (uint64_t *)google::protobuf::RepeatedField<long long>::Get(v93, v94);
                unint64_t v96 = (2 * *v95) ^ (*v95 >> 63);
                if (v96 > 0x7F)
                {
                  *int v5 = v96 | 0x80;
                  unint64_t v97 = v96 >> 7;
                  if (v96 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v97 | 0x80;
                      unint64_t v98 = v97 >> 7;
                      ++v5;
                      unint64_t v99 = v97 >> 14;
                      v97 >>= 7;
                    }
                    while (v99);
                    *(v5 - 1) = v98;
                  }
                  else
                  {
                    v5[1] = v97;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v96;
                }
                ++v94;
                int v93 = *this;
              }
              while (v94 < **this);
            }
            break;
          default:
            return (unsigned __int8 *)v5;
        }
      }
      return (unsigned __int8 *)v5;
    }
    int v18 = *((unsigned __int8 *)this + 8);
    if ((v18 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      char v19 = google::protobuf::internal::LogMessage::operator<<(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v431, (const char **)&v19->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v432[0].__r_.__value_.__l.__data_);
    }
    switch(v18)
    {
      case 1:
        int v20 = *this;
        if (**this >= 1)
        {
          int v21 = 0;
          unsigned int v22 = 8 * a2;
          unsigned int v23 = (8 * a2) | 1;
          char v24 = (8 * a2) | 0x81;
          unsigned int v25 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v26 = v22 >> 7;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              int v20 = *this;
            }
            uint64_t v27 = *(void *)google::protobuf::RepeatedField<double>::Get(v20, v21);
            if (v23 > 0x7F)
            {
              *int v5 = v24;
              if (v23 >= 0x4000)
              {
                uint64_t v28 = v5 + 2;
                unsigned int v29 = v25;
                do
                {
                  *((unsigned char *)v28 - 1) = v29 | 0x80;
                  unsigned int v30 = v29 >> 7;
                  uint64_t v28 = (void *)((char *)v28 + 1);
                  unsigned int v31 = v29 >> 14;
                  v29 >>= 7;
                }
                while (v31);
                *((unsigned char *)v28 - 1) = v30;
              }
              else
              {
                v5[1] = v26;
                uint64_t v28 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v23;
              uint64_t v28 = v5 + 1;
            }
            *uint64_t v28 = v27;
            int v5 = (char *)(v28 + 1);
            ++v21;
            int v20 = *this;
          }
          while (v21 < **this);
        }
        return (unsigned __int8 *)v5;
      case 2:
        v100 = *this;
        if (**this >= 1)
        {
          int v101 = 0;
          unsigned int v102 = (8 * a2) | 5;
          unsigned int v103 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v104 = (8 * a2) >> 7;
          char v105 = (8 * a2) | 0x85;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v100 = *this;
            }
            int v106 = *(_DWORD *)google::protobuf::RepeatedField<float>::Get(v100, v101);
            if (v102 > 0x7F)
            {
              *int v5 = v105;
              if (v102 >= 0x4000)
              {
                v107 = v5 + 2;
                unsigned int v108 = v103;
                do
                {
                  *((unsigned char *)v107 - 1) = v108 | 0x80;
                  unsigned int v109 = v108 >> 7;
                  v107 = (_DWORD *)((char *)v107 + 1);
                  unsigned int v110 = v108 >> 14;
                  v108 >>= 7;
                }
                while (v110);
                *((unsigned char *)v107 - 1) = v109;
              }
              else
              {
                v5[1] = v104;
                v107 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v102;
              v107 = v5 + 1;
            }
            _DWORD *v107 = v106;
            int v5 = (char *)(v107 + 1);
            ++v101;
            v100 = *this;
          }
          while (v101 < **this);
        }
        return (unsigned __int8 *)v5;
      case 3:
        v111 = *this;
        if (**this >= 1)
        {
          int v112 = 0;
          unsigned int v113 = 8 * a2;
          char v114 = (8 * a2) | 0x80;
          unsigned int v115 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v111 = *this;
            }
            unint64_t v116 = *(void *)google::protobuf::RepeatedField<long long>::Get(v111, v112);
            if (v113 > 0x7F)
            {
              *int v5 = v114;
              if (v113 >= 0x4000)
              {
                v117 = v5 + 2;
                unsigned int v118 = v115;
                do
                {
                  *(v117 - 1) = v118 | 0x80;
                  unsigned int v119 = v118 >> 7;
                  ++v117;
                  unsigned int v120 = v118 >> 14;
                  v118 >>= 7;
                }
                while (v120);
                *(v117 - 1) = v119;
              }
              else
              {
                v5[1] = v113 >> 7;
                v117 = v5 + 2;
              }
            }
            else
            {
              v117 = v5 + 1;
              *int v5 = v113;
            }
            if (v116 > 0x7F)
            {
              unsigned char *v117 = v116 | 0x80;
              unint64_t v121 = v116 >> 7;
              if (v116 >> 14)
              {
                int v5 = v117 + 2;
                do
                {
                  *(v5 - 1) = v121 | 0x80;
                  unint64_t v122 = v121 >> 7;
                  ++v5;
                  unint64_t v123 = v121 >> 14;
                  v121 >>= 7;
                }
                while (v123);
                *(v5 - 1) = v122;
              }
              else
              {
                v117[1] = v121;
                int v5 = v117 + 2;
              }
            }
            else
            {
              unsigned char *v117 = v116;
              int v5 = v117 + 1;
            }
            ++v112;
            v111 = *this;
          }
          while (v112 < **this);
        }
        return (unsigned __int8 *)v5;
      case 4:
        v124 = *this;
        if (**this >= 1)
        {
          int v125 = 0;
          unsigned int v126 = 8 * a2;
          char v127 = (8 * a2) | 0x80;
          unsigned int v128 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v124 = *this;
            }
            unint64_t v129 = *(void *)google::protobuf::RepeatedField<unsigned long long>::Get(v124, v125);
            if (v126 > 0x7F)
            {
              *int v5 = v127;
              if (v126 >= 0x4000)
              {
                v130 = v5 + 2;
                unsigned int v131 = v128;
                do
                {
                  *(v130 - 1) = v131 | 0x80;
                  unsigned int v132 = v131 >> 7;
                  ++v130;
                  unsigned int v133 = v131 >> 14;
                  v131 >>= 7;
                }
                while (v133);
                *(v130 - 1) = v132;
              }
              else
              {
                v5[1] = v126 >> 7;
                v130 = v5 + 2;
              }
            }
            else
            {
              v130 = v5 + 1;
              *int v5 = v126;
            }
            if (v129 > 0x7F)
            {
              unsigned char *v130 = v129 | 0x80;
              unint64_t v134 = v129 >> 7;
              if (v129 >> 14)
              {
                int v5 = v130 + 2;
                do
                {
                  *(v5 - 1) = v134 | 0x80;
                  unint64_t v135 = v134 >> 7;
                  ++v5;
                  unint64_t v136 = v134 >> 14;
                  v134 >>= 7;
                }
                while (v136);
                *(v5 - 1) = v135;
              }
              else
              {
                v130[1] = v134;
                int v5 = v130 + 2;
              }
            }
            else
            {
              unsigned char *v130 = v129;
              int v5 = v130 + 1;
            }
            ++v125;
            v124 = *this;
          }
          while (v125 < **this);
        }
        return (unsigned __int8 *)v5;
      case 5:
        v137 = *this;
        if (**this >= 1)
        {
          int v138 = 0;
          unsigned int v139 = 8 * a2;
          char v140 = (8 * a2) | 0x80;
          unsigned int v141 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v137 = *this;
            }
            unint64_t v142 = *(int *)google::protobuf::RepeatedField<int>::Get(v137, v138);
            if (v139 > 0x7F)
            {
              *int v5 = v140;
              if (v139 >= 0x4000)
              {
                v143 = v5 + 2;
                unsigned int v144 = v141;
                do
                {
                  *(v143 - 1) = v144 | 0x80;
                  unsigned int v145 = v144 >> 7;
                  ++v143;
                  unsigned int v146 = v144 >> 14;
                  v144 >>= 7;
                }
                while (v146);
                *(v143 - 1) = v145;
              }
              else
              {
                v5[1] = v139 >> 7;
                v143 = v5 + 2;
              }
            }
            else
            {
              v143 = v5 + 1;
              *int v5 = v139;
            }
            if (v142 > 0x7F)
            {
              unsigned char *v143 = v142 | 0x80;
              unint64_t v147 = v142 >> 7;
              if (v142 >> 14)
              {
                int v5 = v143 + 2;
                do
                {
                  *(v5 - 1) = v147 | 0x80;
                  unint64_t v148 = v147 >> 7;
                  ++v5;
                  unint64_t v149 = v147 >> 14;
                  v147 >>= 7;
                }
                while (v149);
                *(v5 - 1) = v148;
              }
              else
              {
                v143[1] = v147;
                int v5 = v143 + 2;
              }
            }
            else
            {
              unsigned char *v143 = v142;
              int v5 = v143 + 1;
            }
            ++v138;
            v137 = *this;
          }
          while (v138 < **this);
        }
        return (unsigned __int8 *)v5;
      case 6:
        v150 = *this;
        if (**this >= 1)
        {
          int v151 = 0;
          unsigned int v152 = 8 * a2;
          unsigned int v153 = (8 * a2) | 1;
          char v154 = (8 * a2) | 0x81;
          unsigned int v155 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v156 = v152 >> 7;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v150 = *this;
            }
            uint64_t v157 = *(void *)google::protobuf::RepeatedField<unsigned long long>::Get(v150, v151);
            if (v153 > 0x7F)
            {
              *int v5 = v154;
              if (v153 >= 0x4000)
              {
                v158 = v5 + 2;
                unsigned int v159 = v155;
                do
                {
                  *((unsigned char *)v158 - 1) = v159 | 0x80;
                  unsigned int v160 = v159 >> 7;
                  v158 = (void *)((char *)v158 + 1);
                  unsigned int v161 = v159 >> 14;
                  v159 >>= 7;
                }
                while (v161);
                *((unsigned char *)v158 - 1) = v160;
              }
              else
              {
                v5[1] = v156;
                v158 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v153;
              v158 = v5 + 1;
            }
            void *v158 = v157;
            int v5 = (char *)(v158 + 1);
            ++v151;
            v150 = *this;
          }
          while (v151 < **this);
        }
        return (unsigned __int8 *)v5;
      case 7:
        v162 = *this;
        if (**this >= 1)
        {
          int v163 = 0;
          unsigned int v164 = (8 * a2) | 5;
          unsigned int v165 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v166 = (8 * a2) >> 7;
          char v167 = (8 * a2) | 0x85;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v162 = *this;
            }
            int v168 = *(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v162, v163);
            if (v164 > 0x7F)
            {
              *int v5 = v167;
              if (v164 >= 0x4000)
              {
                v169 = v5 + 2;
                unsigned int v170 = v165;
                do
                {
                  *((unsigned char *)v169 - 1) = v170 | 0x80;
                  unsigned int v171 = v170 >> 7;
                  v169 = (_DWORD *)((char *)v169 + 1);
                  unsigned int v172 = v170 >> 14;
                  v170 >>= 7;
                }
                while (v172);
                *((unsigned char *)v169 - 1) = v171;
              }
              else
              {
                v5[1] = v166;
                v169 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v164;
              v169 = v5 + 1;
            }
            _DWORD *v169 = v168;
            int v5 = (char *)(v169 + 1);
            ++v163;
            v162 = *this;
          }
          while (v163 < **this);
        }
        return (unsigned __int8 *)v5;
      case 8:
        v173 = *this;
        if (**this >= 1)
        {
          int v174 = 0;
          unsigned int v175 = 8 * a2;
          char v176 = (8 * a2) | 0x80;
          unsigned int v177 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v173 = *this;
            }
            char v178 = *(unsigned char *)google::protobuf::RepeatedField<BOOL>::Get(v173, v174);
            if (v175 > 0x7F)
            {
              *int v5 = v176;
              if (v175 >= 0x4000)
              {
                v179 = v5 + 2;
                unsigned int v180 = v177;
                do
                {
                  *(v179 - 1) = v180 | 0x80;
                  unsigned int v181 = v180 >> 7;
                  ++v179;
                  unsigned int v182 = v180 >> 14;
                  v180 >>= 7;
                }
                while (v182);
                *(v179 - 1) = v181;
              }
              else
              {
                v5[1] = v175 >> 7;
                v179 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v175;
              v179 = v5 + 1;
            }
            unsigned char *v179 = v178;
            int v5 = v179 + 1;
            ++v174;
            v173 = *this;
          }
          while (v174 < **this);
        }
        return (unsigned __int8 *)v5;
      case 9:
        uint64_t v183 = (uint64_t)*this;
        if ((*this)[2] < 1) {
          return (unsigned __int8 *)v5;
        }
        int v184 = 0;
        unsigned int v185 = 8 * a2;
        uint64_t v186 = 4;
        if (((a2 >> 25) & 0xF) != 0) {
          uint64_t v186 = 5;
        }
        unsigned int v187 = (8 * a2) | 2;
        uint64_t v188 = 1;
        if (v185 >= 0x80) {
          uint64_t v188 = 2;
        }
        if (v185 < 0x200000) {
          uint64_t v186 = 3;
        }
        if (v185 >= 0x4000) {
          uint64_t v189 = v186;
        }
        else {
          uint64_t v189 = v188;
        }
        unsigned int v429 = v185 >> 7;
        while (1)
        {
          if (*(void *)a4 <= (unint64_t)v5)
          {
            int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
            uint64_t v183 = (uint64_t)*this;
          }
          uint64_t v190 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(v183, v184);
          if (*(char *)(v190 + 23) < 0)
          {
            int64_t v191 = *(void *)(v190 + 8);
            if (v191 > 127) {
              goto LABEL_326;
            }
          }
          else
          {
            int64_t v191 = *(unsigned __int8 *)(v190 + 23);
          }
          if ((uint64_t)(*(void *)a4 + ~(unint64_t)&v5[v189] + 16) >= v191)
          {
            if (v187 > 0x7F)
            {
              *int v5 = (8 * a2) | 0x82;
              if (v187 >= 0x4000)
              {
                v192 = v5 + 2;
                unsigned int v193 = (a2 >> 4) & 0x1FFFFFF;
                do
                {
                  *(v192 - 1) = v193 | 0x80;
                  unsigned int v194 = v193 >> 7;
                  ++v192;
                  unsigned int v195 = v193 >> 14;
                  v193 >>= 7;
                }
                while (v195);
                *(v192 - 1) = v194;
              }
              else
              {
                v5[1] = v429;
                v192 = v5 + 2;
              }
            }
            else
            {
              v192 = v5 + 1;
              *int v5 = v187;
            }
            unsigned char *v192 = v191;
            v196 = v192 + 1;
            if (*(char *)(v190 + 23) >= 0) {
              v197 = (const void *)v190;
            }
            else {
              v197 = *(const void **)v190;
            }
            memcpy(v196, v197, v191);
            int v5 = &v196[v191];
            goto LABEL_324;
          }
LABEL_326:
          int v5 = (char *)google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, v190, v5);
LABEL_324:
          ++v184;
          uint64_t v183 = (uint64_t)*this;
          if (v184 >= (*this)[2]) {
            return (unsigned __int8 *)v5;
          }
        }
      case 10:
        uint64_t v198 = (uint64_t)*this;
        if ((*this)[2] >= 1)
        {
          int v199 = 0;
          unsigned int v200 = (8 * a2) | 3;
          char v201 = (8 * a2) | 0x83;
          unsigned int v202 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v203 = (8 * a2) | 4;
          unsigned int v204 = (8 * a2) >> 7;
          char v205 = (8 * a2) | 0x84;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              uint64_t v198 = (uint64_t)*this;
            }
            uint64_t v206 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v198, v199);
            if (v200 > 0x7F)
            {
              *int v5 = v201;
              if (v200 >= 0x4000)
              {
                v207 = v5 + 2;
                unsigned int v208 = v202;
                do
                {
                  *(v207 - 1) = v208 | 0x80;
                  unsigned int v209 = v208 >> 7;
                  ++v207;
                  unsigned int v210 = v208 >> 14;
                  v208 >>= 7;
                }
                while (v210);
                *(v207 - 1) = v209;
              }
              else
              {
                v5[1] = v204;
                v207 = v5 + 2;
              }
            }
            else
            {
              v207 = v5 + 1;
              *int v5 = v200;
            }
            v211 = (char *)(*(uint64_t (**)(uint64_t, char *, google::protobuf::io::EpsCopyOutputStream *))(*(void *)v206 + 96))(v206, v207, a4);
            if (*(void *)a4 <= (unint64_t)v211) {
              v211 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v211);
            }
            if (v203 > 0x7F)
            {
              char *v211 = v205;
              if (v203 >= 0x4000)
              {
                int v5 = v211 + 2;
                unsigned int v212 = v202;
                do
                {
                  *(v5 - 1) = v212 | 0x80;
                  unsigned int v213 = v212 >> 7;
                  ++v5;
                  unsigned int v214 = v212 >> 14;
                  v212 >>= 7;
                }
                while (v214);
                *(v5 - 1) = v213;
              }
              else
              {
                v211[1] = v204;
                int v5 = v211 + 2;
              }
            }
            else
            {
              int v5 = v211 + 1;
              char *v211 = v203;
            }
            ++v199;
            uint64_t v198 = (uint64_t)*this;
          }
          while (v199 < (*this)[2]);
        }
        return (unsigned __int8 *)v5;
      case 11:
        uint64_t v215 = (uint64_t)*this;
        if ((*this)[2] >= 1)
        {
          int v216 = 0;
          unsigned int v217 = (8 * a2) | 2;
          unsigned int v218 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v219 = (8 * a2) >> 7;
          char v220 = (8 * a2) | 0x82;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              uint64_t v215 = (uint64_t)*this;
            }
            uint64_t v221 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v215, v216);
            uint64_t v222 = v221;
            if (v217 > 0x7F)
            {
              *int v5 = v220;
              if (v217 >= 0x4000)
              {
                v223 = v5 + 2;
                unsigned int v224 = v218;
                do
                {
                  *(v223 - 1) = v224 | 0x80;
                  unsigned int v225 = v224 >> 7;
                  ++v223;
                  unsigned int v226 = v224 >> 14;
                  v224 >>= 7;
                }
                while (v226);
                *(v223 - 1) = v225;
              }
              else
              {
                v5[1] = v219;
                v223 = v5 + 2;
              }
            }
            else
            {
              v223 = v5 + 1;
              *int v5 = v217;
            }
            unsigned int v227 = (*(uint64_t (**)(uint64_t))(*(void *)v221 + 80))(v221);
            if (v227 > 0x7F)
            {
              unsigned char *v223 = v227 | 0x80;
              unsigned int v229 = v227 >> 7;
              if (v227 >> 14)
              {
                v228 = v223 + 2;
                do
                {
                  *(v228 - 1) = v229 | 0x80;
                  unsigned int v230 = v229 >> 7;
                  ++v228;
                  unsigned int v231 = v229 >> 14;
                  v229 >>= 7;
                }
                while (v231);
                *(v228 - 1) = v230;
              }
              else
              {
                v223[1] = v229;
                v228 = v223 + 2;
              }
            }
            else
            {
              unsigned char *v223 = v227;
              v228 = v223 + 1;
            }
            int v5 = (char *)(*(uint64_t (**)(uint64_t, unsigned char *, google::protobuf::io::EpsCopyOutputStream *))(*(void *)v222 + 96))(v222, v228, a4);
            ++v216;
            uint64_t v215 = (uint64_t)*this;
          }
          while (v216 < (*this)[2]);
        }
        return (unsigned __int8 *)v5;
      case 12:
        uint64_t v232 = (uint64_t)*this;
        if ((*this)[2] < 1) {
          return (unsigned __int8 *)v5;
        }
        int v233 = 0;
        unsigned int v234 = 8 * a2;
        uint64_t v235 = 4;
        if (((a2 >> 25) & 0xF) != 0) {
          uint64_t v235 = 5;
        }
        unsigned int v236 = (8 * a2) | 2;
        uint64_t v237 = 1;
        if (v234 >= 0x80) {
          uint64_t v237 = 2;
        }
        if (v234 < 0x200000) {
          uint64_t v235 = 3;
        }
        if (v234 >= 0x4000) {
          uint64_t v238 = v235;
        }
        else {
          uint64_t v238 = v237;
        }
        unsigned int v430 = v234 >> 7;
        break;
      case 13:
        v247 = *this;
        if (**this >= 1)
        {
          int v248 = 0;
          unsigned int v249 = 8 * a2;
          char v250 = (8 * a2) | 0x80;
          unsigned int v251 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v247 = *this;
            }
            unsigned int v252 = *(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v247, v248);
            if (v249 > 0x7F)
            {
              *int v5 = v250;
              if (v249 >= 0x4000)
              {
                v253 = v5 + 2;
                unsigned int v254 = v251;
                do
                {
                  *(v253 - 1) = v254 | 0x80;
                  unsigned int v255 = v254 >> 7;
                  ++v253;
                  unsigned int v256 = v254 >> 14;
                  v254 >>= 7;
                }
                while (v256);
                *(v253 - 1) = v255;
              }
              else
              {
                v5[1] = v249 >> 7;
                v253 = v5 + 2;
              }
            }
            else
            {
              v253 = v5 + 1;
              *int v5 = v249;
            }
            if (v252 > 0x7F)
            {
              unsigned char *v253 = v252 | 0x80;
              unsigned int v257 = v252 >> 7;
              if (v252 >> 14)
              {
                int v5 = v253 + 2;
                do
                {
                  *(v5 - 1) = v257 | 0x80;
                  unsigned int v258 = v257 >> 7;
                  ++v5;
                  unsigned int v259 = v257 >> 14;
                  v257 >>= 7;
                }
                while (v259);
                *(v5 - 1) = v258;
              }
              else
              {
                v253[1] = v257;
                int v5 = v253 + 2;
              }
            }
            else
            {
              unsigned char *v253 = v252;
              int v5 = v253 + 1;
            }
            ++v248;
            v247 = *this;
          }
          while (v248 < **this);
        }
        return (unsigned __int8 *)v5;
      case 14:
        v260 = *this;
        if (**this >= 1)
        {
          int v261 = 0;
          unsigned int v262 = 8 * a2;
          char v263 = (8 * a2) | 0x80;
          unsigned int v264 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v260 = *this;
            }
            unint64_t v265 = *(int *)google::protobuf::RepeatedField<int>::Get(v260, v261);
            if (v262 > 0x7F)
            {
              *int v5 = v263;
              if (v262 >= 0x4000)
              {
                v266 = v5 + 2;
                unsigned int v267 = v264;
                do
                {
                  *(v266 - 1) = v267 | 0x80;
                  unsigned int v268 = v267 >> 7;
                  ++v266;
                  unsigned int v269 = v267 >> 14;
                  v267 >>= 7;
                }
                while (v269);
                *(v266 - 1) = v268;
              }
              else
              {
                v5[1] = v262 >> 7;
                v266 = v5 + 2;
              }
            }
            else
            {
              v266 = v5 + 1;
              *int v5 = v262;
            }
            if (v265 > 0x7F)
            {
              unsigned char *v266 = v265 | 0x80;
              unint64_t v270 = v265 >> 7;
              if (v265 >> 14)
              {
                int v5 = v266 + 2;
                do
                {
                  *(v5 - 1) = v270 | 0x80;
                  unint64_t v271 = v270 >> 7;
                  ++v5;
                  unint64_t v272 = v270 >> 14;
                  v270 >>= 7;
                }
                while (v272);
                *(v5 - 1) = v271;
              }
              else
              {
                v266[1] = v270;
                int v5 = v266 + 2;
              }
            }
            else
            {
              unsigned char *v266 = v265;
              int v5 = v266 + 1;
            }
            ++v261;
            v260 = *this;
          }
          while (v261 < **this);
        }
        return (unsigned __int8 *)v5;
      case 15:
        v273 = *this;
        if (**this >= 1)
        {
          int v274 = 0;
          unsigned int v275 = (8 * a2) | 5;
          unsigned int v276 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v277 = (8 * a2) >> 7;
          char v278 = (8 * a2) | 0x85;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v273 = *this;
            }
            int v279 = *(_DWORD *)google::protobuf::RepeatedField<int>::Get(v273, v274);
            if (v275 > 0x7F)
            {
              *int v5 = v278;
              if (v275 >= 0x4000)
              {
                v280 = v5 + 2;
                unsigned int v281 = v276;
                do
                {
                  *((unsigned char *)v280 - 1) = v281 | 0x80;
                  unsigned int v282 = v281 >> 7;
                  v280 = (_DWORD *)((char *)v280 + 1);
                  unsigned int v283 = v281 >> 14;
                  v281 >>= 7;
                }
                while (v283);
                *((unsigned char *)v280 - 1) = v282;
              }
              else
              {
                v5[1] = v277;
                v280 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v275;
              v280 = v5 + 1;
            }
            _DWORD *v280 = v279;
            int v5 = (char *)(v280 + 1);
            ++v274;
            v273 = *this;
          }
          while (v274 < **this);
        }
        return (unsigned __int8 *)v5;
      case 16:
        v284 = *this;
        if (**this >= 1)
        {
          int v285 = 0;
          unsigned int v286 = 8 * a2;
          unsigned int v287 = (8 * a2) | 1;
          char v288 = (8 * a2) | 0x81;
          unsigned int v289 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v290 = v286 >> 7;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v284 = *this;
            }
            uint64_t v291 = *(void *)google::protobuf::RepeatedField<long long>::Get(v284, v285);
            if (v287 > 0x7F)
            {
              *int v5 = v288;
              if (v287 >= 0x4000)
              {
                v292 = v5 + 2;
                unsigned int v293 = v289;
                do
                {
                  *((unsigned char *)v292 - 1) = v293 | 0x80;
                  unsigned int v294 = v293 >> 7;
                  v292 = (void *)((char *)v292 + 1);
                  unsigned int v295 = v293 >> 14;
                  v293 >>= 7;
                }
                while (v295);
                *((unsigned char *)v292 - 1) = v294;
              }
              else
              {
                v5[1] = v290;
                v292 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v287;
              v292 = v5 + 1;
            }
            void *v292 = v291;
            int v5 = (char *)(v292 + 1);
            ++v285;
            v284 = *this;
          }
          while (v285 < **this);
        }
        return (unsigned __int8 *)v5;
      case 17:
        v296 = *this;
        if (**this >= 1)
        {
          int v297 = 0;
          unsigned int v298 = 8 * a2;
          char v299 = (8 * a2) | 0x80;
          unsigned int v300 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v296 = *this;
            }
            int v301 = *(_DWORD *)google::protobuf::RepeatedField<int>::Get(v296, v297);
            if (v298 > 0x7F)
            {
              *int v5 = v299;
              if (v298 >= 0x4000)
              {
                v302 = v5 + 2;
                unsigned int v303 = v300;
                do
                {
                  *(v302 - 1) = v303 | 0x80;
                  unsigned int v304 = v303 >> 7;
                  ++v302;
                  unsigned int v305 = v303 >> 14;
                  v303 >>= 7;
                }
                while (v305);
                *(v302 - 1) = v304;
              }
              else
              {
                v5[1] = v298 >> 7;
                v302 = v5 + 2;
              }
            }
            else
            {
              v302 = v5 + 1;
              *int v5 = v298;
            }
            unsigned int v306 = (2 * v301) ^ (v301 >> 31);
            if (v306 > 0x7F)
            {
              unsigned char *v302 = v306 | 0x80;
              unsigned int v307 = v306 >> 7;
              if (v306 >> 14)
              {
                int v5 = v302 + 2;
                do
                {
                  *(v5 - 1) = v307 | 0x80;
                  unsigned int v308 = v307 >> 7;
                  ++v5;
                  unsigned int v309 = v307 >> 14;
                  v307 >>= 7;
                }
                while (v309);
                *(v5 - 1) = v308;
              }
              else
              {
                v302[1] = v307;
                int v5 = v302 + 2;
              }
            }
            else
            {
              unsigned char *v302 = v306;
              int v5 = v302 + 1;
            }
            ++v297;
            v296 = *this;
          }
          while (v297 < **this);
        }
        return (unsigned __int8 *)v5;
      case 18:
        v310 = *this;
        if (**this >= 1)
        {
          int v311 = 0;
          unsigned int v312 = 8 * a2;
          char v313 = (8 * a2) | 0x80;
          unsigned int v314 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v310 = *this;
            }
            uint64_t v315 = *(void *)google::protobuf::RepeatedField<long long>::Get(v310, v311);
            if (v312 > 0x7F)
            {
              *int v5 = v313;
              if (v312 >= 0x4000)
              {
                v316 = v5 + 2;
                unsigned int v317 = v314;
                do
                {
                  *(v316 - 1) = v317 | 0x80;
                  unsigned int v318 = v317 >> 7;
                  ++v316;
                  unsigned int v319 = v317 >> 14;
                  v317 >>= 7;
                }
                while (v319);
                *(v316 - 1) = v318;
              }
              else
              {
                v5[1] = v312 >> 7;
                v316 = v5 + 2;
              }
            }
            else
            {
              v316 = v5 + 1;
              *int v5 = v312;
            }
            unint64_t v320 = (2 * v315) ^ (v315 >> 63);
            if (v320 > 0x7F)
            {
              unsigned char *v316 = v320 | 0x80;
              unint64_t v321 = v320 >> 7;
              if (v320 >> 14)
              {
                int v5 = v316 + 2;
                do
                {
                  *(v5 - 1) = v321 | 0x80;
                  unint64_t v322 = v321 >> 7;
                  ++v5;
                  unint64_t v323 = v321 >> 14;
                  v321 >>= 7;
                }
                while (v323);
                *(v5 - 1) = v322;
              }
              else
              {
                v316[1] = v321;
                int v5 = v316 + 2;
              }
            }
            else
            {
              unsigned char *v316 = v320;
              int v5 = v316 + 1;
            }
            ++v311;
            v310 = *this;
          }
          while (v311 < **this);
        }
        return (unsigned __int8 *)v5;
      default:
        return (unsigned __int8 *)v5;
    }
    while (1)
    {
      if (*(void *)a4 <= (unint64_t)v5)
      {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
        uint64_t v232 = (uint64_t)*this;
      }
      uint64_t v239 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(v232, v233);
      if (*(char *)(v239 + 23) < 0)
      {
        int64_t v240 = *(void *)(v239 + 8);
        if (v240 > 127) {
          goto LABEL_399;
        }
      }
      else
      {
        int64_t v240 = *(unsigned __int8 *)(v239 + 23);
      }
      if ((uint64_t)(*(void *)a4 + ~(unint64_t)&v5[v238] + 16) >= v240)
      {
        if (v236 > 0x7F)
        {
          *int v5 = (8 * a2) | 0x82;
          if (v236 >= 0x4000)
          {
            v241 = v5 + 2;
            unsigned int v242 = (a2 >> 4) & 0x1FFFFFF;
            do
            {
              *(v241 - 1) = v242 | 0x80;
              unsigned int v243 = v242 >> 7;
              ++v241;
              unsigned int v244 = v242 >> 14;
              v242 >>= 7;
            }
            while (v244);
            *(v241 - 1) = v243;
          }
          else
          {
            v5[1] = v430;
            v241 = v5 + 2;
          }
        }
        else
        {
          v241 = v5 + 1;
          *int v5 = v236;
        }
        unsigned char *v241 = v240;
        v245 = v241 + 1;
        if (*(char *)(v239 + 23) >= 0) {
          v246 = (const void *)v239;
        }
        else {
          v246 = *(const void **)v239;
        }
        memcpy(v245, v246, v240);
        int v5 = &v245[v240];
        goto LABEL_397;
      }
LABEL_399:
      int v5 = (char *)google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, v239, v5);
LABEL_397:
      ++v233;
      uint64_t v232 = (uint64_t)*this;
      if (v233 >= (*this)[2]) {
        return (unsigned __int8 *)v5;
      }
    }
  }
  if (*((unsigned char *)this + 10)) {
    return (unsigned __int8 *)v5;
  }
  int v10 = *((unsigned __int8 *)this + 8);
  if ((v10 - 19) <= 0xFFFFFFED)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    int v11 = google::protobuf::internal::LogMessage::operator<<(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v431, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v432[0].__r_.__value_.__l.__data_);
  }
  switch(v10)
  {
    case 1:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      unsigned int v12 = *this;
      unsigned int v13 = (8 * a2) | 1;
      if (v13 <= 0x7F) {
        goto LABEL_575;
      }
      *int v5 = (8 * a2) | 0x81;
      unsigned int v14 = (8 * a2) >> 7;
      if (!(v13 >> 14)) {
        goto LABEL_602;
      }
      uint64_t v15 = (int **)(v5 + 2);
      do
      {
        *((unsigned char *)v15 - 1) = v14 | 0x80;
        unsigned int v16 = v14 >> 7;
        uint64_t v15 = (int **)((char *)v15 + 1);
        unsigned int v17 = v14 >> 14;
        v14 >>= 7;
      }
      while (v17);
      goto LABEL_693;
    case 2:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      unsigned int v324 = *(_DWORD *)this;
      unsigned int v325 = (8 * a2) | 5;
      if (v325 <= 0x7F) {
        goto LABEL_571;
      }
      *int v5 = (8 * a2) | 0x85;
      unsigned int v326 = (8 * a2) >> 7;
      if (!(v325 >> 14)) {
        goto LABEL_600;
      }
      v327 = (unsigned int *)(v5 + 2);
      do
      {
        *((unsigned char *)v327 - 1) = v326 | 0x80;
        unsigned int v328 = v326 >> 7;
        v327 = (unsigned int *)((char *)v327 + 1);
        unsigned int v329 = v326 >> 14;
        v326 >>= 7;
      }
      while (v329);
      goto LABEL_689;
    case 3:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      unint64_t v330 = (unint64_t)*this;
      unsigned int v331 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v331 | 0x80;
        unsigned int v355 = v331 >> 7;
        if (v331 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v355 | 0x80;
            unsigned int v380 = v355 >> 7;
            ++v332;
            unsigned int v381 = v355 >> 14;
            v355 >>= 7;
          }
          while (v381);
          *(v332 - 1) = v380;
        }
        else
        {
          v5[1] = v355;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v331;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F) {
        goto LABEL_684;
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14)) {
        goto LABEL_686;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v384 = v382 >> 14;
        v382 >>= 7;
      }
      while (v384);
      goto LABEL_718;
    case 4:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      unint64_t v330 = (unint64_t)*this;
      unsigned int v333 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v333 | 0x80;
        unsigned int v356 = v333 >> 7;
        if (v333 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v356 | 0x80;
            unsigned int v385 = v356 >> 7;
            ++v332;
            unsigned int v386 = v356 >> 14;
            v356 >>= 7;
          }
          while (v386);
          *(v332 - 1) = v385;
        }
        else
        {
          v5[1] = v356;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v333;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F) {
        goto LABEL_684;
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14)) {
        goto LABEL_686;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v387 = v382 >> 14;
        v382 >>= 7;
      }
      while (v387);
      goto LABEL_718;
    case 5:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      unint64_t v330 = *(int *)this;
      unsigned int v334 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v334 | 0x80;
        unsigned int v357 = v334 >> 7;
        if (v334 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v357 | 0x80;
            unsigned int v388 = v357 >> 7;
            ++v332;
            unsigned int v389 = v357 >> 14;
            v357 >>= 7;
          }
          while (v389);
          *(v332 - 1) = v388;
        }
        else
        {
          v5[1] = v357;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v334;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F) {
        goto LABEL_684;
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14)) {
        goto LABEL_686;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v390 = v382 >> 14;
        v382 >>= 7;
      }
      while (v390);
      goto LABEL_718;
    case 6:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      unsigned int v12 = *this;
      unsigned int v13 = (8 * a2) | 1;
      if (v13 <= 0x7F) {
        goto LABEL_575;
      }
      *int v5 = (8 * a2) | 0x81;
      unsigned int v14 = (8 * a2) >> 7;
      if (!(v13 >> 14)) {
        goto LABEL_602;
      }
      uint64_t v15 = (int **)(v5 + 2);
      do
      {
        *((unsigned char *)v15 - 1) = v14 | 0x80;
        unsigned int v16 = v14 >> 7;
        uint64_t v15 = (int **)((char *)v15 + 1);
        unsigned int v335 = v14 >> 14;
        v14 >>= 7;
      }
      while (v335);
      goto LABEL_693;
    case 7:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      unsigned int v324 = *(_DWORD *)this;
      unsigned int v325 = (8 * a2) | 5;
      if (v325 <= 0x7F) {
        goto LABEL_571;
      }
      *int v5 = (8 * a2) | 0x85;
      unsigned int v326 = (8 * a2) >> 7;
      if (!(v325 >> 14)) {
        goto LABEL_600;
      }
      v327 = (unsigned int *)(v5 + 2);
      do
      {
        *((unsigned char *)v327 - 1) = v326 | 0x80;
        unsigned int v328 = v326 >> 7;
        v327 = (unsigned int *)((char *)v327 + 1);
        unsigned int v336 = v326 >> 14;
        v326 >>= 7;
      }
      while (v336);
      goto LABEL_689;
    case 8:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      LOBYTE(v337) = *(unsigned char *)this;
      unsigned int v338 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v338 | 0x80;
        unsigned int v358 = v338 >> 7;
        if (v338 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v358 | 0x80;
            unsigned int v391 = v358 >> 7;
            ++v332;
            unsigned int v392 = v358 >> 14;
            v358 >>= 7;
          }
          while (v392);
          *(v332 - 1) = v391;
        }
        else
        {
          v5[1] = v358;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v338;
        v332 = v5 + 1;
      }
      goto LABEL_677;
    case 9:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      v339 = *this;
      if (*((char *)*this + 23) < 0)
      {
        int64_t v340 = *((void *)v339 + 1);
        if (v340 > 127) {
          return google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, (uint64_t)v339, v5);
        }
      }
      else
      {
        int64_t v340 = *((unsigned __int8 *)*this + 23);
      }
      unsigned int v364 = 8 * a2;
      uint64_t v365 = 1;
      uint64_t v366 = 2;
      uint64_t v367 = 3;
      uint64_t v368 = 4;
      if ((8 * a2) >> 28) {
        uint64_t v368 = 5;
      }
      if (v364 >= 0x200000) {
        uint64_t v367 = v368;
      }
      if (v364 >= 0x4000) {
        uint64_t v366 = v367;
      }
      if (v364 >= 0x80) {
        uint64_t v365 = v366;
      }
      if ((uint64_t)(*(void *)a4 + ~(unint64_t)&v5[v365] + 16) < v340) {
        return google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, (uint64_t)v339, v5);
      }
      unsigned int v369 = v364 | 2;
      if ((v364 | 2) <= 0x7F) {
        goto LABEL_633;
      }
      *int v5 = v364 | 0x82;
      unsigned int v370 = v364 >> 7;
      if (!(v369 >> 14)) {
        goto LABEL_635;
      }
      v371 = v5 + 2;
      do
      {
        *(v371 - 1) = v370 | 0x80;
        unsigned int v372 = v370 >> 7;
        ++v371;
        unsigned int v373 = v370 >> 14;
        v370 >>= 7;
      }
      while (v373);
      goto LABEL_727;
    case 10:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      v341 = *this;
      unsigned int v342 = 8 * a2;
      unsigned int v343 = (8 * a2) | 3;
      unsigned int v344 = (8 * a2) >> 7;
      if (v343 > 0x7F)
      {
        *int v5 = (8 * a2) | 0x83;
        if (v343 >> 14)
        {
          v345 = v5 + 2;
          unsigned int v393 = v342 >> 7;
          do
          {
            *(v345 - 1) = v393 | 0x80;
            unsigned int v394 = v393 >> 7;
            ++v345;
            unsigned int v395 = v393 >> 14;
            v393 >>= 7;
          }
          while (v395);
          *(v345 - 1) = v394;
        }
        else
        {
          v5[1] = v344;
          v345 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v343;
        v345 = v5 + 1;
      }
      v332 = (char *)(*(uint64_t (**)(int *, char *, google::protobuf::io::EpsCopyOutputStream *))(*(void *)v341 + 96))(v341, v345, a4);
      if (*(void *)a4 <= (unint64_t)v332) {
        v332 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v332);
      }
      unsigned int v337 = v342 | 4;
      if ((v342 | 4) <= 0x7F) {
        goto LABEL_677;
      }
      char *v332 = v342 | 0x84;
      if (!(v337 >> 14))
      {
        v332[1] = v344;
        return (unsigned __int8 *)(v332 + 2);
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v344 | 0x80;
        unsigned int v411 = v344 >> 7;
        ++v5;
        unsigned int v412 = v344 >> 14;
        v344 >>= 7;
      }
      while (v412);
      goto LABEL_715;
    case 11:
      if ((*((unsigned char *)this + 10) & 0x10) != 0) {
        return (unsigned __int8 *)(*(uint64_t (**)(int *, uint64_t, char *, google::protobuf::io::EpsCopyOutputStream *))(*(void *)*this + 136))(*this, a2, v5, a4);
      }
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      v346 = *this;
      unsigned int v347 = (8 * a2) | 2;
      if (v347 > 0x7F)
      {
        *int v5 = (8 * a2) | 0x82;
        unsigned int v379 = (8 * a2) >> 7;
        if (v347 >> 14)
        {
          v348 = v5 + 2;
          do
          {
            *(v348 - 1) = v379 | 0x80;
            unsigned int v421 = v379 >> 7;
            ++v348;
            unsigned int v422 = v379 >> 14;
            v379 >>= 7;
          }
          while (v422);
          *(v348 - 1) = v421;
        }
        else
        {
          v5[1] = v379;
          v348 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v347;
        v348 = v5 + 1;
      }
      unsigned int v423 = (*(uint64_t (**)(int *))(*(void *)v346 + 80))(v346);
      if (v423 > 0x7F)
      {
        unsigned char *v348 = v423 | 0x80;
        unsigned int v425 = v423 >> 7;
        if (v423 >> 14)
        {
          v424 = v348 + 2;
          do
          {
            *(v424 - 1) = v425 | 0x80;
            unsigned int v426 = v425 >> 7;
            ++v424;
            unsigned int v427 = v425 >> 14;
            v425 >>= 7;
          }
          while (v427);
          *(v424 - 1) = v426;
        }
        else
        {
          v348[1] = v425;
          v424 = v348 + 2;
        }
      }
      else
      {
        unsigned char *v348 = v423;
        v424 = v348 + 1;
      }
      return (unsigned __int8 *)(*(uint64_t (**)(int *, unsigned char *, google::protobuf::io::EpsCopyOutputStream *))(*(void *)v346 + 96))(v346, v424, a4);
    case 12:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      v339 = *this;
      if (*((char *)*this + 23) < 0)
      {
        int64_t v340 = *((void *)v339 + 1);
        if (v340 > 127) {
          return google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, (uint64_t)v339, v5);
        }
      }
      else
      {
        int64_t v340 = *((unsigned __int8 *)*this + 23);
      }
      unsigned int v374 = 8 * a2;
      uint64_t v375 = 1;
      uint64_t v376 = 2;
      uint64_t v377 = 3;
      uint64_t v378 = 4;
      if ((8 * a2) >> 28) {
        uint64_t v378 = 5;
      }
      if (v374 >= 0x200000) {
        uint64_t v377 = v378;
      }
      if (v374 >= 0x4000) {
        uint64_t v376 = v377;
      }
      if (v374 >= 0x80) {
        uint64_t v375 = v376;
      }
      if ((uint64_t)(*(void *)a4 + ~(unint64_t)&v5[v375] + 16) < v340) {
        return google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, (uint64_t)v339, v5);
      }
      unsigned int v369 = v374 | 2;
      if ((v374 | 2) > 0x7F)
      {
        *int v5 = v374 | 0x82;
        unsigned int v370 = v374 >> 7;
        if (v369 >> 14)
        {
          v371 = v5 + 2;
          do
          {
            *(v371 - 1) = v370 | 0x80;
            unsigned int v372 = v370 >> 7;
            ++v371;
            unsigned int v419 = v370 >> 14;
            v370 >>= 7;
          }
          while (v419);
LABEL_727:
          *(v371 - 1) = v372;
        }
        else
        {
LABEL_635:
          v5[1] = v370;
          v371 = v5 + 2;
        }
      }
      else
      {
LABEL_633:
        *int v5 = v369;
        v371 = v5 + 1;
      }
      unsigned char *v371 = v340;
      v420 = v371 + 1;
      if (*((char *)v339 + 23) < 0) {
        v339 = *(int **)v339;
      }
      memcpy(v420, v339, v340);
      return (unsigned __int8 *)&v420[v340];
    case 13:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      unsigned int v337 = *(_DWORD *)this;
      unsigned int v349 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v349 | 0x80;
        unsigned int v360 = v349 >> 7;
        if (v349 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v360 | 0x80;
            unsigned int v396 = v360 >> 7;
            ++v332;
            unsigned int v397 = v360 >> 14;
            v360 >>= 7;
          }
          while (v397);
          *(v332 - 1) = v396;
        }
        else
        {
          v5[1] = v360;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v349;
        v332 = v5 + 1;
      }
      if (v337 <= 0x7F)
      {
LABEL_677:
        char *v332 = v337;
        return (unsigned __int8 *)(v332 + 1);
      }
      char *v332 = v337 | 0x80;
      unsigned int v398 = v337 >> 7;
      if (!(v337 >> 14))
      {
        v332[1] = v398;
        return (unsigned __int8 *)(v332 + 2);
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v398 | 0x80;
        unsigned int v411 = v398 >> 7;
        ++v5;
        unsigned int v413 = v398 >> 14;
        v398 >>= 7;
      }
      while (v413);
LABEL_715:
      *(v5 - 1) = v411;
      return (unsigned __int8 *)v5;
    case 14:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      unint64_t v330 = *(int *)this;
      unsigned int v350 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v350 | 0x80;
        unsigned int v361 = v350 >> 7;
        if (v350 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v361 | 0x80;
            unsigned int v399 = v361 >> 7;
            ++v332;
            unsigned int v400 = v361 >> 14;
            v361 >>= 7;
          }
          while (v400);
          *(v332 - 1) = v399;
        }
        else
        {
          v5[1] = v361;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v350;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F)
      {
LABEL_684:
        char *v332 = v330;
        return (unsigned __int8 *)(v332 + 1);
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14))
      {
LABEL_686:
        v332[1] = v382;
        return (unsigned __int8 *)(v332 + 2);
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v414 = v382 >> 14;
        v382 >>= 7;
      }
      while (v414);
LABEL_718:
      *(v5 - 1) = v383;
      return (unsigned __int8 *)v5;
    case 15:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      unsigned int v324 = *(_DWORD *)this;
      unsigned int v325 = (8 * a2) | 5;
      if (v325 > 0x7F)
      {
        *int v5 = (8 * a2) | 0x85;
        unsigned int v326 = (8 * a2) >> 7;
        if (v325 >> 14)
        {
          v327 = (unsigned int *)(v5 + 2);
          do
          {
            *((unsigned char *)v327 - 1) = v326 | 0x80;
            unsigned int v328 = v326 >> 7;
            v327 = (unsigned int *)((char *)v327 + 1);
            unsigned int v401 = v326 >> 14;
            v326 >>= 7;
          }
          while (v401);
LABEL_689:
          *((unsigned char *)v327 - 1) = v328;
        }
        else
        {
LABEL_600:
          v5[1] = v326;
          v327 = (unsigned int *)(v5 + 2);
        }
      }
      else
      {
LABEL_571:
        *int v5 = v325;
        v327 = (unsigned int *)(v5 + 1);
      }
      unsigned int *v327 = v324;
      return (unsigned __int8 *)(v327 + 1);
    case 16:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      unsigned int v12 = *this;
      unsigned int v13 = (8 * a2) | 1;
      if (v13 > 0x7F)
      {
        *int v5 = (8 * a2) | 0x81;
        unsigned int v14 = (8 * a2) >> 7;
        if (v13 >> 14)
        {
          uint64_t v15 = (int **)(v5 + 2);
          do
          {
            *((unsigned char *)v15 - 1) = v14 | 0x80;
            unsigned int v16 = v14 >> 7;
            uint64_t v15 = (int **)((char *)v15 + 1);
            unsigned int v402 = v14 >> 14;
            v14 >>= 7;
          }
          while (v402);
LABEL_693:
          *((unsigned char *)v15 - 1) = v16;
        }
        else
        {
LABEL_602:
          v5[1] = v14;
          uint64_t v15 = (int **)(v5 + 2);
        }
      }
      else
      {
LABEL_575:
        *int v5 = v13;
        uint64_t v15 = (int **)(v5 + 1);
      }
      std::string *v15 = v12;
      return (unsigned __int8 *)(v15 + 1);
    case 17:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      int v351 = *(_DWORD *)this;
      unsigned int v352 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v352 | 0x80;
        unsigned int v362 = v352 >> 7;
        if (v352 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v362 | 0x80;
            unsigned int v403 = v362 >> 7;
            ++v332;
            unsigned int v404 = v362 >> 14;
            v362 >>= 7;
          }
          while (v404);
          *(v332 - 1) = v403;
        }
        else
        {
          v5[1] = v362;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v352;
        v332 = v5 + 1;
      }
      unsigned int v405 = (2 * v351) ^ (v351 >> 31);
      if (v405 <= 0x7F)
      {
        char *v332 = v405;
        return (unsigned __int8 *)(v332 + 1);
      }
      char *v332 = v405 | 0x80;
      unsigned int v406 = v405 >> 7;
      if (!(v405 >> 14))
      {
        v332[1] = v406;
        return (unsigned __int8 *)(v332 + 2);
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v406 | 0x80;
        unsigned int v415 = v406 >> 7;
        ++v5;
        unsigned int v416 = v406 >> 14;
        v406 >>= 7;
      }
      while (v416);
      *(v5 - 1) = v415;
      return (unsigned __int8 *)v5;
    case 18:
      if (*(void *)a4 <= (unint64_t)v5) {
        int v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      }
      uint64_t v353 = (uint64_t)*this;
      unsigned int v354 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *int v5 = v354 | 0x80;
        unsigned int v363 = v354 >> 7;
        if (v354 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v363 | 0x80;
            unsigned int v407 = v363 >> 7;
            ++v332;
            unsigned int v408 = v363 >> 14;
            v363 >>= 7;
          }
          while (v408);
          *(v332 - 1) = v407;
        }
        else
        {
          v5[1] = v363;
          v332 = v5 + 2;
        }
      }
      else
      {
        *int v5 = v354;
        v332 = v5 + 1;
      }
      unint64_t v409 = (2 * v353) ^ (v353 >> 63);
      if (v409 > 0x7F)
      {
        char *v332 = v409 | 0x80;
        unint64_t v410 = v409 >> 7;
        if (v409 >> 14)
        {
          int v5 = v332 + 2;
          do
          {
            *(v5 - 1) = v410 | 0x80;
            unint64_t v417 = v410 >> 7;
            ++v5;
            unint64_t v418 = v410 >> 14;
            v410 >>= 7;
          }
          while (v418);
          *(v5 - 1) = v417;
        }
        else
        {
          v332[1] = v410;
          return (unsigned __int8 *)(v332 + 2);
        }
      }
      else
      {
        char *v332 = v409;
        return (unsigned __int8 *)(v332 + 1);
      }
      return (unsigned __int8 *)v5;
    default:
      return (unsigned __int8 *)v5;
  }
}

void sub_25BFE5A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::ByteSize(google::protobuf::internal::ExtensionSet *this)
{
  v1 = (int *)*((void *)this + 2);
  if (*((unsigned __int16 *)this + 4) < 0x101u)
  {
    if (*((_WORD *)this + 5))
    {
      uint64_t v2 = 0;
      uint64_t v3 = &v1[8 * *((unsigned __int16 *)this + 5)];
      do
      {
        uint64_t v4 = (int **)(v1 + 2);
        int v5 = *v1;
        v1 += 8;
        v2 += google::protobuf::internal::ExtensionSet::Extension::ByteSize(v4, v5);
      }
      while (v1 != v3);
      return v2;
    }
    return 0;
  }
  unsigned int v8 = *(int **)v1;
  uint64_t v6 = v1 + 2;
  uint64_t v7 = v8;
  if (v8 == v6) {
    return 0;
  }
  uint64_t v2 = 0;
  do
  {
    unint64_t v9 = google::protobuf::internal::ExtensionSet::Extension::ByteSize((int **)v7 + 5, v7[8]);
    int v10 = (int *)*((void *)v7 + 1);
    if (v10)
    {
      do
      {
        int v11 = v10;
        int v10 = *(int **)v10;
      }
      while (v10);
    }
    else
    {
      do
      {
        int v11 = (int *)*((void *)v7 + 2);
        BOOL v12 = *(void *)v11 == (void)v7;
        uint64_t v7 = v11;
      }
      while (!v12);
    }
    v2 += v9;
    uint64_t v7 = v11;
  }
  while (v11 != v6);
  return v2;
}

unint64_t google::protobuf::internal::ExtensionSet::Extension::ByteSize(int **this, int a2)
{
  if (*((unsigned char *)this + 9))
  {
    int v4 = *((unsigned __int8 *)this + 8);
    unsigned __int8 v5 = v4 - 19;
    if (*((unsigned char *)this + 11))
    {
      if ((v4 - 19) <= 0xEDu)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        uint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v101, (const char **)&v6->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v102[0].__r_.__value_.__l.__data_);
      }
      switch(v4)
      {
        case 1:
        case 6:
        case 16:
          uint64_t v21 = 8 * **this;
          goto LABEL_63;
        case 2:
        case 7:
        case 15:
          uint64_t v21 = 4 * **this;
          goto LABEL_63;
        case 3:
          uint64_t v27 = *this;
          if (**this < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v28 = 0;
          do
          {
            v21 += (9 * (__clz(*(void *)google::protobuf::RepeatedField<long long>::Get(v27, v28++) | 1) ^ 0x3F) + 73) >> 6;
            uint64_t v27 = *this;
          }
          while (v28 < **this);
          goto LABEL_63;
        case 4:
          unsigned int v29 = *this;
          if (**this < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v30 = 0;
          do
          {
            v21 += (9
                  * (__clz(*(void *)google::protobuf::RepeatedField<unsigned long long>::Get(v29, v30++) | 1) ^ 0x3F)
                  + 73) >> 6;
            unsigned int v29 = *this;
          }
          while (v30 < **this);
          goto LABEL_63;
        case 5:
          unsigned int v31 = *this;
          if (**this < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v32 = 0;
          do
          {
            unsigned int v33 = (int *)google::protobuf::RepeatedField<int>::Get(v31, v32);
            uint64_t v34 = (9 * (__clz(*v33 | 1) ^ 0x1F) + 73) >> 6;
            if (*v33 >= 0) {
              uint64_t v35 = v34;
            }
            else {
              uint64_t v35 = 10;
            }
            v21 += v35;
            ++v32;
            unsigned int v31 = *this;
          }
          while (v32 < **this);
          goto LABEL_63;
        case 8:
          uint64_t v21 = **this;
          goto LABEL_63;
        case 9:
        case 10:
        case 11:
        case 12:
          google::protobuf::internal::LogMessage::LogMessage((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1599);
          uint64_t v7 = google::protobuf::internal::LogMessage::operator<<(v102, "Non-primitive types can't be packed.");
          google::protobuf::internal::LogFinisher::operator=((int)&v101, (const char **)&v7->__r_.__value_.__l.__data_);
          google::protobuf::internal::LogMessage::~LogMessage((void **)&v102[0].__r_.__value_.__l.__data_);
          goto LABEL_7;
        case 13:
          unsigned int v22 = *this;
          if (**this < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v23 = 0;
          do
          {
            v21 += (9 * (__clz(*(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v22, v23++) | 1) ^ 0x1F)
                  + 73) >> 6;
            unsigned int v22 = *this;
          }
          while (v23 < **this);
          goto LABEL_63;
        case 14:
          unint64_t v36 = *this;
          if (**this < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v37 = 0;
          do
          {
            unint64_t v38 = (int *)google::protobuf::RepeatedField<int>::Get(v36, v37);
            uint64_t v39 = (9 * (__clz(*v38 | 1) ^ 0x1F) + 73) >> 6;
            if (*v38 >= 0) {
              uint64_t v40 = v39;
            }
            else {
              uint64_t v40 = 10;
            }
            v21 += v40;
            ++v37;
            unint64_t v36 = *this;
          }
          while (v37 < **this);
          goto LABEL_63;
        case 17:
          char v24 = *this;
          if (**this < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v25 = 0;
          do
          {
            unsigned int v26 = (int *)google::protobuf::RepeatedField<int>::Get(v24, v25);
            v21 += (9 * (__clz((2 * *v26) ^ (*v26 >> 31) | 1) ^ 0x1F) + 73) >> 6;
            ++v25;
            char v24 = *this;
          }
          while (v25 < **this);
          goto LABEL_63;
        case 18:
          v41 = *this;
          if (**this < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v42 = 0;
          do
          {
            int v43 = (uint64_t *)google::protobuf::RepeatedField<long long>::Get(v41, v42);
            v21 += (9 * (__clz((2 * *v43) ^ (*v43 >> 63) | 1) ^ 0x3F) + 73) >> 6;
            ++v42;
            v41 = *this;
          }
          while (v42 < **this);
LABEL_63:
          *((_DWORD *)this + 3) = v21;
          unint64_t v44 = v21 + ((9 * (__clz((8 * a2) | 3) ^ 0x1F) + 73) >> 6) + ((9 * (__clz(v21 | 1) ^ 0x1F) + 73) >> 6);
          if (v21) {
            unint64_t v8 = v44;
          }
          else {
            unint64_t v8 = 0;
          }
          break;
        default:
LABEL_7:
          unint64_t v8 = 0;
          *((_DWORD *)this + 3) = 0;
          break;
      }
    }
    else
    {
      if ((v4 - 19) > 0xEDu)
      {
        int v14 = *((unsigned __int8 *)this + 8);
      }
      else
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        unsigned int v13 = google::protobuf::internal::LogMessage::operator<<(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v101, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v102[0].__r_.__value_.__l.__data_);
        int v14 = *((unsigned __int8 *)this + 8);
        unsigned __int8 v5 = v14 - 19;
      }
      char v15 = v4 == 10;
      if (v5 <= 0xEDu)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        unsigned int v16 = google::protobuf::internal::LogMessage::operator<<(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v101, (const char **)&v16->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v102[0].__r_.__value_.__l.__data_);
      }
      unint64_t v17 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << v15;
      switch(v14)
      {
        case 1:
        case 6:
        case 16:
          unsigned int v18 = v17 + 8;
          goto LABEL_27;
        case 2:
        case 7:
        case 15:
          unsigned int v18 = v17 + 4;
LABEL_27:
          unint64_t v8 = v18 * (unint64_t)**this;
          break;
        case 3:
          unsigned int v50 = *this;
          int v51 = **this;
          unint64_t v8 = v17 * (unint64_t)v51;
          if (v51 >= 1)
          {
            int v52 = 0;
            do
            {
              v8 += (9 * (__clz(*(void *)google::protobuf::RepeatedField<long long>::Get(v50, v52++) | 1) ^ 0x3F)
                   + 73) >> 6;
              unsigned int v50 = *this;
            }
            while (v52 < **this);
          }
          break;
        case 4:
          unsigned int v53 = *this;
          int v54 = **this;
          unint64_t v8 = v17 * (unint64_t)v54;
          if (v54 >= 1)
          {
            int v55 = 0;
            do
            {
              v8 += (9
                   * (__clz(*(void *)google::protobuf::RepeatedField<unsigned long long>::Get(v53, v55++) | 1) ^ 0x3F)
                   + 73) >> 6;
              unsigned int v53 = *this;
            }
            while (v55 < **this);
          }
          break;
        case 5:
          int v56 = *this;
          int v57 = **this;
          unint64_t v8 = v17 * (unint64_t)v57;
          if (v57 >= 1)
          {
            int v58 = 0;
            do
            {
              unsigned int v59 = (int *)google::protobuf::RepeatedField<int>::Get(v56, v58);
              uint64_t v60 = (9 * (__clz(*v59 | 1) ^ 0x1F) + 73) >> 6;
              if (*v59 >= 0) {
                uint64_t v61 = v60;
              }
              else {
                uint64_t v61 = 10;
              }
              v8 += v61;
              ++v58;
              int v56 = *this;
            }
            while (v58 < **this);
          }
          break;
        case 8:
          unint64_t v8 = **this + **this * (unint64_t)v17;
          break;
        case 9:
          uint64_t v62 = (uint64_t)*this;
          int v63 = (*this)[2];
          unint64_t v8 = v17 * (unint64_t)v63;
          if (v63 >= 1)
          {
            int v64 = 0;
            do
            {
              uint64_t v65 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(v62, v64);
              uint64_t v66 = *(unsigned __int8 *)(v65 + 23);
              if ((v66 & 0x80u) != 0) {
                uint64_t v66 = *(void *)(v65 + 8);
              }
              v8 += v66 + ((9 * (__clz(v66 | 1) ^ 0x1F) + 73) >> 6);
              ++v64;
              uint64_t v62 = (uint64_t)*this;
            }
            while (v64 < (*this)[2]);
          }
          break;
        case 10:
          uint64_t v67 = (uint64_t)*this;
          int v68 = (*this)[2];
          unint64_t v8 = v17 * (unint64_t)v68;
          if (v68 >= 1)
          {
            int v69 = 0;
            do
            {
              uint64_t v70 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v67, v69);
              v8 += (*(uint64_t (**)(uint64_t))(*(void *)v70 + 72))(v70);
              ++v69;
              uint64_t v67 = (uint64_t)*this;
            }
            while (v69 < (*this)[2]);
          }
          break;
        case 11:
          uint64_t v71 = (uint64_t)*this;
          int v72 = (*this)[2];
          unint64_t v8 = v17 * (unint64_t)v72;
          if (v72 >= 1)
          {
            int v73 = 0;
            do
            {
              uint64_t v74 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v71, v73);
              uint64_t v75 = (*(uint64_t (**)(uint64_t))(*(void *)v74 + 72))(v74);
              v8 += v75 + ((9 * (__clz(v75 | 1) ^ 0x1F) + 73) >> 6);
              ++v73;
              uint64_t v71 = (uint64_t)*this;
            }
            while (v73 < (*this)[2]);
          }
          break;
        case 12:
          uint64_t v76 = (uint64_t)*this;
          int v77 = (*this)[2];
          unint64_t v8 = v17 * (unint64_t)v77;
          if (v77 >= 1)
          {
            int v78 = 0;
            do
            {
              uint64_t v79 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(v76, v78);
              uint64_t v80 = *(unsigned __int8 *)(v79 + 23);
              if ((v80 & 0x80u) != 0) {
                uint64_t v80 = *(void *)(v79 + 8);
              }
              v8 += v80 + ((9 * (__clz(v80 | 1) ^ 0x1F) + 73) >> 6);
              ++v78;
              uint64_t v76 = (uint64_t)*this;
            }
            while (v78 < (*this)[2]);
          }
          break;
        case 13:
          int v81 = *this;
          int v82 = **this;
          unint64_t v8 = v17 * (unint64_t)v82;
          if (v82 >= 1)
          {
            int v83 = 0;
            do
            {
              v8 += (9 * (__clz(*(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v81, v83++) | 1) ^ 0x1F)
                   + 73) >> 6;
              int v81 = *this;
            }
            while (v83 < **this);
          }
          break;
        case 14:
          int v84 = *this;
          int v85 = **this;
          unint64_t v8 = v17 * (unint64_t)v85;
          if (v85 >= 1)
          {
            int v86 = 0;
            do
            {
              unint64_t v87 = (int *)google::protobuf::RepeatedField<int>::Get(v84, v86);
              uint64_t v88 = (9 * (__clz(*v87 | 1) ^ 0x1F) + 73) >> 6;
              if (*v87 >= 0) {
                uint64_t v89 = v88;
              }
              else {
                uint64_t v89 = 10;
              }
              v8 += v89;
              ++v86;
              int v84 = *this;
            }
            while (v86 < **this);
          }
          break;
        case 17:
          unint64_t v90 = *this;
          int v91 = **this;
          unint64_t v8 = v17 * (unint64_t)v91;
          if (v91 >= 1)
          {
            int v92 = 0;
            do
            {
              int v93 = (int *)google::protobuf::RepeatedField<int>::Get(v90, v92);
              v8 += (9 * (__clz((2 * *v93) ^ (*v93 >> 31) | 1) ^ 0x1F) + 73) >> 6;
              ++v92;
              unint64_t v90 = *this;
            }
            while (v92 < **this);
          }
          break;
        case 18:
          int v94 = *this;
          int v95 = **this;
          unint64_t v8 = v17 * (unint64_t)v95;
          if (v95 >= 1)
          {
            int v96 = 0;
            do
            {
              unint64_t v97 = (uint64_t *)google::protobuf::RepeatedField<long long>::Get(v94, v96);
              v8 += (9 * (__clz((2 * *v97) ^ (*v97 >> 63) | 1) ^ 0x3F) + 73) >> 6;
              ++v96;
              int v94 = *this;
            }
            while (v96 < **this);
          }
          break;
        default:
          return 0;
      }
    }
  }
  else if (*((unsigned char *)this + 10))
  {
    return 0;
  }
  else
  {
    int v9 = *((unsigned __int8 *)this + 8);
    unsigned __int8 v10 = v9 - 19;
    if ((v9 - 19) > 0xEDu)
    {
      int v12 = *((unsigned __int8 *)this + 8);
    }
    else
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      int v11 = google::protobuf::internal::LogMessage::operator<<(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v101, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v102[0].__r_.__value_.__l.__data_);
      int v12 = *((unsigned __int8 *)this + 8);
      unsigned __int8 v10 = v12 - 19;
    }
    char v19 = v9 == 10;
    if (v10 <= 0xEDu)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      int v20 = google::protobuf::internal::LogMessage::operator<<(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v101, (const char **)&v20->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v102[0].__r_.__value_.__l.__data_);
    }
    unint64_t v8 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << v19;
    switch(v12)
    {
      case 1:
      case 6:
      case 16:
        v8 += 8;
        return v8;
      case 2:
      case 7:
      case 15:
        v8 += 4;
        return v8;
      case 3:
      case 4:
        uint64_t v46 = (uint64_t)*this;
        goto LABEL_138;
      case 5:
      case 14:
        uint64_t v47 = (9 * (__clz(*(_DWORD *)this | 1) ^ 0x1F) + 73) >> 6;
        if (*(int *)this >= 0) {
          uint64_t v48 = v47;
        }
        else {
          uint64_t v48 = 10;
        }
        v8 += v48;
        return v8;
      case 8:
        return ++v8;
      case 9:
      case 12:
        uint64_t v49 = *((void *)*this + 1);
        if (*((char *)*this + 23) >= 0) {
          uint64_t v49 = *((unsigned __int8 *)*this + 23);
        }
        v8 += v49 + ((9 * (__clz(v49 | 1) ^ 0x1F) + 73) >> 6);
        return v8;
      case 10:
        v8 += (*(uint64_t (**)(void))(*(void *)*this + 72))();
        return v8;
      case 11:
        uint64_t v98 = *(void *)*this;
        if ((*((unsigned char *)this + 10) & 0x10) != 0) {
          uint64_t v99 = (*(uint64_t (**)(void))(v98 + 88))();
        }
        else {
          uint64_t v99 = (*(uint64_t (**)(void))(v98 + 72))();
        }
        v8 += v99 + ((9 * (__clz(v99 | 1) ^ 0x1F) + 73) >> 6);
        return v8;
      case 13:
        int v100 = *(_DWORD *)this;
        goto LABEL_136;
      case 17:
        int v100 = (2 * *(_DWORD *)this) ^ (*(int *)this >> 31);
LABEL_136:
        v8 += (9 * (__clz(v100 | 1) ^ 0x1F) + 73) >> 6;
        break;
      case 18:
        uint64_t v46 = (2 * (void)*this) ^ ((uint64_t)*this >> 63);
LABEL_138:
        v8 += (9 * (__clz(v46 | 1) ^ 0x3F) + 73) >> 6;
        break;
      default:
        return v8;
    }
  }
  return v8;
}

void sub_25BFE6818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::ExtensionSet::Extension::Free(google::protobuf::internal::ArenaImpl ***this)
{
  uint64_t v2 = *((unsigned __int8 *)this + 8);
  if (*((unsigned char *)this + 9))
  {
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v12, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v3 = google::protobuf::internal::LogMessage::operator<<(v12, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v3->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
    }
    switch(v2)
    {
      case 1:
        if (*this)
        {
          uint64_t v4 = google::protobuf::RepeatedField<double>::~RepeatedField();
          goto LABEL_32;
        }
        break;
      case 2:
        if (*this)
        {
          uint64_t v4 = google::protobuf::RepeatedField<float>::~RepeatedField();
          goto LABEL_32;
        }
        break;
      case 3:
      case 16:
      case 18:
        if (*this)
        {
          uint64_t v4 = google::protobuf::RepeatedField<long long>::~RepeatedField();
          goto LABEL_32;
        }
        break;
      case 4:
      case 6:
        if (*this)
        {
          uint64_t v4 = google::protobuf::RepeatedField<unsigned long long>::~RepeatedField();
          goto LABEL_32;
        }
        break;
      case 5:
      case 14:
      case 15:
      case 17:
        if (*this)
        {
          uint64_t v4 = google::protobuf::RepeatedField<int>::~RepeatedField();
          goto LABEL_32;
        }
        break;
      case 7:
      case 13:
        if (*this)
        {
          uint64_t v4 = google::protobuf::RepeatedField<unsigned int>::~RepeatedField();
          goto LABEL_32;
        }
        break;
      case 8:
        if (*this)
        {
          uint64_t v4 = google::protobuf::RepeatedField<BOOL>::~RepeatedField();
LABEL_32:
          uint64_t v8 = 0x1080C4057E67DB5;
          goto LABEL_38;
        }
        break;
      case 9:
      case 12:
        if (*this)
        {
          uint64_t v4 = google::protobuf::RepeatedPtrField<std::string>::~RepeatedPtrField();
          goto LABEL_37;
        }
        break;
      case 10:
      case 11:
        unsigned __int8 v10 = *this;
        if (v10)
        {
          google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v10);
          google::protobuf::internal::RepeatedPtrFieldBase::~RepeatedPtrFieldBase(v10);
LABEL_37:
          uint64_t v8 = 0x1020C4014030ADELL;
          goto LABEL_38;
        }
        break;
      default:
        return;
    }
  }
  else
  {
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v12, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unsigned __int8 v5 = google::protobuf::internal::LogMessage::operator<<(v12, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v5->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
    }
    int v6 = google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v2];
    if (v6 == 10)
    {
      int v9 = *this;
      if ((*((unsigned char *)this + 10) & 0x10) != 0)
      {
        if (!v9) {
          return;
        }
      }
      else if (!v9)
      {
        return;
      }
      (*((void (**)(google::protobuf::internal::ArenaImpl **))*v9 + 1))(v9);
      return;
    }
    if (v6 == 9)
    {
      uint64_t v7 = (uint64_t)*this;
      if (v7)
      {
        if (*(char *)(v7 + 23) < 0) {
          operator delete(*(void **)v7);
        }
        uint64_t v4 = v7;
        uint64_t v8 = 0x1012C40EC159624;
LABEL_38:
        MEMORY[0x26117ABD0](v4, v8);
      }
    }
  }
}

void sub_25BFE6B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::GeneratedExtensionFinder::~GeneratedExtensionFinder(google::protobuf::internal::GeneratedExtensionFinder *this)
{
}

void google::protobuf::internal::ExtensionSet::ForEach<std::__map_iterator<std::__tree_iterator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__tree_node<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,void *> *,long>>,google::protobuf::internal::ExtensionSet::~()::$_0>(google::protobuf::internal::ArenaImpl ***a1, google::protobuf::internal::ArenaImpl ****a2)
{
  if (a1 != (google::protobuf::internal::ArenaImpl ***)a2)
  {
    uint64_t v3 = a1;
    do
    {
      google::protobuf::internal::ExtensionSet::Extension::Free(v3 + 5);
      uint64_t v4 = v3[1];
      if (v4)
      {
        do
        {
          unsigned __int8 v5 = (google::protobuf::internal::ArenaImpl ****)v4;
          uint64_t v4 = (google::protobuf::internal::ArenaImpl **)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          unsigned __int8 v5 = (google::protobuf::internal::ArenaImpl ****)v3[2];
          BOOL v6 = *v5 == v3;
          uint64_t v3 = (google::protobuf::internal::ArenaImpl ***)v5;
        }
        while (!v6);
      }
      uint64_t v3 = (google::protobuf::internal::ArenaImpl ***)v5;
    }
    while (v5 != a2);
  }
}

void google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>>(google::protobuf::internal::ArenaImpl **a1)
{
  google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(a1);

  google::protobuf::internal::RepeatedPtrFieldBase::~RepeatedPtrFieldBase(a1);
}

uint64_t google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1705);
    uint64_t v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1706);
    unsigned __int8 v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return *(void *)(*(void *)(a1 + 16) + 8 * a2 + 8);
}

void sub_25BFE6D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::AddAllocatedInternal<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(unsigned int *result, uint64_t a2)
{
  uint64_t v2 = (int *)*((void *)result + 2);
  if (!v2) {
    return google::protobuf::internal::RepeatedPtrFieldBase::UnsafeArenaAddAllocated<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(result, a2);
  }
  uint64_t v3 = *v2;
  if ((int)v3 >= (int)result[3]) {
    return google::protobuf::internal::RepeatedPtrFieldBase::UnsafeArenaAddAllocated<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(result, a2);
  }
  uint64_t v4 = v2 + 2;
  uint64_t v5 = (int)result[2];
  if ((int)v5 < (int)v3) {
    *(void *)&v4[2 * v3] = *(void *)&v4[2 * v5];
  }
  *(void *)&v4[2 * v5] = a2;
  result[2] = v5 + 1;
  ++**((_DWORD **)result + 2);
  return result;
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::UnsafeArenaAddAllocated<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(unsigned int *result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = (int *)*((void *)result + 2);
  if (!v4)
  {
    int v5 = result[3];
    goto LABEL_11;
  }
  int v5 = result[2];
  unsigned int v6 = result[3];
  if (v5 == v6)
  {
LABEL_11:
    uint64_t result = google::protobuf::internal::RepeatedPtrFieldBase::Reserve(result, v5 + 1);
    goto LABEL_12;
  }
  uint64_t v7 = *v4;
  if (v7 != v6)
  {
    if (v5 >= (int)v7)
    {
      int v9 = v7 + 1;
      goto LABEL_13;
    }
    *(void *)&v4[2 * v7 + 2] = *(void *)&v4[2 * v5 + 2];
LABEL_12:
    uint64_t v4 = (int *)*((void *)v3 + 2);
    int v9 = *v4 + 1;
LABEL_13:
    *uint64_t v4 = v9;
    goto LABEL_14;
  }
  uint64_t result = *(unsigned int **)&v4[2 * v5 + 2];
  if (result) {
    BOOL v8 = *(void *)v3 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t result = (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(void *)result + 8))(result);
    uint64_t v4 = (int *)*((void *)v3 + 2);
  }
LABEL_14:
  uint64_t v10 = (int)v3[2];
  v3[2] = v10 + 1;
  *(void *)&v4[2 * v10 + 2] = a2;
  return result;
}

google::protobuf::internal::ExtensionSet *google::protobuf::internal::ExtensionSet::ForEach<std::__map_iterator<std::__tree_iterator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__tree_node<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,void *> *,long>>,google::protobuf::internal::ExtensionSet::MergeFrom(google::protobuf::internal::ExtensionSet const&)::$_0>(void *a1, void *a2, google::protobuf::internal::ExtensionSet *this)
{
  if (a1 != a2)
  {
    int v5 = a1;
    do
    {
      google::protobuf::internal::ExtensionSet::InternalExtensionMergeFrom(this, *((_DWORD *)v5 + 8), (const google::protobuf::internal::ExtensionSet::Extension *)(v5 + 5));
      unsigned int v6 = (void *)v5[1];
      if (v6)
      {
        do
        {
          uint64_t v7 = v6;
          unsigned int v6 = (void *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          uint64_t v7 = (void *)v5[2];
          BOOL v8 = *v7 == (void)v5;
          int v5 = v7;
        }
        while (!v8);
      }
      int v5 = v7;
    }
    while (v7 != a2);
  }
  return this;
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadString(uint64_t a1, std::string::value_type *__s, int a3, std::string *a4)
{
  if (*(void *)(a1 + 8) - (void)__s + 16 >= a3)
  {
    uint64_t v6 = a3;
    MEMORY[0x26117A890](a4, __s, a3);
    return (google::protobuf::internal::EpsCopyInputStream *)&__s[v6];
  }
  else
  {
    return google::protobuf::internal::EpsCopyInputStream::ReadStringFallback(a1, __s, a3, a4);
  }
}

google::protobuf::internal *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = (google::protobuf::internal *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = (google::protobuf::internal *)((char *)this + 1);
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v15 = (unint64_t)result + v5;
    long long v16 = *(_OWORD *)(a3 + 16);
    v19[0] = *(_OWORD *)a3;
    v19[1] = v16;
    uint64_t v20 = *(void *)(a3 + 32);
    uint64_t result = (google::protobuf::internal *)google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>(result, v15, (unsigned int **)v19);
    if ((google::protobuf::internal *)v15 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      long long v10 = *(_OWORD *)(a3 + 16);
      v24[0] = *(_OWORD *)a3;
      v24[1] = v10;
      uint64_t v25 = *(void *)(a3 + 32);
      uint64_t result = (google::protobuf::internal *)google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>(result, v8, (unsigned int **)v24);
      if (!result) {
        break;
      }
      signed int v11 = result - *(void *)(a1 + 8);
      if (v11 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v12 = google::protobuf::internal::LogMessage::operator<<(&v26, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v12->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v26.__r_.__value_.__l.__data_);
      }
      int v13 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v27 = 0;
        v26.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v26.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        uint64_t v22 = *(void *)(a3 + 32);
        long long v17 = *(_OWORD *)(a3 + 16);
        v21[0] = *(_OWORD *)a3;
        v21[1] = v17;
        unsigned int v18 = (std::string *)google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>((google::protobuf::internal *)((char *)&v26 + v11), (unint64_t)&v26 + v13, (unsigned int **)v21);
        uint64_t result = 0;
        if (v18 && v18 == (std::string *)((char *)&v26 + v13)) {
          return (google::protobuf::internal *)(*(void *)(a1 + 8) + v13);
        }
        return result;
      }
      int v5 = v5 - v9 - v11;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        int v14 = google::protobuf::internal::LogMessage::operator<<(&v26, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v14->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v26.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result) {
        return result;
      }
      uint64_t result = (google::protobuf::internal *)((char *)result + v11);
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_25BFE71EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>(google::protobuf::internal *this, unint64_t a2, unsigned int **a3)
{
  uint64_t v3 = (unsigned __int8 *)this;
  if ((unint64_t)this < a2)
  {
    do
    {
      unint64_t v6 = *v3;
      if ((char)*v3 < 0)
      {
        int v7 = v6 + (v3[1] << 7);
        unint64_t v6 = (v7 - 128);
        if ((char)v3[1] < 0)
        {
          uint64_t v3 = (unsigned __int8 *)google::protobuf::internal::VarintParseSlow64((google::protobuf::internal *)v3, (v7 - 128));
          if (!v3) {
            return v3;
          }
          unint64_t v6 = v8;
        }
        else
        {
          v3 += 2;
        }
      }
      else
      {
        ++v3;
      }
      if (((unsigned int (*)(unsigned int *, unint64_t))a3[1])(a3[2], v6))
      {
        int v9 = (int *)*a3;
        uint64_t v10 = **a3;
        if (v10 == (*a3)[1])
        {
          int v11 = v10 + 1;
          google::protobuf::RepeatedField<int>::Reserve((int *)*a3, v10 + 1);
          *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)v9) + 4 * v10) = v6;
        }
        else
        {
          *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)*a3) + 4 * v10) = v6;
          int v11 = v10 + 1;
        }
        *int v9 = v11;
      }
      else
      {
        int v12 = *((_DWORD *)a3 + 8);
        int v13 = (unint64_t *)a3[3];
        if (*v13) {
          int v14 = (std::string *)((*v13 & 0xFFFFFFFFFFFFFFFELL) + 8);
        }
        else {
          int v14 = (std::string *)google::protobuf::internal::InternalMetadata::mutable_unknown_fields_slow<std::string>(v13);
        }
        google::protobuf::internal::WriteVarint(v12, v6, v14);
      }
    }
    while ((unint64_t)v3 < a2);
  }
  return v3;
}

char *google::protobuf::internal::EpsCopyInputStream::InitFrom(uint64_t a1, char *__src, int64_t __n)
{
  *(_DWORD *)(a1 + 84) = 0;
  if (__n >= 17)
  {
    *(_DWORD *)(a1 + 28) = 16;
    unint64_t v6 = &__src[__n - 16];
    *(void *)a1 = v6;
    *(void *)(a1 + 8) = v6;
    *(void *)(a1 + 16) = a1 + 40;
    if (*(void *)(a1 + 72) != 1) {
      return __src;
    }
    uint64_t v7 = 2;
    unint64_t v8 = __src;
    goto LABEL_6;
  }
  unint64_t v8 = (char *)(a1 + 40);
  memcpy((void *)(a1 + 40), __src, __n);
  *(_DWORD *)(a1 + 28) = 0;
  *(void *)a1 = &v8[__n];
  *(void *)(a1 + 8) = &v8[__n];
  *(void *)(a1 + 16) = 0;
  if (*(void *)(a1 + 72) == 1)
  {
    uint64_t v7 = __src - v8;
LABEL_6:
    *(void *)(a1 + 72) = v7;
  }
  return v8;
}

void google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 8);
  if ((v1 & 0x80000000) != 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1780);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: (n) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  else if (v1)
  {
    uint64_t v3 = (uint64_t *)(*(void *)(a1 + 16) + 8);
    do
    {
      uint64_t v4 = *v3++;
      (*(void (**)(uint64_t))(*(void *)v4 + 40))(v4);
      --v1;
    }
    while (v1);
    *(_DWORD *)(a1 + 8) = 0;
  }
}

void sub_25BFE74AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(void *a1)
{
  uint64_t v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    uint64_t v3 = v2 + 2;
    uint64_t v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3) {
          (*(void (**)(void))(*(void *)*v3 + 8))(*v3);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

uint64_t **std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int const,google::protobuf::internal::ExtensionSet::Extension>>(uint64_t **a1, int *a2, _OWORD *a3)
{
  char v6 = a1 + 1;
  int v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        int v5 = *v8;
        char v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      int v5 = v8[1];
      if (!v5)
      {
        char v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x40uLL);
    long long v11 = a3[1];
    *((_OWORD *)v10 + 2) = *a3;
    *((_OWORD *)v10 + 3) = v11;
    std::__tree<std::string>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void google::protobuf::internal::arena_destruct_object<std::map<int,google::protobuf::internal::ExtensionSet::Extension>>(uint64_t a1)
{
}

uint64_t *std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_hint_unique_key_args<int,std::pair<int const,google::protobuf::internal::ExtensionSet::Extension>>(uint64_t **a1, uint64_t *a2, int *a3, _OWORD *a4)
{
  char v6 = std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__find_equal<int>(a1, a2, &v12, &v11, a3);
  int v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    unint64_t v8 = (uint64_t **)v6;
    int v7 = (uint64_t *)operator new(0x40uLL);
    long long v9 = a4[1];
    *((_OWORD *)v7 + 2) = *a4;
    *((_OWORD *)v7 + 3) = v9;
    std::__tree<std::string>::__insert_node_at(a1, (uint64_t)v12, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__find_equal<int>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  int v5 = a1 + 1;
  if (a1 + 1 == a2 || (int v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    unint64_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
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
      long long v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        long long v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      int v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        int v13 = v10;
      }
      while (v14);
    }
    int v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          long long v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          int v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        int v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      long long v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    int v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      int v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    char v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      char v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          int v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        int v5 = v21 + 1;
        uint64_t v20 = v21[1];
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

void google::protobuf::internal::ExtensionSet::IsInitialized()
{
}

uint64_t google::protobuf::internal::DestroyMessage(google::protobuf::internal *this, const void *a2)
{
  return (**(uint64_t (***)(google::protobuf::internal *))this)(this);
}

void google::protobuf::internal::DestroyString(void **this, const void *a2)
{
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void google::protobuf::internal::InitProtobufDefaultsSlow(google::protobuf::internal *this)
{
  {
    google::protobuf::internal::fixed_address_empty_string = 0;
    unk_26A588010 = 0;
    qword_26A588018 = 0;
    google::protobuf::internal::OnShutdownRun((google::protobuf::internal *)google::protobuf::internal::DestroyString, (void (*)(const void *))&google::protobuf::internal::fixed_address_empty_string, v1);
    atomic_store(1u, (unsigned __int8 *)&google::protobuf::internal::init_protobuf_defaults_state);
  }
}

void sub_25BFE793C(_Unwind_Exception *a1)
{
}

uint64_t google::protobuf::internal::GenericSwap(google::protobuf::internal *this, google::protobuf::MessageLite *a2, google::protobuf::MessageLite *a3)
{
  uint64_t v5 = (*(uint64_t (**)(google::protobuf::internal *, google::protobuf::MessageLite *, google::protobuf::MessageLite *))(*(void *)this + 24))(this, a2, a3);
  (*(void (**)(uint64_t, google::protobuf::internal *))(*(void *)v5 + 64))(v5, this);
  (*(void (**)(google::protobuf::internal *))(*(void *)this + 40))(this);
  (*(void (**)(google::protobuf::internal *, google::protobuf::MessageLite *))(*(void *)this + 64))(this, a2);
  (*(void (**)(google::protobuf::MessageLite *))(*(void *)a2 + 40))(a2);
  (*(void (**)(google::protobuf::MessageLite *, uint64_t))(*(void *)a2 + 64))(a2, v5);
  int v6 = *(uint64_t (**)(uint64_t))(*(void *)v5 + 8);

  return v6(v5);
}

void sub_25BFE7AAC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::InitSCCImpl(_DWORD *a1)
{
  {
    __cxa_atexit((void (*)(void *))google::protobuf::internal::WrappedMutex::~WrappedMutex, &google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::mu, &dword_25BF41000);
  }
  uint64_t v2 = (google::protobuf::internal *)pthread_self();
  uint64_t v3 = (uint64_t)v2;
  if (google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::runner)
  {
    if (v2
      && v2 == (google::protobuf::internal *)google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::runner)
    {
      goto LABEL_5;
    }
  }
  else if (!v2)
  {
LABEL_5:
    if (*a1 != 1)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/generated_message_util.cc", 785);
      uint64_t v4 = google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: (scc->visit_status.load(std::memory_order_relaxed)) == (SCCInfoBase::kRunning): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v4->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
    }
    return;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&google::protobuf::internal::init_protobuf_defaults_state, memory_order_acquire) & 1) == 0)google::protobuf::internal::InitProtobufDefaultsSlow(v2); {
  std::mutex::lock(&google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::mu);
  }
  google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::runner = v3;
  google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::runner = 0;

  std::mutex::unlock(&google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::mu);
}

void sub_25BFE7C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

_DWORD *google::protobuf::internal::anonymous namespace'::InitSCC_DFS(_DWORD *result)
{
  if (*result == -1)
  {
    uint64_t v1 = (uint64_t (**)(void))result;
    *uint64_t result = 1;
    uint64_t v2 = result + 6;
    int v3 = result[1];
    if (v3 >= 1)
    {
      for (uint64_t i = 0; i < v3; ++i)
      {
        if (*(void *)&v2[2 * i])
        {
          int v3 = *((_DWORD *)v1 + 1);
        }
      }
    }
    uint64_t v5 = v3;
    int v6 = *((_DWORD *)v1 + 2);
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      unint64_t v8 = &v2[2 * v5];
      do
      {
        if (**(void **)&v8[2 * v7])
        {
          int v6 = *((_DWORD *)v1 + 2);
        }
        ++v7;
      }
      while (v7 < v6);
    }
    uint64_t result = (_DWORD *)v1[2]();
    atomic_store(0, (unsigned int *)v1);
  }
  return result;
}

uint64_t google::protobuf::internal::MergeFromImpl<false>(char *__src, int64_t __n, google::protobuf::MessageLite *a3, char a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v13 = 0x7FFFFFFF00000000;
  int v14 = google::protobuf::io::CodedInputStream::default_recursion_limit_;
  unsigned int v15 = 0x80000000;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  int v6 = google::protobuf::internal::EpsCopyInputStream::InitFrom((uint64_t)v9, __src, __n);
  if ((*(uint64_t (**)(google::protobuf::MessageLite *, char *, unsigned char *))(*(void *)a3 + 88))(a3, v6, v9)) {
    BOOL v7 = v13 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if ((a4 & 2) != 0
      || ((*(uint64_t (**)(google::protobuf::MessageLite *))(*(void *)a3 + 48))(a3) & 1) != 0)
    {
      return 1;
    }
    google::protobuf::MessageLite::LogInitializationErrorMessage(a3);
  }
  return 0;
}

void *google::protobuf::MessageLite::InitializationErrorString@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "(cannot determine missing fields for lite message)");
}

void google::protobuf::MessageLite::LogInitializationErrorMessage(google::protobuf::MessageLite *this)
{
  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 133);
  uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v5, (const std::string::value_type *)&__p);
  google::protobuf::internal::LogFinisher::operator=((int)&v3, (const char **)&v2->__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
}

void sub_25BFE7EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

void google::protobuf::anonymous namespace'::InitializationErrorMessage(const std::string::value_type *this@<X0>, const char *a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::append(a3, "Can't ");
  std::string::append(a3, this);
  std::string::append(a3, " message of type \"");
  (*(void (**)(void **__return_ptr, const char *))(*(void *)a2 + 16))(&__p, a2);
  if ((v13 & 0x80u) == 0) {
    p_p = (const std::string::value_type *)&__p;
  }
  else {
    p_p = (const std::string::value_type *)__p;
  }
  if ((v13 & 0x80u) == 0) {
    std::string::size_type v8 = v13;
  }
  else {
    std::string::size_type v8 = v12;
  }
  std::string::append(a3, p_p, v8);
  if ((char)v13 < 0) {
    operator delete(__p);
  }
  std::string::append(a3, "\" because it is missing required fields: ");
  (*(void (**)(void **__return_ptr, const char *))(*(void *)a2 + 56))(&__p, a2);
  if ((v13 & 0x80u) == 0) {
    long long v9 = (const std::string::value_type *)&__p;
  }
  else {
    long long v9 = (const std::string::value_type *)__p;
  }
  if ((v13 & 0x80u) == 0) {
    std::string::size_type v10 = v13;
  }
  else {
    std::string::size_type v10 = v12;
  }
  std::string::append(a3, v9, v10);
  if ((char)v13 < 0) {
    operator delete(__p);
  }
}

void sub_25BFE8018(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::MessageLite::ParseFromArray(google::protobuf::MessageLite *this, char *a2, unsigned int a3)
{
  if ((a3 & 0x80000000) != 0) {
    google::protobuf::MessageLite::ParseFromArray();
  }
  int64_t v5 = a3;
  (*(void (**)(google::protobuf::MessageLite *))(*(void *)this + 40))(this);

  return google::protobuf::internal::MergeFromImpl<false>(a2, v5, this, 1);
}

BOOL google::protobuf::MessageLite::AppendToString(const char *a1, std::string *a2)
{
  if (((*(uint64_t (**)(const char *))(*(void *)a1 + 48))(a1) & 1) == 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 449);
    uint64_t v4 = google::protobuf::internal::LogMessage::operator<<(v9, "CHECK failed: IsInitialized(): ");
    int64_t v5 = google::protobuf::internal::LogMessage::operator<<(v4, (const std::string::value_type *)&__p);
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v9[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::MessageLite::AppendPartialToString((uint64_t)a1, a2);
}

void sub_25BFE81AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

BOOL google::protobuf::MessageLite::AppendPartialToString(uint64_t a1, std::string *a2)
{
  uint64_t v2 = a2;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type size = a2->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  }
  unint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 72))(a1);
  uint64_t v6 = v5;
  unint64_t v7 = v5 >> 31;
  if (v5 >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 457);
    (*(void (**)(std::string *__return_ptr, uint64_t))(*(void *)a1 + 16))(__p, a1);
    std::string::size_type v10 = google::protobuf::internal::LogMessage::operator<<(v16, (const std::string::value_type *)__p);
    long long v11 = google::protobuf::internal::LogMessage::operator<<(v10, " exceeded maximum protobuf size of 2GB: ");
    std::string::size_type v12 = google::protobuf::internal::LogMessage::operator<<(v11, v6);
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    long long v9 = v16;
    goto LABEL_12;
  }
  std::string::resize(v2, v5 + size, 0);
  if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0) {
    uint64_t v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
  }
  *(_OWORD *)&v16[0].__r_.__value_.__l.__data_ = (unint64_t)v2 + size + v6;
  uint64_t v17 = 0;
  __int16 v18 = 0;
  char v19 = google::protobuf::io::CodedOutputStream::default_serialization_deterministic_ & 1;
  if (v16[0].__r_.__value_.__r.__words[0] != (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 360);
    std::string::size_type v8 = google::protobuf::internal::LogMessage::operator<<(__p, "CHECK failed: target + size == res: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
    long long v9 = __p;
LABEL_12:
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v9->__r_.__value_.__l.__data_);
  }
  return v7 == 0;
}

void sub_25BFE83D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

BOOL google::protobuf::MessageLite::SerializeAsString@<W0>(google::protobuf::MessageLite *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  BOOL result = google::protobuf::MessageLite::AppendToString((const char *)this, (std::string *)a2);
  if (!result)
  {
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
  }
  return result;
}

void sub_25BFE8470(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void google::protobuf::internal::OnShutdownRun(google::protobuf::internal *this, void (*a2)(const void *), const void *a3)
{
  uint64_t v5 = google::protobuf::internal::ShutdownData::get(this);
  std::mutex::lock((std::mutex *)(v5 + 24));
  uint64_t v6 = *(void **)(v5 + 8);
  unint64_t v7 = *(void *)(v5 + 16);
  if ((unint64_t)v6 >= v7)
  {
    uint64_t v9 = ((uint64_t)v6 - *(void *)v5) >> 4;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60) {
      std::vector<_NSRange>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v7 - *(void *)v5;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12) {
      unsigned __int8 v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>(v5 + 16, v12);
    }
    else {
      unsigned __int8 v13 = 0;
    }
    char v14 = &v13[16 * v9];
    uint64_t v15 = &v13[16 * v12];
    *(void *)char v14 = this;
    *((void *)v14 + 1) = a2;
    std::string::size_type v8 = v14 + 16;
    uint64_t v17 = *(char **)v5;
    uint64_t v16 = *(char **)(v5 + 8);
    if (v16 != *(char **)v5)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v16 - 1);
        v14 -= 16;
        v16 -= 16;
      }
      while (v16 != v17);
      uint64_t v16 = *(char **)v5;
    }
    *(void *)uint64_t v5 = v14;
    *(void *)(v5 + 8) = v8;
    *(void *)(v5 + 16) = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    void *v6 = this;
    v6[1] = a2;
    std::string::size_type v8 = v6 + 2;
  }
  *(void *)(v5 + 8) = v8;

  std::mutex::unlock((std::mutex *)(v5 + 24));
}

void sub_25BFE85AC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ShutdownData::get(google::protobuf::internal::ShutdownData *this)
{
  {
    operator new();
  }
  return google::protobuf::internal::ShutdownData::get(void)::data;
}

void sub_25BFE8650(_Unwind_Exception *a1)
{
}

google::protobuf::internal::ShutdownData *google::protobuf::ShutdownProtobufLibrary(google::protobuf::internal::ShutdownData *this)
{
  if ((google::protobuf::ShutdownProtobufLibrary(void)::is_shutdown & 1) == 0)
  {
    this = (google::protobuf::internal::ShutdownData *)google::protobuf::internal::ShutdownData::get(this);
    if (this)
    {
      google::protobuf::internal::ShutdownData::~ShutdownData(this);
      this = (google::protobuf::internal::ShutdownData *)MEMORY[0x26117ABD0]();
    }
    google::protobuf::ShutdownProtobufLibrary(void)::is_shutdown = 1;
  }
  return this;
}

void google::protobuf::internal::ShutdownData::~ShutdownData(google::protobuf::internal::ShutdownData *this)
{
  uint64_t v2 = *(void **)this;
  char v3 = (void *)*((void *)this + 1);
  uint64_t v4 = v3 - 2;
  if (*(void **)this != v3 && v4 > v2)
  {
    do
    {
      uint64_t v6 = (void (*)(void))*v2;
      *uint64_t v2 = *v4;
      *uint64_t v4 = v6;
      uint64_t v7 = v2[1];
      v2[1] = v4[1];
      v4[1] = v7;
      v2 += 2;
      v4 -= 2;
    }
    while (v2 < v4);
    uint64_t v2 = *(void **)this;
    char v3 = (void *)*((void *)this + 1);
  }
  while (v2 != v3)
  {
    ((void (*)(void))*v2)(v2[1]);
    v2 += 2;
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 24));
  std::string::size_type v8 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v8;
    operator delete(v8);
  }
}

void google::protobuf::MessageLite::ParseFromArray()
{
  __assert_rtn("StringPiece", "stringpiece.h", 229, "len >= 0");
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::Next(google::protobuf::internal::EpsCopyInputStream *this)
{
  if (*((int *)this + 7) <= 16)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 158);
    uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: limit_ > kSlopBytes: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  BOOL result = google::protobuf::internal::EpsCopyInputStream::NextBuffer(this, 0, -1);
  uint64_t v4 = *((void *)this + 1);
  if (result)
  {
    int v5 = *((_DWORD *)this + 7) + result - v4;
    *((_DWORD *)this + 7) = v5;
    v4 += v5 & (v5 >> 31);
  }
  else
  {
    *((_DWORD *)this + 20) = 1;
  }
  *(void *)this = v4;
  return result;
}

void sub_25BFE883C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::NextBuffer(google::protobuf::internal::EpsCopyInputStream *this, unsigned int a2, int a3)
{
  char v3 = (google::protobuf::internal::EpsCopyInputStream *)*((void *)this + 2);
  if (!v3) {
    return v3;
  }
  int v5 = (char *)this + 40;
  if (v3 != (google::protobuf::internal::EpsCopyInputStream *)((char *)this + 40))
  {
    int v6 = *((_DWORD *)this + 6);
    if (v6 <= 16)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 105);
      uint64_t v7 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: size_ > kSlopBytes: ");
      google::protobuf::internal::LogFinisher::operator=((int)&__src, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
      char v3 = (google::protobuf::internal::EpsCopyInputStream *)*((void *)this + 2);
      int v6 = *((_DWORD *)this + 6);
    }
    *((void *)this + 1) = (char *)v3 + v6 - 16;
    *((void *)this + 2) = v5;
    if (*((void *)this + 9) == 1) {
      *((void *)this + 9) = 2;
    }
    return v3;
  }
  *(_OWORD *)char v3 = *(_OWORD *)*((void *)this + 1);
  if (*((int *)this + 21) < 1) {
    goto LABEL_46;
  }
  int v8 = a3;
  if (a3 < 0) {
    goto LABEL_39;
  }
  if ((a2 & 0x80000000) != 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 53);
    uint64_t v11 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: overrun >= 0: ");
    google::protobuf::internal::LogFinisher::operator=((int)&__src, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
LABEL_14:
    unint64_t v12 = (unsigned __int8 *)this + 56;
    unsigned __int8 v13 = (unsigned __int8 *)v3 + (int)a2;
    char v14 = v13;
    while (2)
    {
      int v15 = (char)*v14++;
      int v16 = v15;
      if (v15 < 0)
      {
        int v16 = v16 + (*v14 << 7) - 128;
        if ((char)*v14 < 0)
        {
          char v14 = v13 + 3;
          uint64_t v20 = -21;
          while (1)
          {
            v16 += (*(v14 - 1) - 1) << (v20 + 35);
            if (((char)*(v14 - 1) & 0x80000000) == 0) {
              break;
            }
            ++v14;
            v20 += 7;
            if (!v20) {
              goto LABEL_39;
            }
          }
        }
        else
        {
          char v14 = v13 + 2;
        }
      }
      if (v14 <= v12)
      {
        if (!v16) {
          goto LABEL_46;
        }
        switch(v16 & 7)
        {
          case 0:
            v33[0].__r_.__value_.__r.__words[0] = 0;
            char v14 = google::protobuf::internal::VarintParse<unsigned long long>((char *)v14, v33);
            if (!v14) {
              goto LABEL_39;
            }
            goto LABEL_38;
          case 1:
            v14 += 8;
            goto LABEL_38;
          case 2:
            __int16 v18 = (const char *)*v14;
            if ((char)*v14 < 0)
            {
              SizeFallback = google::protobuf::internal::ReadSizeFallback((google::protobuf::internal *)v14, v18);
              if (!SizeFallback) {
                goto LABEL_39;
              }
            }
            else
            {
              SizeFallback = (char *)(v14 + 1);
            }
            if (v12 - (unsigned __int8 *)SizeFallback < (int)v18) {
              goto LABEL_39;
            }
            char v14 = (unsigned __int8 *)&SizeFallback[(int)v18];
LABEL_38:
            unsigned __int8 v13 = v14;
            if (v14 >= v12) {
              goto LABEL_39;
            }
            continue;
          case 3:
            ++v8;
            goto LABEL_38;
          case 4:
            BOOL v17 = __OFSUB__(v8--, 1);
            if (v8 < 0 != v17) {
              goto LABEL_46;
            }
            goto LABEL_38;
          case 5:
            v14 += 4;
            goto LABEL_38;
          default:
            goto LABEL_39;
        }
      }
      goto LABEL_39;
    }
  }
  if (a2 >= 0x11)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 54);
    unint64_t v10 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: overrun <= kSlopBytes: ");
    google::protobuf::internal::LogFinisher::operator=((int)&__src, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    goto LABEL_39;
  }
  if (a2 != 16) {
    goto LABEL_14;
  }
LABEL_39:
  __src = 0;
  if (!(*(unsigned int (**)(void, void **, char *))(**((void **)this + 4) + 16))(*((void *)this + 4), &__src, (char *)this + 24))
  {
LABEL_45:
    *((_DWORD *)this + 21) = 0;
LABEL_46:
    if (*((void *)this + 9) == 2) {
      *((void *)this + 9) = *((void *)this + 1) - (void)v3;
    }
    *((void *)this + 1) = (char *)this + 56;
    *((void *)this + 2) = 0;
    *((_DWORD *)this + 6) = 0;
    return v3;
  }
  while (1)
  {
    size_t v21 = *((unsigned int *)this + 6);
    *((_DWORD *)this + 21) -= v21;
    if ((int)v21 >= 17)
    {
      unint64_t v27 = *((void *)this + 9);
      std::string v26 = (void *)((char *)this + 72);
      unint64_t v25 = v27;
      uint64_t v28 = (char *)(v26 - 2);
      unsigned int v29 = __src;
      *((_OWORD *)v26 - 1) = *(_OWORD *)__src;
      *(v26 - 7) = v29;
      goto LABEL_52;
    }
    if ((int)v21 >= 1) {
      break;
    }
    if (v21)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 137);
      int v22 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: size_ == 0: ");
      char v23 = google::protobuf::internal::LogMessage::operator<<(v22, *((_DWORD *)this + 6));
      google::protobuf::internal::LogFinisher::operator=((int)&v31, (const char **)&v23->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    }
    if (((*(uint64_t (**)(void, void **, char *))(**((void **)this + 4) + 16))(*((void *)this + 4), &__src, (char *)this + 24) & 1) == 0)goto LABEL_45; {
  }
    }
  memcpy((char *)this + 56, __src, v21);
  unint64_t v30 = *((void *)this + 9);
  std::string v26 = (void *)((char *)this + 72);
  unint64_t v25 = v30;
  uint64_t v28 = (char *)v3 + v21;
  *(v26 - 7) = v3;
LABEL_52:
  *(v26 - 8) = v28;
  if (v25 > 1) {
    *std::string v26 = 1;
  }
  return v3;
}

void sub_25BFE8C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::EpsCopyInputStream::DoneFallback(google::protobuf::internal::EpsCopyInputStream *this, signed int a2, int a3)
{
  int v3 = *((_DWORD *)this + 7);
  if (v3 < a2) {
    return 0;
  }
  signed int v5 = a2;
  if (v3 == a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 175);
    uint64_t v7 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: overrun != limit_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
    int v3 = *((_DWORD *)this + 7);
  }
  if (v3 <= v5)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 176);
    int v8 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: overrun < limit_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
    int v3 = *((_DWORD *)this + 7);
  }
  if (*(void *)this != *((void *)this + 1) + (v3 & (v3 >> 31)))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 181);
    uint64_t v9 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: limit_end_ == buffer_end_ + (std::min)(0, limit_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v9->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
    int v3 = *((_DWORD *)this + 7);
  }
  if (v3 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 183);
    unint64_t v10 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: limit_ > 0: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
  }
  if (*(void *)this != *((void *)this + 1))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 184);
    uint64_t v11 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: limit_end_ == buffer_end_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
  }
  while (1)
  {
    if (v5 < 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 188);
      unint64_t v12 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: overrun >= 0: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
    }
    Buffer = google::protobuf::internal::EpsCopyInputStream::NextBuffer(this, v5, a3);
    if (!Buffer) {
      break;
    }
    uint64_t v14 = *((void *)this + 1);
    int v15 = *((_DWORD *)this + 7) + Buffer - v14;
    *((_DWORD *)this + 7) = v15;
    uint64_t result = (uint64_t)Buffer + v5;
    signed int v5 = result - v14;
    if ((int)result - (int)v14 < 0)
    {
      *(void *)this = v14 + (v15 & (v15 >> 31));
      return result;
    }
  }
  if (v5) {
    return 0;
  }
  if (*((int *)this + 7) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 193);
    BOOL v17 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: limit_ > 0: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v17->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
  }
  uint64_t result = *((void *)this + 1);
  *(void *)this = result;
  *((_DWORD *)this + 20) = 1;
  return result;
}

void sub_25BFE8F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::SkipFallback(google::protobuf::internal::EpsCopyInputStream *this, const char *a2, int a3)
{
  int v5 = *((_DWORD *)this + 2) - a2 + 16;
  while (1)
  {
    BOOL v6 = __OFSUB__(a3, v5);
    a3 -= v5;
    if ((a3 < 0) ^ v6 | (a3 == 0))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      uint64_t v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: size > chunk_size: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    if (!*((void *)this + 2) || *((int *)this + 7) < 17) {
      break;
    }
    uint64_t result = google::protobuf::internal::EpsCopyInputStream::Next(this);
    if (!result) {
      return result;
    }
    int v5 = *((_DWORD *)this + 2) - result;
    if (a3 <= v5) {
      return (google::protobuf::internal::EpsCopyInputStream *)((char *)result + a3 + 16);
    }
  }
  return 0;
}

void sub_25BFE9048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadStringFallback(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  int v5 = a3;
  BOOL v6 = __s;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0;
  }
  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    *((unsigned char *)&this->__r_.__value_.__s + 23) = 0;
  }
  uint64_t v8 = *(void *)(a1 + 8);
  if (v8 - (uint64_t)__s + *(int *)(a1 + 28) >= a3)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
    }
    else {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    }
    if (a3 >= 50000000) {
      int v10 = 50000000;
    }
    else {
      int v10 = a3;
    }
    std::string::reserve(this, size + v10);
    uint64_t v8 = *(void *)(a1 + 8);
  }
  int v11 = v8 - v6 + 16;
  while (1)
  {
    BOOL v12 = __OFSUB__(v5, v11);
    v5 -= v11;
    if ((v5 < 0) ^ v12 | (v5 == 0))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      unsigned __int8 v13 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: size > chunk_size: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    }
    if (!*(void *)(a1 + 16)) {
      break;
    }
    std::string::append(this, v6, v11);
    if (*(int *)(a1 + 28) < 17) {
      break;
    }
    uint64_t result = google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
    if (!result) {
      return result;
    }
    BOOL v6 = (char *)result + 16;
    int v11 = *(_DWORD *)(a1 + 8) - result;
    if (v5 <= v11)
    {
      std::string::append(this, v6, v5);
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5];
    }
  }
  return 0;
}

void sub_25BFE91D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::AppendStringFallback(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  int v5 = a3;
  BOOL v6 = __s;
  uint64_t v8 = *(void *)(a1 + 8);
  if (v8 - (uint64_t)__s + *(int *)(a1 + 28) >= a3)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
    }
    else {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    }
    if (a3 >= 50000000) {
      int v10 = 50000000;
    }
    else {
      int v10 = a3;
    }
    std::string::reserve(this, size + v10);
    uint64_t v8 = *(void *)(a1 + 8);
  }
  int v11 = v8 - v6 + 16;
  while (1)
  {
    BOOL v12 = __OFSUB__(v5, v11);
    v5 -= v11;
    if ((v5 < 0) ^ v12 | (v5 == 0))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      unsigned __int8 v13 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: size > chunk_size: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    }
    if (!*(void *)(a1 + 16)) {
      break;
    }
    std::string::append(this, v6, v11);
    if (*(int *)(a1 + 28) < 17) {
      break;
    }
    uint64_t result = google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
    if (!result) {
      return result;
    }
    BOOL v6 = (char *)result + 16;
    int v11 = *(_DWORD *)(a1 + 8) - result;
    if (v5 <= v11)
    {
      std::string::append(this, v6, v5);
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5];
    }
  }
  return 0;
}

void sub_25BFE9338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

char *google::protobuf::internal::ParseContext::ParseMessage<google::protobuf::MessageLite>(google::protobuf::internal::EpsCopyInputStream *this, uint64_t a2, google::protobuf::internal *a3)
{
  int v6 = *(char *)a3;
  uint64_t v7 = (const char *)*(unsigned __int8 *)a3;
  if (v6 < 0)
  {
    uint64_t result = google::protobuf::internal::ReadSizeFallback(a3, v7);
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    LODWORD(v7) = v10;
  }
  else
  {
    uint64_t v8 = (char *)a3 + 1;
  }
  int v11 = google::protobuf::internal::EpsCopyInputStream::PushLimit(this, v8, v7);
  int v12 = *((_DWORD *)this + 22);
  BOOL v13 = __OFSUB__(v12--, 1);
  *((_DWORD *)this + 22) = v12;
  if (v12 < 0 != v13) {
    return 0;
  }
  int v14 = v11;
  uint64_t result = (char *)(*(uint64_t (**)(uint64_t, const char *, google::protobuf::internal::EpsCopyInputStream *))(*(void *)a2 + 88))(a2, v8, this);
  if (!result) {
    return result;
  }
  ++*((_DWORD *)this + 22);
  if (*((_DWORD *)this + 20)) {
    return 0;
  }
  int v15 = *((_DWORD *)this + 7) + v14;
  *((_DWORD *)this + 7) = v15;
  *(void *)this = *((void *)this + 1) + (v15 & (v15 >> 31));
  return result;
}

void google::protobuf::internal::WriteVarint(int a1, unint64_t a2, std::string *this)
{
  unint64_t v5 = (8 * a1);
  if (v5 < 0x80)
  {
    LOBYTE(v6) = 8 * a1;
  }
  else
  {
    do
    {
      std::string::push_back(this, v5 | 0x80);
      unint64_t v6 = v5 >> 7;
      unint64_t v7 = v5 >> 14;
      v5 >>= 7;
    }
    while (v7);
  }
  std::string::push_back(this, v6);
  if (a2 < 0x80)
  {
    LOBYTE(v8) = a2;
  }
  else
  {
    do
    {
      std::string::push_back(this, a2 | 0x80);
      unint64_t v8 = a2 >> 7;
      unint64_t v9 = a2 >> 14;
      a2 >>= 7;
    }
    while (v9);
  }

  std::string::push_back(this, v8);
}

uint64_t google::protobuf::internal::VarintParseSlow32(google::protobuf::internal *this, const char *a2)
{
  uint64_t result = (uint64_t)this + 3;
  uint64_t v4 = -21;
  while (1)
  {
    LODWORD(a2) = ((*(unsigned __int8 *)(result - 1) - 1) << (v4 + 35)) + a2;
    if ((*(char *)(result - 1) & 0x80000000) == 0) {
      break;
    }
    ++result;
    v4 += 7;
    if (!v4)
    {
      while (*((char *)this + v4 + 5) < 0)
      {
        uint64_t result = 0;
        if (++v4 == 5) {
          return result;
        }
      }
      return (uint64_t)this + v4 + 6;
    }
  }
  return result;
}

uint64_t google::protobuf::internal::VarintParseSlow64(google::protobuf::internal *this, unint64_t a2)
{
  a2 = a2;
  uint64_t result = (uint64_t)this + 3;
  uint64_t v4 = (char *)this + 2;
  uint64_t v5 = 14;
  while (1)
  {
    int v6 = *v4++;
    a2 += (v6 - 1) << v5;
    if ((v6 & 0x80000000) == 0) {
      break;
    }
    ++result;
    v5 += 7;
    if (v5 == 70) {
      return 0;
    }
  }
  return result;
}

uint64_t google::protobuf::internal::ReadTagFallback(google::protobuf::internal *this, const char *a2)
{
  uint64_t result = (uint64_t)this + 3;
  uint64_t v4 = (char *)this + 2;
  uint64_t v5 = -21;
  while (1)
  {
    int v6 = *v4++;
    LODWORD(a2) = ((v6 - 1) << (v5 + 35)) + a2;
    if ((v6 & 0x80000000) == 0) {
      break;
    }
    ++result;
    v5 += 7;
    if (!v5) {
      return 0;
    }
  }
  return result;
}

char *google::protobuf::internal::ReadSizeFallback(google::protobuf::internal *this, const char *a2)
{
  uint64_t result = (char *)this + 2;
  uint64_t v4 = -21;
  while (1)
  {
    LODWORD(a2) = ((*(result - 1) - 1) << (v4 + 28)) + a2;
    if ((*(result - 1) & 0x80000000) == 0) {
      break;
    }
    ++result;
    v4 += 7;
    if (!v4)
    {
      unsigned int v5 = *((unsigned __int8 *)this + 4);
      int v6 = (char *)this + 5;
      if (a2 + (v5 << 28) - 0x10000000 > 0x7FFFFFEF) {
        int v6 = 0;
      }
      if (v5 <= 7) {
        return v6;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

char *google::protobuf::internal::InlineGreedyStringParser(std::string *a1, std::string::value_type *this, uint64_t a3)
{
  int v5 = *this;
  if (*this < 0)
  {
    uint64_t result = google::protobuf::internal::ReadSizeFallback((google::protobuf::internal *)this, (const char *)*this);
    if (!result) {
      return result;
    }
    int v6 = result;
    int v5 = v8;
  }
  else
  {
    int v6 = this + 1;
  }

  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadString(a3, v6, v5, a1);
}

unsigned __int8 *google::protobuf::internal::PackedInt32Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedUInt32Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedInt64Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedUInt64Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedSInt32Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedSInt64Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedBoolParser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

char *google::protobuf::internal::FixedParser<unsigned int>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v6 = result;
    int v5 = v8;
  }
  else
  {
    int v6 = (char *)this + 1;
  }

  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<unsigned int>(a3, v6, v5, a1);
}

char *google::protobuf::internal::FixedParser<int>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v6 = result;
    int v5 = v8;
  }
  else
  {
    int v6 = (char *)this + 1;
  }

  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<int>(a3, v6, v5, a1);
}

char *google::protobuf::internal::FixedParser<unsigned long long>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v6 = result;
    int v5 = v8;
  }
  else
  {
    int v6 = (char *)this + 1;
  }

  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<unsigned long long>(a3, v6, v5, a1);
}

char *google::protobuf::internal::FixedParser<long long>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v6 = result;
    int v5 = v8;
  }
  else
  {
    int v6 = (char *)this + 1;
  }

  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<long long>(a3, v6, v5, a1);
}

char *google::protobuf::internal::FixedParser<float>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v6 = result;
    int v5 = v8;
  }
  else
  {
    int v6 = (char *)this + 1;
  }

  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<float>(a3, v6, v5, a1);
}

char *google::protobuf::internal::FixedParser<double>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v6 = result;
    int v5 = v8;
  }
  else
  {
    int v6 = (char *)this + 1;
  }

  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<double>(a3, v6, v5, a1);
}

char *google::protobuf::internal::WireFormatParser<google::protobuf::internal::UnknownFieldLiteParserHelper>(google::protobuf::internal::UnknownFieldLiteParserHelper *a1, char *a2, google::protobuf::internal::EpsCopyInputStream *this)
{
  int v10 = a2;
  while (1)
  {
    if (google::protobuf::internal::EpsCopyInputStream::DoneWithCheck(this, (const char **)&v10, *((_DWORD *)this + 23)))return v10; {
    int v5 = v10 + 1;
    }
    int v6 = *v10;
    if (*v10 < 0)
    {
      int v6 = v6 + (*v5 << 7) - 128;
      if (*v5 < 0)
      {
        int v5 = v10 + 3;
        uint64_t v8 = -21;
        while (1)
        {
          v6 += (*(v5 - 1) - 1) << (v8 + 35);
          if ((*(v5 - 1) & 0x80000000) == 0) {
            break;
          }
          ++v5;
          v8 += 7;
          if (!v8) {
            return 0;
          }
        }
      }
      else
      {
        int v5 = v10 + 2;
      }
    }
    int v10 = v5;
    if (!v6 || (v6 & 7) == 4) {
      break;
    }
    int v10 = (char *)google::protobuf::internal::FieldParser<google::protobuf::internal::UnknownFieldLiteParserHelper>(v6, a1, (google::protobuf::internal *)v5);
    if (!v10) {
      return 0;
    }
  }
  *((_DWORD *)this + 20) = v6 - 1;
  return v5;
}

unsigned __int8 *google::protobuf::internal::UnknownFieldParse(unsigned int a1, std::string *a2, google::protobuf::internal *a3, google::protobuf::internal::ParseContext *a4)
{
  int v5 = a2;
  return google::protobuf::internal::FieldParser<google::protobuf::internal::UnknownFieldLiteParserHelper>(a1, &v5, a3, a4);
}

unsigned __int8 *google::protobuf::internal::FieldParser<google::protobuf::internal::UnknownFieldLiteParserHelper>(unint64_t a1, std::string **this, google::protobuf::internal *a3, google::protobuf::internal::ParseContext *a4)
{
  unint64_t v4 = a1 >> 3;
  if (!(a1 >> 3)) {
    return 0;
  }
  int v5 = (unsigned __int8 *)a3;
  switch(a1 & 7)
  {
    case 0uLL:
      v11[0].__r_.__value_.__r.__words[0] = 0;
      int v5 = google::protobuf::internal::VarintParse<unsigned long long>((char *)a3, v11);
      if (v5) {
        google::protobuf::internal::UnknownFieldLiteParserHelper::AddVarint(this, v4, v11[0].__r_.__value_.__r.__words[0]);
      }
      return v5;
    case 1uLL:
      int v5 = (unsigned __int8 *)a3 + 8;
      google::protobuf::internal::UnknownFieldLiteParserHelper::AddFixed64((std::string *)this, v4, *(void *)a3);
      return v5;
    case 2uLL:
      uint64_t v8 = (unsigned __int8 *)google::protobuf::internal::UnknownFieldLiteParserHelper::ParseLengthDelimited(this, v4, (std::string::value_type *)a3, a4);
      goto LABEL_10;
    case 3uLL:
      uint64_t v8 = (unsigned __int8 *)google::protobuf::internal::UnknownFieldLiteParserHelper::ParseGroup(this, v4, (char *)a3, (int32x2_t *)a4);
LABEL_10:
      int v5 = v8;
      break;
    case 4uLL:
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 758);
      unint64_t v7 = google::protobuf::internal::LogMessage::operator<<(v11, "Can't happen");
      google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
      break;
    case 5uLL:
      int v5 = (unsigned __int8 *)a3 + 4;
      google::protobuf::internal::UnknownFieldLiteParserHelper::AddFixed32((std::string *)this, v4, *(_DWORD *)a3);
      break;
    default:
      return 0;
  }
  return v5;
}

void sub_25BFE9C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::VarintParse<unsigned long long>(char *a1, void *a2)
{
  uint64_t v2 = *a1;
  if (*a1 < 0)
  {
    int v4 = a1[1];
    uint64_t v5 = (v2 + (v4 << 7) - 128);
    if ((v4 & 0x80) != 0)
    {
      uint64_t result = (unsigned __int8 *)(a1 + 3);
      uint64_t v6 = 14;
      while (1)
      {
        v5 += (*(result - 1) - 1) << v6;
        if (((char)*(result - 1) & 0x80000000) == 0) {
          break;
        }
        ++result;
        v6 += 7;
        if (v6 == 70)
        {
          uint64_t result = 0;
          uint64_t v5 = 0;
          break;
        }
      }
      *a2 = v5;
    }
    else
    {
      *a2 = v5;
      return (unsigned __int8 *)(a1 + 2);
    }
  }
  else
  {
    *a2 = v2;
    return (unsigned __int8 *)(a1 + 1);
  }
  return result;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = (unsigned __int8 *)this + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_25BFE9F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i) {
      break;
    }
    int v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      google::protobuf::RepeatedField<int>::Reserve(a3, v7 + 1);
      *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a3) + 4 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = (unsigned __int8 *)this + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_25BFEA1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i) {
      break;
    }
    int v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      google::protobuf::RepeatedField<unsigned int>::Reserve(a3, v7 + 1);
      *(_DWORD *)(google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a3) + 4 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = (unsigned __int8 *)this + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_25BFEA4AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i) {
      break;
    }
    uint64_t v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      google::protobuf::RepeatedField<long long>::Reserve(a3, v7 + 1);
      *(void *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(void *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a3) + 8 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = (unsigned __int8 *)this + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_25BFEA780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i) {
      break;
    }
    uint64_t v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      google::protobuf::RepeatedField<unsigned long long>::Reserve(a3, v7 + 1);
      *(void *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(void *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a3) + 8 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = (unsigned __int8 *)this + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_25BFEAA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i) {
      break;
    }
    int v6 = -(v10 & 1) ^ (v10 >> 1);
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      google::protobuf::RepeatedField<int>::Reserve(a3, v7 + 1);
      *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a3) + 4 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = (unsigned __int8 *)this + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_25BFEAD34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    unint64_t v10 = 0;
    uint64_t i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i) {
      break;
    }
    unint64_t v6 = -(uint64_t)(v10 & 1) ^ (v10 >> 1);
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      google::protobuf::RepeatedField<long long>::Reserve(a3, v7 + 1);
      *(void *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(void *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a3) + 8 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    uint64_t result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = (unsigned __int8 *)this + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_25BFEB014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i) {
      break;
    }
    BOOL v6 = v10 != 0;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      google::protobuf::RepeatedField<BOOL>::Reserve(a3, v7 + 1);
      *(unsigned char *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a3) + v7) = v6;
    }
    else
    {
      *(unsigned char *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a3) + v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<unsigned int>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *((_DWORD *)a1 + 2) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<unsigned int>::Reserve(a4, *a4 + (v5 >> 2));
    int v11 = (void *)google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC)) {
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFFC];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<unsigned int>::Reserve(a4, *a4 + (v7 >> 2));
      int v9 = (void *)google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*((int *)a1 + 7) < 17) {
        return 0;
      }
      uint64_t result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFFC;
      BOOL v6 = (char *)result - (v7 & 3) + 16;
      int v7 = *((_DWORD *)a1 + 2) - (result - (v7 & 3));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<int>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *((_DWORD *)a1 + 2) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<int>::Reserve(a4, *a4 + (v5 >> 2));
    int v11 = (void *)google::protobuf::RepeatedField<int>::AddNAlreadyReserved((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC)) {
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFFC];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<int>::Reserve(a4, *a4 + (v7 >> 2));
      int v9 = (void *)google::protobuf::RepeatedField<int>::AddNAlreadyReserved((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*((int *)a1 + 7) < 17) {
        return 0;
      }
      uint64_t result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFFC;
      BOOL v6 = (char *)result - (v7 & 3) + 16;
      int v7 = *((_DWORD *)a1 + 2) - (result - (v7 & 3));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<unsigned long long>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *((_DWORD *)a1 + 2) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<unsigned long long>::Reserve(a4, *a4 + (v5 >> 3));
    int v11 = (void *)google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8)) {
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFF8];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<unsigned long long>::Reserve(a4, *a4 + (v7 >> 3));
      int v9 = (void *)google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*((int *)a1 + 7) < 17) {
        return 0;
      }
      uint64_t result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFF8;
      BOOL v6 = (char *)result - (v7 & 7) + 16;
      int v7 = *((_DWORD *)a1 + 2) - (result - (v7 & 7));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<long long>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *((_DWORD *)a1 + 2) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<long long>::Reserve(a4, *a4 + (v5 >> 3));
    int v11 = (void *)google::protobuf::RepeatedField<long long>::AddNAlreadyReserved((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8)) {
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFF8];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<long long>::Reserve(a4, *a4 + (v7 >> 3));
      int v9 = (void *)google::protobuf::RepeatedField<long long>::AddNAlreadyReserved((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*((int *)a1 + 7) < 17) {
        return 0;
      }
      uint64_t result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFF8;
      BOOL v6 = (char *)result - (v7 & 7) + 16;
      int v7 = *((_DWORD *)a1 + 2) - (result - (v7 & 7));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<float>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *((_DWORD *)a1 + 2) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<float>::Reserve(a4, *a4 + (v5 >> 2));
    int v11 = (void *)google::protobuf::RepeatedField<float>::AddNAlreadyReserved((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC)) {
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFFC];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<float>::Reserve(a4, *a4 + (v7 >> 2));
      int v9 = (void *)google::protobuf::RepeatedField<float>::AddNAlreadyReserved((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*((int *)a1 + 7) < 17) {
        return 0;
      }
      uint64_t result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFFC;
      BOOL v6 = (char *)result - (v7 & 3) + 16;
      int v7 = *((_DWORD *)a1 + 2) - (result - (v7 & 3));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<double>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *((_DWORD *)a1 + 2) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<double>::Reserve(a4, *a4 + (v5 >> 3));
    int v11 = (void *)google::protobuf::RepeatedField<double>::AddNAlreadyReserved((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8)) {
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFF8];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<double>::Reserve(a4, *a4 + (v7 >> 3));
      int v9 = (void *)google::protobuf::RepeatedField<double>::AddNAlreadyReserved((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*((int *)a1 + 7) < 17) {
        return 0;
      }
      uint64_t result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFF8;
      BOOL v6 = (char *)result - (v7 & 7) + 16;
      int v7 = *((_DWORD *)a1 + 2) - (result - (v7 & 7));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

void google::protobuf::internal::UnknownFieldLiteParserHelper::AddVarint(std::string **this, int a2, unint64_t a3)
{
  int v3 = *this;
  if (*this)
  {
    unint64_t v6 = (8 * a2);
    if (v6 < 0x80)
    {
      LOBYTE(v7) = 8 * a2;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        unint64_t v7 = v6 >> 7;
        unint64_t v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    int v9 = *this;
    if (a3 < 0x80)
    {
      LOBYTE(v10) = a3;
    }
    else
    {
      do
      {
        std::string::push_back(v9, a3 | 0x80);
        unint64_t v10 = a3 >> 7;
        unint64_t v11 = a3 >> 14;
        a3 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v9, v10);
  }
}

std::string *google::protobuf::internal::UnknownFieldLiteParserHelper::AddFixed64(std::string *this, int a2, uint64_t a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  int v3 = (std::string *)this->__r_.__value_.__r.__words[0];
  if (this->__r_.__value_.__r.__words[0])
  {
    int v5 = (std::string **)this;
    unint64_t v6 = (8 * a2) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 1;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        unint64_t v7 = v6 >> 7;
        unint64_t v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    v9[0] = a3;
    return std::string::append(*v5, (const std::string::value_type *)v9, 8uLL);
  }
  return this;
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::UnknownFieldLiteParserHelper::ParseLengthDelimited(std::string **this, int a2, std::string::value_type *a3, google::protobuf::internal::ParseContext *a4)
{
  int v7 = *a3;
  if (*a3 < 0)
  {
    uint64_t result = (google::protobuf::internal::EpsCopyInputStream *)google::protobuf::internal::ReadSizeFallback((google::protobuf::internal *)a3, (const char *)*a3);
    if (!result) {
      return result;
    }
    unint64_t v8 = (std::string::value_type *)result;
    int v7 = v10;
  }
  else
  {
    unint64_t v8 = a3 + 1;
  }
  unint64_t v11 = *this;
  if (*this)
  {
    unint64_t v12 = (8 * a2) | 2u;
    if (v12 < 0x80)
    {
      LOBYTE(v13) = v12;
    }
    else
    {
      do
      {
        std::string::push_back(v11, v12 | 0x80);
        unint64_t v13 = v12 >> 7;
        unint64_t v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
    }
    std::string::push_back(v11, v13);
    unint64_t v15 = v7;
    BOOL v16 = *this;
    if (v7 < 0x80)
    {
      LOBYTE(v17) = v7;
    }
    else
    {
      do
      {
        std::string::push_back(v16, v15 | 0x80);
        unint64_t v17 = v15 >> 7;
        unint64_t v18 = v15 >> 14;
        v15 >>= 7;
      }
      while (v18);
    }
    std::string::push_back(v16, v17);
    __int16 v19 = *this;
    return google::protobuf::internal::EpsCopyInputStream::AppendString((uint64_t)a4, v8, v7, v19);
  }
  else if (*((void *)a4 + 1) - (void)v8 + 16 >= v7)
  {
    return (google::protobuf::internal::EpsCopyInputStream *)&v8[v7];
  }
  else
  {
    return google::protobuf::internal::EpsCopyInputStream::SkipFallback(a4, v8, v7);
  }
}

char *google::protobuf::internal::UnknownFieldLiteParserHelper::ParseGroup(std::string **this, int a2, char *a3, int32x2_t *a4)
{
  int v7 = *this;
  int v8 = 8 * a2;
  if (*this)
  {
    unint64_t v9 = v8 | 3u;
    if (v9 < 0x80)
    {
      LOBYTE(v10) = v8 | 3;
    }
    else
    {
      do
      {
        std::string::push_back(v7, v9 | 0x80);
        unint64_t v10 = v9 >> 7;
        unint64_t v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v7, v10);
  }
  int v12 = a4[11].i32[0];
  BOOL v13 = __OFSUB__(v12--, 1);
  a4[11].i32[0] = v12;
  if (v12 < 0 != v13) {
    return 0;
  }
  ++a4[11].i32[1];
  unint64_t v14 = google::protobuf::internal::WireFormatParser<google::protobuf::internal::UnknownFieldLiteParserHelper>((google::protobuf::internal::UnknownFieldLiteParserHelper *)this, a3, (google::protobuf::internal::EpsCopyInputStream *)a4);
  a4[11] = vadd_s32(a4[11], (int32x2_t)0xFFFFFFFF00000001);
  __int32 v15 = a4[10].i32[0];
  a4[10].i32[0] = 0;
  if (v15 != (v8 | 3) || v14 == 0) {
    return 0;
  }
  unint64_t v17 = v14;
  unint64_t v18 = *this;
  if (v18)
  {
    unint64_t v19 = v8 | 4u;
    if (v19 < 0x80)
    {
      LOBYTE(v20) = v8 | 4;
    }
    else
    {
      do
      {
        std::string::push_back(v18, v19 | 0x80);
        unint64_t v20 = v19 >> 7;
        unint64_t v21 = v19 >> 14;
        v19 >>= 7;
      }
      while (v21);
    }
    std::string::push_back(v18, v20);
  }
  return v17;
}

std::string *google::protobuf::internal::UnknownFieldLiteParserHelper::AddFixed32(std::string *this, int a2, int a3)
{
  int v3 = (std::string *)this->__r_.__value_.__r.__words[0];
  if (this->__r_.__value_.__r.__words[0])
  {
    int v5 = (std::string **)this;
    unint64_t v6 = (8 * a2) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 5;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        unint64_t v7 = v6 >> 7;
        unint64_t v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    *(_DWORD *)__s = a3;
    return std::string::append(*v5, __s, 4uLL);
  }
  return this;
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::AppendString(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  if (*(void *)(a1 + 8) - (void)__s + 16 >= a3)
  {
    uint64_t v6 = a3;
    std::string::append(this, __s, a3);
    return (google::protobuf::internal::EpsCopyInputStream *)&__s[v6];
  }
  else
  {
    return google::protobuf::internal::EpsCopyInputStream::AppendStringFallback(a1, __s, a3, this);
  }
}

void google::protobuf::RepeatedField<BOOL>::Reserve(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  if (v6)
  {
    unint64_t v11 = (v9 + 15) & 0x1FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v11);
    }
    AlignedNoHook = (void *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v11);
  }
  else
  {
    AlignedNoHook = operator new(v9 + 8);
  }
  void *AlignedNoHook = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    BOOL v13 = (void *)google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1);
    memcpy(v13, v5 + 1, *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_25BFEBDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    int v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_25BFEBEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::Mutable(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) + a2;
}

void sub_25BFEBF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::Get(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) + a2;
}

void sub_25BFEC06C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::~RepeatedField(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = google::protobuf::RepeatedField<BOOL>::elements(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<BOOL>::elements(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(void *)(a1 + 8);
}

void sub_25BFEC14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<BOOL>::MergeFrom(int *a1, int *a2)
{
  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    int v5 = *a1;
    google::protobuf::RepeatedField<BOOL>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<BOOL>::AddNAlreadyReserved((uint64_t)a1, *a2);
    uint64_t v6 = (void *)google::protobuf::RepeatedField<BOOL>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    unint64_t v8 = (const void *)google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a2);
    memcpy(v6, v8, *a2);
  }
}

void sub_25BFEC270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<int>::Reserve(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 4 * v9;
  if (v6)
  {
    unint64_t v12 = (v11 + 15) & 0x7FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    AlignedNoHook = (void *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  void *AlignedNoHook = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<int>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)google::protobuf::RepeatedField<int>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_25BFEC44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    int v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_25BFEC50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::Mutable(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_25BFEC5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::Get(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_25BFEC6C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::~RepeatedField(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = google::protobuf::RepeatedField<int>::elements(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<int>::elements(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(void *)(a1 + 8);
}

void sub_25BFEC7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<int>::MergeFrom(int *a1, int *a2)
{
  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    int v5 = *a1;
    google::protobuf::RepeatedField<int>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<int>::AddNAlreadyReserved((uint64_t)a1, *a2);
    uint64_t v6 = (void *)google::protobuf::RepeatedField<int>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    unint64_t v8 = (const void *)google::protobuf::RepeatedField<int>::elements((uint64_t)a2);
    memcpy(v6, v8, 4 * *a2);
  }
}

void sub_25BFEC8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned int>::Reserve(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 4 * v9;
  if (v6)
  {
    unint64_t v12 = (v11 + 15) & 0x7FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    AlignedNoHook = (void *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  void *AlignedNoHook = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_25BFECAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    int v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_25BFECB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::Mutable(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_25BFECC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::Get(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_25BFECD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::~RepeatedField(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = google::protobuf::RepeatedField<unsigned int>::elements(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<unsigned int>::elements(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(void *)(a1 + 8);
}

void sub_25BFECE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned int>::MergeFrom(int *a1, int *a2)
{
  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    int v5 = *a1;
    google::protobuf::RepeatedField<unsigned int>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved((uint64_t)a1, *a2);
    uint64_t v6 = (void *)google::protobuf::RepeatedField<unsigned int>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    unint64_t v8 = (const void *)google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a2);
    memcpy(v6, v8, 4 * *a2);
  }
}

void sub_25BFECF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<long long>::Reserve(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 8 * v9;
  if (v6)
  {
    unint64_t v12 = (v11 + 15) & 0xFFFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    AlignedNoHook = (void *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  void *AlignedNoHook = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<long long>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)google::protobuf::RepeatedField<long long>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_25BFED104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    int v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_25BFED1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::Mutable(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_25BFED29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::Get(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_25BFED37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::~RepeatedField(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = google::protobuf::RepeatedField<long long>::elements(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<long long>::elements(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(void *)(a1 + 8);
}

void sub_25BFED45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<long long>::MergeFrom(int *a1, int *a2)
{
  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    int v5 = *a1;
    google::protobuf::RepeatedField<long long>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<long long>::AddNAlreadyReserved((uint64_t)a1, *a2);
    uint64_t v6 = (void *)google::protobuf::RepeatedField<long long>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    unint64_t v8 = (const void *)google::protobuf::RepeatedField<long long>::elements((uint64_t)a2);
    memcpy(v6, v8, 8 * *a2);
  }
}

void sub_25BFED584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned long long>::Reserve(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 8 * v9;
  if (v6)
  {
    unint64_t v12 = (v11 + 15) & 0xFFFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    AlignedNoHook = (void *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  void *AlignedNoHook = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_25BFED760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    int v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_25BFED820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::Mutable(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_25BFED8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::Get(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_25BFED9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::~RepeatedField(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = google::protobuf::RepeatedField<unsigned long long>::elements(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::elements(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(void *)(a1 + 8);
}

void sub_25BFEDAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned long long>::MergeFrom(int *a1, int *a2)
{
  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    int v5 = *a1;
    google::protobuf::RepeatedField<unsigned long long>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved((uint64_t)a1, *a2);
    uint64_t v6 = (void *)google::protobuf::RepeatedField<unsigned long long>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    unint64_t v8 = (const void *)google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a2);
    memcpy(v6, v8, 8 * *a2);
  }
}

void sub_25BFEDBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<float>::Reserve(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 4 * v9;
  if (v6)
  {
    unint64_t v12 = (v11 + 15) & 0x7FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    AlignedNoHook = (void *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  void *AlignedNoHook = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<float>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)google::protobuf::RepeatedField<float>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_25BFEDDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    int v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_25BFEDE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::Mutable(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<float>::elements((uint64_t)a1) + 4 * a2;
}

void sub_25BFEDF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::Get(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<float>::elements((uint64_t)a1) + 4 * a2;
}

void sub_25BFEE034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::~RepeatedField(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = google::protobuf::RepeatedField<float>::elements(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<float>::elements(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(void *)(a1 + 8);
}

void sub_25BFEE114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<float>::MergeFrom(int *a1, int *a2)
{
  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    int v5 = *a1;
    google::protobuf::RepeatedField<float>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<float>::AddNAlreadyReserved((uint64_t)a1, *a2);
    uint64_t v6 = (void *)google::protobuf::RepeatedField<float>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    unint64_t v8 = (const void *)google::protobuf::RepeatedField<float>::elements((uint64_t)a2);
    memcpy(v6, v8, 4 * *a2);
  }
}

void sub_25BFEE23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<double>::Reserve(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 8 * v9;
  if (v6)
  {
    unint64_t v12 = (v11 + 15) & 0xFFFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    AlignedNoHook = (void *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  void *AlignedNoHook = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<double>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)google::protobuf::RepeatedField<double>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_25BFEE418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    int v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    unint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_25BFEE4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::Mutable(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<double>::elements((uint64_t)a1) + 8 * a2;
}

void sub_25BFEE5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::Get(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<double>::elements((uint64_t)a1) + 8 * a2;
}

void sub_25BFEE690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::~RepeatedField(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = google::protobuf::RepeatedField<double>::elements(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<double>::elements(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(void *)(a1 + 8);
}

void sub_25BFEE770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<double>::MergeFrom(int *a1, int *a2)
{
  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    int v5 = *a1;
    google::protobuf::RepeatedField<double>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<double>::AddNAlreadyReserved((uint64_t)a1, *a2);
    uint64_t v6 = (void *)google::protobuf::RepeatedField<double>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    unint64_t v8 = (const void *)google::protobuf::RepeatedField<double>::elements((uint64_t)a2);
    memcpy(v6, v8, 8 * *a2);
  }
}

void sub_25BFEE898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedPtrField<std::string>::~RepeatedPtrField(google::protobuf::internal::ArenaImpl **a1)
{
  google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(a1);

  google::protobuf::internal::RepeatedPtrFieldBase::~RepeatedPtrFieldBase(a1);
}

void google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(void *a1)
{
  uint64_t v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    int v3 = (uint64_t *)(v2 + 2);
    uint64_t v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        uint64_t v5 = *v3;
        if (*v3)
        {
          if (*(char *)(v5 + 23) < 0) {
            operator delete(*(void **)v5);
          }
          MEMORY[0x26117ABD0](v5, 0x1012C40EC159624);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::Reserve(unsigned int *this, int a2)
{
  unsigned int v2 = this[2];
  BOOL v3 = __OFSUB__(a2, v2);
  int v4 = a2 - v2;
  if (!((v4 < 0) ^ v3 | (v4 == 0))) {
    return google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)this, v4);
  }
  return this;
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend(google::protobuf::internal::RepeatedPtrFieldBase *this, int a2)
{
  int v2 = *((_DWORD *)this + 2);
  int v3 = *((_DWORD *)this + 3);
  int v4 = v2 + a2;
  uint64_t v5 = (unsigned int *)*((void *)this + 2);
  if (v3 < v2 + a2)
  {
    uint64_t v7 = *(void *)this;
    int v8 = 2 * v3;
    if (2 * v3 <= v4) {
      int v8 = v4;
    }
    if (v8 <= 4) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = v8;
    }
    uint64_t v10 = 8 * v9;
    if (v7)
    {
      unint64_t v11 = (v10 + 15) & 0x7FFFFFFF8;
      if (*(unsigned char *)(v7 + 24)) {
        (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v7 + 32) + 32) + 40))(*(void *)(*(void *)(v7 + 32) + 32), MEMORY[0x263F8C238], v11);
      }
      AlignedNoHook = (unsigned int *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v7, v11);
    }
    else
    {
      AlignedNoHook = (unsigned int *)operator new(v10 + 8);
    }
    *((void *)this + 2) = AlignedNoHook;
    *((_DWORD *)this + 3) = v9;
    if (v5 && (uint64_t v13 = *v5, (int)v13 >= 1))
    {
      memcpy(AlignedNoHook + 2, v5 + 2, 8 * v13);
      AlignedNoHook = (unsigned int *)*((void *)this + 2);
      unsigned int *AlignedNoHook = *v5;
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      unsigned int *AlignedNoHook = 0;
      if (!v7)
      {
LABEL_17:
        operator delete(v5);
        AlignedNoHook = (unsigned int *)*((void *)this + 2);
      }
    }
    int v2 = *((_DWORD *)this + 2);
    uint64_t v5 = AlignedNoHook;
  }
  return &v5[2 * v2 + 2];
}

uint64_t sentencepiece::MemoryMappedModelProto::MemoryMappedModelProto(uint64_t a1, _DWORD *a2, unint64_t a3)
{
  *(void *)a1 = &unk_2709727F0;
  *(void *)(a1 + 16) = &unk_270972C48;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = &unk_270972C48;
  *(_DWORD *)(a1 + 40) = 0;
  uint64_t v6 = (uint64_t *)(a1 + 88);
  sentencepiece::util::Status::Status((void *)(a1 + 88));
  sentencepiece::MemoryMappedModelProto::Init(a1, a2, a3, (sentencepiece::util::Status *)&v8);
  sentencepiece::util::Status::operator=(v6, &v8);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v8);
  return a1;
}

void sub_25BFEEB9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)va);
  sentencepiece::util::Status::~Status(v2);
  _Unwind_Resume(a1);
}

void *sentencepiece::MemoryMappedModelProto::Init@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, unint64_t a3@<X2>, sentencepiece::util::Status *a4@<X8>)
{
  uint64_t v13 = a2;
  unint64_t v14 = a3;
  int v12 = 0;
  uint64_t result = sentencepiece::mmap_util::DecodePrefix<unsigned int>(a2, a3, &v12, a4);
  if (!*(void *)a4)
  {
    sentencepiece::util::Status::~Status(a4);
    uint64_t result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
    if (!*(void *)a4)
    {
      sentencepiece::util::Status::~Status(a4);
      *(_DWORD *)(a1 + 8) = v12;
      int v11 = 0;
      uint64_t result = sentencepiece::mmap_util::DecodePrefix<unsigned int>(v13, v14, &v11, a4);
      if (!*(void *)a4)
      {
        sentencepiece::util::Status::~Status(a4);
        uint64_t result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
        if (!*(void *)a4)
        {
          sentencepiece::util::Status::~Status(a4);
          *(_DWORD *)(a1 + 24) = v11;
          int v10 = 0;
          uint64_t result = sentencepiece::mmap_util::DecodePrefix<unsigned int>(v13, v14, &v10, a4);
          if (!*(void *)a4)
          {
            sentencepiece::util::Status::~Status(a4);
            uint64_t result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
            if (!*(void *)a4)
            {
              sentencepiece::util::Status::~Status(a4);
              int v7 = v10;
              *(_DWORD *)(a1 + 48) = 0;
              *(_DWORD *)(a1 + 40) = v7;
              uint64_t result = sentencepiece::mmap_util::DecodePrefix<int>(v13, v14, (_DWORD *)(a1 + 48), a4);
              if (!*(void *)a4)
              {
                sentencepiece::util::Status::~Status(a4);
                uint64_t result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
                if (!*(void *)a4)
                {
                  sentencepiece::util::Status::~Status(a4);
                  *(void *)(a1 + 56) = v13;
                  unint64_t v8 = sentencepiece::mmap_util::RoundUp((sentencepiece::mmap_util *)*(int *)(a1 + 48), 4uLL);
                  uint64_t result = sentencepiece::mmap_util::RemovePrefix(&v13, v8, a4);
                  if (!*(void *)a4)
                  {
                    sentencepiece::util::Status::~Status(a4);
                    *(void *)(a1 + 64) = v13;
                    uint64_t result = sentencepiece::mmap_util::RemovePrefix(&v13, 4 * *(int *)(a1 + 48), a4);
                    if (!*(void *)a4)
                    {
                      sentencepiece::util::Status::~Status(a4);
                      *(void *)(a1 + 72) = v13;
                      uint64_t result = sentencepiece::mmap_util::RemovePrefix(&v13, 4 * *(int *)(a1 + 48) + 20, a4);
                      if (!*(void *)a4)
                      {
                        sentencepiece::util::Status::~Status(a4);
                        *(void *)(a1 + 80) = v13;
                        return sentencepiece::util::Status::Status(v9);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sentencepiece::MemoryMappedNormalizerSpec::~MemoryMappedNormalizerSpec(sentencepiece::MemoryMappedNormalizerSpec *this)
{
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::add_dummy_prefix(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return *((_DWORD *)this + 2) & 1;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::remove_extra_whitespaces(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return (*((unsigned __int8 *)this + 8) >> 1) & 1;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::escape_whitespaces(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return (*((unsigned __int8 *)this + 8) >> 2) & 1;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::add_suffix_space(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return (*((unsigned __int8 *)this + 8) >> 3) & 1;
}

void sentencepiece::MemoryMappedModelProto::~MemoryMappedModelProto(sentencepiece::MemoryMappedModelProto *this)
{
  *(void *)this = &unk_2709727F0;
  sentencepiece::util::Status::~Status((sentencepiece::MemoryMappedModelProto *)((char *)this + 88));
}

{
  uint64_t vars8;

  *(void *)this = &unk_2709727F0;
  sentencepiece::util::Status::~Status((sentencepiece::MemoryMappedModelProto *)((char *)this + 88));

  JUMPOUT(0x26117ABD0);
}

uint64_t sentencepiece::MemoryMappedModelProto::PieceSize(sentencepiece::MemoryMappedModelProto *this)
{
  return *((unsigned int *)this + 12);
}

const char *sentencepiece::MemoryMappedModelProto::UnkSurface(sentencepiece::MemoryMappedModelProto *this)
{
  uint64_t v1 = (const char *)(*((void *)this + 10) + **((unsigned int **)this + 9));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::UnkPiece(sentencepiece::MemoryMappedModelProto *this)
{
  uint64_t v1 = (const char *)(*((void *)this + 10) + *(unsigned int *)(*((void *)this + 9) + 4));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::BosPiece(sentencepiece::MemoryMappedModelProto *this)
{
  uint64_t v1 = (const char *)(*((void *)this + 10) + *(unsigned int *)(*((void *)this + 9) + 8));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::EosPiece(sentencepiece::MemoryMappedModelProto *this)
{
  uint64_t v1 = (const char *)(*((void *)this + 10) + *(unsigned int *)(*((void *)this + 9) + 12));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::PadPiece(sentencepiece::MemoryMappedModelProto *this)
{
  uint64_t v1 = (const char *)(*((void *)this + 10) + *(unsigned int *)(*((void *)this + 9) + 16));
  strlen(v1);
  return v1;
}

uint64_t sentencepiece::MemoryMappedModelProto::ByteFallback(sentencepiece::MemoryMappedModelProto *this)
{
  return *((_DWORD *)this + 2) & 1;
}

uint64_t sentencepiece::MemoryMappedModelProto::HasUnkSurface(sentencepiece::MemoryMappedModelProto *this)
{
  return (*((unsigned __int8 *)this + 8) >> 1) & 1;
}

uint64_t sentencepiece::MemoryMappedModelProto::GetModelType(sentencepiece::MemoryMappedModelProto *this)
{
  return *((_DWORD *)this + 2) >> 30;
}

const char *sentencepiece::MemoryMappedModelProto::IdToPiece(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  int v2 = (const char *)(*((void *)this + 10) + *(unsigned int *)(*((void *)this + 9) + 4 * (a2 + 5)));
  strlen(v2);
  return v2;
}

float sentencepiece::MemoryMappedModelProto::GetScore(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(float *)(*((void *)this + 8) + 4 * a2);
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsNormal(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(unsigned char *)(*((void *)this + 7) + a2) == 1;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsUnknown(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(unsigned char *)(*((void *)this + 7) + a2) == 2;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsControl(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(unsigned char *)(*((void *)this + 7) + a2) == 3;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsUnused(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(unsigned char *)(*((void *)this + 7) + a2) == 4;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsUserDefined(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(unsigned char *)(*((void *)this + 7) + a2) == 5;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsByte(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(unsigned char *)(*((void *)this + 7) + a2) == 6;
}

uint64_t sentencepiece::MemoryMappedModelProto::NormalizerSpec(sentencepiece::MemoryMappedModelProto *this)
{
  return (uint64_t)this + 16;
}

uint64_t sentencepiece::MemoryMappedModelProto::DenormalizerSpec(sentencepiece::MemoryMappedModelProto *this)
{
  return (uint64_t)this + 32;
}

void anonymous namespace'::tensorViewCHW()
{
  __assert_rtn("tensorViewCHW", "SCMLImageAnalyzer.mm", 499, "buf->batch_number == 1");
}

{
  __assert_rtn("tensorViewCHW", "SCMLImageAnalyzer.mm", 498, "buf->sequence_length == 1");
}

uint64_t ik::core::E5BufferStorage::E5BufferStorage(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void anonymous namespace'::resolveBackends()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BF41000, v0, v1, "ImageSanitizerStructuralIntegrity on", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BF41000, v0, v1, "ImageSanitizerStructuralIntegrity off", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BF41000, v0, v1, "ImageSanitizerASM on", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BF41000, v0, v1, "ImageSanitizerASM off", v2, v3, v4, v5, v6);
}

uint64_t ___ZL32getVCPImageEmbeddingRequestClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[SCMLImageModelThresholds _createThresholdDictionaryWithError:](v0);
}

void scaledPixelBuffer32BGRAFromCGImage_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_25BF41000, a2, OS_LOG_TYPE_ERROR, "Error converting CGImage to CVPixelBuffer: failed to create pixel buffer %d", (uint8_t *)v2, 8u);
}

void scaledPixelBuffer32BGRAFromCGImage_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_25BF41000, log, OS_LOG_TYPE_ERROR, "Error converting CGImage to CVPixelBuffer: failed to create context", v1, 2u);
}

void scaledPixelBuffer32BGRAFromCGImage_cold_3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_25BF41000, a2, OS_LOG_TYPE_ERROR, "Error converting CGImage to CVPixelBuffer: failed to lock pixel buffer %d", (uint8_t *)v2, 8u);
}

void saveCGImageToPng_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void saveCGImageToPng_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void saveCVPixelBufferToPng_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_25BFEFCC0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25BFEFCD0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25BFEFCE0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25BFEFCF0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25BFEFD00()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25BFEFD10()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25BFEFD20()
{
  return MEMORY[0x270EEE170]();
}

uint64_t sub_25BFEFD30()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_25BFEFD40()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_25BFEFD50()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25BFEFD60()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_25BFEFD70()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25BFEFD80()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25BFEFD90()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25BFEFDA0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25BFEFDB0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25BFEFDC0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25BFEFDD0()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_25BFEFDE0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25BFEFDF0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25BFEFE00()
{
  return MEMORY[0x270F4B8B8]();
}

uint64_t sub_25BFEFE10()
{
  return MEMORY[0x270F4BAD8]();
}

uint64_t sub_25BFEFE20()
{
  return MEMORY[0x270F4BB08]();
}

uint64_t sub_25BFEFE30()
{
  return MEMORY[0x270F4BBA0]();
}

uint64_t sub_25BFEFE40()
{
  return MEMORY[0x270F4BCD8]();
}

uint64_t sub_25BFEFE50()
{
  return MEMORY[0x270F7EBD8]();
}

uint64_t sub_25BFEFE70()
{
  return MEMORY[0x270F7EBE8]();
}

uint64_t sub_25BFEFE80()
{
  return MEMORY[0x270F7EBF0]();
}

uint64_t sub_25BFEFE90()
{
  return MEMORY[0x270F7EC08]();
}

uint64_t sub_25BFEFEA0()
{
  return MEMORY[0x270F7EC48]();
}

uint64_t sub_25BFEFEB0()
{
  return MEMORY[0x270F7EC50]();
}

uint64_t sub_25BFEFEC0()
{
  return MEMORY[0x270F7EC60]();
}

uint64_t sub_25BFEFED0()
{
  return MEMORY[0x270F7EC78]();
}

uint64_t sub_25BFEFEE0()
{
  return MEMORY[0x270F7EE50]();
}

uint64_t sub_25BFEFEF0()
{
  return MEMORY[0x270F7EE70]();
}

uint64_t sub_25BFEFF00()
{
  return MEMORY[0x270F7EE90]();
}

uint64_t sub_25BFEFF10()
{
  return MEMORY[0x270F7EEB0]();
}

uint64_t sub_25BFEFF20()
{
  return MEMORY[0x270F7EEE8]();
}

uint64_t sub_25BFEFF30()
{
  return MEMORY[0x270F7EF00]();
}

uint64_t sub_25BFEFF40()
{
  return MEMORY[0x270F7EF18]();
}

uint64_t sub_25BFEFF50()
{
  return MEMORY[0x270F7EF88]();
}

uint64_t sub_25BFEFF60()
{
  return MEMORY[0x270F7EF90]();
}

uint64_t sub_25BFEFF70()
{
  return MEMORY[0x270F7EFE8]();
}

uint64_t sub_25BFEFF80()
{
  return MEMORY[0x270F7F5E0]();
}

uint64_t sub_25BFEFF90()
{
  return MEMORY[0x270F7F5E8]();
}

uint64_t sub_25BFEFFB0()
{
  return MEMORY[0x270F7F2C0]();
}

uint64_t sub_25BFEFFC0()
{
  return MEMORY[0x270FA2A70]();
}

uint64_t sub_25BFEFFD0()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_25BFEFFE0()
{
  return MEMORY[0x270F2EE18]();
}

uint64_t sub_25BFEFFF0()
{
  return MEMORY[0x270F2EE20]();
}

uint64_t sub_25BFF0000()
{
  return MEMORY[0x270F2EE30]();
}

uint64_t sub_25BFF0010()
{
  return MEMORY[0x270F2EE60]();
}

uint64_t sub_25BFF0040()
{
  return MEMORY[0x270F4C1D0]();
}

uint64_t sub_25BFF0050()
{
  return MEMORY[0x270F4C1F8]();
}

uint64_t sub_25BFF0060()
{
  return MEMORY[0x270F4C210]();
}

uint64_t sub_25BFF0080()
{
  return MEMORY[0x270F4C2B0]();
}

uint64_t sub_25BFF00C0()
{
  return MEMORY[0x270F4C3C0]();
}

uint64_t sub_25BFF00D0()
{
  return MEMORY[0x270F4C3C8]();
}

uint64_t sub_25BFF00E0()
{
  return MEMORY[0x270F4C3D8]();
}

uint64_t sub_25BFF00F0()
{
  return MEMORY[0x270F4C3E8]();
}

uint64_t sub_25BFF0100()
{
  return MEMORY[0x270F4C408]();
}

uint64_t sub_25BFF0110()
{
  return MEMORY[0x270F2FED0]();
}

uint64_t sub_25BFF0120()
{
  return MEMORY[0x270F2FEF8]();
}

uint64_t sub_25BFF0130()
{
  return MEMORY[0x270F2F2A8]();
}

uint64_t sub_25BFF0140()
{
  return MEMORY[0x270F2F2D0]();
}

uint64_t sub_25BFF0150()
{
  return MEMORY[0x270F2F2E0]();
}

uint64_t sub_25BFF0160()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25BFF0170()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_25BFF0180()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25BFF0190()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_25BFF01A0()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_25BFF01B0()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_25BFF01C0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25BFF01D0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25BFF01E0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25BFF01F0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25BFF0200()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25BFF0210()
{
  return MEMORY[0x270F580E8]();
}

uint64_t sub_25BFF0220()
{
  return MEMORY[0x270F580F0]();
}

uint64_t sub_25BFF0230()
{
  return MEMORY[0x270F58100]();
}

uint64_t sub_25BFF0240()
{
  return MEMORY[0x270F58108]();
}

uint64_t sub_25BFF0250()
{
  return MEMORY[0x270F58128]();
}

uint64_t sub_25BFF0260()
{
  return MEMORY[0x270F58130]();
}

uint64_t sub_25BFF0270()
{
  return MEMORY[0x270F582E8]();
}

uint64_t sub_25BFF0280()
{
  return MEMORY[0x270F30050]();
}

uint64_t sub_25BFF0290()
{
  return MEMORY[0x270F2F510]();
}

uint64_t sub_25BFF02A0()
{
  return MEMORY[0x270F7F328]();
}

uint64_t sub_25BFF02B0()
{
  return MEMORY[0x270F2EEF8]();
}

uint64_t sub_25BFF02C0()
{
  return MEMORY[0x270F583D0]();
}

uint64_t sub_25BFF02D0()
{
  return MEMORY[0x270F58408]();
}

uint64_t sub_25BFF02E0()
{
  return MEMORY[0x270F58410]();
}

uint64_t sub_25BFF02F0()
{
  return MEMORY[0x270F7F348]();
}

uint64_t sub_25BFF0300()
{
  return MEMORY[0x270F58420]();
}

uint64_t sub_25BFF0310()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25BFF0320()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25BFF0330()
{
  return MEMORY[0x270F9D3C0]();
}

uint64_t sub_25BFF0340()
{
  return MEMORY[0x270F9D4A0]();
}

uint64_t sub_25BFF0350()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t sub_25BFF0360()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t sub_25BFF0370()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25BFF0380()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25BFF0390()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25BFF03A0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25BFF03B0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25BFF03C0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25BFF03D0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25BFF03E0()
{
  return MEMORY[0x270F9D678]();
}

uint64_t sub_25BFF03F0()
{
  return MEMORY[0x270F9D680]();
}

uint64_t sub_25BFF0400()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25BFF0410()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25BFF0420()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25BFF0430()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_25BFF0440()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25BFF0450()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25BFF0460()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_25BFF0470()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25BFF0480()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_25BFF0490()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25BFF04A0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25BFF04B0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25BFF04C0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25BFF04D0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25BFF04E0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25BFF04F0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25BFF0500()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25BFF0510()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25BFF0520()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25BFF0530()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25BFF0540()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25BFF0550()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25BFF0560()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25BFF0570()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25BFF0580()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25BFF0590()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25BFF05A0()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_25BFF05B0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25BFF05C0()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25BFF05D0()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25BFF05E0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25BFF05F0()
{
  return MEMORY[0x270F9E468]();
}

uint64_t sub_25BFF0600()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_25BFF0610()
{
  return MEMORY[0x270F9E4B8]();
}

uint64_t sub_25BFF0620()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_25BFF0630()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_25BFF0640()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25BFF0650()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25BFF0660()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_25BFF0670()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25BFF0680()
{
  return MEMORY[0x270EF2548]();
}

uint64_t sub_25BFF0690()
{
  return MEMORY[0x270EF2598]();
}

uint64_t sub_25BFF06A0()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_25BFF06B0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25BFF06C0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25BFF06D0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25BFF06F0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25BFF0700()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25BFF0710()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25BFF0720()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25BFF0730()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25BFF0740()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25BFF0750()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25BFF0760()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25BFF0770()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25BFF0780()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25BFF0790()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25BFF07A0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25BFF07B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25BFF07C0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25BFF07D0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25BFF07E0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25BFF07F0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25BFF0800()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25BFF0810()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25BFF0820()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25BFF0830()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25BFF0840()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25BFF0850()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25BFF0860()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25BFF0870()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_25BFF0880()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25BFF0890()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25BFF08A0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25BFF08B0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25BFF08C0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25BFF08D0()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_25BFF08E0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25BFF08F0()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_25BFF0900()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25BFF0910()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25BFF0920()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25BFF0930()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25BFF0940()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25BFF0970()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25BFF0980()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25BFF0990()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25BFF09A0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25BFF09B0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25BFF09C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25BFF09D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25BFF09E0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25BFF09F0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25BFF0A00()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25BFF0A10()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25BFF0A20()
{
  return MEMORY[0x270F9FD98]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x270EE7C58](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x270EE7DE0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1D0](pixelBuffer);
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

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x270F46EF0]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x270F46EF8]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x270F46F50]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x270F46F70]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x270F96018]();
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x270F06678](pixelBuffer, options, imageOut);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
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

uint64_t language_modeling::v1::LinguisticContext::push_back()
{
  return MEMORY[0x270F46CA8]();
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  return MEMORY[0x270F46CC0](this);
}

void language_modeling::v1::LinguisticContext::~LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
}

uint64_t E5RT::E5Compiler::GetCompiler(E5RT::E5Compiler *this)
{
  return MEMORY[0x270F277E8](this);
}

uint64_t E5RT::E5Compiler::Compile()
{
  return MEMORY[0x270F27800]();
}

uint64_t E5RT::BufferObject::AllocMemory()
{
  return MEMORY[0x270F27808]();
}

uint64_t E5RT::SurfaceObject::CreateSurfaceFromHandle<__IOSurface *>()
{
  return MEMORY[0x270F27838]();
}

uint64_t E5RT::ProgramLibrary::GetExportedFunctions(E5RT::ProgramLibrary *this)
{
  return MEMORY[0x270F27860](this);
}

void E5RT::TensorDataType::~TensorDataType(E5RT::TensorDataType *this)
{
}

uint64_t E5RT::ExecutionStream::EncodeOperation()
{
  return MEMORY[0x270F27888]();
}

uint64_t E5RT::ExecutionStream::ExecuteStreamSync(E5RT::ExecutionStream *this)
{
  return MEMORY[0x270F27898](this);
}

uint64_t E5RT::ExecutionStream::CreateExecutionStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x270F278A0](this);
}

uint64_t E5RT::ComputeGPUDevice::GetComputeGPUDeviceForMTLDevice()
{
  return MEMORY[0x270F278B0]();
}

uint64_t E5RT::E5CompilerOptions::SetForceRecompilation(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x270F278C8](this);
}

uint64_t E5RT::E5CompilerOptions::SetPreferredCpuBackends()
{
  return MEMORY[0x270F278D0]();
}

uint64_t E5RT::E5CompilerOptions::SetComputeDeviceTypesAllowed()
{
  return MEMORY[0x270F278E0]();
}

uint64_t E5RT::E5CompilerOptions::Create(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x270F27900](this);
}

uint64_t E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp()
{
  return MEMORY[0x270F27940]();
}

{
  return MEMORY[0x270F27948]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::SetOperationName()
{
  return MEMORY[0x270F27960]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::SetOverrideComputeGPUDevice()
{
  return MEMORY[0x270F27970]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::Create()
{
  return MEMORY[0x270F27990]();
}

uint64_t E5RT::IOPort::BindMemoryObject()
{
  return MEMORY[0x270F279A8]();
}

uint64_t language_modeling::v1::LinguisticContext::tokenSpan(language_modeling::v1::LinguisticContext *this)
{
  return MEMORY[0x270F46D28](this);
}

uint64_t E5RT::TensorDataType::GetComponentSize(E5RT::TensorDataType *this)
{
  return MEMORY[0x270F27A00](this);
}

uint64_t E5RT::TensorDataType::GetComponentDataType(E5RT::TensorDataType *this)
{
  return MEMORY[0x270F27A10](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorShape(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x270F27A28](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorDataType(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x270F27A38](this);
}

uint64_t E5RT::OperandDescriptor::TensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x270F27A58](this);
}

uint64_t E5RT::OperandDescriptor::SurfaceDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x270F27A60](this);
}

uint64_t E5RT::OperandDescriptor::TryAsTensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x270F27A68](this);
}

uint64_t E5RT::OperandDescriptor::TryAsSurfaceDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x270F27A70](this);
}

uint64_t E5RT::SurfaceDescriptor::GetSurfaceWidth(E5RT::SurfaceDescriptor *this)
{
  return MEMORY[0x270F27A78](this);
}

uint64_t E5RT::SurfaceDescriptor::GetSurfaceFormat(E5RT::SurfaceDescriptor *this)
{
  return MEMORY[0x270F27A80](this);
}

uint64_t E5RT::SurfaceDescriptor::GetSurfaceHeight(E5RT::SurfaceDescriptor *this)
{
  return MEMORY[0x270F27A88](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x270F27A98](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x270F27AA0](this);
}

uint64_t E5RT::IOPort::GetPortDescriptor(E5RT::IOPort *this)
{
  return MEMORY[0x270F27AB8](this);
}

uint64_t E5RT::IOPort::GetPortDescriptorRef(E5RT::IOPort *this)
{
  return MEMORY[0x270F27AC0](this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x270F98200](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  CFIndex v1 = (const std::string_view::value_type *)MEMORY[0x270F98288](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  CFIndex v1 = (const std::string_view::value_type *)MEMORY[0x270F98298](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  CFIndex v1 = (const std::string_view::value_type *)MEMORY[0x270F982A0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__stem(const std::__fs::filesystem::path *this)
{
  CFIndex v1 = (const std::string_view::value_type *)MEMORY[0x270F982C8](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x270F983C8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983C0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

{
  MEMORY[0x270F983E8](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
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

uint64_t std::istream::read()
{
  return MEMORY[0x270F98678]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986F0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
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
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x270F98838](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x270F98848](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
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

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
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

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p, std::align_val_t a2)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x270F98F00](a1);
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t c_network_get_input_names()
{
  return MEMORY[0x270F27AD0]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_device_id_for_metal_device()
{
  return MEMORY[0x270F27F30]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x270F27F98]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x270F28030]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x270F280A8]();
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

long double expm1(long double __x)
{
  MEMORY[0x270ED9878](__x);
  return result;
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float log1pf(float a1)
{
  MEMORY[0x270EDA0C8](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x270EDA848](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

uint64_t pc_session_add_metric()
{
  return MEMORY[0x270F9ABA0]();
}

uint64_t pc_session_begin()
{
  return MEMORY[0x270F9ABA8]();
}

uint64_t pc_session_create()
{
  return MEMORY[0x270F9ABB0]();
}

uint64_t pc_session_destroy()
{
  return MEMORY[0x270F9ABC0]();
}

uint64_t pc_session_end()
{
  return MEMORY[0x270F9ABC8]();
}

uint64_t pc_session_get_value()
{
  return MEMORY[0x270F9ABD8]();
}

uint64_t pc_session_set_procpid()
{
  return MEMORY[0x270F9ABE8]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}
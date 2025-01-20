uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  int v1;

  v1 = *((_DWORD *)this + 10);
  if (v1 == 0x7FFFFFFF) {
    return 0xFFFFFFFFLL;
  }
  else {
    return (v1
  }
                        - *((_DWORD *)this + 6)
                        + *((_DWORD *)this + 11)
                        + *((_DWORD *)this + 4)
                        - *((_DWORD *)this + 2));
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::ByteCount(wireless_diagnostics::google::protobuf::io::FileInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32));
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(uint64_t this, int a2)
{
  *(_DWORD *)(this + 40) = a2;
  int v2 = *(_DWORD *)(this + 48);
  uint64_t v3 = *(void *)(this + 16) + *(int *)(this + 44);
  *(void *)(this + 16) = v3;
  if (v2 >= a2) {
    int v4 = a2;
  }
  else {
    int v4 = v2;
  }
  int v5 = *(_DWORD *)(this + 24);
  BOOL v6 = __OFSUB__(v5, v4);
  int v7 = v5 - v4;
  if ((v7 < 0) ^ v6 | (v7 == 0)) {
    int v7 = 0;
  }
  else {
    *(void *)(this + 16) = v3 - v7;
  }
  *(_DWORD *)(this + 44) = v7;
  *(unsigned char *)(this + 36) = 0;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::ByteCount(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  return *((void *)this + 3) - *((int *)this + 12);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  int v2 = *((_DWORD *)this + 6);
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = *((unsigned int *)this + 10);
  uint64_t v5 = *((int *)this + 11);
  int v6 = v2 - v5 + *((_DWORD *)this + 2) - v3;
  BOOL v7 = (v6 ^ 0x7FFFFFFF) < a2 || a2 < 0;
  int v8 = v6 + a2;
  if (v7) {
    int v8 = 0x7FFFFFFF;
  }
  if ((int)v4 < v8) {
    int v8 = *((_DWORD *)this + 10);
  }
  *((_DWORD *)this + 10) = v8;
  uint64_t v9 = v3 + v5;
  *((void *)this + 2) = v9;
  if (*((_DWORD *)this + 12) < v8) {
    int v8 = *((_DWORD *)this + 12);
  }
  BOOL v10 = __OFSUB__(v2, v8);
  int v11 = v2 - v8;
  if ((v11 < 0) ^ v10 | (v11 == 0)) {
    int v11 = 0;
  }
  else {
    *((void *)this + 2) = v9 - v11;
  }
  *((_DWORD *)this + 11) = v11;
  return v4;
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString(uint64_t a1, std::string *this, std::string::size_type __n)
{
  if ((__n & 0x80000000) != 0) {
    return 0;
  }
  unsigned int v3 = __n;
  uint64_t v4 = this;
  if (*(_DWORD *)(a1 + 16) - *(_DWORD *)(a1 + 8) >= (int)__n)
  {
    std::string::resize(this, __n, 0);
    if (!v3) {
      return 1;
    }
    if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0)
    {
      if (!v4->__r_.__value_.__l.__size_)
      {
LABEL_13:
        uint64_t v4 = 0;
        goto LABEL_14;
      }
      uint64_t v4 = (std::string *)v4->__r_.__value_.__r.__words[0];
    }
    else if (!*((unsigned char *)&v4->__r_.__value_.__s + 23))
    {
      goto LABEL_13;
    }
LABEL_14:
    memcpy(v4, *(const void **)(a1 + 8), v3);
    *(void *)(a1 + 8) += v3;
    return 1;
  }

  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadStringFallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)a1, this, __n);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *a2)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5, a2);
  uint64_t v3 = wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToCodedStream(this, (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  return v3;
}

void sub_2135A653C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToCodedStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2)
{
  uint64_t v4 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 72))(this);
  uint64_t v5 = (wireless_diagnostics::google::protobuf::_anonymous_namespace_ *)v4;
  int v6 = *((_DWORD *)a2 + 4);
  int v7 = v6 - v4;
  if (v6 < (int)v4)
  {
LABEL_6:
    int v9 = *((_DWORD *)a2 + 5);
    (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *, wireless_diagnostics::google::protobuf::io::CodedOutputStream *))(*(void *)this + 80))(this, a2);
    if (*((unsigned char *)a2 + 24)) {
      return 0;
    }
    LODWORD(a2) = *((_DWORD *)a2 + 5) - *((_DWORD *)a2 + 4) + v6 - v9;
    if (a2 != v5) {
      goto LABEL_9;
    }
    return 1;
  }
  uint64_t v8 = *((void *)a2 + 1);
  *((void *)a2 + 1) = v8 + (int)v4;
  *((_DWORD *)a2 + 4) = v7;
  if (!v8)
  {
    int v6 = v7;
    goto LABEL_6;
  }
  a2 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, uint64_t))(*(void *)this + 88))(this, v8)- v8);
  if (a2 != (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(int)v5)
  {
LABEL_9:
    int v11 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 72))(this);
  }
  return 1;
}

void wireless_diagnostics::google::protobuf::io::FileOutputStream::~FileOutputStream(wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  *(void *)this = &unk_26C3F79C0;
  int v2 = (wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32);
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(v2);
  wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 8));

  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);
}

{
  uint64_t vars8;

  wireless_diagnostics::google::protobuf::io::FileOutputStream::~FileOutputStream(this);

  JUMPOUT(0x21668CE50);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  if (*((unsigned char *)this + 17)) {
    return 0;
  }
  if (!*((_DWORD *)this + 11)) {
    return 1;
  }
  if ((*(unsigned int (**)(void, void))(**((void **)this + 1) + 16))(*((void *)this + 1), *((void *)this + 4)))
  {
    *((void *)this + 3) += *((int *)this + 11);
    *((_DWORD *)this + 11) = 0;
    return 1;
  }
  *((unsigned char *)this + 17) = 1;
  *((_DWORD *)this + 11) = 0;
  uint64_t result = *((void *)this + 4);
  if (result)
  {
    MEMORY[0x21668CE30](result, 0x1000C8077774924);
    uint64_t result = 0;
    *((void *)this + 4) = 0;
  }
  return result;
}

void wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  *(void *)this = &unk_26C3F7CC8;
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this);
  if (*((unsigned char *)this + 16))
  {
    uint64_t v2 = *((void *)this + 1);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    MEMORY[0x21668CE30](v3, 0x1000C8077774924);
  }

  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);
}

{
  uint64_t vars8;

  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(this);

  JUMPOUT(0x21668CE50);
}

void wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream(wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this)
{
  *(void *)this = &unk_26C3F7998;
  if (*((unsigned char *)this + 12)
    && !wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close(this))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 216);
    uint64_t v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, "close() failed: ");
    uint64_t v3 = strerror(*((_DWORD *)this + 4));
    uint64_t v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, v3);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  wireless_diagnostics::google::protobuf::io::CopyingOutputStream::~CopyingOutputStream(this);
}

{
  uint64_t vars8;

  wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream(this);

  JUMPOUT(0x21668CE50);
}

BOOL wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Write(wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this, char *a2, int a3)
{
  if (*((unsigned char *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 238);
    int v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
  }
  if (a3 < 1) {
    return 1;
  }
  int v7 = 0;
  do
  {
    while (1)
    {
      int v8 = write(*((_DWORD *)this + 2), &a2[v7], a3 - v7);
      int v9 = v8;
      if (v8 < 0) {
        break;
      }
      BOOL result = v8 != 0;
      v7 += v9;
      if (v9) {
        BOOL v10 = v7 < a3;
      }
      else {
        BOOL v10 = 0;
      }
      if (!v10) {
        return result;
      }
    }
  }
  while (*__error() == 4);
  int v11 = __error();
  BOOL result = 0;
  *((_DWORD *)this + 4) = *v11;
  return result;
}

void sub_2135A6A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * this) | 1);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * this);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (2 * a2) ^ (a2 >> 31));
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, const void *a2, void *__dst, unsigned __int8 *a4)
{
  int v5 = (int)a2;
  memcpy(__dst, this, (int)a2);
  return (uint64_t)__dst + v5;
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  uint64_t v3 = (unsigned int *)*((void *)this + 1);
  if (((*((_DWORD *)this + 4) - v3) & 0xFFFFFFFC) != 0)
  {
    *((void *)this + 1) = v3 + 1;
  }
  else
  {
    uint64_t v3 = (unsigned int *)__dst;
    BOOL result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, __dst, 4);
    if (!result) {
      return result;
    }
  }
  *a2 = *v3;
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes(int a1, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)this, (8 * a1) | 2);
  int v5 = *(char *)(a2 + 23);
  if (v5 < 0 && *(void *)(a2 + 8) >> 31)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/wire_format_lite.cc", 292);
    int v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: value.size() <= kint32max: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v12, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    LOBYTE(v5) = *(unsigned char *)(a2 + 23);
  }
  if ((v5 & 0x80u) == 0) {
    unsigned int v7 = v5;
  }
  else {
    unsigned int v7 = *(_DWORD *)(a2 + 8);
  }
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)this, v7);
  int v8 = *(char *)(a2 + 23);
  if (v8 >= 0) {
    int v9 = (char *)a2;
  }
  else {
    int v9 = *(char **)a2;
  }
  if (v8 >= 0) {
    int v10 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    int v10 = *(_DWORD *)(a2 + 8);
  }
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw(this, v9, v10);
}

void sub_2135A6C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64(uint64_t this, unint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(int *)(this + 16) >= 10)
  {
    uint64_t v2 = *(unsigned char **)(this + 8);
    unint64_t v3 = a2 >> 28;
    if (HIBYTE(a2))
    {
      if (HIBYTE(a2) >= 0x80)
      {
        v2[9] = -127;
        unsigned int v4 = 10;
      }
      else
      {
        unsigned int v4 = 9;
      }
      v2[8] = HIBYTE(a2) | 0x80;
    }
    else
    {
      if (!v3)
      {
        if (!(a2 >> 14))
        {
          if (a2 < 0x80)
          {
            unsigned int v4 = 1;
            goto LABEL_24;
          }
          unsigned int v4 = 2;
LABEL_23:
          v2[1] = (a2 >> 7) | 0x80;
LABEL_24:
          *uint64_t v2 = a2 | 0x80;
          v2[v4 - 1] &= ~0x80u;
          *(void *)(this + 8) += v4;
          *(_DWORD *)(this + 16) -= v4;
          return this;
        }
        if (a2 < 0x200000)
        {
          unsigned int v4 = 3;
          goto LABEL_22;
        }
        unsigned int v4 = 4;
LABEL_21:
        v2[3] = (a2 >> 21) | 0x80;
LABEL_22:
        v2[2] = (a2 >> 14) | 0x80;
        goto LABEL_23;
      }
      if (!(v3 >> 14))
      {
        if (v3 < 0x80)
        {
          unsigned int v4 = 5;
LABEL_20:
          v2[4] = v3 | 0x80;
          goto LABEL_21;
        }
        unsigned int v4 = 6;
LABEL_19:
        v2[5] = (a2 >> 35) | 0x80;
        goto LABEL_20;
      }
      if (v3 < 0x200000)
      {
        unsigned int v4 = 7;
        goto LABEL_18;
      }
      unsigned int v4 = 8;
    }
    v2[7] = (a2 >> 49) | 0x80;
LABEL_18:
    v2[6] = (a2 >> 42) | 0x80;
    goto LABEL_19;
  }
  if (a2 < 0x80)
  {
    LODWORD(v5) = 0;
  }
  else
  {
    uint64_t v5 = 0;
    do
    {
      __src[v5++] = a2 | 0x80;
      unint64_t v6 = a2 >> 14;
      a2 >>= 7;
    }
    while (v6);
  }
  __src[v5] = a2;
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this, __src, (int)v5 + 1);
}

void wireless_diagnostics::google::protobuf::internal::Mutex::Mutex(wireless_diagnostics::google::protobuf::internal::Mutex *this)
{
}

{
  operator new();
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParseFromString(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *a1, uint64_t *a2)
{
  LODWORD(v3) = *((unsigned __int8 *)a2 + 23);
  if ((v3 & 0x80u) == 0) {
    unsigned int v4 = a2;
  }
  else {
    unsigned int v4 = (uint64_t *)*a2;
  }
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = a2[1];
  }
  v8[0] = 0;
  v8[1] = v4;
  v8[2] = (char *)v4 + (int)v3;
  int v9 = v3;
  uint64_t v10 = 0;
  __int16 v11 = 0;
  int v12 = v3;
  long long v13 = xmmword_2135B7F30;
  int v14 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  (*(void (**)(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(void *)a1 + 32))(a1);
  if (!(*(unsigned int (**)(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *, void *))(*(void *)a1 + 64))(a1, v8))goto LABEL_12; {
  if (((*(uint64_t (**)(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(void *)a1 + 40))(a1) & 1) == 0)
  }
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 124);
    unint64_t v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v19, (const std::string::value_type *)&__p);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v17, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
LABEL_12:
    BOOL v5 = 0;
    goto LABEL_13;
  }
  BOOL v5 = (_BYTE)v11 != 0;
LABEL_13:
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v8);
  return v5;
}

void sub_2135A7018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)(v25 - 64));
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2)
{
  v6[0] = a2;
  memset(&v6[1], 0, 30);
  long long v7 = xmmword_2135B7F20;
  int v8 = 0;
  int v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  unsigned int v3 = wireless_diagnostics::google::protobuf::MessageLite::ParseFromCodedStream(this, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  if (BYTE4(v6[4])) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  return v4;
}

void sub_2135A70D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromCodedStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 32))(this);
  uint64_t result = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, wireless_diagnostics::google::protobuf::io::CodedInputStream *))(*(void *)this + 64))(this, a2);
  if (result)
  {
    if ((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 40))(this))
    {
      return 1;
    }
    else
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 124);
      BOOL v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, (const std::string::value_type *)&__p);
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v6, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
      return 0;
    }
  }
  return result;
}

void sub_2135A71F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray(wireless_diagnostics::google::protobuf::MessageLite *this, char *a2, int a3)
{
  v7[0] = 0;
  v7[1] = a2;
  v7[2] = &a2[a3];
  int v8 = a3;
  uint64_t v9 = 0;
  __int16 v10 = 0;
  int v11 = a3;
  long long v12 = xmmword_2135B7F30;
  int v13 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 32))(this);
  if (!(*(unsigned int (**)(wireless_diagnostics::google::protobuf::MessageLite *, void *))(*(void *)this + 64))(this, v7))
  {
LABEL_7:
    BOOL v4 = 0;
    goto LABEL_8;
  }
  if (((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 40))(this) & 1) == 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 124);
    BOOL v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v18, (const std::string::value_type *)&__p);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v16, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    goto LABEL_7;
  }
  BOOL v4 = (_BYTE)v10 != 0;
LABEL_8:
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v7);
  return v4;
}

void sub_2135A7380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)(v25 - 64));
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  if (*(void *)this) {
    wireless_diagnostics::google::protobuf::io::CodedInputStream::BackUpInputToCurrentPosition(this);
  }
  if (*((_DWORD *)this + 13) == -2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/coded_stream.cc", 79);
    uint64_t v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v5, "The total number of bytes read was ");
    unsigned int v3 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, *((_DWORD *)this + 6));
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v4, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v3);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
}

_DWORD *wireless_diagnostics::google::protobuf::io::CodedInputStream::BackUpInputToCurrentPosition(_DWORD *this)
{
  if (this[7] + this[11] + this[4] - this[2] >= 1)
  {
    v1 = this;
    this = (_DWORD *)(*(uint64_t (**)(void))(**(void **)this + 24))(*(void *)this);
    uint64_t v2 = *((void *)v1 + 1);
    unsigned int v3 = v1[6] - v1[11] + v2 - v1[4];
    *((void *)v1 + 2) = v2;
    v1[11] = 0;
    *((void *)v1 + 3) = v3;
  }
  return this;
}

void wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::BackUp(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this, int a2)
{
  if (*((_DWORD *)this + 12) || !*((void *)this + 4))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 257);
    char v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: backup_bytes_ == 0 && buffer_.get() != NULL: ");
    BOOL v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v4, " BackUp() can only be called after Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (*((_DWORD *)this + 11) < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 259);
    char v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) <= (buffer_used_): ");
    long long v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, " Can't back up over more bytes than were returned by the last call to Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 262);
    int v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    uint64_t v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, " Parameter to BackUp() can't be negative.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  *((_DWORD *)this + 12) = a2;
}

void sub_2135A7610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::io::FileInputStream::BackUp(wireless_diagnostics::google::protobuf::io::FileInputStream *this, int a2)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage(uint64_t result, int a2, uint64_t a3, int a4)
{
  *(_DWORD *)uint64_t result = a2;
  *(void *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(void *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  *(void *)(result + 24) = 0;
  return result;
}

{
  *(_DWORD *)uint64_t result = a2;
  *(void *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(void *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  *(void *)(result + 24) = 0;
  return result;
}

unint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  uint64_t v2 = (char *)*((void *)this + 1);
  unsigned int v3 = (unsigned __int8 *)*((void *)this + 2);
  if (v2 != (char *)v3)
  {
LABEL_4:
    unint64_t v7 = 0;
    if (v2 >= (char *)v3 || *v2 < 0)
    {
      unint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v7);
      if (result) {
        return v7;
      }
    }
    else
    {
      unint64_t result = *v2;
      *((void *)this + 1) = v2 + 1;
    }
    return result;
  }
  if (wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this))
  {
    uint64_t v2 = (char *)*((void *)this + 1);
    unsigned int v3 = (unsigned __int8 *)*((void *)this + 2);
    goto LABEL_4;
  }
  int v5 = *((_DWORD *)this + 12);
  unint64_t result = 0;
  BOOL v6 = *((_DWORD *)this + 6) - *((_DWORD *)this + 11) < v5 || *((_DWORD *)this + 10) == v5;
  *((unsigned char *)this + 36) = v6;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString(int a1, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)this, (8 * a1) | 2);
  int v5 = *(char *)(a2 + 23);
  if (v5 < 0 && *(void *)(a2 + 8) >> 31)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/wire_format_lite.cc", 285);
    BOOL v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: value.size() <= kint32max: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v12, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    LOBYTE(v5) = *(unsigned char *)(a2 + 23);
  }
  if ((v5 & 0x80u) == 0) {
    unsigned int v7 = v5;
  }
  else {
    unsigned int v7 = *(_DWORD *)(a2 + 8);
  }
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)this, v7);
  int v8 = *(char *)(a2 + 23);
  if (v8 >= 0) {
    uint64_t v9 = (char *)a2;
  }
  else {
    uint64_t v9 = *(char **)a2;
  }
  if (v8 >= 0) {
    int v10 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    int v10 = *(_DWORD *)(a2 + 8);
  }
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw(this, v9, v10);
}

void sub_2135A77E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * this);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unsigned int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * this);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
}

atomic_ullong *wireless_diagnostics::google::protobuf::GoogleOnceInitImpl(atomic_ullong *result, uint64_t a2)
{
  atomic_ullong v2 = *result;
  __dmb(0xBu);
  if (v2 != 2)
  {
    unsigned int v3 = result;
    do
    {
      uint64_t v4 = 0;
      atomic_compare_exchange_strong(result, (unint64_t *)&v4, 1uLL);
      if (!v4)
      {
        unint64_t result = (atomic_ullong *)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 16))(a2);
        __dmb(0xBu);
        *unsigned int v3 = 2;
        return result;
      }
    }
    while (!*result);
    if (*result == 1)
    {
      do
      {
        unint64_t result = (atomic_ullong *)sched_yield();
        uint64_t v5 = *v3;
        __dmb(0xBu);
      }
      while (v5 == 1);
    }
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::FunctionClosure0::Run(uint64_t (**this)(void))
{
  int v2 = *((unsigned __int8 *)this + 16);
  uint64_t result = this[1]();
  if (this && v2)
  {
    uint64_t v4 = (uint64_t (*)(uint64_t (**)(void)))*((void *)*this + 1);
    return v4(this);
  }
  return result;
}

void wireless_diagnostics::google::protobuf::internal::OnShutdown(wireless_diagnostics::google::protobuf::internal *this, void (*a2)(void))
{
  uint64_t v3 = wireless_diagnostics::google::protobuf::internal::shutdown_functions_init;
  __dmb(0xBu);
  if (v3 != 2)
  {
    v19[0] = &unk_26C3F7D88;
    v19[1] = wireless_diagnostics::google::protobuf::internal::InitShutdownFunctions;
    char v20 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl(&wireless_diagnostics::google::protobuf::internal::shutdown_functions_init, (uint64_t)v19);
  }
  uint64_t v4 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex;
  wireless_diagnostics::google::protobuf::internal::Mutex::Lock((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex);
  uint64_t v5 = (void **)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
  BOOL v6 = *(void **)(wireless_diagnostics::google::protobuf::internal::shutdown_functions + 8);
  unint64_t v7 = *(void *)(wireless_diagnostics::google::protobuf::internal::shutdown_functions + 16);
  if ((unint64_t)v6 >= v7)
  {
    uint64_t v9 = ((uint64_t)v6 - *(void *)wireless_diagnostics::google::protobuf::internal::shutdown_functions) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<void (*)(void)>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v7 - *(void *)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      int v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void (*)(void)>>(wireless_diagnostics::google::protobuf::internal::shutdown_functions + 16, v12);
    }
    else {
      int v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)uint64_t v14 = this;
    int v8 = v14 + 8;
    char v17 = (char *)*v5;
    char v16 = (char *)v5[1];
    if (v16 != *v5)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      char v16 = (char *)*v5;
    }
    *uint64_t v5 = v14;
    v5[1] = v8;
    std::string v5[2] = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    *BOOL v6 = this;
    int v8 = v6 + 1;
  }
  v5[1] = v8;
  wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v4);
}

void sub_2135A7AF8(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v1);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(pthread_mutex_t **this)
{
  int v1 = pthread_mutex_unlock(*this);
  if (v1)
  {
    int v2 = v1;
    int v4 = 3;
    uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    int v6 = 312;
    memset(&__p, 0, sizeof(__p));
    std::string::append(&__p, "pthread_mutex_unlock: ");
    uint64_t v3 = strerror(v2);
    std::string::append(&__p, v3);
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_2135A7BB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::internal::Mutex::Lock(pthread_mutex_t **this)
{
  int v1 = pthread_mutex_lock(*this);
  if (v1)
  {
    int v2 = v1;
    int v4 = 3;
    uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    int v6 = 305;
    memset(&__p, 0, sizeof(__p));
    std::string::append(&__p, "pthread_mutex_lock: ");
    uint64_t v3 = strerror(v2);
    std::string::append(&__p, v3);
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_2135A7C6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void (*)(void)>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void wireless_diagnostics::google::protobuf::internal::InitShutdownFunctions(wireless_diagnostics::google::protobuf::internal *this)
{
}

void sub_2135A7D50(_Unwind_Exception *a1)
{
  MEMORY[0x21668CE50](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, float a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a2, (8 * this) | 5);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a2, SLODWORD(a3));
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, signed int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * this);
  if (a2 < 0)
  {
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
  }
  else
  {
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
  }
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unsigned int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * this);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, double a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a2, (8 * this) | 1);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a2, *(uint64_t *)&a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * this) | 2);
  unsigned int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96))(a2);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v6);
  unint64_t v7 = *(uint64_t (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)a2 + 80);

  return v7(a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(uint64_t this, unsigned int a2)
{
  if (*(int *)(this + 16) < 5)
  {
    if (a2 < 0x80)
    {
      LODWORD(v4) = 0;
    }
    else
    {
      uint64_t v4 = 0;
      do
      {
        __src[v4++] = a2 | 0x80;
        unsigned int v5 = a2 >> 14;
        a2 >>= 7;
      }
      while (v5);
    }
    __src[v4] = a2;
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this, __src, (int)v4 + 1);
  }
  else
  {
    int v2 = *(unsigned char **)(this + 8);
    *int v2 = a2 | 0x80;
    if (a2 < 0x80)
    {
      *int v2 = a2 & 0x7F;
      int v3 = v2 + 1;
    }
    else
    {
      v2[1] = (a2 >> 7) | 0x80;
      if (a2 < 0x4000)
      {
        v2[1] = (a2 >> 7) & 0x7F;
        int v3 = v2 + 2;
      }
      else
      {
        v2[2] = (a2 >> 14) | 0x80;
        if (a2 < 0x200000)
        {
          v2[2] = (a2 >> 14) & 0x7F;
          int v3 = v2 + 3;
        }
        else
        {
          v2[3] = (a2 >> 21) | 0x80;
          if (a2 >> 28)
          {
            v2[4] = a2 >> 28;
            int v3 = v2 + 5;
          }
          else
          {
            int v3 = v2 + 4;
            v2[3] = (a2 >> 21) & 0x7F;
          }
        }
      }
    }
    int v6 = v3 - v2;
    *(void *)(this + 8) += v6;
    *(_DWORD *)(this + 16) -= v6;
  }
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, char *__src, int a3)
{
  while (1)
  {
    size_t v6 = *((int *)this + 4);
    unint64_t v7 = (void *)*((void *)this + 1);
    if ((int)v6 >= a3) {
      break;
    }
    memcpy(v7, __src, v6);
    uint64_t v8 = *((int *)this + 4);
    a3 -= v8;
    __src += v8;
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
    if ((result & 1) == 0) {
      return result;
    }
  }
  uint64_t result = (uint64_t)memcpy(v7, __src, a3);
  *((void *)this + 1) += a3;
  *((_DWORD *)this + 4) -= a3;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToArray(wireless_diagnostics::google::protobuf::MessageLite *this, void *a2, int a3)
{
  size_t v6 = (wireless_diagnostics::google::protobuf::_anonymous_namespace_ *)(*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 72))(this);
  if ((int)v6 <= a3)
  {
    uint64_t v7 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, void *))(*(void *)this
                                                                                                  + 88))(this, a2)- (void)a2;
    if (v7 != (int)v6)
    {
      int v8 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 72))(this);
    }
  }
  return (int)v6 <= a3;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToString(uint64_t a1, uint64_t a2)
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
  wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString(a1, (std::string *)a2);
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString(uint64_t a1, std::string *a2)
{
  int v2 = a2;
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type size = a2->__r_.__value_.__l.__size_;
  }
  else {
    LODWORD(size) = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  }
  unsigned int v5 = (wireless_diagnostics::google::protobuf::_anonymous_namespace_ *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 72))(a1);
  std::string::resize(v2, (int)v5 + (int)size, 0);
  if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
  {
    if (v2->__r_.__value_.__l.__size_)
    {
      int v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)&v2->__r_.__value_.__s + 23))
  {
    goto LABEL_10;
  }
  int v2 = 0;
LABEL_10:
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 88))(a1, (uint64_t)v2 + (int)size)
     - ((void)v2
      + (int)size);
  if (v6 != (int)v5)
  {
    int v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 72))(a1);
  }
  return 1;
}

unsigned __int8 *wireless_diagnostics::google::protobuf::MessageLite::SerializeWithCachedSizesToArray(wireless_diagnostics::google::protobuf::MessageLite *this, unsigned __int8 *a2)
{
  int v4 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 96))(this);
  wireless_diagnostics::google::protobuf::io::ArrayOutputStream::ArrayOutputStream((uint64_t)v10, a2, v4, -1);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v9, (wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *)v10);
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *, unsigned char *))(*(void *)this + 80))(this, v9);
  if (v9[24])
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 225);
    unsigned int v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: !coded_out.HadError(): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v7, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v9);
  wireless_diagnostics::google::protobuf::io::ArrayOutputStream::~ArrayOutputStream((wireless_diagnostics::google::protobuf::io::ArrayOutputStream *)v10);
  return &a2[v4];
}

void sub_2135A8454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  unsigned int v5 = va_arg(va1, void *);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)va1);
  wireless_diagnostics::google::protobuf::io::ArrayOutputStream::~ArrayOutputStream((wireless_diagnostics::google::protobuf::io::ArrayOutputStream *)(v3 - 64));
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, signed int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * this);
  if (a2 < 0)
  {
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
  }
  else
  {
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
  }
}

void wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  if (*((int *)this + 4) >= 1) {
    (*(void (**)(void))(**(void **)this + 24))();
  }
}

wireless_diagnostics::google::protobuf::io::CodedOutputStream *wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = a2;
  *((unsigned char *)this + 24) = 0;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
  *((unsigned char *)this + 24) = 0;
  return this;
}

{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = a2;
  *((unsigned char *)this + 24) = 0;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
  *((unsigned char *)this + 24) = 0;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  uint64_t v4 = 0;
  uint64_t result = (*(uint64_t (**)(void, uint64_t *, char *))(**(void **)this + 16))(*(void *)this, &v4, (char *)this + 16);
  if (result)
  {
    uint64_t v3 = v4;
    *((_DWORD *)this + 5) += *((_DWORD *)this + 4);
  }
  else
  {
    uint64_t v3 = 0;
    *((_DWORD *)this + 4) = 0;
    *((unsigned char *)this + 24) = 1;
  }
  *((void *)this + 1) = v3;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::io::ArrayOutputStream::Next(wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this, void **a2, int *a3)
{
  uint64_t v3 = *((int *)this + 6);
  int v4 = *((_DWORD *)this + 4);
  if ((int)v3 >= v4)
  {
    *((_DWORD *)this + 7) = 0;
  }
  else
  {
    int v5 = v4 - v3;
    if (v4 - (int)v3 >= *((_DWORD *)this + 5)) {
      int v5 = *((_DWORD *)this + 5);
    }
    *((_DWORD *)this + 7) = v5;
    *a2 = (void *)(*((void *)this + 1) + v3);
    *a3 = v5;
    *((_DWORD *)this + 6) += *((_DWORD *)this + 7);
  }
  return (int)v3 < v4;
}

uint64_t wireless_diagnostics::google::protobuf::io::ArrayOutputStream::ArrayOutputStream(uint64_t this, void *a2, int a3, int a4)
{
  *(void *)this = &unk_26C3F79F8;
  *(void *)(this + 8) = a2;
  if (a4 <= 0) {
    int v4 = a3;
  }
  else {
    int v4 = a4;
  }
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(void *)(this + 24) = 0;
  return this;
}

{
  int v4;

  *(void *)this = &unk_26C3F79F8;
  *(void *)(this + 8) = a2;
  if (a4 <= 0) {
    int v4 = a3;
  }
  else {
    int v4 = a4;
  }
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(void *)(this + 24) = 0;
  return this;
}

void wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::BackUp(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this, int a2)
{
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 346);
    int v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  int v5 = *((_DWORD *)this + 11);
  if (v5 != *((_DWORD *)this + 10))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 347);
    uint64_t v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (buffer_used_) == (buffer_size_): ");
    uint64_t v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, " BackUp() can only be called after Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    int v5 = *((_DWORD *)this + 11);
  }
  if (v5 < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 349);
    uint64_t v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) <= (buffer_used_): ");
    uint64_t v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, " Can't back up over more bytes than were returned by the last call to Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    int v5 = *((_DWORD *)this + 11);
  }
  *((_DWORD *)this + 11) = v5 - a2;
}

void sub_2135A87CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Next(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this, void **a2, int *a3)
{
  if (*((_DWORD *)this + 11) != *((_DWORD *)this + 10)
    || (uint64_t result = wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this),
        result))
  {
    wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::AllocateBufferIfNeeded((uint64_t)this);
    int v7 = *((_DWORD *)this + 10);
    uint64_t v8 = *((int *)this + 11);
    *a2 = (void *)(*((void *)this + 4) + v8);
    *a3 = v7 - v8;
    *((_DWORD *)this + 11) = *((_DWORD *)this + 10);
    return 1;
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::AllocateBufferIfNeeded(uint64_t this)
{
  if (!*(void *)(this + 32)) {
    operator new[]();
  }
  return this;
}

void wireless_diagnostics::google::protobuf::io::FileOutputStream::BackUp(wireless_diagnostics::google::protobuf::io::FileOutputStream *this, int a2)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::Next(wireless_diagnostics::google::protobuf::io::FileOutputStream *this, void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Next((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32), a2, a3);
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (unint64_t *)*((void *)this + 1);
  if (((*((_DWORD *)this + 4) - v3) & 0xFFFFFFF8) != 0)
  {
    *((void *)this + 1) = v3 + 1;
  }
  else
  {
    uint64_t v3 = (unint64_t *)v5;
    BOOL result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, v5, 8);
    if (!result) {
      return result;
    }
  }
  *a2 = *v3;
  return 1;
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, char *__dst, int a3)
{
  while (1)
  {
    int v6 = a3;
    int v7 = (const void *)*((void *)this + 1);
    int v8 = *((void *)this + 2) - v7;
    BOOL v9 = __OFSUB__(a3, v8);
    a3 -= v8;
    if ((a3 < 0) ^ v9 | (a3 == 0)) {
      break;
    }
    memcpy(__dst, v7, v8);
    __dst += v8;
    *((void *)this + 1) += v8;
    if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this) & 1) == 0) {
      return v6 <= v8;
    }
  }
  memcpy(__dst, v7, v6);
  *((void *)this + 1) += v6;
  return v6 <= v8;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  int v2 = *((_DWORD *)this + 11);
  if (v2 > 0 || *((int *)this + 7) > 0 || (int v3 = *((_DWORD *)this + 6), v3 == *((_DWORD *)this + 10)))
  {
    int v4 = *((_DWORD *)this + 6) - v2;
    int v5 = *((_DWORD *)this + 12);
    if (v4 >= v5 && v5 != *((_DWORD *)this + 10)) {
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PrintTotalBytesLimitError(this);
    }
    return 0;
  }
  else
  {
    int v8 = *((_DWORD *)this + 13);
    if ((v8 & 0x80000000) == 0 && v3 >= v8)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/coded_stream.cc", 506);
      BOOL v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v28, "Reading dangerously large protocol message.  If the message turns out to be larger than ");
      char v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v9, *((_DWORD *)this + 12));
      uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, " bytes, parsing will be halted for security reasons.  To increase the limit (or to disable these warnings), see CodedInputStream::SetTotalBytesLimit() in google/protobuf/io/coded_stream.h.");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v27, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
      *((_DWORD *)this + 13) = -2;
    }
    uint64_t v27 = 0;
    int v26 = 0;
    uint64_t v12 = *(void *)this;
    do
    {
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(void *)v12 + 16))(v12, &v27, &v26);
      if (!v6)
      {
        *((void *)this + 1) = 0;
        *((void *)this + 2) = 0;
        return v6;
      }
      int v13 = v26;
    }
    while (!v26);
    uint64_t v14 = v27 + v26;
    *((void *)this + 1) = v27;
    *((void *)this + 2) = v14;
    if (v13 < 0)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/coded_stream.cc", 523);
      uint64_t v15 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (buffer_size) >= (0): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v25, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v15);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
      int v13 = v26;
    }
    int v16 = *((_DWORD *)this + 6);
    int v17 = v16 - (v13 ^ 0x7FFFFFFF);
    if (v16 <= (v13 ^ 0x7FFFFFFF))
    {
      int v19 = v13 + v16;
      uint64_t v18 = *((void *)this + 2);
    }
    else
    {
      *((_DWORD *)this + 7) = v17;
      uint64_t v18 = *((void *)this + 2) - v17;
      *((void *)this + 2) = v18;
      int v19 = 0x7FFFFFFF;
    }
    *((_DWORD *)this + 6) = v19;
    int v20 = *((_DWORD *)this + 10);
    uint64_t v21 = v18 + *((int *)this + 11);
    *((void *)this + 2) = v21;
    int v22 = *((_DWORD *)this + 12);
    if (v22 >= v20) {
      int v22 = v20;
    }
    BOOL v23 = __OFSUB__(v19, v22);
    int v24 = v19 - v22;
    if ((v24 < 0) ^ v23 | (v24 == 0)) {
      int v24 = 0;
    }
    else {
      *((void *)this + 2) = v21 - v24;
    }
    *((_DWORD *)this + 11) = v24;
  }
  return v6;
}

void sub_2135A8C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Next(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this, const void **a2, int *a3)
{
  if (*((unsigned char *)this + 17)) {
    return 0;
  }
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::AllocateBufferIfNeeded((uint64_t)this);
  uint64_t v7 = *((unsigned int *)this + 12);
  if ((int)v7 < 1)
  {
    int v8 = (*(uint64_t (**)(void, void, void))(**((void **)this + 1) + 16))(*((void *)this + 1), *((void *)this + 4), *((unsigned int *)this + 10));
    *((_DWORD *)this + 11) = v8;
    if (v8 <= 0)
    {
      if (v8 < 0) {
        *((unsigned char *)this + 17) = 1;
      }
      wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::FreeBuffer(this);
      return 0;
    }
    BOOL v9 = (const void *)*((void *)this + 4);
    *((void *)this + 3) += v8;
    *a3 = v8;
    *a2 = v9;
  }
  else
  {
    *a2 = (const void *)(*((void *)this + 4) + *((int *)this + 11) - v7);
    *a3 = v7;
    *((_DWORD *)this + 12) = 0;
  }
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::AllocateBufferIfNeeded(uint64_t this)
{
  if (!*(void *)(this + 32)) {
    operator new[]();
  }
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::Next(wireless_diagnostics::google::protobuf::io::FileInputStream *this, const void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Next((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32), a2, a3);
}

ssize_t wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Read(wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this, void *a2, int a3)
{
  if (*((unsigned char *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 139);
    uint64_t v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  while (1)
  {
    ssize_t v7 = read(*((_DWORD *)this + 2), a2, a3);
    if ((v7 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4)
    {
      *((_DWORD *)this + 4) = *__error();
      return v7;
    }
  }
  return v7;
}

void sub_2135A8E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::FreeBuffer(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  if (*((_DWORD *)this + 12))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 302);
    int v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (backup_bytes_) == (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v4, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  *((_DWORD *)this + 11) = 0;
  uint64_t result = *((void *)this + 4);
  if (result)
  {
    uint64_t result = MEMORY[0x21668CE30](result, 0x1000C8077774924);
    *((void *)this + 4) = 0;
  }
  return result;
}

void sub_2135A8EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete(uint64_t result)
{
  if (result)
  {
    if (*(char *)(result + 23) < 0) {
      operator delete(*(void **)result);
    }
    JUMPOUT(0x21668CE50);
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(uint64_t this, int a2)
{
  int v2 = *(_DWORD *)(this + 16);
  if (v2 < a2)
  {
    int v3 = 2 * v2;
    if (v3 <= a2) {
      int v3 = a2;
    }
    if (v3 <= 4) {
      int v3 = 4;
    }
    *(_DWORD *)(this + 16) = v3;
    operator new[]();
  }
  return this;
}

void wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *this)
{
}

BOOL wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString(uint64_t a1, std::string *this)
{
  unsigned int v10 = 0;
  int v5 = *(char **)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  if ((unint64_t)v5 < v4 && (*v5 & 0x80000000) == 0)
  {
    unsigned int v6 = *v5;
    unsigned int v10 = v6;
    ssize_t v7 = (unsigned __int8 *)(v5 + 1);
    *(void *)(a1 + 8) = v7;
    goto LABEL_7;
  }
  int v8 = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)a1, &v10);
  BOOL result = 0;
  if (v8)
  {
    unsigned int v6 = v10;
    if ((v10 & 0x80000000) == 0)
    {
      ssize_t v7 = *(unsigned __int8 **)(a1 + 8);
      unint64_t v4 = *(void *)(a1 + 16);
LABEL_7:
      if ((int)v6 > (int)v4 - (int)v7) {
        return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadStringFallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)a1, this, v6);
      }
      std::string::resize(this, v6, 0);
      if (!v6) {
        return 1;
      }
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      {
        if (!this->__r_.__value_.__l.__size_)
        {
LABEL_15:
          this = 0;
          goto LABEL_16;
        }
        this = (std::string *)this->__r_.__value_.__r.__words[0];
      }
      else if (!*((unsigned char *)&this->__r_.__value_.__s + 23))
      {
        goto LABEL_15;
      }
LABEL_16:
      memcpy(this, *(const void **)(a1 + 8), v6);
      *(void *)(a1 + 8) += v6;
      return 1;
    }
  }
  return result;
}

BOOL wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes(uint64_t a1, std::string *this)
{
  unsigned int v10 = 0;
  int v5 = *(char **)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  if ((unint64_t)v5 < v4 && (*v5 & 0x80000000) == 0)
  {
    unsigned int v6 = *v5;
    unsigned int v10 = v6;
    ssize_t v7 = (unsigned __int8 *)(v5 + 1);
    *(void *)(a1 + 8) = v7;
    goto LABEL_7;
  }
  int v8 = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)a1, &v10);
  BOOL result = 0;
  if (v8)
  {
    unsigned int v6 = v10;
    if ((v10 & 0x80000000) == 0)
    {
      ssize_t v7 = *(unsigned __int8 **)(a1 + 8);
      unint64_t v4 = *(void *)(a1 + 16);
LABEL_7:
      if ((int)v6 > (int)v4 - (int)v7) {
        return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadStringFallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)a1, this, v6);
      }
      std::string::resize(this, v6, 0);
      if (!v6) {
        return 1;
      }
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      {
        if (!this->__r_.__value_.__l.__size_)
        {
LABEL_15:
          this = 0;
          goto LABEL_16;
        }
        this = (std::string *)this->__r_.__value_.__r.__words[0];
      }
      else if (!*((unsigned char *)&this->__r_.__value_.__s + 23))
      {
        goto LABEL_15;
      }
LABEL_16:
      memcpy(this, *(const void **)(a1 + 8), v6);
      *(void *)(a1 + 8) += v6;
      return 1;
    }
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  unint64_t v4 = (unsigned char *)*((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  if ((int)v3 - (int)v4 <= 9 && (v3 <= (unint64_t)v4 || *(char *)(v3 - 1) < 0))
  {
    unint64_t v14 = 0;
    uint64_t v8 = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v14);
    if (v8) {
      *a2 = v14;
    }
  }
  else
  {
    uint64_t v5 = (uint64_t)(v4 + 1);
    unsigned int v6 = *v4 & 0x7F;
    if ((*v4 & 0x80) != 0)
    {
      int v7 = (char)v4[1];
      unsigned int v6 = *v4 & 0x7F | ((v7 & 0x7F) << 7);
      if (v7 < 0)
      {
        int v9 = (char)v4[2];
        unsigned int v6 = v6 & 0xFFE03FFF | ((v9 & 0x7F) << 14);
        if (v9 < 0)
        {
          int v10 = (char)v4[3];
          unsigned int v6 = v6 & 0xF01FFFFF | ((v10 & 0x7F) << 21);
          if (v10 < 0)
          {
            int v11 = (char)v4[4];
            v6 |= v11 << 28;
            if (v11 < 0)
            {
              uint64_t v12 = 0;
              while ((char)v4[v12 + 5] < 0)
              {
                uint64_t v8 = 0;
                if (++v12 == 5) {
                  return v8;
                }
              }
              uint64_t v5 = (uint64_t)&v4[v12 + 6];
            }
            else
            {
              uint64_t v5 = (uint64_t)(v4 + 5);
            }
          }
          else
          {
            uint64_t v5 = (uint64_t)(v4 + 4);
          }
        }
        else
        {
          uint64_t v5 = (uint64_t)(v4 + 3);
        }
      }
      else
      {
        uint64_t v5 = (uint64_t)(v4 + 2);
      }
    }
    *a2 = v6;
    *((void *)this + 1) = v5;
    return 1;
  }
  return v8;
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadStringFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, std::string *a2, int a3)
{
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
  {
    if (a2->__r_.__value_.__l.__size_)
    {
      *a2->__r_.__value_.__l.__data_ = 0;
      a2->__r_.__value_.__l.__size_ = 0;
    }
  }
  else if (*((unsigned char *)&a2->__r_.__value_.__s + 23))
  {
    a2->__r_.__value_.__s.__data_[0] = 0;
    *((unsigned char *)&a2->__r_.__value_.__s + 23) = 0;
  }
  while (1)
  {
    int v6 = a3;
    int v7 = (const std::string::value_type *)*((void *)this + 1);
    int v8 = *((void *)this + 2) - v7;
    BOOL v9 = __OFSUB__(a3, v8);
    a3 -= v8;
    if ((a3 < 0) ^ v9 | (a3 == 0)) {
      break;
    }
    if (v8)
    {
      std::string::append(a2, v7, v8);
      int v7 = (const std::string::value_type *)*((void *)this + 1);
    }
    *((void *)this + 1) = &v7[v8];
    if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this) & 1) == 0) {
      return v6 <= v8;
    }
  }
  std::string::append(a2, v7, v6);
  *((void *)this + 1) += v6;
  return v6 <= v8;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  int v2 = (unsigned char *)*((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  if ((int)v3 - (int)v2 <= 9 && (v3 <= (unint64_t)v2 || *(char *)(v3 - 1) < 0)) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Slow(this, a2);
  }
  int v4 = v2 + 1;
  unsigned int v5 = *v2 & 0x7F;
  if ((*v2 & 0x80) == 0)
  {
    unsigned int v6 = 0;
    uint64_t v7 = 0;
LABEL_25:
    *((void *)this + 1) = &v2[v4 - (int)v2];
    *a2 = v5 | ((unint64_t)v6 << 28) | (v7 << 56);
    return 1;
  }
  int v9 = (char)v2[1];
  unsigned int v5 = *v2 & 0x7F | ((v9 & 0x7F) << 7);
  if ((v9 & 0x80000000) == 0)
  {
    unsigned int v6 = 0;
    uint64_t v7 = 0;
    int v4 = v2 + 2;
    goto LABEL_25;
  }
  int v10 = (char)v2[2];
  unsigned int v5 = v5 & 0xFFE03FFF | ((v10 & 0x7F) << 14);
  if ((v10 & 0x80000000) == 0)
  {
    unsigned int v6 = 0;
    uint64_t v7 = 0;
    int v4 = v2 + 3;
    goto LABEL_25;
  }
  int v11 = (char)v2[3];
  unsigned int v5 = v5 & 0xF01FFFFF | ((v11 & 0x7F) << 21);
  if ((v11 & 0x80000000) == 0)
  {
    unsigned int v6 = 0;
    uint64_t v7 = 0;
    int v4 = v2 + 4;
    goto LABEL_25;
  }
  unsigned int v6 = v2[4] & 0x7F;
  if ((v2[4] & 0x80) == 0)
  {
    uint64_t v7 = 0;
    int v4 = v2 + 5;
    goto LABEL_25;
  }
  int v12 = (char)v2[5];
  unsigned int v6 = v2[4] & 0x7F | ((v12 & 0x7F) << 7);
  if ((v12 & 0x80000000) == 0)
  {
    uint64_t v7 = 0;
    int v4 = v2 + 6;
    goto LABEL_25;
  }
  int v13 = (char)v2[6];
  unsigned int v6 = v6 & 0xFFE03FFF | ((v13 & 0x7F) << 14);
  if ((v13 & 0x80000000) == 0)
  {
    uint64_t v7 = 0;
    int v4 = v2 + 7;
    goto LABEL_25;
  }
  int v14 = (char)v2[7];
  unsigned int v6 = v6 & 0xF01FFFFF | ((v14 & 0x7F) << 21);
  if ((v14 & 0x80000000) == 0)
  {
    uint64_t v7 = 0;
    int v4 = v2 + 8;
    goto LABEL_25;
  }
  uint64_t v7 = v2[8] & 0x7F;
  if ((v2[8] & 0x80) == 0)
  {
    int v4 = v2 + 9;
    goto LABEL_25;
  }
  int v15 = (char)v2[9];
  if ((v15 & 0x80000000) == 0)
  {
    int v4 = v2 + 10;
    uint64_t v7 = v2[8] & 0x7F | ((v15 & 0x7F) << 7);
    goto LABEL_25;
  }
  return 0;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Slow(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  while (v4 != 10)
  {
    while (1)
    {
      unsigned int v6 = (char *)*((void *)this + 1);
      if (v6 != *((char **)this + 2)) {
        break;
      }
      if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this) & 1) == 0) {
        return 0;
      }
    }
    char v7 = *v6;
    v5 |= (unint64_t)(*v6 & 0x7F) << (7 * v4);
    *((void *)this + 1) = v6 + 1;
    ++v4;
    if ((v7 & 0x80) == 0)
    {
      *a2 = v5;
      return 1;
    }
  }
  return 0;
}

unint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  int v2 = (unsigned char *)*((void *)this + 1);
  uint64_t v1 = *((void *)this + 2);
  int v3 = v1 - v2;
  if ((int)v1 - (int)v2 > 9) {
    goto LABEL_4;
  }
  if (v3 >= 1)
  {
    if ((*(char *)(v1 - 1) & 0x80000000) == 0)
    {
LABEL_4:
      uint64_t v4 = (uint64_t)(v2 + 1);
      uint64_t v5 = *v2 & 0x7F;
      if ((*v2 & 0x80) != 0)
      {
        int v6 = (char)v2[1];
        uint64_t v5 = *v2 & 0x7F | ((v6 & 0x7F) << 7);
        if (v6 < 0)
        {
          int v8 = (char)v2[2];
          uint64_t v5 = v5 & 0xFFE03FFF | ((v8 & 0x7F) << 14);
          if (v8 < 0)
          {
            int v12 = (char)v2[3];
            uint64_t v5 = v5 & 0xF01FFFFF | ((v12 & 0x7F) << 21);
            if (v12 < 0)
            {
              int v13 = (char)v2[4];
              uint64_t v5 = v5 | (v13 << 28);
              if (v13 < 0)
              {
                uint64_t v14 = 0;
                while ((char)v2[v14 + 5] < 0)
                {
                  uint64_t v11 = 0;
                  if (++v14 == 5) {
                    return v11;
                  }
                }
                uint64_t v4 = (uint64_t)&v2[v14 + 6];
              }
              else
              {
                uint64_t v4 = (uint64_t)(v2 + 5);
              }
            }
            else
            {
              uint64_t v4 = (uint64_t)(v2 + 4);
            }
          }
          else
          {
            uint64_t v4 = (uint64_t)(v2 + 3);
          }
        }
        else
        {
          uint64_t v4 = (uint64_t)(v2 + 2);
        }
      }
      *((void *)this + 1) = v4;
      return v5;
    }
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  }
  if (v3) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  }
  int v9 = *((_DWORD *)this + 11);
  int v10 = *((_DWORD *)this + 6);
  if (v9 <= 0 && v10 != *((_DWORD *)this + 10)) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  }
  if (v10 - v9 >= *((_DWORD *)this + 12)) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  }
  uint64_t v11 = 0;
  *((unsigned char *)this + 36) = 1;
  return v11;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64(uint64_t this, uint64_t a2)
{
  v2[1] = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(this + 16) < 8u)
  {
    v2[0] = a2;
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this, (char *)v2, 8);
  }
  else
  {
    **(void **)(this + 8) = a2;
    *(void *)(this + 8) += 8;
    *(_DWORD *)(this + 16) -= 8;
  }
  return this;
}

void *wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionSet(void *this)
{
  this[2] = 0;
  this[1] = 0;
  *this = this + 1;
  return this;
}

{
  this[2] = 0;
  this[1] = 0;
  *this = this + 1;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  if (this >> 28) {
    int v1 = 5;
  }
  else {
    int v1 = 4;
  }
  if (this >= 0x200000) {
    int v2 = v1;
  }
  else {
    int v2 = 3;
  }
  if (this >= 0x4000) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 2;
  }
  if (this >= 0x80) {
    return v3;
  }
  else {
    return 1;
  }
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32(uint64_t this, int a2)
{
  if (*(_DWORD *)(this + 16) < 4u)
  {
    int __src = a2;
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this, (char *)&__src, 4);
  }
  else
  {
    **(_DWORD **)(this + 8) = a2;
    *(void *)(this + 8) += 4;
    *(_DWORD *)(this + 16) -= 4;
  }
  return this;
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::~ExtensionSet(wireless_diagnostics::google::protobuf::internal::ExtensionSet **this)
{
  int v2 = this + 1;
  unsigned int v3 = *this;
  if (*this != (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(this + 1))
  {
    do
    {
      wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Free((int *)v3 + 10);
      uint64_t v4 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((void *)v3 + 1);
      if (v4)
      {
        do
        {
          uint64_t v5 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v4;
          uint64_t v4 = *(wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          uint64_t v5 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((void *)v3 + 2);
          BOOL v6 = *v5 == v3;
          unsigned int v3 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v5;
        }
        while (!v6);
      }
      unsigned int v3 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v5;
    }
    while (v5 != v2);
  }
  std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy((uint64_t)this, this[1]);
}

void std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ByteSize(wireless_diagnostics::google::protobuf::internal::ExtensionSet **this)
{
  int v1 = this + 1;
  int v2 = *this;
  if (*this == (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(this + 1)) {
    return 0;
  }
  LODWORD(v3) = 0;
  do
  {
    int v4 = wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::ByteSize((wireless_diagnostics::google::protobuf::internal::ExtensionSet *)((char *)v2 + 40), (const wireless_diagnostics::google::protobuf::MessageLite *)*((unsigned int *)v2 + 8));
    uint64_t v5 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((void *)v2 + 1);
    if (v5)
    {
      do
      {
        BOOL v6 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v5;
        uint64_t v5 = *(wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        BOOL v6 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((void *)v2 + 2);
        BOOL v7 = *v6 == v2;
        int v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v6;
      }
      while (!v7);
    }
    uint64_t v3 = (v4 + v3);
    int v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v6;
  }
  while (v6 != v1);
  return v3;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(unint64_t this)
{
  if ((this & 0x8000000000000000) == 0) {
    int v1 = 9;
  }
  else {
    int v1 = 10;
  }
  if (HIBYTE(this)) {
    int v2 = v1;
  }
  else {
    int v2 = 8;
  }
  if (this >> 49) {
    int v3 = v2;
  }
  else {
    int v3 = 7;
  }
  if (this >> 42) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = 6;
  }
  if (this >> 28) {
    int v5 = 5;
  }
  else {
    int v5 = 4;
  }
  if (this >= 0x200000) {
    int v6 = v5;
  }
  else {
    int v6 = 3;
  }
  if (this >= 0x4000) {
    int v7 = v6;
  }
  else {
    int v7 = 2;
  }
  if (this >= 0x80) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 1;
  }
  if (this >> 35) {
    return v4;
  }
  else {
    return v8;
  }
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SerializeWithCachedSizes(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  int v5 = (char *)this + 8;
  unsigned int v4 = (char *)*((void *)this + 1);
  if (v4)
  {
    unsigned int v8 = (char *)this + 8;
    do
    {
      int v9 = *((_DWORD *)v4 + 8);
      BOOL v10 = v9 < a2;
      if (v9 >= a2) {
        uint64_t v11 = (char **)v4;
      }
      else {
        uint64_t v11 = (char **)(v4 + 8);
      }
      if (!v10) {
        unsigned int v8 = v4;
      }
      unsigned int v4 = *v11;
    }
    while (*v11);
    if (v8 != v5)
    {
      do
      {
        int v12 = (wireless_diagnostics::google::protobuf::internal::WireFormatLite *)*((unsigned int *)v8 + 8);
        if ((int)v12 >= a3) {
          break;
        }
        wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::SerializeFieldWithCachedSizes((wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *)(v8 + 40), v12, a4, a4);
        int v13 = (char *)*((void *)v8 + 1);
        if (v13)
        {
          do
          {
            uint64_t v14 = v13;
            int v13 = *(char **)v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            uint64_t v14 = (char *)*((void *)v8 + 2);
            BOOL v15 = *(void *)v14 == (void)v8;
            unsigned int v8 = v14;
          }
          while (!v15);
        }
        unsigned int v8 = v14;
      }
      while (v14 != v5);
    }
  }
}

void wireless_diagnostics::google::protobuf::io::FileInputStream::~FileInputStream(wireless_diagnostics::google::protobuf::io::FileInputStream *this)
{
  wireless_diagnostics::google::protobuf::io::FileInputStream::~FileInputStream(this);

  JUMPOUT(0x21668CE50);
}

{
  wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *v2;
  uint64_t vars8;

  *(void *)this = &unk_26C3F7918;
  int v2 = (wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 8);
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32));
  wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(v2);

  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

void wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  *(void *)this = &unk_26C3F7C88;
  if (*((unsigned char *)this + 16))
  {
    uint64_t v2 = *((void *)this + 1);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    MEMORY[0x21668CE30](v3, 0x1000C8077774924);
  }

  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

{
  uint64_t vars8;

  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor(this);

  JUMPOUT(0x21668CE50);
}

void wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this)
{
  *(void *)this = &unk_26C3F78E8;
  if (*((unsigned char *)this + 12)
    && !wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Close(this))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 118);
    uint64_t v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, "close() failed: ");
    uint64_t v3 = strerror(*((_DWORD *)this + 4));
    unsigned int v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, v3);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  wireless_diagnostics::google::protobuf::io::CopyingInputStream::~CopyingInputStream(this);
}

{
  uint64_t vars8;

  wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(this);

  JUMPOUT(0x21668CE50);
}

wireless_diagnostics::google::protobuf::io::FileInputStream *wireless_diagnostics::google::protobuf::io::FileInputStream::FileInputStream(wireless_diagnostics::google::protobuf::io::FileInputStream *this, int a2, int a3)
{
  *(void *)this = &unk_26C3F7918;
  *((void *)this + 1) = &unk_26C3F78E8;
  *((_DWORD *)this + 4) = a2;
  *((_WORD *)this + 10) = 0;
  *((_DWORD *)this + 6) = 0;
  *((unsigned char *)this + 28) = 0;
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor((uint64_t)this + 32, (wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 8), a3);
  return this;
}

void sub_2135A9D48(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(v1);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor(uint64_t this, wireless_diagnostics::google::protobuf::io::CopyingInputStream *a2, int a3)
{
  *(void *)this = &unk_26C3F7C88;
  *(void *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(_DWORD *)(this + 44) = 0;
  *(_DWORD *)(this + 48) = 0;
  *(_DWORD *)(this + 40) = v3;
  return this;
}

{
  int v3;

  *(void *)this = &unk_26C3F7C88;
  *(void *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(_DWORD *)(this + 44) = 0;
  *(_DWORD *)(this + 48) = 0;
  *(_DWORD *)(this + 40) = v3;
  return this;
}

uint64_t _GLOBAL__sub_I_generated_message_util_cc()
{
  wireless_diagnostics::google::protobuf::internal::kEmptyString = 0;
  *(void *)algn_26AA45B68 = 0;
  qword_26AA45B70 = 0;
  return __cxa_atexit(MEMORY[0x263F8C0B8], &wireless_diagnostics::google::protobuf::internal::kEmptyString, &dword_2135A5000);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::IsInitialized(wireless_diagnostics::google::protobuf::internal::ExtensionSet **this)
{
  int v1 = this + 1;
  uint64_t v2 = *this;
  if (*this == (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(this + 1)) {
    return 1;
  }
  while (1)
  {
    if (wireless_diagnostics::google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[*((unsigned __int8 *)v2
                                                                                                  + 48)] != 10)
      goto LABEL_14;
    if (*((unsigned char *)v2 + 49)) {
      break;
    }
    if ((*((unsigned char *)v2 + 50) & 1) == 0)
    {
      uint64_t v5 = **((void **)v2 + 5);
      if ((*((unsigned char *)v2 + 50) & 0x10) != 0)
      {
        if (((*(uint64_t (**)(void))(v5 + 56))() & 1) == 0) {
          return 0;
        }
      }
      else
      {
        uint64_t result = (*(uint64_t (**)(void))(v5 + 40))();
        if (!result) {
          return result;
        }
      }
    }
LABEL_14:
    int v7 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((void *)v2 + 1);
    if (v7)
    {
      do
      {
        unsigned int v8 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v7;
        int v7 = *(wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v7;
      }
      while (v7);
    }
    else
    {
      do
      {
        unsigned int v8 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((void *)v2 + 2);
        BOOL v9 = *v8 == v2;
        uint64_t v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v8;
      }
      while (!v9);
    }
    uint64_t v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v8;
    if (v8 == v1) {
      return 1;
    }
  }
  uint64_t v3 = *((void *)v2 + 5);
  if (*(int *)(v3 + 8) < 1) {
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  while (((*(uint64_t (**)(void))(**(void **)(*(void *)v3 + 8 * v4) + 40))(*(void *)(*(void *)v3 + 8 * v4)) & 1) != 0)
  {
    ++v4;
    uint64_t v3 = *((void *)v2 + 5);
    if (v4 >= *(int *)(v3 + 8)) {
      goto LABEL_14;
    }
  }
  return 0;
}

wireless_diagnostics::google::protobuf::io::FileOutputStream *wireless_diagnostics::google::protobuf::io::FileOutputStream::FileOutputStream(wireless_diagnostics::google::protobuf::io::FileOutputStream *this, int a2, int a3)
{
  *(void *)this = &unk_26C3F79C0;
  *((void *)this + 1) = &unk_26C3F7998;
  *((_DWORD *)this + 4) = a2;
  *((_WORD *)this + 10) = 0;
  *((_DWORD *)this + 6) = 0;
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor((uint64_t)this + 32, (wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 8), a3);
  return this;
}

void sub_2135A9FA0(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(v1);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor(uint64_t this, wireless_diagnostics::google::protobuf::io::CopyingOutputStream *a2, int a3)
{
  *(void *)this = &unk_26C3F7CC8;
  *(void *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(_DWORD *)(this + 40) = v3;
  *(_DWORD *)(this + 44) = 0;
  return this;
}

{
  int v3;

  *(void *)this = &unk_26C3F7CC8;
  *(void *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(_DWORD *)(this + 40) = v3;
  *(_DWORD *)(this + 44) = 0;
  return this;
}

unsigned char *wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned char *a2, unsigned __int8 *a3)
{
  *a2 = this | 0x80;
  if (this < 0x80)
  {
    *a2 = this & 0x7F;
    return a2 + 1;
  }
  else
  {
    a2[1] = (this >> 7) | 0x80;
    if (this < 0x4000)
    {
      a2[1] = (this >> 7) & 0x7F;
      return a2 + 2;
    }
    else
    {
      a2[2] = (this >> 14) | 0x80;
      if (this < 0x200000)
      {
        a2[2] = (this >> 14) & 0x7F;
        return a2 + 3;
      }
      else
      {
        a2[3] = (this >> 21) | 0x80;
        if (this >> 28)
        {
          a2[4] = this >> 28;
          return a2 + 5;
        }
        else
        {
          int v3 = a2 + 4;
          a2[3] = (this >> 21) & 0x7F;
        }
      }
    }
  }
  return v3;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::GetDirectBufferPointer(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, const void **a2, int *a3)
{
  int v6 = (const void *)*((void *)this + 1);
  if (*((_DWORD *)this + 4) == v6)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this);
    if (!result) {
      return result;
    }
    int v6 = (const void *)*((void *)this + 1);
  }
  *a2 = v6;
  *a3 = *((_DWORD *)this + 4) - *((_DWORD *)this + 2);
  return 1;
}

unsigned char *wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(unint64_t this, unsigned char *a2, unsigned __int8 *a3)
{
  unint64_t v3 = this >> 28;
  if (HIBYTE(this))
  {
    if (HIBYTE(this) >= 0x80)
    {
      a2[9] = -127;
      unsigned int v4 = 10;
    }
    else
    {
      unsigned int v4 = 9;
    }
    a2[8] = HIBYTE(this) | 0x80;
    goto LABEL_10;
  }
  if (v3)
  {
    if (!(v3 >> 14))
    {
      if (v3 < 0x80)
      {
        unsigned int v4 = 5;
LABEL_13:
        a2[4] = v3 | 0x80;
        goto LABEL_14;
      }
      unsigned int v4 = 6;
LABEL_12:
      a2[5] = (this >> 35) | 0x80;
      goto LABEL_13;
    }
    if (v3 < 0x200000)
    {
      unsigned int v4 = 7;
      goto LABEL_11;
    }
    unsigned int v4 = 8;
LABEL_10:
    a2[7] = (this >> 49) | 0x80;
LABEL_11:
    a2[6] = (this >> 42) | 0x80;
    goto LABEL_12;
  }
  if (this >> 14)
  {
    if (this < 0x200000)
    {
      unsigned int v4 = 3;
      goto LABEL_15;
    }
    unsigned int v4 = 4;
LABEL_14:
    a2[3] = (this >> 21) | 0x80;
LABEL_15:
    a2[2] = (this >> 14) | 0x80;
    goto LABEL_16;
  }
  if (this < 0x80)
  {
    unsigned int v4 = 1;
    goto LABEL_17;
  }
  unsigned int v4 = 2;
LABEL_16:
  a2[1] = (this >> 7) | 0x80;
LABEL_17:
  *a2 = this | 0x80;
  a2[v4 - 1] &= ~0x80u;
  return &a2[v4];
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0) {
    return 0;
  }
  uint64_t v4 = *((void *)this + 1);
  unint64_t v3 = (void *)((char *)this + 8);
  uint64_t v5 = *((void *)this + 2) - v4;
  BOOL v6 = __OFSUB__(a2, v5);
  int v7 = a2 - v5;
  if ((v7 < 0) ^ v6 | (v7 == 0))
  {
    *unint64_t v3 = v4 + a2;
    return 1;
  }
  if (*((int *)this + 11) >= 1)
  {
    uint64_t result = 0;
    *unint64_t v3 = v4 + (int)v5;
    return result;
  }
  *unint64_t v3 = 0;
  *((void *)this + 2) = 0;
  int v9 = *((_DWORD *)this + 10);
  if (*((_DWORD *)this + 12) < v9) {
    int v9 = *((_DWORD *)this + 12);
  }
  int v10 = *((_DWORD *)this + 6);
  uint64_t v11 = (v9 - v10);
  if ((int)v11 < v7)
  {
    if ((int)v11 >= 1)
    {
      *((_DWORD *)this + 6) = v9;
      (*(void (**)(void, uint64_t))(**(void **)this + 32))(*(void *)this, v11);
    }
    return 0;
  }
  *((_DWORD *)this + 6) = v10 + v7;
  int v12 = *(uint64_t (**)(void))(**(void **)this + 32);

  return v12();
}

void wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, wireless_diagnostics::google::protobuf::internal *a2, const std::string::value_type *a3, const char *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ((int)a2 > 2005000)
  {
    int v21 = 3;
    int v22 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    int v23 = 62;
    memset(&v24, 0, sizeof(v24));
    std::string::append(&v24, "This program requires version ");
    wireless_diagnostics::google::protobuf::internal::VersionString(a2, &v18);
    if ((v20 & 0x80u) == 0) {
      int v7 = (const std::string::value_type *)&v18;
    }
    else {
      int v7 = (const std::string::value_type *)v18;
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v8 = v20;
    }
    else {
      std::string::size_type v8 = v19;
    }
    std::string::append(&v24, v7, v8);
    std::string::append(&v24, " of the Protocol Buffer runtime library, but the installed version is ");
    snprintf(__str, 0x80uLL, "%d.%d.%d", 2, 5, 0);
    char v26 = 0;
    std::string::basic_string[abi:ne180100]<0>(&__p, __str);
    if ((v17 & 0x80u) == 0) {
      p_p = (const std::string::value_type *)&__p;
    }
    else {
      p_p = (const std::string::value_type *)__p;
    }
    if ((v17 & 0x80u) == 0) {
      std::string::size_type v10 = v17;
    }
    else {
      std::string::size_type v10 = v16;
    }
    std::string::append(&v24, p_p, v10);
    std::string::append(&v24, ".  Please update your library.  If you compiled the program yourself, make sure that your headers are from the same version of Protocol Buffers as your link-time library.  (Version verification failed in \"");
    std::string::append(&v24, a3);
    std::string::append(&v24, "\".)");
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v21);
    if ((char)v17 < 0) {
      operator delete(__p);
    }
    if ((char)v20 < 0) {
      operator delete(v18);
    }
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v24.__r_.__value_.__l.__data_);
    }
  }
  if ((int)this < 2005000)
  {
    int v21 = 3;
    int v22 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    int v23 = 73;
    memset(&v24, 0, sizeof(v24));
    std::string::append(&v24, "This program was compiled against version ");
    wireless_diagnostics::google::protobuf::internal::VersionString(this, &v18);
    if ((v20 & 0x80u) == 0) {
      uint64_t v11 = (const std::string::value_type *)&v18;
    }
    else {
      uint64_t v11 = (const std::string::value_type *)v18;
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v12 = v20;
    }
    else {
      std::string::size_type v12 = v19;
    }
    std::string::append(&v24, v11, v12);
    std::string::append(&v24, " of the Protocol Buffer runtime library, which is not compatible with the installed version (");
    snprintf(__str, 0x80uLL, "%d.%d.%d", 2, 5, 0);
    char v26 = 0;
    std::string::basic_string[abi:ne180100]<0>(&__p, __str);
    if ((v17 & 0x80u) == 0) {
      int v13 = (const std::string::value_type *)&__p;
    }
    else {
      int v13 = (const std::string::value_type *)__p;
    }
    if ((v17 & 0x80u) == 0) {
      std::string::size_type v14 = v17;
    }
    else {
      std::string::size_type v14 = v16;
    }
    std::string::append(&v24, v13, v14);
    std::string::append(&v24, ").  Contact the program author for an update.  If you compiled the program yourself, make sure that your headers are from the same version of Protocol Buffers as your link-time library.  (Version verification failed in \"");
    std::string::append(&v24, a3);
    std::string::append(&v24, "\".)");
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v21);
    if ((char)v17 < 0) {
      operator delete(__p);
    }
    if ((char)v20 < 0) {
      operator delete(v18);
    }
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v24.__r_.__value_.__l.__data_);
    }
  }
}

void sub_2135AA60C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
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

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedExtensionFinder::Find(uint64_t a1, unsigned int a2, _OWORD *a3)
{
    return 0;
  v7[0] = *(void *)(a1 + 8);
  v7[1] = a2;
  if (!v4) {
    return 0;
  }
  long long v5 = *((_OWORD *)v4 + 3);
  *a3 = *((_OWORD *)v4 + 2);
  a3[1] = v5;
  return 1;
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RegisterExtension(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, const wireless_diagnostics::google::protobuf::MessageLite *a2, int a3, char a4, char a5)
{
  char v7 = a3;
  unsigned int v8 = a2;
  switch(a3)
  {
    case 14:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 116);
      std::string::size_type v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (type) != (WireFormatLite::TYPE_ENUM): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v15, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
LABEL_7:
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
      break;
    case 11:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 117);
      uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (type) != (WireFormatLite::TYPE_MESSAGE): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v15, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
      goto LABEL_7;
    case 10:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 118);
      std::string::size_type v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (type) != (WireFormatLite::TYPE_GROUP): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v15, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v12);
      goto LABEL_7;
  }
  LOBYTE(v13) = v7;
  BYTE1(v13) = a4;
  BYTE2(v13) = a5;
  uint64_t v14 = 0;
}

void sub_2135AA818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::anonymous namespace'::Register(uint64_t a1, unsigned int a2, long long *a3)
{
  __dmb(0xBu);
  if (v6 != 2)
  {
    *(void *)&long long v17 = &unk_26C3F7D88;
    LOBYTE(v18) = 0;
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)&v17);
  }
  *(void *)&long long v17 = a1;
  *((void *)&v17 + 1) = a2;
  long long v7 = a3[1];
  long long v18 = *a3;
  long long v19 = v7;
  if ((v8 & 1) == 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v17, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 86);
    int v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<((std::string *)&v17, "Multiple extension registrations for type \"");
    (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a1 + 16))(__p, a1);
    std::string::size_type v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v9, (const std::string::value_type *)__p);
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "\", field number ");
    std::string::size_type v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, a2);
    long long v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, ".");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v17);
  }
}

void sub_2135AA9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RegisterEnumExtension(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, const wireless_diagnostics::google::protobuf::MessageLite *a2, int a3, char a4, char a5, uint64_t a6, BOOL (*a7)(int))
{
  char v10 = a3;
  unsigned int v11 = a2;
  if (a3 != 14)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 140);
    long long v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (type) == (WireFormatLite::TYPE_ENUM): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v17, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
  }
  LOBYTE(v14) = v10;
  BYTE1(v14) = a4;
  BYTE2(v14) = a5;
  *((void *)&v14 + 1) = wireless_diagnostics::google::protobuf::internal::CallNoArgValidityFunc;
  uint64_t v15 = a6;
  uint64_t v16 = 0;
}

void sub_2135AAAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::CallNoArgValidityFunc(wireless_diagnostics::google::protobuf::internal *this, const void *a2)
{
  return ((uint64_t (*)(const void *))this)(a2);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RegisterMessageExtension(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, const wireless_diagnostics::google::protobuf::MessageLite *a2, char a3, char a4, char a5, uint64_t a6, const wireless_diagnostics::google::protobuf::MessageLite *a7)
{
  unsigned int v11 = a2;
  if ((a3 & 0xFE) != 0xA)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v17, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 153);
    long long v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v17, "CHECK failed: type == WireFormatLite::TYPE_MESSAGE || type == WireFormatLite::TYPE_GROUP: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v16, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v17[0].__r_.__value_.__l.__data_);
  }
  LOBYTE(v14) = a3;
  BYTE1(v14) = a4;
  BYTE2(v14) = a5;
  *((void *)&v14 + 1) = a6;
  uint64_t v15 = 0;
}

void sub_2135AAB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

int *wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Free(int *this)
{
  int v1 = wireless_diagnostics::google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[*((unsigned __int8 *)this
                                                                                                + 8)];
  if (*((unsigned char *)this + 9))
  {
    switch(*((unsigned char *)this + 8))
    {
      case 1:
        if (!*(void *)this) {
          return this;
        }
        if (**(void **)this) {
          goto LABEL_29;
        }
        goto LABEL_39;
      case 2:
        if (!*(void *)this) {
          return this;
        }
        if (**(void **)this) {
LABEL_29:
        }
          MEMORY[0x21668CE30]();
        goto LABEL_39;
      case 3:
      case 4:
      case 6:
      case 0x10:
      case 0x12:
        if (!*(void *)this) {
          return this;
        }
        if (**(void **)this) {
          goto LABEL_33;
        }
        goto LABEL_39;
      case 5:
      case 7:
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x11:
        if (!*(void *)this) {
          return this;
        }
        if (**(void **)this) {
          goto LABEL_33;
        }
        goto LABEL_39;
      case 8:
        if (!*(void *)this) {
          return this;
        }
        if (**(void **)this) {
LABEL_33:
        }
          MEMORY[0x21668CE30]();
        break;
      case 9:
      case 0xC:
        if (!*(void *)this) {
          return this;
        }
        wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(*(int **)this);
        break;
      case 0xA:
      case 0xB:
        if (!*(void *)this) {
          return this;
        }
        wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>(*(uint64_t **)this);
        break;
      default:
        return this;
    }
    goto LABEL_39;
  }
  if (v1 == 10)
  {
    char v3 = *((unsigned char *)this + 10);
    this = *(int **)this;
    if ((v3 & 0x10) != 0)
    {
      if (!this) {
        return this;
      }
      uint64_t v4 = *(uint64_t (**)(void))(*(void *)this + 8);
    }
    else
    {
      if (!this) {
        return this;
      }
      uint64_t v4 = *(uint64_t (**)(void))(*(void *)this + 8);
    }
    return (int *)v4();
  }
  if (v1 == 9)
  {
    uint64_t v2 = *(int **)this;
    if (*(void *)this)
    {
      if (*((char *)v2 + 23) < 0) {
        operator delete(*(void **)v2);
      }
LABEL_39:
      JUMPOUT(0x21668CE50);
    }
  }
  return this;
}

BOOL wireless_diagnostics::google::protobuf::internal::ExtensionSet::Has(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v4 = (char *)*((void *)this + 1);
  uint64_t v2 = (char *)this + 8;
  char v3 = v4;
  if (!v4) {
    return 0;
  }
  long long v5 = v2;
  do
  {
    int v6 = *((_DWORD *)v3 + 8);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      char v8 = (char **)v3;
    }
    else {
      char v8 = (char **)(v3 + 8);
    }
    if (!v7) {
      long long v5 = v3;
    }
    char v3 = *v8;
  }
  while (*v8);
  return v5 != v2 && *((_DWORD *)v5 + 8) <= a2 && (v5[50] & 1) == 0;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::NumExtensions(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this)
{
  char v3 = *(char **)this;
  int v1 = (char *)this + 8;
  uint64_t v2 = v3;
  if (v3 == v1) {
    return 0;
  }
  LODWORD(v4) = 0;
  do
  {
    if (v2[50]) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = (v4 + 1);
    }
    long long v5 = (char *)*((void *)v2 + 1);
    if (v5)
    {
      do
      {
        int v6 = v5;
        long long v5 = *(char **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        int v6 = (char *)*((void *)v2 + 2);
        BOOL v7 = *(void *)v6 == (void)v2;
        uint64_t v2 = v6;
      }
      while (!v7);
    }
    uint64_t v2 = v6;
  }
  while (v6 != v1);
  return v4;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionSize(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v4 = (char *)*((void *)this + 1);
  uint64_t v2 = (char *)this + 8;
  char v3 = v4;
  if (!v4) {
    return 0;
  }
  long long v5 = v2;
  do
  {
    int v6 = *((_DWORD *)v3 + 8);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      char v8 = (char **)v3;
    }
    else {
      char v8 = (char **)(v3 + 8);
    }
    if (!v7) {
      long long v5 = v3;
    }
    char v3 = *v8;
  }
  while (*v8);
  if (v5 != v2 && *((_DWORD *)v5 + 8) <= a2) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::GetSize((wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *)(v5 + 40));
  }
  else {
    return 0;
  }
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::GetSize(wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *this)
{
  switch(*((unsigned char *)this + 8))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xA:
    case 0xB:
    case 0xC:
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
    case 0x11:
    case 0x12:
      uint64_t result = *(unsigned int *)(*(void *)this + 8);
      break;
    default:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v4, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 1415);
      uint64_t v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v4, "Can't get here.");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v3, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v4[0].__r_.__value_.__l.__data_);
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_2135AAFE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionType(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v4 = (char *)*((void *)this + 1);
  uint64_t v2 = (char *)this + 8;
  char v3 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  long long v5 = v2;
  do
  {
    int v6 = *((_DWORD *)v3 + 8);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      char v8 = (char **)v3;
    }
    else {
      char v8 = (char **)(v3 + 8);
    }
    if (!v7) {
      long long v5 = v3;
    }
    char v3 = *v8;
  }
  while (*v8);
  if (v5 != v2 && *((_DWORD *)v5 + 8) <= a2)
  {
    if (v5[50])
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 208);
      unsigned int v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v13, "Don't lookup extension types if they aren't present (2). ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v12, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    }
    return v5[48];
  }
  else
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 204);
    int v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v13, "Don't lookup extension types if they aren't present (1). ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v12, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    return 0;
  }
}

void sub_2135AB110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned char *wireless_diagnostics::google::protobuf::internal::ExtensionSet::ClearExtension(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v4 = *((void *)this + 1);
  uint64_t result = (char *)this + 8;
  uint64_t v3 = v4;
  if (v4)
  {
    uint64_t v5 = (uint64_t)result;
    do
    {
      int v6 = *(_DWORD *)(v3 + 32);
      BOOL v7 = v6 < a2;
      if (v6 >= a2) {
        char v8 = (uint64_t *)v3;
      }
      else {
        char v8 = (uint64_t *)(v3 + 8);
      }
      if (!v7) {
        uint64_t v5 = v3;
      }
      uint64_t v3 = *v8;
    }
    while (*v8);
    if ((unsigned char *)v5 != result && *(_DWORD *)(v5 + 32) <= a2) {
      return wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Clear((unsigned char *)(v5 + 40));
    }
  }
  return result;
}

unsigned char *wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Clear(unsigned char *this)
{
  int v1 = this;
  if (this[9])
  {
    switch(this[8])
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x10:
      case 0x11:
      case 0x12:
        *(_DWORD *)(*(void *)this + 8) = 0;
        break;
      case 9:
      case 0xC:
        uint64_t v5 = *(void *)this;
        this = (unsigned char *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(v5);
        break;
      case 0xA:
      case 0xB:
        uint64_t v6 = *(void *)this;
        this = (unsigned char *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>(v6);
        break;
      default:
        return this;
    }
  }
  else if ((this[10] & 1) == 0)
  {
    int v2 = wireless_diagnostics::google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[this[8]];
    if (v2 == 10)
    {
      uint64_t v4 = **(void **)this;
      if ((this[10] & 0x10) != 0) {
        this = (unsigned char *)(*(uint64_t (**)(void))(v4 + 88))();
      }
      else {
        this = (unsigned char *)(*(uint64_t (**)(void))(v4 + 32))();
      }
    }
    else if (v2 == 9)
    {
      uint64_t v3 = *(void **)this;
      if (*(char *)(*(void *)this + 23) < 0)
      {
        *(unsigned char *)*uint64_t v3 = 0;
        v3[1] = 0;
      }
      else
      {
        *(unsigned char *)uint64_t v3 = 0;
        *((unsigned char *)v3 + 23) = 0;
      }
    }
    v1[10] = v1[10] & 0xF0 | 1;
  }
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = v4;
      }
      uint64_t v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return *((unsigned int *)v6 + 10);
    }
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt32(uint64_t **a1, int a2, char a3, int a4, uint64_t *a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v10 = a2;
  uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((unsigned char *)result + 48) = a3;
    *((unsigned char *)result + 49) = 0;
  }
  *((unsigned char *)result + 50) &= 0xF0u;
  *((_DWORD *)result + 10) = a4;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::internal::ExtensionSet::MaybeNewExtension(uint64_t **a1, int a2, uint64_t *a3, void *a4)
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  int v9 = a2;
  uint64_t v6 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v9, (uint64_t)&v9);
  *a4 = v6 + 5;
  v6[7] = a3;
  return v7 != 0;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      int v9 = (char **)v4;
    }
    else {
      int v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 298);
    uint64_t v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }
  return *(unsigned int *)(**((void **)v6 + 5) + 4 * a3);
}

void sub_2135AB4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 298);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    char v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }
  *(_DWORD *)(**((void **)v8 + 5) + 4 * a3) = a4;
}

void sub_2135AB5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32(uint64_t **a1, int a2, char a3, char a4, int a5, uint64_t a6)
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  int v15 = a2;
  uint64_t result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v15, (uint64_t)&v15);
  *(void *)(result + 56) = a6;
  if (v11)
  {
    *(unsigned char *)(result + 48) = a3;
    *(unsigned char *)(result + 49) = 1;
    *(unsigned char *)(result + 51) = a4;
    operator new();
  }
  uint64_t v12 = *(void *)(result + 40);
  int v13 = *(_DWORD *)(v12 + 8);
  if (v13 == *(_DWORD *)(v12 + 12))
  {
    uint64_t result = wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v12, v13 + 1);
    int v13 = *(_DWORD *)(v12 + 8);
  }
  uint64_t v14 = *(void *)v12;
  *(_DWORD *)(v12 + 8) = v13 + 1;
  *(_DWORD *)(v14 + 4 * v13) = a5;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = v4;
      }
      uint64_t v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return *((void *)v6 + 5);
    }
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt64(uint64_t **a1, int a2, char a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v10 = a2;
  uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((unsigned char *)result + 48) = a3;
    *((unsigned char *)result + 49) = 0;
  }
  *((unsigned char *)result + 50) &= 0xF0u;
  result[5] = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 299);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }
  return *(void *)(**((void **)v6 + 5) + 8 * a3);
}

void sub_2135AB830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, uint64_t a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 299);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    char v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }
  *(void *)(**((void **)v8 + 5) + 8 * a3) = a4;
}

void sub_2135AB914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64(uint64_t **a1, int a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  int v15 = a2;
  uint64_t result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v15, (uint64_t)&v15);
  *(void *)(result + 56) = a6;
  if (v11)
  {
    *(unsigned char *)(result + 48) = a3;
    *(unsigned char *)(result + 49) = 1;
    *(unsigned char *)(result + 51) = a4;
    operator new();
  }
  uint64_t v12 = *(void *)(result + 40);
  int v13 = *(_DWORD *)(v12 + 8);
  if (v13 == *(_DWORD *)(v12 + 12))
  {
    uint64_t result = wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(v12, v13 + 1);
    int v13 = *(_DWORD *)(v12 + 8);
  }
  uint64_t v14 = *(void *)v12;
  *(_DWORD *)(v12 + 8) = v13 + 1;
  *(void *)(v14 + 8 * v13) = a5;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetUInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = v4;
      }
      uint64_t v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return *((unsigned int *)v6 + 10);
    }
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt32(uint64_t **a1, int a2, char a3, int a4, uint64_t *a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v10 = a2;
  uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((unsigned char *)result + 48) = a3;
    *((unsigned char *)result + 49) = 0;
  }
  *((unsigned char *)result + 50) &= 0xF0u;
  *((_DWORD *)result + 10) = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedUInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 300);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }
  return *(unsigned int *)(**((void **)v6 + 5) + 4 * a3);
}

void sub_2135ABB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedUInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 300);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    char v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }
  *(_DWORD *)(**((void **)v8 + 5) + 4 * a3) = a4;
}

void sub_2135ABC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32(uint64_t **a1, int a2, char a3, char a4, int a5, uint64_t a6)
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  int v15 = a2;
  uint64_t result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v15, (uint64_t)&v15);
  *(void *)(result + 56) = a6;
  if (v11)
  {
    *(unsigned char *)(result + 48) = a3;
    *(unsigned char *)(result + 49) = 1;
    *(unsigned char *)(result + 51) = a4;
    operator new();
  }
  uint64_t v12 = *(void *)(result + 40);
  int v13 = *(_DWORD *)(v12 + 8);
  if (v13 == *(_DWORD *)(v12 + 12))
  {
    uint64_t result = wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v12, v13 + 1);
    int v13 = *(_DWORD *)(v12 + 8);
  }
  uint64_t v14 = *(void *)v12;
  *(_DWORD *)(v12 + 8) = v13 + 1;
  *(_DWORD *)(v14 + 4 * v13) = a5;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetUInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = v4;
      }
      uint64_t v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return *((void *)v6 + 5);
    }
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt64(uint64_t **a1, int a2, char a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v10 = a2;
  uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((unsigned char *)result + 48) = a3;
    *((unsigned char *)result + 49) = 0;
  }
  *((unsigned char *)result + 50) &= 0xF0u;
  result[5] = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedUInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 301);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }
  return *(void *)(**((void **)v6 + 5) + 8 * a3);
}

void sub_2135ABED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedUInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, uint64_t a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 301);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    char v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }
  *(void *)(**((void **)v8 + 5) + 8 * a3) = a4;
}

void sub_2135ABFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64(uint64_t **a1, int a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  int v15 = a2;
  uint64_t result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v15, (uint64_t)&v15);
  *(void *)(result + 56) = a6;
  if (v11)
  {
    *(unsigned char *)(result + 48) = a3;
    *(unsigned char *)(result + 49) = 1;
    *(unsigned char *)(result + 51) = a4;
    operator new();
  }
  uint64_t v12 = *(void *)(result + 40);
  int v13 = *(_DWORD *)(v12 + 8);
  if (v13 == *(_DWORD *)(v12 + 12))
  {
    uint64_t result = wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(v12, v13 + 1);
    int v13 = *(_DWORD *)(v12 + 8);
  }
  uint64_t v14 = *(void *)v12;
  *(_DWORD *)(v12 + 8) = v13 + 1;
  *(void *)(v14 + 8 * v13) = a5;
  return result;
}

float wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetFloat(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, float a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = (float *)v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = (float *)v4;
      }
      uint64_t v4 = *v9;
    }
    while (*v9);
    if (v6 != (float *)v3 && *((_DWORD *)v6 + 8) <= a2 && (*((unsigned char *)v6 + 50) & 1) == 0) {
      return v6[10];
    }
  }
  return result;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetFloat(uint64_t **a1, int a2, char a3, uint64_t *a4, float a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v10 = a2;
  float result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a4;
  if (v9)
  {
    *((unsigned char *)result + 48) = a3;
    *((unsigned char *)result + 49) = 0;
  }
  *((unsigned char *)result + 50) &= 0xF0u;
  *((float *)result + 10) = a5;
  return result;
}

float wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedFloat(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 302);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }
  return *(float *)(**((void **)v6 + 5) + 4 * a3);
}

void sub_2135AC228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedFloat(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, float a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 302);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    char v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }
  *(float *)(**((void **)v8 + 5) + 4 * a3) = a4;
}

void sub_2135AC30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddFloat(uint64_t **a1, int a2, char a3, char a4, uint64_t a5, float a6)
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  int v15 = a2;
  uint64_t result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v15, (uint64_t)&v15);
  *(void *)(result + 56) = a5;
  if (v11)
  {
    *(unsigned char *)(result + 48) = a3;
    *(unsigned char *)(result + 49) = 1;
    *(unsigned char *)(result + 51) = a4;
    operator new();
  }
  uint64_t v12 = *(void *)(result + 40);
  int v13 = *(_DWORD *)(v12 + 8);
  if (v13 == *(_DWORD *)(v12 + 12))
  {
    uint64_t result = wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v12, v13 + 1);
    int v13 = *(_DWORD *)(v12 + 8);
  }
  uint64_t v14 = *(void *)v12;
  *(_DWORD *)(v12 + 8) = v13 + 1;
  *(float *)(v14 + 4 * v13) = a6;
  return result;
}

double wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetDouble(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, double a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = (double *)v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = (double *)v4;
      }
      uint64_t v4 = *v9;
    }
    while (*v9);
    if (v6 != (double *)v3 && *((_DWORD *)v6 + 8) <= a2 && (*((unsigned char *)v6 + 50) & 1) == 0) {
      return v6[5];
    }
  }
  return result;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetDouble(uint64_t **a1, int a2, char a3, uint64_t *a4, double a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v10 = a2;
  double result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a4;
  if (v9)
  {
    *((unsigned char *)result + 48) = a3;
    *((unsigned char *)result + 49) = 0;
  }
  *((unsigned char *)result + 50) &= 0xF0u;
  *((double *)result + 5) = a5;
  return result;
}

double wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedDouble(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 303);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }
  return *(double *)(**((void **)v6 + 5) + 8 * a3);
}

void sub_2135AC578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedDouble(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, double a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 303);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    char v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }
  *(double *)(**((void **)v8 + 5) + 8 * a3) = a4;
}

void sub_2135AC65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddDouble(uint64_t **a1, int a2, char a3, char a4, uint64_t a5, double a6)
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  int v15 = a2;
  uint64_t result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v15, (uint64_t)&v15);
  *(void *)(result + 56) = a5;
  if (v11)
  {
    *(unsigned char *)(result + 48) = a3;
    *(unsigned char *)(result + 49) = 1;
    *(unsigned char *)(result + 51) = a4;
    operator new();
  }
  uint64_t v12 = *(void *)(result + 40);
  int v13 = *(_DWORD *)(v12 + 8);
  if (v13 == *(_DWORD *)(v12 + 12))
  {
    uint64_t result = wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(v12, v13 + 1);
    int v13 = *(_DWORD *)(v12 + 8);
  }
  uint64_t v14 = *(void *)v12;
  *(_DWORD *)(v12 + 8) = v13 + 1;
  *(double *)(v14 + 8 * v13) = a6;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetBool(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = v4;
      }
      uint64_t v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return v6[40] != 0;
    }
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetBool(uint64_t **a1, int a2, char a3, char a4, uint64_t *a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v10 = a2;
  uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((unsigned char *)result + 48) = a3;
    *((unsigned char *)result + 49) = 0;
  }
  *((unsigned char *)result + 50) &= 0xF0u;
  *((unsigned char *)result + 40) = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedBool(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 304);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }
  return *(unsigned __int8 *)(**((void **)v6 + 5) + a3);
}

void sub_2135AC8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedBool(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, char a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 304);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    char v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }
  *(unsigned char *)(**((void **)v8 + 5) + a3) = a4;
}

void sub_2135AC9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddBool(uint64_t **a1, int a2, char a3, char a4, char a5, uint64_t a6)
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  int v15 = a2;
  uint64_t result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v15, (uint64_t)&v15);
  *(void *)(result + 56) = a6;
  if (v11)
  {
    *(unsigned char *)(result + 48) = a3;
    *(unsigned char *)(result + 49) = 1;
    *(unsigned char *)(result + 51) = a4;
    operator new();
  }
  uint64_t v12 = *(void *)(result + 40);
  int v13 = *(_DWORD *)(v12 + 8);
  if (v13 == *(_DWORD *)(v12 + 12))
  {
    uint64_t result = wireless_diagnostics::google::protobuf::RepeatedField<BOOL>::Reserve(v12, v13 + 1);
    int v13 = *(_DWORD *)(v12 + 8);
  }
  uint64_t v14 = *(void *)v12;
  *(_DWORD *)(v12 + 8) = v13 + 1;
  *(unsigned char *)(v14 + v13) = a5;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v4 = (char *)this + 8;
  uint64_t v3 = (char *)*((void *)this + 1);
  if (!v3) {
    goto LABEL_11;
  }
  uint64_t v5 = (char *)this + 8;
  do
  {
    int v6 = *((_DWORD *)v3 + 8);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      BOOL v8 = (char **)v3;
    }
    else {
      BOOL v8 = (char **)(v3 + 8);
    }
    if (!v7) {
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v5 == v4 || *((_DWORD *)v5 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 312);
    int v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    BOOL v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v9, "no extension numbered ");
    char v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, a2);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    uint64_t v5 = v4;
  }
  return *((void *)v5 + 5);
}

void sub_2135ACB64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetEnum(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    int v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        int v6 = v4;
      }
      uint64_t v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return *((unsigned int *)v6 + 10);
    }
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetEnum(uint64_t **a1, int a2, char a3, int a4, uint64_t *a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v10 = a2;
  uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((unsigned char *)result + 48) = a3;
    *((unsigned char *)result + 49) = 0;
  }
  *((unsigned char *)result + 50) &= 0xF0u;
  *((_DWORD *)result + 10) = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedEnum(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      int v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 346);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    int v6 = v5;
  }
  return *(unsigned int *)(**((void **)v6 + 5) + 4 * a3);
}

void sub_2135ACD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedEnum(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  int v7 = (char *)this + 8;
  int v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    int v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 353);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    char v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }
  *(_DWORD *)(**((void **)v8 + 5) + 4 * a3) = a4;
}

void sub_2135ACDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddEnum(uint64_t **a1, int a2, char a3, char a4, int a5, uint64_t a6)
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  int v15 = a2;
  uint64_t result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v15, (uint64_t)&v15);
  *(void *)(result + 56) = a6;
  if (v11)
  {
    *(unsigned char *)(result + 48) = a3;
    *(unsigned char *)(result + 49) = 1;
    *(unsigned char *)(result + 51) = a4;
    operator new();
  }
  uint64_t v12 = *(void *)(result + 40);
  int v13 = *(_DWORD *)(v12 + 8);
  if (v13 == *(_DWORD *)(v12 + 12))
  {
    uint64_t result = wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v12, v13 + 1);
    int v13 = *(_DWORD *)(v12 + 8);
  }
  uint64_t v14 = *(void *)v12;
  *(_DWORD *)(v12 + 8) = v13 + 1;
  *(_DWORD *)(v14 + 4 * v13) = a5;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetString(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v3 = a1 + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *(_DWORD *)(v4 + 32);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
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
    if (v6 != v3 && *(_DWORD *)(v6 + 32) <= a2 && (*(unsigned char *)(v6 + 50) & 1) == 0) {
      return *(void *)(v6 + 40);
    }
  }
  return a3;
}

uint64_t *wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString(uint64_t **a1, int a2, char a3, uint64_t *a4)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v10 = a2;
  uint64_t v6 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  int v7 = v6;
  v6[7] = a4;
  if (v8)
  {
    *((unsigned char *)v6 + 48) = a3;
    *((unsigned char *)v6 + 49) = 0;
    operator new();
  }
  uint64_t result = v6[5];
  *((unsigned char *)v7 + 50) &= 0xF0u;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedString(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      int v9 = (char **)v4;
    }
    else {
      int v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 407);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }
  return *(void *)(**((void **)v6 + 5) + 8 * a3);
}

void sub_2135AD07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRepeatedString(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      int v9 = (char **)v4;
    }
    else {
      int v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 414);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }
  return *(void *)(**((void **)v6 + 5) + 8 * a3);
}

void sub_2135AD154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddString(uint64_t **a1, int a2, char a3, uint64_t a4)
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  int v13 = a2;
  uint64_t v6 = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v13, (uint64_t)&v13);
  *(void *)(v6 + 56) = a4;
  if (v7)
  {
    *(unsigned char *)(v6 + 48) = a3;
    *(unsigned char *)(v6 + 49) = 1;
    *(unsigned char *)(v6 + 51) = 0;
    operator new();
  }
  uint64_t v8 = *(void *)(v6 + 40);
  int v9 = *(_DWORD *)(v8 + 12);
  uint64_t v10 = *(int *)(v8 + 8);
  if ((int)v10 >= v9)
  {
    if (v9 == *(_DWORD *)(v8 + 16))
    {
      uint64_t v6 = wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v8, v9 + 1);
      int v9 = *(_DWORD *)(v8 + 12);
    }
    *(_DWORD *)(v8 + 12) = v9 + 1;
    wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New((wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)v6);
  }
  uint64_t v11 = *(void *)v8;
  *(_DWORD *)(v8 + 8) = v10 + 1;
  return *(void *)(v11 + 8 * v10);
}

const wireless_diagnostics::google::protobuf::MessageLite *wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetMessage(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, const wireless_diagnostics::google::protobuf::MessageLite *a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (!v5) {
    return a3;
  }
  uint64_t v6 = v3;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      int v9 = (char **)v4;
    }
    else {
      int v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v3 || *((_DWORD *)v6 + 8) > a2) {
    return a3;
  }
  if ((v6[50] & 0x10) == 0) {
    return (const wireless_diagnostics::google::protobuf::MessageLite *)*((void *)v6 + 5);
  }
  return (const wireless_diagnostics::google::protobuf::MessageLite *)(*(uint64_t (**)(void, const wireless_diagnostics::google::protobuf::MessageLite *))(**((void **)v6 + 5) + 24))(*((void *)v6 + 5), a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableMessage(uint64_t **a1, int a2, char a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  int v13 = a2;
  BOOL v8 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v13, (uint64_t)&v13);
  int v9 = v8;
  v8[7] = a5;
  if (v10)
  {
    *((unsigned char *)v8 + 48) = a3;
    *((unsigned char *)v8 + 49) = 0;
    *((unsigned char *)v8 + 50) &= 0xFu;
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 24))(a4);
    v9[5] = (uint64_t *)result;
    *((unsigned char *)v9 + 50) &= 0xF0u;
  }
  else
  {
    char v12 = *((unsigned char *)v8 + 50);
    *((unsigned char *)v8 + 50) = v12 & 0xF0;
    uint64_t result = (uint64_t)v8[5];
    if ((v12 & 0x10) != 0) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 32))(result, a4);
    }
  }
  return result;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetAllocatedMessage(uint64_t **a1, int a2, char a3, uint64_t *a4, uint64_t *a5)
{
  if (a5)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    int v13 = a2;
    uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v13, (uint64_t)&v13);
    char v10 = result;
    result[7] = a4;
    if (v11)
    {
      *((unsigned char *)result + 48) = a3;
      *((unsigned char *)result + 49) = 0;
      *((unsigned char *)result + 50) &= 0xFu;
    }
    else
    {
      char v12 = *((unsigned char *)result + 50);
      uint64_t result = (uint64_t **)result[5];
      if ((v12 & 0x10) != 0)
      {
        uint64_t result = (uint64_t **)((uint64_t (*)(uint64_t **, uint64_t *))(*result)[5])(result, a5);
        goto LABEL_5;
      }
      if (result) {
        uint64_t result = (uint64_t **)((uint64_t (*)(uint64_t **))(*result)[1])(result);
      }
    }
    v10[5] = a5;
LABEL_5:
    *((unsigned char *)v10 + 50) &= 0xF0u;
    return result;
  }
  return (uint64_t **)wireless_diagnostics::google::protobuf::internal::ExtensionSet::ClearExtension((wireless_diagnostics::google::protobuf::internal::ExtensionSet *)a1, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ReleaseMessage(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, const wireless_diagnostics::google::protobuf::MessageLite *a3)
{
  int v12 = a2;
  uint64_t v3 = (char *)*((void *)this + 1);
  if (!v3) {
    return 0;
  }
  uint64_t v5 = (char *)this + 8;
  do
  {
    int v6 = *((_DWORD *)v3 + 8);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      BOOL v8 = (char **)v3;
    }
    else {
      BOOL v8 = (char **)(v3 + 8);
    }
    if (!v7) {
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v5 == (char *)this + 8 || *((_DWORD *)v5 + 8) > a2) {
    return 0;
  }
  uint64_t v9 = *((void *)v5 + 5);
  if ((v5[50] & 0x10) != 0)
  {
    uint64_t v9 = (*(uint64_t (**)(void, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)v9 + 48))(*((void *)v5 + 5), a3);
    uint64_t v11 = *((void *)v5 + 5);
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    }
  }
  std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__erase_unique<int>((uint64_t)this, &v12);
  return v9;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedMessage(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      uint64_t v9 = (char **)v4;
    }
    else {
      uint64_t v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      int v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 539);
    char v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    int v6 = v5;
  }
  return *(void *)(**((void **)v6 + 5) + 8 * a3);
}

void sub_2135AD680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRepeatedMessage(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      uint64_t v9 = (char **)v4;
    }
    else {
      uint64_t v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      int v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 546);
    char v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    int v6 = v5;
  }
  return *(void *)(**((void **)v6 + 5) + 8 * a3);
}

void sub_2135AD758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddMessage(uint64_t **a1, int a2, char a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  int v16 = a2;
  BOOL v8 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v16, (uint64_t)&v16);
  uint64_t v9 = v8;
  v8[7] = a5;
  if (v10)
  {
    *((unsigned char *)v8 + 48) = a3;
    *((unsigned char *)v8 + 49) = 1;
    operator new();
  }
  uint64_t v11 = v8[5];
  uint64_t v12 = *((int *)v11 + 2);
  if ((int)v12 >= *((_DWORD *)v11 + 3)
    || (uint64_t v13 = *v11, *((_DWORD *)v11 + 2) = v12 + 1, (v14 = *(void *)(v13 + 8 * v12)) == 0))
  {
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 24))(a4);
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::AddAllocated<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>((int *)v9[5], v14);
  }
  return v14;
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RemoveLast(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v3 = (char *)this + 8;
  int v2 = (char *)*((void *)this + 1);
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v4 = (char *)this + 8;
  do
  {
    int v5 = *((_DWORD *)v2 + 8);
    BOOL v6 = v5 < a2;
    if (v5 >= a2) {
      int v7 = (char **)v2;
    }
    else {
      int v7 = (char **)(v2 + 8);
    }
    if (!v6) {
      uint64_t v4 = v2;
    }
    int v2 = *v7;
  }
  while (*v7);
  if (v4 == v3 || *((_DWORD *)v4 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 585);
    BOOL v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v17, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    uint64_t v4 = v3;
  }
  switch(v4[48])
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
      --*(_DWORD *)(*((void *)v4 + 5) + 8);
      break;
    case 9:
    case 12:
      char v10 = (uint64_t *)*((void *)v4 + 5);
      uint64_t v11 = *v10;
      uint64_t v12 = *((int *)v10 + 2) - 1;
      *((_DWORD *)v10 + 2) = v12;
      uint64_t v13 = *(void *)(v11 + 8 * v12);
      if (*(char *)(v13 + 23) < 0)
      {
        **(unsigned char **)uint64_t v13 = 0;
        *(void *)(v13 + 8) = 0;
      }
      else
      {
        *(unsigned char *)uint64_t v13 = 0;
        *(unsigned char *)(v13 + 23) = 0;
      }
      break;
    case 10:
    case 11:
      uint64_t v14 = (uint64_t *)*((void *)v4 + 5);
      uint64_t v15 = *v14;
      uint64_t v16 = *((int *)v14 + 2) - 1;
      *((_DWORD *)v14 + 2) = v16;
      (*(void (**)(void))(**(void **)(v15 + 8 * v16) + 32))(*(void *)(v15 + 8 * v16));
      break;
    default:
      return;
  }
}

void sub_2135AD9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ReleaseLast(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v3 = (char *)this + 8;
  int v2 = (char *)*((void *)this + 1);
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v4 = (char *)this + 8;
  do
  {
    int v5 = *((_DWORD *)v2 + 8);
    BOOL v6 = v5 < a2;
    if (v5 >= a2) {
      int v7 = (char **)v2;
    }
    else {
      int v7 = (char **)(v2 + 8);
    }
    if (!v6) {
      uint64_t v4 = v2;
    }
    int v2 = *v7;
  }
  while (*v7);
  if (v4 == v3 || *((_DWORD *)v4 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 626);
    BOOL v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v15, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    uint64_t v4 = v3;
  }
  char v10 = (uint64_t *)*((void *)v4 + 5);
  uint64_t v11 = *v10;
  int v12 = *((_DWORD *)v10 + 3);
  uint64_t v13 = *((int *)v10 + 2);
  *((_DWORD *)v10 + 2) = v13 - 1;
  uint64_t result = *(void *)(v11 + 8 * (v13 - 1));
  *((_DWORD *)v10 + 3) = v12 - 1;
  if ((int)v13 < v12) {
    *(void *)(v11 + 8 * (v13 - 1)) = *(void *)(v11 + 8 * (v12 - 1));
  }
  return result;
}

void sub_2135ADB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SwapElements(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  int v7 = (char *)this + 8;
  BOOL v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    BOOL v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 636);
    int v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v25, "CHECK failed: iter != extensions_.end(): ");
    uint64_t v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v24, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v25[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }
  switch(v8[48])
  {
    case 1:
      uint64_t v18 = **((void **)v8 + 5);
      uint64_t v19 = *(void *)(v18 + 8 * a3);
      *(void *)(v18 + 8 * a3) = *(void *)(v18 + 8 * a4);
      *(void *)(v18 + 8 * a4) = v19;
      break;
    case 2:
      uint64_t v20 = **((void **)v8 + 5);
      int v21 = *(_DWORD *)(v20 + 4 * a3);
      *(_DWORD *)(v20 + 4 * a3) = *(_DWORD *)(v20 + 4 * a4);
      *(_DWORD *)(v20 + 4 * a4) = v21;
      break;
    case 3:
    case 4:
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 16:
    case 18:
      uint64_t v14 = **((void **)v8 + 5);
      uint64_t v15 = *(void *)(v14 + 8 * a3);
      *(void *)(v14 + 8 * a3) = *(void *)(v14 + 8 * a4);
      *(void *)(v14 + 8 * a4) = v15;
      break;
    case 5:
    case 7:
    case 13:
    case 14:
    case 15:
    case 17:
      uint64_t v16 = **((void **)v8 + 5);
      int v17 = *(_DWORD *)(v16 + 4 * a3);
      *(_DWORD *)(v16 + 4 * a3) = *(_DWORD *)(v16 + 4 * a4);
      *(_DWORD *)(v16 + 4 * a4) = v17;
      break;
    case 8:
      uint64_t v22 = **((void **)v8 + 5);
      char v23 = *(unsigned char *)(v22 + a3);
      *(unsigned char *)(v22 + a3) = *(unsigned char *)(v22 + a4);
      *(unsigned char *)(v22 + a4) = v23;
      break;
    default:
      return;
  }
}

void sub_2135ADCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned char *wireless_diagnostics::google::protobuf::internal::ExtensionSet::Clear(unsigned char *this)
{
  int v1 = this + 8;
  int v2 = *(void **)this;
  if (*(unsigned char **)this != this + 8)
  {
    do
    {
      this = wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Clear((unsigned char *)v2 + 40);
      uint64_t v3 = (void *)v2[1];
      if (v3)
      {
        do
        {
          uint64_t v4 = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          uint64_t v4 = (void *)v2[2];
          BOOL v5 = *v4 == (void)v2;
          int v2 = v4;
        }
        while (!v5);
      }
      int v2 = v4;
    }
    while (v4 != v1);
  }
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MergeFrom(uint64_t this, const wireless_diagnostics::google::protobuf::internal::ExtensionSet **a2)
{
  int v2 = a2 + 1;
  uint64_t v3 = *a2;
  if (*a2 != (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(a2 + 1))
  {
    uint64_t v4 = (uint64_t **)this;
    while (1)
    {
      if (*((unsigned char *)v3 + 49))
      {
        int v5 = *((_DWORD *)v3 + 8);
        uint64_t v6 = *((void *)v3 + 7);
        uint64_t v49 = 0;
        uint64_t v50 = 0;
        uint64_t v51 = 0;
        int v48 = v5;
        this = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(v4, &v48, (uint64_t)&v48);
        uint64_t v8 = this;
        *(void *)(this + 56) = v6;
        if (v7)
        {
          *(unsigned char *)(this + 48) = *((unsigned char *)v3 + 48);
          *(unsigned char *)(this + 51) = *((unsigned char *)v3 + 51);
          *(unsigned char *)(this + 49) = 1;
        }
        switch(*((unsigned char *)v3 + 48))
        {
          case 1:
            if (v7) {
              operator new();
            }
            uint64_t v9 = *((void *)v3 + 5);
            int v12 = *(_DWORD *)(v9 + 8);
            if (v12) {
              goto LABEL_29;
            }
            break;
          case 2:
            if (v7) {
              operator new();
            }
            uint64_t v9 = *((void *)v3 + 5);
            int v10 = *(_DWORD *)(v9 + 8);
            if (v10) {
              goto LABEL_33;
            }
            break;
          case 3:
          case 0x10:
          case 0x12:
            if (v7) {
              operator new();
            }
            uint64_t v9 = *((void *)v3 + 5);
            int v12 = *(_DWORD *)(v9 + 8);
            if (v12) {
              goto LABEL_29;
            }
            break;
          case 4:
          case 6:
            if (v7) {
              operator new();
            }
            uint64_t v9 = *((void *)v3 + 5);
            int v12 = *(_DWORD *)(v9 + 8);
            if (v12)
            {
LABEL_29:
              uint64_t v13 = *(void *)(this + 40);
              wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(v13, *(_DWORD *)(v13 + 8) + v12);
              uint64_t v14 = (void *)(*(void *)v13 + 8 * *(int *)(v13 + 8));
              uint64_t v15 = *(const void **)v9;
              size_t v16 = 8 * *(int *)(v9 + 8);
              goto LABEL_34;
            }
            break;
          case 5:
          case 0xE:
          case 0xF:
          case 0x11:
            if (v7) {
              operator new();
            }
            uint64_t v9 = *((void *)v3 + 5);
            int v10 = *(_DWORD *)(v9 + 8);
            if (v10) {
              goto LABEL_33;
            }
            break;
          case 7:
          case 0xD:
            if (v7) {
              operator new();
            }
            uint64_t v9 = *((void *)v3 + 5);
            int v10 = *(_DWORD *)(v9 + 8);
            if (v10)
            {
LABEL_33:
              uint64_t v13 = *(void *)(this + 40);
              wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v13, *(_DWORD *)(v13 + 8) + v10);
              uint64_t v14 = (void *)(*(void *)v13 + 4 * *(int *)(v13 + 8));
              uint64_t v15 = *(const void **)v9;
              size_t v16 = 4 * *(int *)(v9 + 8);
              goto LABEL_34;
            }
            break;
          case 8:
            if (v7) {
              operator new();
            }
            uint64_t v9 = *((void *)v3 + 5);
            int v20 = *(_DWORD *)(v9 + 8);
            if (v20)
            {
              uint64_t v13 = *(void *)(this + 40);
              wireless_diagnostics::google::protobuf::RepeatedField<BOOL>::Reserve(v13, *(_DWORD *)(v13 + 8) + v20);
              uint64_t v14 = (void *)(*(void *)v13 + *(int *)(v13 + 8));
              uint64_t v15 = *(const void **)v9;
              size_t v16 = *(int *)(v9 + 8);
LABEL_34:
              this = (uint64_t)memcpy(v14, v15, v16);
              *(_DWORD *)(v13 + 8) += *(_DWORD *)(v9 + 8);
            }
            break;
          case 9:
          case 0xC:
            if (v7) {
              operator new();
            }
            uint64_t v28 = *(void *)(this + 40);
            uint64_t v29 = *((void *)v3 + 5);
            this = wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v28, *(_DWORD *)(v29 + 8) + *(_DWORD *)(v28 + 8));
            if (*(int *)(v29 + 8) >= 1)
            {
              uint64_t v30 = 0;
              do
              {
                v31 = *(const std::string **)(*(void *)v29 + 8 * v30);
                int v32 = *(_DWORD *)(v28 + 12);
                uint64_t v33 = *(int *)(v28 + 8);
                if ((int)v33 >= v32)
                {
                  if (v32 == *(_DWORD *)(v28 + 16))
                  {
                    this = wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v28, v32 + 1);
                    int v32 = *(_DWORD *)(v28 + 12);
                  }
                  *(_DWORD *)(v28 + 12) = v32 + 1;
                  wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New((wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)this);
                }
                uint64_t v34 = *(void *)v28;
                *(_DWORD *)(v28 + 8) = v33 + 1;
                this = (uint64_t)std::string::operator=(*(std::string **)(v34 + 8 * v33), v31);
                ++v30;
              }
              while (v30 < *(int *)(v29 + 8));
            }
            break;
          case 0xA:
          case 0xB:
            if (v7) {
              operator new();
            }
            uint64_t v21 = *((void *)v3 + 5);
            if (*(int *)(v21 + 8) >= 1)
            {
              uint64_t v22 = 0;
              do
              {
                uint64_t v23 = *(void *)(*(void *)v21 + 8 * v22);
                char v24 = *(uint64_t **)(v8 + 40);
                uint64_t v25 = *((int *)v24 + 2);
                if ((int)v25 >= *((_DWORD *)v24 + 3)
                  || (uint64_t v26 = *v24, *((_DWORD *)v24 + 2) = v25 + 1, (v27 = *(void *)(v26 + 8 * v25)) == 0))
                {
                  uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)v23 + 24))(v23);
                  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::AddAllocated<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>(*(int **)(v8 + 40), v27);
                }
                this = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v27 + 56))(v27, v23);
                ++v22;
              }
              while (v22 < *(int *)(v21 + 8));
            }
            break;
          default:
            goto LABEL_35;
        }
        goto LABEL_35;
      }
      if ((*((unsigned char *)v3 + 50) & 1) == 0) {
        break;
      }
LABEL_35:
      int v17 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((void *)v3 + 1);
      if (v17)
      {
        do
        {
          uint64_t v18 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v17;
          int v17 = *(const wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          uint64_t v18 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((void *)v3 + 2);
          BOOL v19 = *v18 == v3;
          uint64_t v3 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v18;
        }
        while (!v19);
      }
      uint64_t v3 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v18;
      if (v18 == v2) {
        return this;
      }
    }
    char v11 = *((unsigned char *)v3 + 48);
    switch(v11)
    {
      case 1:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetDouble(v4, *((_DWORD *)v3 + 8), v11, *((uint64_t **)v3 + 7), *((double *)v3 + 5));
        goto LABEL_35;
      case 2:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetFloat(v4, *((_DWORD *)v3 + 8), v11, *((uint64_t **)v3 + 7), *((float *)v3 + 10));
        goto LABEL_35;
      case 3:
      case 16:
      case 18:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt64(v4, *((_DWORD *)v3 + 8), v11, *((uint64_t **)v3 + 5), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      case 4:
      case 6:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt64(v4, *((_DWORD *)v3 + 8), v11, *((uint64_t **)v3 + 5), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      case 5:
      case 15:
      case 17:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt32(v4, *((_DWORD *)v3 + 8), v11, *((_DWORD *)v3 + 10), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      case 7:
      case 13:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt32(v4, *((_DWORD *)v3 + 8), v11, *((_DWORD *)v3 + 10), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      case 8:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetBool(v4, *((_DWORD *)v3 + 8), v11, *((unsigned char *)v3 + 40), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      case 9:
      case 12:
        v35 = (const std::string *)*((void *)v3 + 5);
        v36 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString(v4, *((_DWORD *)v3 + 8), v11, *((uint64_t **)v3 + 7));
        this = (uint64_t)std::string::operator=(v36, v35);
        goto LABEL_35;
      case 10:
      case 11:
        int v37 = *((_DWORD *)v3 + 8);
        v38 = (uint64_t *)*((void *)v3 + 7);
        uint64_t v49 = 0;
        uint64_t v50 = 0;
        uint64_t v51 = 0;
        int v48 = v37;
        v39 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(v4, &v48, (uint64_t)&v48);
        v40 = v39;
        v39[7] = v38;
        if (v41)
        {
          *((unsigned char *)v39 + 48) = *((unsigned char *)v3 + 48);
          *((unsigned char *)v39 + 51) = *((unsigned char *)v3 + 51);
          *((unsigned char *)v39 + 49) = 0;
          char v42 = *((unsigned char *)v39 + 50) & 0xF;
          if ((*((unsigned char *)v3 + 50) & 0x10) != 0)
          {
            *((unsigned char *)v39 + 50) = v42 | 0x10;
            uint64_t v47 = (*(uint64_t (**)(void))(**((void **)v3 + 5) + 16))(*((void *)v3 + 5));
            v40[5] = (uint64_t *)v47;
            this = (*(uint64_t (**)(uint64_t, void))(*(void *)v47 + 80))(v47, *((void *)v3 + 5));
            goto LABEL_86;
          }
          *((unsigned char *)v39 + 50) = v42;
          uint64_t v43 = (*(uint64_t (**)(void))(**((void **)v3 + 5) + 24))(*((void *)v3 + 5));
          v40[5] = (uint64_t *)v43;
LABEL_80:
          this = (*(uint64_t (**)(uint64_t, void))(*(void *)v43 + 56))(v43, *((void *)v3 + 5));
LABEL_86:
          *((unsigned char *)v40 + 50) &= 0xF0u;
          goto LABEL_35;
        }
        v44 = v39[5];
        uint64_t v45 = *((void *)v3 + 5);
        if ((*((unsigned char *)v3 + 50) & 0x10) != 0)
        {
          if ((*((unsigned char *)v39 + 50) & 0x10) != 0)
          {
            this = (*(uint64_t (**)(uint64_t *, uint64_t))(*v44 + 80))(v39[5], v45);
            goto LABEL_86;
          }
          uint64_t v45 = (*(uint64_t (**)(void, uint64_t *))(*(void *)v45 + 24))(*((void *)v3 + 5), v39[5]);
          uint64_t v46 = *v44;
        }
        else
        {
          uint64_t v46 = *v44;
          if ((*((unsigned char *)v39 + 50) & 0x10) != 0)
          {
            uint64_t v43 = (*(uint64_t (**)(uint64_t *, uint64_t))(v46 + 32))(v39[5], v45);
            goto LABEL_80;
          }
        }
        this = (*(uint64_t (**)(uint64_t *, uint64_t))(v46 + 56))(v44, v45);
        goto LABEL_86;
      case 14:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetEnum(v4, *((_DWORD *)v3 + 8), v11, *((_DWORD *)v3 + 10), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      default:
        goto LABEL_35;
    }
  }
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::FindExtensionInfoFromTag(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int *a4, unsigned __int8 *a5)
{
  char v6 = a2;
  *a4 = a2 >> 3;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a3 + 16))(a3))
  {
    int v7 = v6 & 7;
    if (a5[2]) {
      BOOL v8 = v7 == 2;
    }
    else {
      BOOL v8 = v7 == wireless_diagnostics::google::protobuf::internal::WireFormatLite::kWireTypeForFieldType[*a5];
    }
    int v9 = !v8;
  }
  else
  {
    int v9 = 1;
  }
  return v9 ^ 1u;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField(uint64_t **this, uint64_t a2, char **a3, wireless_diagnostics::google::protobuf::internal::ExtensionFinder *a4, wireless_diagnostics::google::protobuf::internal::FieldSkipper *a5)
{
  unsigned int v11 = 0;
  if (wireless_diagnostics::google::protobuf::internal::ExtensionSet::FindExtensionInfoFromTag((uint64_t)this, a2, (uint64_t)a4, &v11, v10))return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo(this, (wireless_diagnostics::google::protobuf::internal::WireFormatLite *)v11, (uint64_t)v10, a3, (uint64_t)a5); {
  else
  }
    return (*(uint64_t (**)(wireless_diagnostics::google::protobuf::internal::FieldSkipper *, char **, uint64_t))(*(void *)a5 + 16))(a5, a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo(uint64_t **a1, wireless_diagnostics::google::protobuf::internal::WireFormatLite *a2, uint64_t a3, char **this, uint64_t a5)
{
  if (!*(unsigned char *)(a3 + 2))
  {
    switch(*(unsigned char *)a3)
    {
      case 1:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!result) {
          return result;
        }
        if (*(unsigned char *)(a3 + 1)) {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddDouble(a1, (int)a2, 1, 0, *(void *)(a3 + 24), *(double *)&v65[0].__r_.__value_.__l.__data_);
        }
        else {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetDouble(a1, (int)a2, 1, *(uint64_t **)(a3 + 24), *(double *)&v65[0].__r_.__value_.__l.__data_);
        }
        return 1;
      case 2:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!result) {
          return result;
        }
        if (*(unsigned char *)(a3 + 1)) {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddFloat(a1, (int)a2, 2, 0, *(void *)(a3 + 24), *(float *)&v65[0].__r_.__value_.__l.__data_);
        }
        else {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetFloat(a1, (int)a2, 2, *(uint64_t **)(a3 + 24), *(float *)&v65[0].__r_.__value_.__l.__data_);
        }
        return 1;
      case 3:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!result) {
          return result;
        }
        uint64_t v30 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        v31 = *(uint64_t **)(a3 + 24);
        int v32 = a1;
        int v33 = (int)a2;
        char v34 = 3;
        if (!*(unsigned char *)(a3 + 1)) {
          goto LABEL_110;
        }
        goto LABEL_152;
      case 4:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!result) {
          return result;
        }
        v35 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        v36 = *(uint64_t **)(a3 + 24);
        int v37 = a1;
        int v38 = (int)a2;
        char v39 = 4;
        if (!*(unsigned char *)(a3 + 1)) {
          goto LABEL_113;
        }
        goto LABEL_119;
      case 5:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!result) {
          return result;
        }
        int data = (int)v65[0].__r_.__value_.__l.__data_;
        char v41 = *(uint64_t **)(a3 + 24);
        char v42 = a1;
        int v43 = (int)a2;
        char v44 = 5;
        if (!*(unsigned char *)(a3 + 1)) {
          goto LABEL_116;
        }
        goto LABEL_149;
      case 6:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!result) {
          return result;
        }
        v35 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        v36 = *(uint64_t **)(a3 + 24);
        int v37 = a1;
        int v38 = (int)a2;
        char v39 = 6;
        if (*(unsigned char *)(a3 + 1)) {
LABEL_119:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64(v37, v38, v39, 0, (uint64_t)v35, (uint64_t)v36);
        else {
LABEL_113:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt64(v37, v38, v39, v35, v36);
        return 1;
      case 7:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!result) {
          return result;
        }
        int v45 = (int)v65[0].__r_.__value_.__l.__data_;
        uint64_t v46 = *(uint64_t **)(a3 + 24);
        uint64_t v47 = a1;
        int v48 = (int)a2;
        char v49 = 7;
        if (*(unsigned char *)(a3 + 1)) {
          goto LABEL_122;
        }
        goto LABEL_136;
      case 8:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!result) {
          return result;
        }
        if (*(unsigned char *)(a3 + 1)) {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddBool(a1, (int)a2, 8, 0, LODWORD(v65[0].__r_.__value_.__l.__data_) != 0, *(void *)(a3 + 24));
        }
        else {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetBool(a1, (int)a2, 8, LODWORD(v65[0].__r_.__value_.__l.__data_) != 0, *(uint64_t **)(a3 + 24));
        }
        return 1;
      case 9:
        uint64_t v50 = *(uint64_t **)(a3 + 24);
        if (*(unsigned char *)(a3 + 1)) {
          uint64_t v51 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddString(a1, (int)a2, 9, (uint64_t)v50);
        }
        else {
          uint64_t v51 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString(a1, (int)a2, 9, v50);
        }
        return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString((uint64_t)this, v51);
      case 0xA:
        uint64_t v52 = *(void *)(a3 + 8);
        v53 = *(uint64_t **)(a3 + 24);
        if (*(unsigned char *)(a3 + 1)) {
          v54 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddMessage(a1, (int)a2, 10, v52, v53);
        }
        else {
          v54 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableMessage(a1, (int)a2, 10, v52, v53);
        }
        return (wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadGroup(a2, this, v54, v55) & 1) != 0;
      case 0xB:
        uint64_t v56 = *(void *)(a3 + 8);
        v57 = *(uint64_t **)(a3 + 24);
        if (*(unsigned char *)(a3 + 1)) {
          v58 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddMessage(a1, (int)a2, 11, v56, v57);
        }
        else {
          v58 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableMessage(a1, (int)a2, 11, v56, v57);
        }
        uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)this, v58, v59);
        if (result) {
          return 1;
        }
        return result;
      case 0xC:
        v60 = *(uint64_t **)(a3 + 24);
        if (*(unsigned char *)(a3 + 1)) {
          v61 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddString(a1, (int)a2, 12, (uint64_t)v60);
        }
        else {
          v61 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString(a1, (int)a2, 12, v60);
        }
        return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes((uint64_t)this, v61);
      case 0xD:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!result) {
          return result;
        }
        int v45 = (int)v65[0].__r_.__value_.__l.__data_;
        uint64_t v46 = *(uint64_t **)(a3 + 24);
        uint64_t v47 = a1;
        int v48 = (int)a2;
        char v49 = 13;
        if (*(unsigned char *)(a3 + 1)) {
LABEL_122:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32(v47, v48, v49, 0, v45, (uint64_t)v46);
        else {
LABEL_136:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt32(v47, v48, v49, v45, v46);
        return 1;
      case 0xE:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!result) {
          return result;
        }
        uint64_t data_low = LODWORD(v65[0].__r_.__value_.__l.__data_);
        if ((*(uint64_t (**)(void, void))(a3 + 8))(*(void *)(a3 + 16), LODWORD(v65[0].__r_.__value_.__l.__data_)))
        {
          if (*(unsigned char *)(a3 + 1)) {
            wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddEnum(a1, (int)a2, 14, 0, data_low, *(void *)(a3 + 24));
          }
          else {
            wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetEnum(a1, (int)a2, 14, data_low, *(uint64_t **)(a3 + 24));
          }
        }
        else
        {
          (*(void (**)(uint64_t, wireless_diagnostics::google::protobuf::internal::WireFormatLite *, uint64_t))(*(void *)a5 + 32))(a5, a2, data_low);
        }
        return 1;
      case 0xF:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!result) {
          return result;
        }
        int data = (int)v65[0].__r_.__value_.__l.__data_;
        char v41 = *(uint64_t **)(a3 + 24);
        char v42 = a1;
        int v43 = (int)a2;
        char v44 = 15;
        if (!*(unsigned char *)(a3 + 1)) {
          goto LABEL_116;
        }
        goto LABEL_149;
      case 0x10:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!result) {
          return result;
        }
        uint64_t v30 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        v31 = *(uint64_t **)(a3 + 24);
        int v32 = a1;
        int v33 = (int)a2;
        char v34 = 16;
        if (!*(unsigned char *)(a3 + 1)) {
          goto LABEL_110;
        }
        goto LABEL_152;
      case 0x11:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!result) {
          return result;
        }
        int data = -(v65[0].__r_.__value_.__s.__data_[0] & 1) ^ (LODWORD(v65[0].__r_.__value_.__l.__data_) >> 1);
        char v41 = *(uint64_t **)(a3 + 24);
        char v42 = a1;
        int v43 = (int)a2;
        char v44 = 17;
        if (*(unsigned char *)(a3 + 1)) {
LABEL_149:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32(v42, v43, v44, 0, data, (uint64_t)v41);
        else {
LABEL_116:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt32(v42, v43, v44, data, v41);
        break;
      case 0x12:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!result) {
          return result;
        }
        uint64_t v30 = (uint64_t *)(-(uint64_t)(v65[0].__r_.__value_.__s.__data_[0] & 1) ^ (v65[0].__r_.__value_.__r.__words[0] >> 1));
        v31 = *(uint64_t **)(a3 + 24);
        int v32 = a1;
        int v33 = (int)a2;
        char v34 = 18;
        if (*(unsigned char *)(a3 + 1)) {
LABEL_152:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64(v32, v33, v34, 0, (uint64_t)v30, (uint64_t)v31);
        else {
LABEL_110:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt64(v32, v33, v34, v30, v31);
        break;
      default:
        return 1;
    }
    return 1;
  }
  unsigned int v66 = 0;
  int v9 = this[1];
  if (v9 < this[2] && (*v9 & 0x80000000) == 0)
  {
    unsigned int v10 = *v9;
    unsigned int v66 = v10;
    this[1] = v9 + 1;
LABEL_11:
    int v12 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, v10);
    switch(*(unsigned char *)a3)
    {
      case 1:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        do
        {
          v65[0].__r_.__value_.__r.__words[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0; {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddDouble(a1, (int)a2, 1, 1, *(void *)(a3 + 24), *(double *)&v65[0].__r_.__value_.__l.__data_);
          }
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 2:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        while (1)
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0; {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddFloat(a1, (int)a2, 2, 1, *(void *)(a3 + 24), *(float *)&v65[0].__r_.__value_.__l.__data_);
          }
          if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) <= 0) {
            goto LABEL_13;
          }
        }
      case 3:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        do
        {
          v65[0].__r_.__value_.__r.__words[0] = 0;
          int v20 = this[1];
          if (v20 >= this[2] || *v20 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0; {
            uint64_t v21 = v65[0].__r_.__value_.__r.__words[0];
            }
          }
          else
          {
            uint64_t v21 = *v20;
            this[1] = v20 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64(a1, (int)a2, 3, 1, v21, *(void *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 4:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        do
        {
          v65[0].__r_.__value_.__r.__words[0] = 0;
          uint64_t v22 = this[1];
          if (v22 >= this[2] || *v22 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0; {
            uint64_t v23 = v65[0].__r_.__value_.__r.__words[0];
            }
          }
          else
          {
            uint64_t v23 = *v22;
            v65[0].__r_.__value_.__r.__words[0] = v23;
            this[1] = v22 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64(a1, (int)a2, 4, 1, v23, *(void *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 5:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        do
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          uint64_t v14 = this[1];
          if (v14 >= this[2] || *v14 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0; {
            int v15 = (int)v65[0].__r_.__value_.__l.__data_;
            }
          }
          else
          {
            int v15 = *v14;
            this[1] = v14 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32(a1, (int)a2, 5, 1, v15, *(void *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 6:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        while (1)
        {
          v65[0].__r_.__value_.__r.__words[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0; {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64(a1, (int)a2, 6, 1, (uint64_t)v65[0].__r_.__value_.__l.__data_, *(void *)(a3 + 24));
          }
          if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) <= 0) {
            goto LABEL_13;
          }
        }
      case 7:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        while (1)
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0; {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32(a1, (int)a2, 7, 1, (int)v65[0].__r_.__value_.__l.__data_, *(void *)(a3 + 24));
          }
          if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) <= 0) {
            goto LABEL_13;
          }
        }
      case 8:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        do
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          char v24 = this[1];
          if (v24 >= this[2] || *v24 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0; {
            int v25 = (int)v65[0].__r_.__value_.__l.__data_;
            }
          }
          else
          {
            int v25 = *v24;
            this[1] = v24 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddBool(a1, (int)a2, 8, 1, v25 != 0, *(void *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
        wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v65, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 943);
        uint64_t v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v65, "Non-primitive types can't be packed.");
        wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v64, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
        wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v65[0].__r_.__value_.__l.__data_);
        goto LABEL_13;
      case 0xD:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        do
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          size_t v16 = this[1];
          if (v16 >= this[2] || *v16 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0; {
            int v17 = (int)v65[0].__r_.__value_.__l.__data_;
            }
          }
          else
          {
            int v17 = *v16;
            LODWORD(v65[0].__r_.__value_.__l.__data_) = v17;
            this[1] = v16 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32(a1, (int)a2, 13, 1, v17, *(void *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 0xE:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        do
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          uint64_t v26 = this[1];
          if (v26 >= this[2] || *v26 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0; {
            uint64_t v27 = LODWORD(v65[0].__r_.__value_.__l.__data_);
            }
          }
          else
          {
            uint64_t v27 = *v26;
            this[1] = v26 + 1;
          }
          if ((*(unsigned int (**)(void, uint64_t))(a3 + 8))(*(void *)(a3 + 16), v27)) {
            wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddEnum(a1, (int)a2, 14, 1, v27, *(void *)(a3 + 24));
          }
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 0xF:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        while (1)
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0; {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32(a1, (int)a2, 15, 1, (int)v65[0].__r_.__value_.__l.__data_, *(void *)(a3 + 24));
          }
          if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) <= 0) {
            goto LABEL_13;
          }
        }
      case 0x10:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        while (1)
        {
          v65[0].__r_.__value_.__r.__words[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0; {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64(a1, (int)a2, 16, 1, (uint64_t)v65[0].__r_.__value_.__l.__data_, *(void *)(a3 + 24));
          }
          if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) <= 0) {
            goto LABEL_13;
          }
        }
      case 0x11:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        do
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          uint64_t v18 = this[1];
          if (v18 >= this[2] || *v18 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0; {
            unsigned int v19 = v65[0].__r_.__value_.__l.__data_;
            }
          }
          else
          {
            unsigned int v19 = *v18;
            this[1] = v18 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32(a1, (int)a2, 17, 1, -(v19 & 1) ^ (v19 >> 1), *(void *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 0x12:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1) {
          goto LABEL_13;
        }
        break;
      default:
        goto LABEL_13;
    }
    do
    {
      v65[0].__r_.__value_.__r.__words[0] = 0;
      uint64_t v28 = this[1];
      if (v28 >= this[2] || *v28 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0; {
        std::string::size_type v29 = v65[0].__r_.__value_.__r.__words[0];
        }
      }
      else
      {
        std::string::size_type v29 = *v28;
        this[1] = v28 + 1;
      }
      wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64(a1, (int)a2, 18, 1, -(uint64_t)(v29 & 1) ^ (v29 >> 1), *(void *)(a3 + 24));
    }
    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
LABEL_13:
    wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((uint64_t)this, v12);
    return 1;
  }
  if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, &v66))
  {
    unsigned int v10 = v66;
    goto LABEL_11;
  }
  return 0;
}

void sub_2135AF328(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  int v2 = (unsigned __int8 *)*((void *)this + 1);
  if ((unint64_t)v2 >= *((void *)this + 2) || (char)*v2 < 0) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, a2);
  }
  *a2 = *v2;
  *((void *)this + 1) = v2 + 1;
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadGroup(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, _DWORD *a2, wireless_diagnostics::google::protobuf::io::CodedInputStream *a3, wireless_diagnostics::google::protobuf::MessageLite *a4)
{
  int v4 = a2[14];
  int v5 = a2[15];
  a2[14] = v4 + 1;
  if (v4 >= v5) {
    return 0;
  }
  int v7 = (int)this;
  uint64_t result = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::io::CodedInputStream *))(*(void *)a3 + 64))(a3);
  if (result)
  {
    int v9 = a2[14];
    BOOL v10 = __OFSUB__(v9, 1);
    int v11 = v9 - 1;
    if (v11 < 0 == v10) {
      a2[14] = v11;
    }
    return a2[8] == ((8 * v7) | 4);
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, wireless_diagnostics::google::protobuf::MessageLite *a3)
{
  unsigned int v13 = 0;
  int v5 = (char *)*((void *)this + 1);
  if ((unint64_t)v5 >= *((void *)this + 2) || *v5 < 0)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v13);
    if (!result) {
      return result;
    }
  }
  else
  {
    unsigned int v13 = *v5;
    *((void *)this + 1) = v5 + 1;
  }
  int v7 = *((_DWORD *)this + 14);
  int v8 = *((_DWORD *)this + 15);
  *((_DWORD *)this + 14) = v7 + 1;
  if (v7 >= v8) {
    return 0;
  }
  int v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this, v13);
  uint64_t result = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::io::CodedInputStream *, wireless_diagnostics::google::protobuf::internal::WireFormatLite *))(*(void *)a2 + 64))(a2, this);
  if (!result) {
    return result;
  }
  if (!*((unsigned char *)this + 36)) {
    return 0;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((uint64_t)this, v9);
  int v10 = *((_DWORD *)this + 14);
  BOOL v11 = __OFSUB__(v10, 1);
  int v12 = v10 - 1;
  if (v12 < 0 == v11) {
    *((_DWORD *)this + 14) = v12;
  }
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField(uint64_t **this, uint64_t a2, char **a3, const wireless_diagnostics::google::protobuf::MessageLite *a4)
{
  char v6 = &unk_26C3F7D28;
  v5[0] = &unk_26C3F7DB0;
  v5[1] = a4;
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField(this, a2, a3, (wireless_diagnostics::google::protobuf::internal::ExtensionFinder *)v5, (wireless_diagnostics::google::protobuf::internal::FieldSkipper *)&v6);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::SerializeFieldWithCachedSizes(wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *this, wireless_diagnostics::google::protobuf::internal::WireFormatLite *a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  if (*((unsigned char *)this + 9))
  {
    if (*((unsigned char *)this + 11))
    {
      if (*((_DWORD *)this + 3))
      {
        wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * a2) | 2);
        wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, *((_DWORD *)this + 3));
        switch(*((unsigned char *)this + 8))
        {
          case 1:
            int v20 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v21 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, *(void *)(*v20 + 8 * v21++));
                int v20 = *(void **)this;
              }
              while (v21 < *(int *)(*(void *)this + 8));
            }
            break;
          case 2:
            uint64_t v22 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v23 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, *(_DWORD *)(*v22 + 4 * v23++));
                uint64_t v22 = *(void **)this;
              }
              while (v23 < *(int *)(*(void *)this + 8));
            }
            break;
          case 3:
            char v24 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v25 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, *(void *)(*v24 + 8 * v25++));
                char v24 = *(void **)this;
              }
              while (v25 < *(int *)(*(void *)this + 8));
            }
            break;
          case 4:
            uint64_t v26 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v27 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, *(void *)(*v26 + 8 * v27++));
                uint64_t v26 = *(void **)this;
              }
              while (v27 < *(int *)(*(void *)this + 8));
            }
            break;
          case 5:
            BOOL v11 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v12 = 0;
              do
              {
                unint64_t v13 = *(int *)(*v11 + 4 * v12);
                if ((v13 & 0x80000000) != 0) {
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, v13);
                }
                else {
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v13);
                }
                ++v12;
                BOOL v11 = *(void **)this;
              }
              while (v12 < *(int *)(*(void *)this + 8));
            }
            break;
          case 6:
            uint64_t v28 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v29 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, *(void *)(*v28 + 8 * v29++));
                uint64_t v28 = *(void **)this;
              }
              while (v29 < *(int *)(*(void *)this + 8));
            }
            break;
          case 7:
            uint64_t v30 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v31 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, *(_DWORD *)(*v30 + 4 * v31++));
                uint64_t v30 = *(void **)this;
              }
              while (v31 < *(int *)(*(void *)this + 8));
            }
            break;
          case 8:
            int v32 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v33 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, *(unsigned __int8 *)(*v32 + v33++));
                int v32 = *(void **)this;
              }
              while (v33 < *(int *)(*(void *)this + 8));
            }
            break;
          case 9:
          case 0xA:
          case 0xB:
          case 0xC:
            wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v95, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 1182);
            int v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v95, "Non-primitive types can't be packed.");
            wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v94, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
            wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v95[0].__r_.__value_.__l.__data_);
            break;
          case 0xD:
            uint64_t v14 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v15 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, *(_DWORD *)(*v14 + 4 * v15++));
                uint64_t v14 = *(void **)this;
              }
              while (v15 < *(int *)(*(void *)this + 8));
            }
            break;
          case 0xE:
            char v34 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v35 = 0;
              do
              {
                unint64_t v36 = *(int *)(*v34 + 4 * v35);
                if ((v36 & 0x80000000) != 0) {
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, v36);
                }
                else {
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v36);
                }
                ++v35;
                char v34 = *(void **)this;
              }
              while (v35 < *(int *)(*(void *)this + 8));
            }
            break;
          case 0xF:
            size_t v16 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v17 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, *(_DWORD *)(*v16 + 4 * v17++));
                size_t v16 = *(void **)this;
              }
              while (v17 < *(int *)(*(void *)this + 8));
            }
            break;
          case 0x10:
            int v37 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v38 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, *(void *)(*v37 + 8 * v38++));
                int v37 = *(void **)this;
              }
              while (v38 < *(int *)(*(void *)this + 8));
            }
            break;
          case 0x11:
            uint64_t v18 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v19 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (2 * *(_DWORD *)(*v18 + 4 * v19)) ^ (*(int *)(*v18 + 4 * v19) >> 31));
                ++v19;
                uint64_t v18 = *(void **)this;
              }
              while (v19 < *(int *)(*(void *)this + 8));
            }
            break;
          case 0x12:
            char v39 = *(void **)this;
            if (*(int *)(*(void *)this + 8) >= 1)
            {
              uint64_t v40 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, (2 * *(void *)(*v39 + 8 * v40)) ^ (*(uint64_t *)(*v39 + 8 * v40) >> 63));
                ++v40;
                char v39 = *(void **)this;
              }
              while (v40 < *(int *)(*(void *)this + 8));
            }
            break;
          default:
            return;
        }
      }
    }
    else
    {
      switch(*((unsigned char *)this + 8))
      {
        case 1:
          int v9 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v10 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(a2, a3, *(double *)(*v9 + 8 * v10++), a3);
              int v9 = *(void **)this;
            }
            while (v10 < *(int *)(*(void *)this + 8));
          }
          break;
        case 2:
          char v41 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v42 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(a2, a3, *(float *)(*v41 + 4 * v42++), a3);
              char v41 = *(void **)this;
            }
            while (v42 < *(int *)(*(void *)this + 8));
          }
          break;
        case 3:
          int v43 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v44 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(a2, *(void *)(*v43 + 8 * v44++), a3, a4);
              int v43 = *(void **)this;
            }
            while (v44 < *(int *)(*(void *)this + 8));
          }
          break;
        case 4:
          int v45 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v46 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(a2, *(void *)(*v45 + 8 * v46++), a3, a4);
              int v45 = *(void **)this;
            }
            while (v46 < *(int *)(*(void *)this + 8));
          }
          break;
        case 5:
          uint64_t v47 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v48 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(a2, *(_DWORD *)(*v47 + 4 * v48++), a3, a4);
              uint64_t v47 = *(void **)this;
            }
            while (v48 < *(int *)(*(void *)this + 8));
          }
          break;
        case 6:
          char v49 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v50 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed64(a2, *(void *)(*v49 + 8 * v50++), a3, a4);
              char v49 = *(void **)this;
            }
            while (v50 < *(int *)(*(void *)this + 8));
          }
          break;
        case 7:
          uint64_t v51 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v52 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed32(a2, *(_DWORD *)(*v51 + 4 * v52++), a3, a4);
              uint64_t v51 = *(void **)this;
            }
            while (v52 < *(int *)(*(void *)this + 8));
          }
          break;
        case 8:
          v53 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v54 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(a2, *(unsigned __int8 *)(*v53 + v54++), a3, a4);
              v53 = *(void **)this;
            }
            while (v54 < *(int *)(*(void *)this + 8));
          }
          break;
        case 9:
          v55 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v56 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString((int)a2, *(void *)(*v55 + 8 * v56++), a3);
              v55 = *(void **)this;
            }
            while (v56 < *(int *)(*(void *)this + 8));
          }
          break;
        case 0xA:
          v57 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v58 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroup(a2, *(void *)(*v57 + 8 * v58++), a3, a4);
              v57 = *(void **)this;
            }
            while (v58 < *(int *)(*(void *)this + 8));
          }
          break;
        case 0xB:
          v59 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v60 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(a2, *(void *)(*v59 + 8 * v60++), a3, a4);
              v59 = *(void **)this;
            }
            while (v60 < *(int *)(*(void *)this + 8));
          }
          break;
        case 0xC:
          v61 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v62 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes((int)a2, *(void *)(*v61 + 8 * v62++), a3);
              v61 = *(void **)this;
            }
            while (v62 < *(int *)(*(void *)this + 8));
          }
          break;
        case 0xD:
          v63 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v64 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(a2, *(_DWORD *)(*v63 + 4 * v64++), a3, a4);
              v63 = *(void **)this;
            }
            while (v64 < *(int *)(*(void *)this + 8));
          }
          break;
        case 0xE:
          v65 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v66 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(a2, *(_DWORD *)(*v65 + 4 * v66++), a3, a4);
              v65 = *(void **)this;
            }
            while (v66 < *(int *)(*(void *)this + 8));
          }
          break;
        case 0xF:
          v67 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v68 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed32(a2, *(_DWORD *)(*v67 + 4 * v68++), a3, a4);
              v67 = *(void **)this;
            }
            while (v68 < *(int *)(*(void *)this + 8));
          }
          break;
        case 0x10:
          v69 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v70 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed64(a2, *(void *)(*v69 + 8 * v70++), a3, a4);
              v69 = *(void **)this;
            }
            while (v70 < *(int *)(*(void *)this + 8));
          }
          break;
        case 0x11:
          v71 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v72 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(a2, *(_DWORD *)(*v71 + 4 * v72++), a3, a4);
              v71 = *(void **)this;
            }
            while (v72 < *(int *)(*(void *)this + 8));
          }
          break;
        case 0x12:
          v73 = *(void **)this;
          if (*(int *)(*(void *)this + 8) >= 1)
          {
            uint64_t v74 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt64(a2, *(void *)(*v73 + 8 * v74++), a3, a4);
              v73 = *(void **)this;
            }
            while (v74 < *(int *)(*(void *)this + 8));
          }
          break;
        default:
          return;
      }
    }
  }
  else if ((*((unsigned char *)this + 10) & 1) == 0)
  {
    switch(*((unsigned char *)this + 8))
    {
      case 1:
        double v8 = *(double *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(a2, a3, v8, a3);
        break;
      case 2:
        float v75 = *(float *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(a2, a3, v75, a3);
        break;
      case 3:
        unint64_t v76 = *(void *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(a2, v76, a3, a4);
        break;
      case 4:
        unint64_t v77 = *(void *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(a2, v77, a3, a4);
        break;
      case 5:
        signed int v78 = *(_DWORD *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(a2, v78, a3, a4);
        break;
      case 6:
        uint64_t v79 = *(void *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed64(a2, v79, a3, a4);
        break;
      case 7:
        int v80 = *(_DWORD *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed32(a2, v80, a3, a4);
        break;
      case 8:
        unsigned int v81 = *(unsigned __int8 *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(a2, v81, a3, a4);
        break;
      case 9:
        uint64_t v82 = *(void *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString((int)a2, v82, a3);
        break;
      case 0xA:
        uint64_t v83 = *(void *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroup(a2, v83, a3, a4);
        break;
      case 0xB:
        uint64_t v84 = *(void *)this;
        if ((*((unsigned char *)this + 10) & 0x10) != 0)
        {
          v92 = *(void (**)(uint64_t, wireless_diagnostics::google::protobuf::internal::WireFormatLite *))(*(void *)v84 + 104);
          uint64_t v93 = *(void *)this;
          v92(v93, a2);
        }
        else
        {
          wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(a2, v84, a3, a4);
        }
        break;
      case 0xC:
        uint64_t v85 = *(void *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes((int)a2, v85, a3);
        break;
      case 0xD:
        unsigned int v86 = *(_DWORD *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(a2, v86, a3, a4);
        break;
      case 0xE:
        signed int v87 = *(_DWORD *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(a2, v87, a3, a4);
        break;
      case 0xF:
        int v88 = *(_DWORD *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed32(a2, v88, a3, a4);
        break;
      case 0x10:
        uint64_t v89 = *(void *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed64(a2, v89, a3, a4);
        break;
      case 0x11:
        int v90 = *(_DWORD *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(a2, v90, a3, a4);
        break;
      case 0x12:
        uint64_t v91 = *(void *)this;
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt64(a2, v91, a3, a4);
        break;
      default:
        return;
    }
  }
}

void sub_2135B02DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::ByteSize(wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *this, const wireless_diagnostics::google::protobuf::MessageLite *a2)
{
  int v2 = (int)a2;
  if (*((unsigned char *)this + 9))
  {
    int v4 = *((unsigned __int8 *)this + 8);
    if (*((unsigned char *)this + 11))
    {
      switch(*((unsigned char *)this + 8))
      {
        case 1:
        case 6:
        case 0x10:
          unint64_t v6 = (8 * *(_DWORD *)(*(void *)this + 8));
          goto LABEL_67;
        case 2:
        case 7:
        case 0xF:
          unint64_t v6 = (4 * *(_DWORD *)(*(void *)this + 8));
          goto LABEL_67;
        case 3:
          uint64_t v22 = *(void **)this;
          if (*(int *)(*(void *)this + 8) < 1) {
            goto LABEL_5;
          }
          uint64_t v23 = 0;
          LODWORD(v6) = 0;
          do
          {
            unint64_t v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*(void *)(*v22 + 8 * v23++))
               + v6;
            uint64_t v22 = *(void **)this;
          }
          while (v23 < *(int *)(*(void *)this + 8));
          goto LABEL_67;
        case 4:
          char v24 = *(void **)this;
          if (*(int *)(*(void *)this + 8) < 1) {
            goto LABEL_5;
          }
          uint64_t v25 = 0;
          LODWORD(v6) = 0;
          do
          {
            unint64_t v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*(void *)(*v24 + 8 * v25++))
               + v6;
            char v24 = *(void **)this;
          }
          while (v25 < *(int *)(*(void *)this + 8));
          goto LABEL_67;
        case 5:
          uint64_t v26 = *(void *)this;
          if (*(int *)(*(void *)this + 8) < 1) {
            goto LABEL_5;
          }
          uint64_t v27 = 0;
          LODWORD(v6) = 0;
          do
          {
            uint64_t v28 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*(void *)v26 + 4 * v27);
            if ((v28 & 0x80000000) != 0)
            {
              int v29 = 10;
            }
            else if (v28 >= 0x80)
            {
              int v29 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v28);
              uint64_t v26 = *(void *)this;
            }
            else
            {
              int v29 = 1;
            }
            unint64_t v6 = (v29 + v6);
            ++v27;
          }
          while (v27 < *(int *)(v26 + 8));
          goto LABEL_67;
        case 8:
          unint64_t v6 = *(unsigned int *)(*(void *)this + 8);
          goto LABEL_67;
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
          wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v105, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 1294);
          int v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v105, "Non-primitive types can't be packed.");
          wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v104, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
          wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v105[0].__r_.__value_.__l.__data_);
          goto LABEL_5;
        case 0xD:
          uint64_t v14 = *(void *)this;
          if (*(int *)(*(void *)this + 8) < 1) {
            goto LABEL_5;
          }
          uint64_t v15 = 0;
          LODWORD(v6) = 0;
          do
          {
            size_t v16 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*(void *)v14 + 4 * v15);
            if (v16 >= 0x80)
            {
              int v17 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v16);
              uint64_t v14 = *(void *)this;
            }
            else
            {
              int v17 = 1;
            }
            unint64_t v6 = (v17 + v6);
            ++v15;
          }
          while (v15 < *(int *)(v14 + 8));
          goto LABEL_67;
        case 0xE:
          uint64_t v30 = *(void *)this;
          if (*(int *)(*(void *)this + 8) < 1) {
            goto LABEL_5;
          }
          uint64_t v31 = 0;
          LODWORD(v6) = 0;
          do
          {
            int v32 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*(void *)v30 + 4 * v31);
            if ((v32 & 0x80000000) != 0)
            {
              int v33 = 10;
            }
            else if (v32 >= 0x80)
            {
              int v33 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v32);
              uint64_t v30 = *(void *)this;
            }
            else
            {
              int v33 = 1;
            }
            unint64_t v6 = (v33 + v6);
            ++v31;
          }
          while (v31 < *(int *)(v30 + 8));
          goto LABEL_67;
        case 0x11:
          uint64_t v18 = *(void *)this;
          if (*(int *)(*(void *)this + 8) < 1) {
            goto LABEL_5;
          }
          uint64_t v19 = 0;
          LODWORD(v6) = 0;
          do
          {
            int v20 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((2
                                                                                   * *(_DWORD *)(*(void *)v18 + 4 * v19)) ^ (*(int *)(*(void *)v18 + 4 * v19) >> 31));
            if (v20 >= 0x80)
            {
              int v21 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v20);
              uint64_t v18 = *(void *)this;
            }
            else
            {
              int v21 = 1;
            }
            unint64_t v6 = (v21 + v6);
            ++v19;
          }
          while (v19 < *(int *)(v18 + 8));
          goto LABEL_67;
        case 0x12:
          char v34 = *(void **)this;
          if (*(int *)(*(void *)this + 8) < 1) {
            goto LABEL_5;
          }
          uint64_t v35 = 0;
          LODWORD(v6) = 0;
          do
          {
            unint64_t v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64((2 * *(void *)(*v34 + 8 * v35)) ^ (*(uint64_t *)(*v34 + 8 * v35) >> 63))
               + v6;
            ++v35;
            char v34 = *(void **)this;
          }
          while (v35 < *(int *)(*(void *)this + 8));
LABEL_67:
          *((_DWORD *)this + 3) = v6;
          if ((int)v6 >= 1)
          {
            if (v6 >= 0x80) {
              int v36 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v6);
            }
            else {
              int v36 = 1;
            }
            int v37 = v36 + v6;
            uint64_t v38 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((8 * v2) | 2u);
            if (v38 >= 0x80) {
              int v39 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v38);
            }
            else {
              int v39 = 1;
            }
            unint64_t v6 = (v37 + v39);
          }
          break;
        default:
LABEL_5:
          unint64_t v6 = 0;
          *((_DWORD *)this + 3) = 0;
          break;
      }
    }
    else
    {
      uint64_t v10 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(8 * a2);
      if (v10 >= 0x80) {
        int v11 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v10);
      }
      else {
        int v11 = 1;
      }
      int v12 = v11 << (v4 == 10);
      switch(*((unsigned char *)this + 8))
      {
        case 1:
        case 6:
        case 0x10:
          int v13 = v12 + 8;
          goto LABEL_21;
        case 2:
        case 7:
        case 0xF:
          int v13 = v12 + 4;
LABEL_21:
          unint64_t v6 = (*(_DWORD *)(*(void *)this + 8) * v13);
          break;
        case 3:
          int v43 = *(void **)this;
          int v44 = *(_DWORD *)(*(void *)this + 8);
          unint64_t v6 = (v44 * v12);
          if (v44 >= 1)
          {
            uint64_t v45 = 0;
            do
            {
              unint64_t v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*(void *)(*v43 + 8 * v45++))
                 + v6;
              int v43 = *(void **)this;
            }
            while (v45 < *(int *)(*(void *)this + 8));
          }
          break;
        case 4:
          uint64_t v46 = *(void **)this;
          int v47 = *(_DWORD *)(*(void *)this + 8);
          unint64_t v6 = (v47 * v12);
          if (v47 >= 1)
          {
            uint64_t v48 = 0;
            do
            {
              unint64_t v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*(void *)(*v46 + 8 * v48++))
                 + v6;
              uint64_t v46 = *(void **)this;
            }
            while (v48 < *(int *)(*(void *)this + 8));
          }
          break;
        case 5:
          uint64_t v49 = *(void *)this;
          int v50 = *(_DWORD *)(*(void *)this + 8);
          unint64_t v6 = (v50 * v12);
          if (v50 >= 1)
          {
            uint64_t v51 = 0;
            do
            {
              uint64_t v52 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*(void *)v49 + 4 * v51);
              if ((v52 & 0x80000000) != 0)
              {
                int v53 = 10;
              }
              else if (v52 >= 0x80)
              {
                int v53 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v52);
                uint64_t v49 = *(void *)this;
              }
              else
              {
                int v53 = 1;
              }
              unint64_t v6 = (v53 + v6);
              ++v51;
            }
            while (v51 < *(int *)(v49 + 8));
          }
          break;
        case 8:
          unint64_t v6 = (*(_DWORD *)(*(void *)this + 8) + *(_DWORD *)(*(void *)this + 8) * v12);
          break;
        case 9:
          uint64_t v54 = *(void *)this;
          int v55 = *(_DWORD *)(*(void *)this + 8);
          unint64_t v6 = (v55 * v12);
          if (v55 >= 1)
          {
            uint64_t v56 = 0;
            do
            {
              uint64_t v57 = *(void *)(*(void *)v54 + 8 * v56);
              int v58 = *(unsigned __int8 *)(v57 + 23);
              char v59 = v58;
              uint64_t v60 = *(void *)(v57 + 8);
              if ((v58 & 0x80u) == 0) {
                unint64_t v61 = *(unsigned __int8 *)(v57 + 23);
              }
              else {
                unint64_t v61 = v60;
              }
              if (v61 >= 0x80)
              {
                int v62 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v61);
                int v58 = *(unsigned __int8 *)(v57 + 23);
                uint64_t v60 = *(void *)(v57 + 8);
                uint64_t v54 = *(void *)this;
                char v59 = *(unsigned char *)(v57 + 23);
              }
              else
              {
                int v62 = 1;
              }
              if (v59 < 0) {
                int v58 = v60;
              }
              unint64_t v6 = (v62 + v6 + v58);
              ++v56;
            }
            while (v56 < *(int *)(v54 + 8));
          }
          break;
        case 0xA:
          v63 = *(void **)this;
          int v64 = *(_DWORD *)(*(void *)this + 8);
          unint64_t v6 = (v64 * v12);
          if (v64 >= 1)
          {
            uint64_t v65 = 0;
            do
            {
              unint64_t v6 = (*(unsigned int (**)(void))(**(void **)(*v63 + 8 * v65) + 72))(*(void *)(*v63 + 8 * v65))
                 + v6;
              ++v65;
              v63 = *(void **)this;
            }
            while (v65 < *(int *)(*(void *)this + 8));
          }
          break;
        case 0xB:
          uint64_t v66 = *(void **)this;
          int v67 = *(_DWORD *)(*(void *)this + 8);
          unint64_t v6 = (v67 * v12);
          if (v67 >= 1)
          {
            uint64_t v68 = 0;
            do
            {
              v69 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(*(uint64_t (**)(void))(**(void **)(*v66 + 8 * v68) + 72))(*(void *)(*v66 + 8 * v68));
              int v70 = (int)v69;
              if (v69 >= 0x80) {
                int v71 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v69);
              }
              else {
                int v71 = 1;
              }
              unint64_t v6 = (v70 + v6 + v71);
              ++v68;
              uint64_t v66 = *(void **)this;
            }
            while (v68 < *(int *)(*(void *)this + 8));
          }
          break;
        case 0xC:
          uint64_t v72 = *(void *)this;
          int v73 = *(_DWORD *)(*(void *)this + 8);
          unint64_t v6 = (v73 * v12);
          if (v73 >= 1)
          {
            uint64_t v74 = 0;
            do
            {
              uint64_t v75 = *(void *)(*(void *)v72 + 8 * v74);
              int v76 = *(unsigned __int8 *)(v75 + 23);
              char v77 = v76;
              uint64_t v78 = *(void *)(v75 + 8);
              if ((v76 & 0x80u) == 0) {
                unint64_t v79 = *(unsigned __int8 *)(v75 + 23);
              }
              else {
                unint64_t v79 = v78;
              }
              if (v79 >= 0x80)
              {
                int v80 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v79);
                int v76 = *(unsigned __int8 *)(v75 + 23);
                uint64_t v78 = *(void *)(v75 + 8);
                uint64_t v72 = *(void *)this;
                char v77 = *(unsigned char *)(v75 + 23);
              }
              else
              {
                int v80 = 1;
              }
              if (v77 < 0) {
                int v76 = v78;
              }
              unint64_t v6 = (v80 + v6 + v76);
              ++v74;
            }
            while (v74 < *(int *)(v72 + 8));
          }
          break;
        case 0xD:
          uint64_t v81 = *(void *)this;
          int v82 = *(_DWORD *)(*(void *)this + 8);
          unint64_t v6 = (v82 * v12);
          if (v82 >= 1)
          {
            uint64_t v83 = 0;
            do
            {
              uint64_t v84 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*(void *)v81 + 4 * v83);
              if (v84 >= 0x80)
              {
                int v85 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v84);
                uint64_t v81 = *(void *)this;
              }
              else
              {
                int v85 = 1;
              }
              unint64_t v6 = (v85 + v6);
              ++v83;
            }
            while (v83 < *(int *)(v81 + 8));
          }
          break;
        case 0xE:
          uint64_t v86 = *(void *)this;
          int v87 = *(_DWORD *)(*(void *)this + 8);
          unint64_t v6 = (v87 * v12);
          if (v87 >= 1)
          {
            uint64_t v88 = 0;
            do
            {
              uint64_t v89 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*(void *)v86 + 4 * v88);
              if ((v89 & 0x80000000) != 0)
              {
                int v90 = 10;
              }
              else if (v89 >= 0x80)
              {
                int v90 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v89);
                uint64_t v86 = *(void *)this;
              }
              else
              {
                int v90 = 1;
              }
              unint64_t v6 = (v90 + v6);
              ++v88;
            }
            while (v88 < *(int *)(v86 + 8));
          }
          break;
        case 0x11:
          uint64_t v91 = *(void *)this;
          int v92 = *(_DWORD *)(*(void *)this + 8);
          unint64_t v6 = (v92 * v12);
          if (v92 >= 1)
          {
            uint64_t v93 = 0;
            do
            {
              char v94 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((2
                                                                                     * *(_DWORD *)(*(void *)v91
                                                                                                 + 4 * v93)) ^ (*(int *)(*(void *)v91 + 4 * v93) >> 31));
              if (v94 >= 0x80)
              {
                int v95 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v94);
                uint64_t v91 = *(void *)this;
              }
              else
              {
                int v95 = 1;
              }
              unint64_t v6 = (v95 + v6);
              ++v93;
            }
            while (v93 < *(int *)(v91 + 8));
          }
          break;
        case 0x12:
          v96 = *(void **)this;
          int v97 = *(_DWORD *)(*(void *)this + 8);
          unint64_t v6 = (v97 * v12);
          if (v97 >= 1)
          {
            uint64_t v98 = 0;
            do
            {
              unint64_t v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64((2 * *(void *)(*v96 + 8 * v98)) ^ (*(uint64_t *)(*v96 + 8 * v98) >> 63))
                 + v6;
              ++v98;
              v96 = *(void **)this;
            }
            while (v98 < *(int *)(*(void *)this + 8));
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
    int v7 = *((unsigned __int8 *)this + 8);
    double v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(8 * a2);
    if (v8 >= 0x80) {
      int v9 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8);
    }
    else {
      int v9 = 1;
    }
    unint64_t v6 = (v9 << (v7 == 10));
    switch(*((unsigned char *)this + 8))
    {
      case 1:
      case 6:
      case 0x10:
        return (v6 + 8);
      case 2:
      case 7:
      case 0xF:
        return (v6 + 4);
      case 3:
      case 4:
        unint64_t v40 = *(void *)this;
        goto LABEL_169;
      case 5:
      case 0xE:
        char v41 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)this;
        if ((v41 & 0x80000000) == 0) {
          goto LABEL_165;
        }
        int v42 = 10;
        goto LABEL_170;
      case 8:
        return (v6 + 1);
      case 9:
      case 0xC:
        int v42 = wireless_diagnostics::google::protobuf::internal::WireFormatLite::StringSize(*(void *)this);
        goto LABEL_170;
      case 0xA:
        int v42 = (*(uint64_t (**)(void))(**(void **)this + 72))();
        goto LABEL_170;
      case 0xB:
        v99 = *(wireless_diagnostics::google::protobuf::internal::WireFormatLite **)this;
        if ((*((unsigned char *)this + 10) & 0x10) != 0)
        {
          v101 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(*(uint64_t (**)(wireless_diagnostics::google::protobuf::internal::WireFormatLite *))(*(void *)v99 + 64))(v99);
          int v102 = (int)v101;
          if (v101 >= 0x80) {
            int v103 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v101);
          }
          else {
            int v103 = 1;
          }
          unint64_t v6 = (v102 + v6 + v103);
        }
        else
        {
          int v42 = wireless_diagnostics::google::protobuf::internal::WireFormatLite::MessageSize(v99, a2);
LABEL_170:
          unint64_t v6 = (v42 + v6);
        }
        break;
      case 0xD:
        char v41 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)this;
        goto LABEL_165;
      case 0x11:
        char v41 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((2 * *(_DWORD *)this) ^ (*(int *)this >> 31));
LABEL_165:
        if (v41 >= 0x80) {
          int v42 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v41);
        }
        else {
          int v42 = 1;
        }
        goto LABEL_170;
      case 0x12:
        unint64_t v40 = (2 * *(void *)this) ^ (*(uint64_t *)this >> 63);
LABEL_169:
        int v42 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(v40);
        goto LABEL_170;
      default:
        return v6;
    }
  }
  return v6;
}

void sub_2135B0D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::StringSize(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 23);
  char v3 = v2;
  uint64_t v4 = *(void *)(a1 + 8);
  if ((v2 & 0x80u) == 0) {
    unint64_t v5 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    unint64_t v5 = v4;
  }
  if (v5 >= 0x80)
  {
    int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
    int v2 = *(unsigned __int8 *)(a1 + 23);
    uint64_t v4 = *(void *)(a1 + 8);
    char v3 = *(unsigned char *)(a1 + 23);
  }
  else
  {
    int v6 = 1;
  }
  if (v3 < 0) {
    int v2 = v4;
  }
  return (v6 + v2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::MessageSize(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, const wireless_diagnostics::google::protobuf::MessageLite *a2)
{
  int v2 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(*(uint64_t (**)(wireless_diagnostics::google::protobuf::internal::WireFormatLite *, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 72))(this, a2);
  int v3 = (int)v2;
  if (v2 >= 0x80) {
    int v4 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v2);
  }
  else {
    int v4 = 1;
  }
  return (v4 + v3);
}

void wireless_diagnostics::google::protobuf::internal::GeneratedExtensionFinder::~GeneratedExtensionFinder(wireless_diagnostics::google::protobuf::internal::GeneratedExtensionFinder *this)
{
}

uint64_t *std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::find<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>(void *a1, uint64_t a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  uint64_t v3 = *(int *)(a2 + 8);
  unint64_t v4 = v3 - *(void *)a2 + (*(void *)a2 << 16);
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v6 = v3 - *(void *)a2 + (*(void *)a2 << 16);
    if (v4 >= *(void *)&v2) {
      uint64_t v6 = v4 % *(void *)&v2;
    }
  }
  else
  {
    uint64_t v6 = (*(void *)&v2 - 1) & v4;
  }
  int v7 = *(uint64_t ***)(*a1 + 8 * v6);
  if (!v7) {
    return 0;
  }
  for (uint64_t result = *v7; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v9 = result[1];
    if (v4 == v9)
    {
      if (result[2] == *(void *)a2 && *((_DWORD *)result + 6) == v3) {
        return result;
      }
    }
    else
    {
      if (v5.u32[0] > 1uLL)
      {
        if (v9 >= *(void *)&v2) {
          v9 %= *(void *)&v2;
        }
      }
      else
      {
        v9 &= *(void *)&v2 - 1;
      }
      if (v9 != v6) {
        return 0;
      }
    }
  }
  return result;
}

void wireless_diagnostics::google::protobuf::internal::anonymous namespace'::InitRegistry(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::anonymous namespace'::DeleteRegistry(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *this)
{
  {
    uint64_t result = MEMORY[0x21668CE50](v2, 0x10A0C408EF24B1CLL);
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__emplace_unique_key_args<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::pair<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int> const,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v6 = *(int *)(a2 + 8);
  unint64_t v7 = v6 - *(void *)a2 + (*(void *)a2 << 16);
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v3 = v6 - *(void *)a2 + (*(void *)a2 << 16);
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
    }
    else
    {
      unint64_t v3 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v10)
    {
      int v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == *(void *)a2 && *((_DWORD *)v11 + 6) == v6) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v3) {
              break;
            }
          }
          int v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  int v11 = operator new(0x40uLL);
  *int v11 = 0;
  v11[1] = v7;
  long long v14 = a3[1];
  *((_OWORD *)v11 + 1) = *a3;
  *((_OWORD *)v11 + 2) = v14;
  *((_OWORD *)v11 + 3) = a3[2];
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__rehash<true>(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
      else {
        unint64_t v3 = v7;
      }
    }
    else
    {
      unint64_t v3 = (v8 - 1) & v7;
    }
  }
  uint64_t v21 = *(void *)a1;
  uint64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *int v11 = *v22;
LABEL_42:
    *uint64_t v22 = v11;
    goto LABEL_43;
  }
  *int v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v21 + 8 * v3) = a1 + 16;
  if (*v11)
  {
    unint64_t v23 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8) {
        v23 %= v8;
      }
    }
    else
    {
      v23 &= v8 - 1;
    }
    uint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_2135B12DC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      int v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *int v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  uint64_t v2 = (unsigned __int8 *)*((void *)this + 1);
  if ((unint64_t)v2 >= *((void *)this + 2) || (char)*v2 < 0) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, a2);
  }
  *a2 = *v2;
  *((void *)this + 1) = v2 + 1;
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 12);
  if (v2 < a2)
  {
    int v3 = 2 * v2;
    if (v3 <= a2) {
      int v3 = a2;
    }
    if (v3 <= 4) {
      int v3 = 4;
    }
    *(_DWORD *)(result + 12) = v3;
    operator new[]();
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 12);
  if (v2 < a2)
  {
    int v3 = 2 * v2;
    if (v3 <= a2) {
      int v3 = a2;
    }
    if (v3 <= 4) {
      int v3 = 4;
    }
    *(_DWORD *)(result + 12) = v3;
    operator new[]();
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::RepeatedField<BOOL>::Reserve(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 12);
  if (v2 < a2)
  {
    uint64_t v3 = result;
    int v4 = 2 * v2;
    if (v4 <= a2) {
      int v4 = a2;
    }
    if (v4 <= 4) {
      int v5 = 4;
    }
    else {
      int v5 = v4;
    }
    *(_DWORD *)(v3 + 12) = v5;
    operator new[]();
  }
  return result;
}

uint64_t std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__erase_unique<int>(uint64_t a1, int *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0;
  }
  int v3 = *a2;
  uint64_t v4 = a1 + 8;
  do
  {
    int v5 = *(_DWORD *)(v2 + 32);
    BOOL v6 = v5 < v3;
    if (v5 >= v3) {
      uint64_t v7 = (uint64_t *)v2;
    }
    else {
      uint64_t v7 = (uint64_t *)(v2 + 8);
    }
    if (!v6) {
      uint64_t v4 = v2;
    }
    uint64_t v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32)) {
    return 0;
  }
  std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__remove_node_pointer((uint64_t **)a1, (uint64_t *)v4);
  operator delete((void *)v4);
  return 1;
}

uint64_t *std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      int v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      int v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  BOOL v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      int v3 = a2;
      goto LABEL_7;
    }
    do
    {
      int v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
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
  BOOL v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *BOOL v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
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
    *int v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
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
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      int v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      std::string v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *int v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    float v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      float v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *uint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        std::string v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        void v7[2] = (uint64_t)v15;
        float v16 = v7;
      }
      else
      {
        float v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      char v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *char v24 = v23;
      goto LABEL_72;
    }
    float v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    BOOL v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      BOOL v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
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
    void v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  unint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  size_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    BOOL v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    size_t v20 = v7;
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
    *size_t v20 = (uint64_t)v7;
    void v7[2] = (uint64_t)v20;
    unint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  char v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

int *wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::AddAllocated<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>(int *this, uint64_t a2)
{
  int v3 = this;
  uint64_t v4 = this[2];
  int v5 = this[4];
  if (v4 == v5)
  {
    this = (int *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)this, (int)v4 + 1);
    int v6 = v3[3] + 1;
LABEL_9:
    v3[3] = v6;
    goto LABEL_10;
  }
  uint64_t v7 = this[3];
  if (v7 != v5)
  {
    if ((int)v4 < (int)v7) {
      *(void *)(*(void *)this + 8 * v7) = *(void *)(*(void *)this + 8 * v4);
    }
    int v6 = v7 + 1;
    goto LABEL_9;
  }
  this = *(int **)(*(void *)this + 8 * v4);
  if (this) {
    this = (int *)(*(uint64_t (**)(int *))(*(void *)this + 8))(this);
  }
LABEL_10:
  uint64_t v8 = *(void *)v3;
  uint64_t v9 = v3[2];
  v3[2] = v9 + 1;
  *(void *)(v8 + 8 * v9) = a2;
  return this;
}

uint64_t *std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::swap(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = *(void *)a2;
  *(void *)a2 = v2;
  uint64_t v5 = result[1];
  uint64_t v4 = result[2];
  int v3 = result + 1;
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v4;
  if (result[2]) {
    uint64_t result = (uint64_t *)(*v3 + 16);
  }
  *uint64_t result = (uint64_t)v3;
  int v6 = (void *)(*(void *)(a2 + 8) + 16);
  if (!v4) {
    int v6 = (void *)a2;
  }
  *int v6 = a2 + 8;
  return result;
}

uint64_t **std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(uint64_t **a1, int *a2, uint64_t a3)
{
  int v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        int v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        int v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (char *)operator new(0x40uLL);
    *((_DWORD *)v10 + 8) = *(_DWORD *)a3;
    *(_OWORD *)(v10 + 40) = *(_OWORD *)(a3 + 8);
    *((void *)v10 + 7) = *(void *)(a3 + 24);
    std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__insert_node_at(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
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
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }
          else
          {
            int v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              std::string v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *int v9 = v2;
            void v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          void v2[2] = v3[2];
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
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          void v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        void v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
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

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(uint64_t result)
{
  if (*(int *)(result + 8) >= 1)
  {
    uint64_t v1 = 0;
    do
    {
      uint64_t v2 = *(void *)(*(void *)result + 8 * v1);
      if (*(char *)(v2 + 23) < 0)
      {
        **(unsigned char **)uint64_t v2 = 0;
        *(void *)(v2 + 8) = 0;
      }
      else
      {
        *(unsigned char *)uint64_t v2 = 0;
        *(unsigned char *)(v2 + 23) = 0;
      }
      ++v1;
    }
    while (v1 < *(int *)(result + 8));
  }
  *(_DWORD *)(result + 8) = 0;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>(uint64_t result)
{
  uint64_t v1 = result;
  if (*(int *)(result + 8) >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      uint64_t result = (*(uint64_t (**)(void))(**(void **)(*(void *)v1 + 8 * v2) + 32))(*(void *)(*(void *)v1 + 8 * v2));
      ++v2;
    }
    while (v2 < *(int *)(v1 + 8));
  }
  *(_DWORD *)(v1 + 8) = 0;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(int *a1)
{
  if (a1[3] >= 1)
  {
    uint64_t v2 = 0;
    do
      wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete(*(void *)(*(void *)a1
                                                                                                + 8 * v2++));
    while (v2 < a1[3]);
  }
  uint64_t result = *(void *)a1;
  if (*(void *)a1)
  {
    JUMPOUT(0x21668CE30);
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>(uint64_t *a1)
{
  int v2 = *((_DWORD *)a1 + 3);
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i < v2; ++i)
    {
      uint64_t v4 = *(void *)(*a1 + 8 * i);
      if (v4)
      {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
        int v2 = *((_DWORD *)a1 + 3);
      }
    }
  }
  uint64_t result = *a1;
  if (*a1)
  {
    JUMPOUT(0x21668CE30);
  }
  return result;
}

void *wireless_diagnostics::google::protobuf::MessageLite::InitializationErrorString@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "(cannot determine missing fields for lite message)");
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::MergeFromCodedStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t result = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, wireless_diagnostics::google::protobuf::io::CodedInputStream *))(*(void *)this + 64))(this, a2);
  if (result)
  {
    if ((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 40))(this))
    {
      return 1;
    }
    else
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 124);
      uint64_t v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v7, (const std::string::value_type *)&__p);
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
      return 0;
    }
  }
  return result;
}

void sub_2135B22B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromCodedStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 32))(this);
  uint64_t v4 = *(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, wireless_diagnostics::google::protobuf::io::CodedInputStream *))(*(void *)this + 64);

  return v4(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2)
{
  v6[0] = a2;
  memset(&v6[1], 0, 30);
  long long v7 = xmmword_2135B7F20;
  int v8 = 0;
  int v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 32))(this);
  unsigned int v3 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, void *))(*(void *)this
                                                                                                  + 64))(this, v6);
  if (BYTE4(v6[4])) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  return v4;
}

void sub_2135B2430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParseFromBoundedZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2, int a3)
{
  v9[0] = a2;
  memset(&v9[1], 0, 30);
  long long v10 = xmmword_2135B7F20;
  int v11 = 0;
  int v12 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9, a3);
  int v5 = wireless_diagnostics::google::protobuf::MessageLite::ParseFromCodedStream(this, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  if (BYTE4(v9[4])) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  BOOL v7 = v6 == 1
    && wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9) == 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  return v7;
}

void sub_2135B24F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromBoundedZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2, int a3)
{
  v9[0] = a2;
  memset(&v9[1], 0, 30);
  long long v10 = xmmword_2135B7F20;
  int v11 = 0;
  int v12 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9, a3);
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 32))(this);
  int v5 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, void *))(*(void *)this
                                                                                                  + 64))(this, v9);
  if (BYTE4(v9[4])) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  BOOL v7 = v6 == 1
    && wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9) == 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  return v7;
}

void sub_2135B2600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromString(uint64_t a1, uint64_t *a2)
{
  LODWORD(v3) = *((unsigned __int8 *)a2 + 23);
  if ((v3 & 0x80u) == 0) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = (uint64_t *)*a2;
  }
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = a2[1];
  }
  v8[0] = 0;
  v8[1] = v4;
  std::string v8[2] = (char *)v4 + (int)v3;
  int v9 = v3;
  uint64_t v10 = 0;
  __int16 v11 = 0;
  int v12 = v3;
  long long v13 = xmmword_2135B7F30;
  int v14 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  (*(void (**)(uint64_t))(*(void *)a1 + 32))(a1);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 64))(a1, v8);
  if ((_BYTE)v11) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v8);
  return v6;
}

void sub_2135B26F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromArray(wireless_diagnostics::google::protobuf::MessageLite *this, char *a2, int a3)
{
  v7[0] = 0;
  v7[1] = a2;
  std::string v7[2] = &a2[a3];
  int v8 = a3;
  uint64_t v9 = 0;
  __int16 v10 = 0;
  int v11 = a3;
  long long v12 = xmmword_2135B7F30;
  int v13 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 32))(this);
  unsigned int v4 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, void *))(*(void *)this
                                                                                                  + 64))(this, v7);
  if ((_BYTE)v10) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v7);
  return v5;
}

void sub_2135B27D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void wireless_diagnostics::google::protobuf::anonymous namespace'::InitializationErrorMessage(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::append(a2, "Can't ");
  std::string::append(a2, "parse");
  std::string::append(a2, " message of type \"");
  (*(void (**)(void **__return_ptr, wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(void *)this + 16))(&__p, this);
  if ((v12 & 0x80u) == 0) {
    p_p = (const std::string::value_type *)&__p;
  }
  else {
    p_p = (const std::string::value_type *)__p;
  }
  if ((v12 & 0x80u) == 0) {
    std::string::size_type v7 = v12;
  }
  else {
    std::string::size_type v7 = v11;
  }
  std::string::append(a2, p_p, v7);
  if ((char)v12 < 0) {
    operator delete(__p);
  }
  std::string::append(a2, "\" because it is missing required fields: ");
  (*(void (**)(void **__return_ptr, wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(void *)this + 48))(&__p, this);
  if ((v12 & 0x80u) == 0) {
    int v8 = (const std::string::value_type *)&__p;
  }
  else {
    int v8 = (const std::string::value_type *)__p;
  }
  if ((v12 & 0x80u) == 0) {
    std::string::size_type v9 = v12;
  }
  else {
    std::string::size_type v9 = v11;
  }
  std::string::append(a2, v8, v9);
  if ((char)v12 < 0) {
    operator delete(__p);
  }
}

void sub_2135B2928(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::anonymous namespace'::ByteSizeConsistencyError(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *this, int a2, int a3)
{
  int v4 = (int)this;
  if (this != a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 64);
    uint64_t v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (byte_size_before_serialization) == (byte_size_after_serialization): ");
    uint64_t v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v5, "Protocol message was modified concurrently during serialization.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (a3 != v4)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 66);
    std::string::size_type v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (bytes_produced_by_serialization) == (byte_size_before_serialization): ");
    int v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v7, "Byte size calculation and serialization were inconsistent.  This may indicate a bug in protocol buffers or it may be caused by concurrent modification of the message.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 70);
  std::string::size_type v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "This shouldn't be called if all the sizes are equal.");
  wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
}

void sub_2135B2A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *a2)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5, a2);
  uint64_t v3 = wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToCodedStream(this, (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  return v3;
}

void sub_2135B2AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::AppendToString(uint64_t a1, std::string *a2)
{
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToString(uint64_t a1, uint64_t a2)
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
  wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString(a1, (std::string *)a2);
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString@<X0>(wireless_diagnostics::google::protobuf::MessageLite *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString((uint64_t)this, a2);
}

void sub_2135B2B80(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialAsString@<X0>(wireless_diagnostics::google::protobuf::MessageLite *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString((uint64_t)this, a2);
}

void sub_2135B2BCC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
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

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2641B0738, MEMORY[0x263F8C060]);
}

void sub_2135B2CFC(_Unwind_Exception *a1)
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

uint64_t wireless_diagnostics::google::protobuf::io::ArrayInputStream::ArrayInputStream(uint64_t this, const void *a2, int a3, int a4)
{
  *(void *)this = &unk_26C3F7958;
  *(void *)(this + 8) = a2;
  if (a4 <= 0) {
    int v4 = a3;
  }
  else {
    int v4 = a4;
  }
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(void *)(this + 24) = 0;
  return this;
}

{
  int v4;

  *(void *)this = &unk_26C3F7958;
  *(void *)(this + 8) = a2;
  if (a4 <= 0) {
    int v4 = a3;
  }
  else {
    int v4 = a4;
  }
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(void *)(this + 24) = 0;
  return this;
}

void wireless_diagnostics::google::protobuf::io::ArrayInputStream::~ArrayInputStream(wireless_diagnostics::google::protobuf::io::ArrayInputStream *this)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);

  JUMPOUT(0x21668CE50);
}

BOOL wireless_diagnostics::google::protobuf::io::ArrayInputStream::Next(wireless_diagnostics::google::protobuf::io::ArrayInputStream *this, const void **a2, int *a3)
{
  uint64_t v3 = *((int *)this + 6);
  int v4 = *((_DWORD *)this + 4);
  if ((int)v3 >= v4)
  {
    *((_DWORD *)this + 7) = 0;
  }
  else
  {
    int v5 = v4 - v3;
    if (v4 - (int)v3 >= *((_DWORD *)this + 5)) {
      int v5 = *((_DWORD *)this + 5);
    }
    *((_DWORD *)this + 7) = v5;
    *a2 = (const void *)(*((void *)this + 1) + v3);
    *a3 = v5;
    *((_DWORD *)this + 6) += *((_DWORD *)this + 7);
  }
  return (int)v3 < v4;
}

void wireless_diagnostics::google::protobuf::io::ArrayInputStream::BackUp(wireless_diagnostics::google::protobuf::io::ArrayInputStream *this, int a2)
{
  int v4 = *((_DWORD *)this + 7);
  if (v4 <= 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 80);
    int v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (last_returned_size_) > (0): ");
    uint64_t v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v5, "BackUp() can only be called after a successful Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    int v4 = *((_DWORD *)this + 7);
  }
  if (v4 < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 82);
    uint64_t v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) <= (last_returned_size_): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 83);
    uint64_t v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  *((void *)this + 3) = (*((_DWORD *)this + 6) - a2);
}

void sub_2135B2F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL wireless_diagnostics::google::protobuf::io::ArrayInputStream::Skip(wireless_diagnostics::google::protobuf::io::ArrayInputStream *this, int a2)
{
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 89);
    int v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  int v5 = *((_DWORD *)this + 4);
  int v6 = *((_DWORD *)this + 6);
  int v7 = v5 - v6;
  BOOL result = v5 - v6 >= a2;
  int v9 = v6 + a2;
  if (v7 >= a2) {
    int v5 = v9;
  }
  *((_DWORD *)this + 6) = v5;
  *((_DWORD *)this + 7) = 0;
  return result;
}

void sub_2135B3000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::ArrayInputStream::ByteCount(wireless_diagnostics::google::protobuf::io::ArrayInputStream *this)
{
  return *((int *)this + 6);
}

void wireless_diagnostics::google::protobuf::io::ArrayOutputStream::~ArrayOutputStream(wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);

  JUMPOUT(0x21668CE50);
}

void wireless_diagnostics::google::protobuf::io::ArrayOutputStream::BackUp(wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this, int a2)
{
  int v4 = *((_DWORD *)this + 7);
  if (v4 <= 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 133);
    int v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (last_returned_size_) > (0): ");
    int v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v5, "BackUp() can only be called after a successful Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    int v4 = *((_DWORD *)this + 7);
  }
  if (v4 < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 135);
    int v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) <= (last_returned_size_): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 136);
    uint64_t v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  *((void *)this + 3) = (*((_DWORD *)this + 6) - a2);
}

void sub_2135B31A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::ArrayOutputStream::ByteCount(wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this)
{
  return *((int *)this + 6);
}

void *wireless_diagnostics::google::protobuf::io::StringOutputStream::StringOutputStream(void *result, uint64_t a2)
{
  *BOOL result = &unk_26C3F7AD0;
  result[1] = a2;
  return result;
}

{
  *BOOL result = &unk_26C3F7AD0;
  result[1] = a2;
  return result;
}

void wireless_diagnostics::google::protobuf::io::StringOutputStream::~StringOutputStream(wireless_diagnostics::google::protobuf::io::StringOutputStream *this)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);

  JUMPOUT(0x21668CE50);
}

uint64_t wireless_diagnostics::google::protobuf::io::StringOutputStream::Next(wireless_diagnostics::google::protobuf::io::StringOutputStream *this, void **a2, int *a3)
{
  uint64_t v6 = *((void *)this + 1);
  if (*(char *)(v6 + 23) < 0)
  {
    uint64_t v7 = *(void *)(v6 + 8);
    uint64_t v9 = (int)v7;
    std::string::size_type v8 = (*(void *)(v6 + 16) & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if ((int)v7 < v8) {
      goto LABEL_10;
    }
  }
  else
  {
    LODWORD(v7) = *(unsigned __int8 *)(v6 + 23);
    if (v7 < 0x16)
    {
      std::string::size_type v8 = 22;
      uint64_t v9 = *(unsigned __int8 *)(v6 + 23);
      goto LABEL_10;
    }
    uint64_t v9 = *(unsigned __int8 *)(v6 + 23);
  }
  if (2 * (int)v7 <= 16) {
    std::string::size_type v8 = 16;
  }
  else {
    std::string::size_type v8 = (2 * v7);
  }
LABEL_10:
  std::string::resize((std::string *)v6, v8, 0);
  char v10 = (uint64_t *)*((void *)this + 1);
  if (*((char *)v10 + 23) < 0)
  {
    if (v10[1])
    {
      char v10 = (uint64_t *)*v10;
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v10 + 23))
  {
    goto LABEL_16;
  }
  char v10 = 0;
LABEL_16:
  *a2 = (char *)v10 + v9;
  uint64_t v11 = *((void *)this + 1);
  if (*(char *)(v11 + 23) < 0) {
    uint64_t v11 = *(void *)(v11 + 8);
  }
  else {
    LODWORD(v11) = *(unsigned __int8 *)(v11 + 23);
  }
  *a3 = v11 - v7;
  return 1;
}

void wireless_diagnostics::google::protobuf::io::StringOutputStream::BackUp(wireless_diagnostics::google::protobuf::io::StringOutputStream *this, int a2)
{
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 177);
    int v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  uint64_t v5 = *((void *)this + 1);
  LODWORD(v6) = *(char *)(v5 + 23);
  if ((v6 & 0x80000000) != 0) {
    unint64_t v7 = *(void *)(v5 + 8);
  }
  else {
    unint64_t v7 = *(unsigned __int8 *)(v5 + 23);
  }
  if (v7 < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 178);
    std::string::size_type v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) <= (target_->size()): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    uint64_t v5 = *((void *)this + 1);
    LOBYTE(v6) = *(unsigned char *)(v5 + 23);
  }
  if ((v6 & 0x80) != 0) {
    uint64_t v6 = *(void *)(v5 + 8);
  }
  else {
    uint64_t v6 = v6;
  }
  std::string::resize((std::string *)v5, v6 - a2, 0);
}

void sub_2135B3428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::StringOutputStream::ByteCount(wireless_diagnostics::google::protobuf::io::StringOutputStream *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (*(char *)(v1 + 23) < 0) {
    return *(void *)(v1 + 8);
  }
  else {
    return *(unsigned __int8 *)(v1 + 23);
  }
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStream::Skip(wireless_diagnostics::google::protobuf::io::CopyingInputStream *this)
{
  uint64_t v1 = MEMORY[0x270FA5388](this);
  int v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = 0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  do
  {
    uint64_t v6 = v5;
    BOOL v7 = __OFSUB__(v3, v5);
    int v8 = v3 - v5;
    if ((v8 < 0) ^ v7 | (v8 == 0)) {
      break;
    }
    uint64_t v9 = v8 >= 4096 ? 4096 : v8;
    int v10 = (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(*(void *)v4 + 16))(v4, v12, v9);
    uint64_t v5 = (v10 + v6);
  }
  while (v10 > 0);
  return v6;
}

BOOL wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Skip(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this, int a2)
{
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 269);
    uint64_t v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*((unsigned char *)this + 17)) {
    return 0;
  }
  int v6 = *((_DWORD *)this + 12);
  if (v6 >= a2)
  {
    *((_DWORD *)this + 12) = v6 - a2;
    return 1;
  }
  else
  {
    uint64_t v7 = (a2 - v6);
    *((_DWORD *)this + 12) = 0;
    int v8 = (*(uint64_t (**)(void, uint64_t))(**((void **)this + 1) + 24))(*((void *)this + 1), v7);
    *((void *)this + 3) += v8;
    return v8 == v7;
  }
}

void sub_2135B3698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  return *((void *)this + 3) + *((int *)this + 11);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::FreeBuffer(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  *((_DWORD *)this + 11) = 0;
  uint64_t result = *((void *)this + 4);
  if (result)
  {
    uint64_t result = MEMORY[0x21668CE30](result, 0x1000C8077774924);
    *((void *)this + 4) = 0;
  }
  return result;
}

std::string *wireless_diagnostics::google::protobuf::StringAppendV(std::string *a1, char *__format, va_list a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t result = (std::string *)vsnprintf(__str, 0x400uLL, __format, a3);
  if ((int)result > 1023) {
    operator new[]();
  }
  if ((result & 0x80000000) == 0) {
    return std::string::append(a1, __str, result);
  }
  return result;
}

std::string *wireless_diagnostics::google::protobuf::StringPrintf@<X0>(wireless_diagnostics::google::protobuf *this@<X0>, std::string *a2@<X8>, ...)
{
  va_start(va, a2);
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return wireless_diagnostics::google::protobuf::StringAppendV(a2, (char *)this, va);
}

void sub_2135B38D0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::SStringPrintf(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*(char *)(a1 + 23) < 0)
  {
    **(unsigned char **)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a1 = 0;
    *(unsigned char *)(a1 + 23) = 0;
  }
  wireless_diagnostics::google::protobuf::StringAppendV((std::string *)a1, a2, &a9);
  return a1;
}

std::string *wireless_diagnostics::google::protobuf::StringAppendF(std::string *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return wireless_diagnostics::google::protobuf::StringAppendV(a1, a2, &a9);
}

std::string *wireless_diagnostics::google::protobuf::StringPrintfVector@<X0>(wireless_diagnostics::google::protobuf *this@<X0>, uint64_t **a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  unint64_t v7 = ((char *)v6 - (char *)*a2) / 24;
  if (v7 >= 0x21)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/stringprintf.cc", 142);
    char v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<((std::string *)&v19, "CHECK failed: (v.size()) <= (kStringPrintfVectorMaxArgs): ");
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v9, "StringPrintfVector currently only supports up to ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, 32);
    unsigned __int8 v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, " arguments. ");
    uint64_t v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Feel free to add support for more if you need it.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v18, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v19);
    uint64_t v5 = *a2;
    uint64_t v6 = a2[1];
    unint64_t v7 = ((char *)v6 - (char *)*a2) / 24;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (v6 != v5)
  {
    if (v7 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v7;
    }
    uint64_t v15 = &v19;
    do
    {
      uint64_t v16 = v5;
      if (*((char *)v5 + 23) < 0) {
        uint64_t v16 = (uint64_t *)*v5;
      }
      *(void *)uint64_t v15 = v16;
      uint64_t v15 = (long long *)((char *)v15 + 8);
      v5 += 3;
      --v14;
    }
    while (v14);
  }
  if ((v7 & 0xFFFFFFE0) == 0) {
    memset_pattern16((char *)&v19 + ((8 * v7) & 0x7FFFFFFF8), &off_2641B0760, ((248 - 8 * v7) & 0x7FFFFFFF8) + 8);
  }
  return wireless_diagnostics::google::protobuf::StringPrintf(this, a3, v19, v20, v21, v22, v23, v24, v25, v26, (void)v27, *((void *)&v27 + 1), (void)v28, *((void *)&v28 + 1), (void)v29, *((void *)&v29 + 1), (void)v30, *((void *)&v30 + 1), (void)v31,
           *((void *)&v31 + 1),
           (void)v32,
           *((void *)&v32 + 1),
           (void)v33,
           *((void *)&v33 + 1),
           (void)v34,
           *((void *)&v34 + 1));
}

void sub_2135B3B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43)
{
}

int32x2_t *wireless_diagnostics::google::protobuf::io::CodedInputStream::SetTotalBytesLimit(int32x2_t *this, unsigned int a2, __int32 a3)
{
  __int32 v3 = this[3].i32[0];
  int32x2_t v4 = this[2];
  int v5 = this[5].i32[0];
  uint64_t v6 = this[5].i32[1];
  v7.i32[0] = v3 - v6 + this[1].i32[0] - v4.i32[0];
  v7.i32[1] = a3;
  int32x2_t v8 = vmax_s32(v7, (int32x2_t)(a2 | 0xFFFFFFFF00000000));
  this[6] = v8;
  int32x2_t v9 = (int32x2_t)(*(void *)&v4 + v6);
  this[2] = v9;
  int v10 = v8.i32[0];
  if (v8.i32[0] >= v5) {
    int v10 = v5;
  }
  BOOL v11 = __OFSUB__(v3, v10);
  int v12 = v3 - v10;
  if ((v12 < 0) ^ v11 | (v12 == 0)) {
    int v12 = 0;
  }
  else {
    this[2] = (int32x2_t)(*(void *)&v9 - v12);
  }
  this[5].i32[1] = v12;
  return this;
}

void wireless_diagnostics::google::protobuf::io::CodedInputStream::PrintTotalBytesLimitError(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/coded_stream.cc", 172);
  int v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, "A protocol message was rejected because it was too big (more than ");
  __int32 v3 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, *((_DWORD *)this + 12));
  int32x2_t v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v3, " bytes).  To increase the limit (or to disable these warnings), see CodedInputStream::SetTotalBytesLimit() in google/protobuf/io/coded_stream.h.");
  wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
}

void sub_2135B3C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Slow(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  unint64_t v4 = 0;
  uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v4);
  if (result) {
    *a2 = v4;
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, int a2)
{
  if (a2 < 0) {
    return 0;
  }
  while (1)
  {
    int v3 = *((_DWORD *)this + 4);
    int v4 = a2 - v3;
    if (a2 <= v3) {
      break;
    }
    char v5 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
    a2 = v4;
    if ((v5 & 1) == 0) {
      return 0;
    }
  }
  *((void *)this + 1) += a2;
  *((_DWORD *)this + 4) = v3 - a2;
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::GetDirectBufferPointer(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, void **a2, int *a3)
{
  int v6 = *((_DWORD *)this + 4);
  if (!v6)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
    if (!result) {
      return result;
    }
    int v6 = *((_DWORD *)this + 4);
  }
  *a2 = (void *)*((void *)this + 1);
  *a3 = v6;
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::CopyingFileInputStream(uint64_t this, int a2)
{
  *(void *)this = &unk_26C3F78E8;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  *(unsigned char *)(this + 20) = 0;
  return this;
}

{
  *(void *)this = &unk_26C3F78E8;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  *(unsigned char *)(this + 20) = 0;
  return this;
}

BOOL wireless_diagnostics::google::protobuf::io::FileInputStream::Close(wireless_diagnostics::google::protobuf::io::FileInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Close((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 8));
}

BOOL wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Close(wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this)
{
  if (*((unsigned char *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 124);
    int v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  *((unsigned char *)this + 13) = 1;
  if (v3) {
    *((_DWORD *)this + 4) = *__error();
  }
  return v3 == 0;
}

void sub_2135B3EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL wireless_diagnostics::google::protobuf::io::FileInputStream::Skip(wireless_diagnostics::google::protobuf::io::FileInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Skip((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32), a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::anonymous namespace'::close_no_eintr(wireless_diagnostics::google::protobuf::io::_anonymous_namespace_ *this)
{
  int v1 = (int)this;
  do
    uint64_t v2 = close(v1);
  while ((v2 & 0x80000000) != 0 && *__error() == 4);
  return v2;
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Skip(wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this, uint64_t a2)
{
  if (*((unsigned char *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 155);
    int v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v6, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  if (*((unsigned char *)this + 20) || lseek(*((_DWORD *)this + 2), (int)a2, 1) == -1)
  {
    *((unsigned char *)this + 20) = 1;
    return wireless_diagnostics::google::protobuf::io::CopyingInputStream::Skip(this);
  }
  return a2;
}

void sub_2135B4028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::CopyingFileOutputStream(uint64_t this, int a2)
{
  *(void *)this = &unk_26C3F7998;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

{
  *(void *)this = &unk_26C3F7998;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::Close(wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  unsigned int v2 = wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
  return wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 8)) & v2;
}

BOOL wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close(wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this)
{
  if (*((unsigned char *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 222);
    unsigned int v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  *((unsigned char *)this + 13) = 1;
  if (v3) {
    *((_DWORD *)this + 4) = *__error();
  }
  return v3 == 0;
}

void sub_2135B4178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::Flush(wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::ByteCount(wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
}

void *wireless_diagnostics::google::protobuf::io::IstreamInputStream::IstreamInputStream(void *a1, uint64_t a2, int a3)
{
  *a1 = &unk_26C3F7A90;
  a1[1] = &unk_26C3F7A60;
  a1[2] = a2;
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor((uint64_t)(a1 + 3), (wireless_diagnostics::google::protobuf::io::CopyingInputStream *)(a1 + 1), a3);
  return a1;
}

void sub_2135B4278(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::io::CopyingInputStream::~CopyingInputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(v1);
  _Unwind_Resume(a1);
}

void *wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::CopyingIstreamInputStream(void *result, uint64_t a2)
{
  *uint64_t result = &unk_26C3F7A60;
  result[1] = a2;
  return result;
}

{
  *uint64_t result = &unk_26C3F7A60;
  result[1] = a2;
  return result;
}

void wireless_diagnostics::google::protobuf::io::IstreamInputStream::~IstreamInputStream(wireless_diagnostics::google::protobuf::io::IstreamInputStream *this)
{
  *(void *)this = &unk_26C3F7A90;
  unsigned int v2 = (wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 8);
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24));
  wireless_diagnostics::google::protobuf::io::CopyingInputStream::~CopyingInputStream(v2);

  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

{
  uint64_t vars8;

  wireless_diagnostics::google::protobuf::io::IstreamInputStream::~IstreamInputStream(this);

  JUMPOUT(0x21668CE50);
}

uint64_t wireless_diagnostics::google::protobuf::io::IstreamInputStream::Next(wireless_diagnostics::google::protobuf::io::IstreamInputStream *this, const void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Next((wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24), a2, a3);
}

void wireless_diagnostics::google::protobuf::io::IstreamInputStream::BackUp(wireless_diagnostics::google::protobuf::io::IstreamInputStream *this, int a2)
{
}

BOOL wireless_diagnostics::google::protobuf::io::IstreamInputStream::Skip(wireless_diagnostics::google::protobuf::io::IstreamInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Skip((wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24), a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::IstreamInputStream::ByteCount(wireless_diagnostics::google::protobuf::io::IstreamInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24));
}

void wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::~CopyingIstreamInputStream(wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *this)
{
  wireless_diagnostics::google::protobuf::io::CopyingInputStream::~CopyingInputStream(this);

  JUMPOUT(0x21668CE50);
}

uint64_t wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::Read(wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *this, void *a2)
{
  std::istream::read();
  uint64_t v3 = *((void *)this + 1);
  uint64_t result = *(unsigned int *)(v3 + 8);
  if (!result)
  {
    int v5 = *(_DWORD *)(v3 + *(void *)(*(void *)v3 - 24) + 32);
    int v6 = v5 & 5;
    int v7 = v5 & 2;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8) {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

void *wireless_diagnostics::google::protobuf::io::OstreamOutputStream::OstreamOutputStream(void *a1, uint64_t a2, int a3)
{
  *a1 = &unk_26C3F7B98;
  a1[1] = &unk_26C3F7B70;
  a1[2] = a2;
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor((uint64_t)(a1 + 3), (wireless_diagnostics::google::protobuf::io::CopyingOutputStream *)(a1 + 1), a3);
  return a1;
}

void sub_2135B44BC(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::io::CopyingOutputStream::~CopyingOutputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(v1);
  _Unwind_Resume(a1);
}

void *wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::CopyingOstreamOutputStream(void *result, uint64_t a2)
{
  *uint64_t result = &unk_26C3F7B70;
  result[1] = a2;
  return result;
}

{
  *uint64_t result = &unk_26C3F7B70;
  result[1] = a2;
  return result;
}

void wireless_diagnostics::google::protobuf::io::OstreamOutputStream::~OstreamOutputStream(wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this)
{
  *(void *)this = &unk_26C3F7B98;
  unsigned int v2 = (wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24);
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24));
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(v2);
  wireless_diagnostics::google::protobuf::io::CopyingOutputStream::~CopyingOutputStream((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 8));

  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);
}

{
  uint64_t vars8;

  wireless_diagnostics::google::protobuf::io::OstreamOutputStream::~OstreamOutputStream(this);

  JUMPOUT(0x21668CE50);
}

uint64_t wireless_diagnostics::google::protobuf::io::OstreamOutputStream::Next(wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this, void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Next((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24), a2, a3);
}

void wireless_diagnostics::google::protobuf::io::OstreamOutputStream::BackUp(wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this, int a2)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::OstreamOutputStream::ByteCount(wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24));
}

void wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::~CopyingOstreamOutputStream(wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *this)
{
  wireless_diagnostics::google::protobuf::io::CopyingOutputStream::~CopyingOutputStream(this);

  JUMPOUT(0x21668CE50);
}

BOOL wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::Write(wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *this, const void *a2)
{
  return *(_DWORD *)(*((void *)this + 1) + *(void *)(**((void **)this + 1) - 24) + 32) == 0;
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::ConcatenatingInputStream(uint64_t this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *const *a2, int a3)
{
  *(void *)this = &unk_26C3F7C48;
  *(void *)(this + 8) = a2;
  *(_DWORD *)(this + 16) = a3;
  *(void *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = &unk_26C3F7C48;
  *(void *)(this + 8) = a2;
  *(_DWORD *)(this + 16) = a3;
  *(void *)(this + 24) = 0;
  return this;
}

void wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::~ConcatenatingInputStream(wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);

  JUMPOUT(0x21668CE50);
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::Next(wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this, const void **a2, int *a3)
{
  if (*((int *)this + 4) < 1) {
    return 0;
  }
  int v6 = (void *)*((void *)this + 1);
  do
  {
    uint64_t v7 = (*(uint64_t (**)(void, const void **, int *))(*(void *)*v6 + 16))(*v6, a2, a3);
    if (v7) {
      break;
    }
    *((void *)this + 3) += (*(uint64_t (**)(void))(***((void ***)this + 1) + 40))(**((void **)this + 1));
    int v6 = (void *)(*((void *)this + 1) + 8);
    *((void *)this + 1) = v6;
    int v8 = *((_DWORD *)this + 4);
    BOOL v9 = __OFSUB__(v8--, 1);
    *((_DWORD *)this + 4) = v8;
  }
  while (!((v8 < 0) ^ v9 | (v8 == 0)));
  return v7;
}

void wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::BackUp(wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this)
{
  if (*((int *)this + 4) < 1)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v4, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 378);
    unsigned int v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v4, "Can't BackUp() after failed Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v3, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v4[0].__r_.__value_.__l.__data_);
  }
  else
  {
    int v1 = *(void (**)(void))(***((void ***)this + 1) + 24);
    v1();
  }
}

void sub_2135B4890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::Skip(wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this, uint64_t a2)
{
  if (*((int *)this + 4) < 1) {
    return 0;
  }
  uint64_t v4 = *((void *)this + 1);
  do
  {
    int v5 = (*(uint64_t (**)(void))(**(void **)v4 + 40))();
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(***((void ***)this + 1) + 32))(**((void **)this + 1), a2);
    if (v6) {
      break;
    }
    uint64_t v7 = (*(uint64_t (**)(void))(***((void ***)this + 1) + 40))(**((void **)this + 1));
    a2 = (v5 + a2 - v7);
    *((void *)this + 3) += v7;
    uint64_t v4 = *((void *)this + 1) + 8;
    *((void *)this + 1) = v4;
    int v8 = *((_DWORD *)this + 4);
    BOOL v9 = __OFSUB__(v8--, 1);
    *((_DWORD *)this + 4) = v8;
  }
  while (!((v8 < 0) ^ v9 | (v8 == 0)));
  return v6;
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::ByteCount(wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (*((_DWORD *)this + 4)) {
    v1 += (*(uint64_t (**)(void))(***((void ***)this + 1) + 40))(**((void **)this + 1));
  }
  return v1;
}

void *wireless_diagnostics::google::protobuf::io::LimitingInputStream::LimitingInputStream(void *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2, uint64_t a3)
{
  *this = &unk_26C3F7B30;
  this[1] = a2;
  this[2] = a3;
  return this;
}

{
  *this = &unk_26C3F7B30;
  this[1] = a2;
  this[2] = a3;
  return this;
}

void wireless_diagnostics::google::protobuf::io::LimitingInputStream::~LimitingInputStream(wireless_diagnostics::google::protobuf::io::LimitingInputStream *this)
{
  *(void *)this = &unk_26C3F7B30;
  if ((*((void *)this + 2) & 0x8000000000000000) != 0) {
    (*(void (**)(void, void))(**((void **)this + 1) + 24))(*((void *)this + 1), -*((_DWORD *)this + 4));
  }

  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

{
  uint64_t vars8;

  wireless_diagnostics::google::protobuf::io::LimitingInputStream::~LimitingInputStream(this);

  JUMPOUT(0x21668CE50);
}

uint64_t wireless_diagnostics::google::protobuf::io::LimitingInputStream::Next(wireless_diagnostics::google::protobuf::io::LimitingInputStream *this, const void **a2, int *a3)
{
  if (*((uint64_t *)this + 2) < 1) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(void, const void **))(**((void **)this + 1) + 16))(*((void *)this + 1), a2);
  if (result)
  {
    uint64_t v6 = *a3;
    uint64_t v7 = *((void *)this + 2) - v6;
    *((void *)this + 2) = v7;
    if (v7 < 0) {
      *a3 = v6 + v7;
    }
    return 1;
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::LimitingInputStream::BackUp(wireless_diagnostics::google::protobuf::io::LimitingInputStream *this, uint64_t a2)
{
  int v2 = a2;
  uint64_t v6 = (char *)this + 8;
  uint64_t v4 = *((void *)this + 1);
  uint64_t v5 = *((void *)v6 + 1);
  if (v5 < 0)
  {
    uint64_t v8 = (int)a2;
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)v4 + 24))(v4, (a2 - v5));
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 24))(v4, a2);
    uint64_t v8 = *((void *)this + 2) + v2;
  }
  *((void *)this + 2) = v8;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::io::LimitingInputStream::Skip(wireless_diagnostics::google::protobuf::io::LimitingInputStream *this, uint64_t a2)
{
  uint64_t v4 = *((void *)this + 2);
  BOOL v5 = v4 >= (int)a2;
  if (v4 < (int)a2)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      (*(void (**)(void))(**((void **)this + 1) + 32))(*((void *)this + 1));
      uint64_t v6 = 0;
      goto LABEL_6;
    }
    return 0;
  }
  if (!(*(unsigned int (**)(void, uint64_t))(**((void **)this + 1) + 32))(*((void *)this + 1), a2)) {
    return 0;
  }
  uint64_t v6 = *((void *)this + 2) - (int)a2;
LABEL_6:
  *((void *)this + 2) = v6;
  return v5;
}

uint64_t wireless_diagnostics::google::protobuf::io::LimitingInputStream::ByteCount(wireless_diagnostics::google::protobuf::io::LimitingInputStream *this)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 1) + 40))(*((void *)this + 1));
  if (v2 < 0) {
    result += *((void *)this + 2);
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  uint64_t result = 0;
  switch(a2 & 7)
  {
    case 0:
      *(void *)uint64_t v14 = 0;
      BOOL v5 = (char *)*((void *)this + 1);
      if ((unint64_t)v5 >= *((void *)this + 2) || *v5 < 0) {
        return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, (unint64_t *)v14);
      }
      *((void *)this + 1) = v5 + 1;
      return 1;
    case 1:
      *(void *)uint64_t v14 = 0;
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v14);
    case 2:
      v14[0] = 0;
      uint64_t v6 = (char *)*((void *)this + 1);
      if ((unint64_t)v6 >= *((void *)this + 2) || *v6 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v14);
        if (!result) {
          return result;
        }
        unsigned int v7 = v14[0];
      }
      else
      {
        unsigned int v7 = *v6;
        v14[0] = v7;
        *((void *)this + 1) = v6 + 1;
      }
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(this, v7);
    case 3:
      int v8 = *((_DWORD *)this + 14);
      int v9 = *((_DWORD *)this + 15);
      *((_DWORD *)this + 14) = v8 + 1;
      if (v8 >= v9) {
        return 0;
      }
      int v10 = (int)a2;
      uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipMessage(this, a2, a3);
      if (result)
      {
        int v11 = *((_DWORD *)this + 14);
        BOOL v12 = __OFSUB__(v11, 1);
        int v13 = v11 - 1;
        if (v13 < 0 == v12) {
          *((_DWORD *)this + 14) = v13;
        }
        return *((_DWORD *)this + 8) == (v10 & 0xFFFFFFF8 | 4);
      }
      return result;
    case 5:
      v14[0] = 0;
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v14);
    default:
      return result;
  }
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  do
  {
    uint64_t v4 = (char *)*((void *)this + 1);
    if ((unint64_t)v4 >= *((void *)this + 2) || *v4 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
      *((_DWORD *)this + 8) = TagFallback;
    }
    else
    {
      unint64_t TagFallback = *v4;
      *((_DWORD *)this + 8) = TagFallback;
      *((void *)this + 1) = v4 + 1;
    }
    if (TagFallback) {
      BOOL v6 = (TagFallback & 7) == 4;
    }
    else {
      BOOL v6 = 1;
    }
    uint64_t v7 = v6;
  }
  while (!v6
       && (wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(this, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) != 0);
  return v7;
}

uint64_t wireless_diagnostics::google::protobuf::internal::FieldSkipper::SkipField(wireless_diagnostics::google::protobuf::internal::FieldSkipper *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, wireless_diagnostics::google::protobuf::io::CodedInputStream *a3)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, a3, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::FieldSkipper::SkipMessage(wireless_diagnostics::google::protobuf::internal::FieldSkipper *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipMessage(a2, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int (*a2)(uint64_t), uint64_t a3)
{
  unsigned int v14 = 0;
  BOOL v6 = (char *)*((void *)this + 1);
  if ((unint64_t)v6 >= *((void *)this + 2) || *v6 < 0)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v14);
    if (!result) {
      return result;
    }
    unsigned int v7 = v14;
  }
  else
  {
    unsigned int v7 = *v6;
    unsigned int v14 = v7;
    *((void *)this + 1) = v6 + 1;
  }
  int v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this, v7);
  if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this) >= 1)
  {
    do
    {
      unsigned int v15 = 0;
      int v10 = (char *)*((void *)this + 1);
      if ((unint64_t)v10 >= *((void *)this + 2) || *v10 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v15);
        if (!result) {
          return result;
        }
        uint64_t v11 = v15;
      }
      else
      {
        uint64_t v11 = *v10;
        *((void *)this + 1) = v10 + 1;
      }
      if (a2(v11))
      {
        int v12 = *(_DWORD *)(a3 + 8);
        if (v12 == *(_DWORD *)(a3 + 12))
        {
          wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(a3, v12 + 1);
          int v12 = *(_DWORD *)(a3 + 8);
        }
        uint64_t v13 = *(void *)a3;
        *(_DWORD *)(a3 + 8) = v12 + 1;
        *(_DWORD *)(v13 + 4 * v12) = v11;
      }
    }
    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this) > 0);
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((uint64_t)this, v9);
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * this);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * this);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, (2 * a2) ^ (a2 >> 63));
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * this) | 5);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * this) | 5);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * this) | 1);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroup(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  int v6 = (int)this;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * this) | 3);
  (*(void (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)a2 + 80))(a2, a3);

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * v6) | 4u);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroupMaybeToArray(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  int v6 = 8 * this;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * this) | 3);
  int v7 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96))(a2);
  int v8 = *((_DWORD *)a3 + 4);
  BOOL v9 = __OFSUB__(v8, v7);
  int v10 = v8 - v7;
  if (v10 < 0 != v9 || (uint64_t v11 = *((void *)a3 + 1), *((void *)a3 + 1) = v11 + v7, *((_DWORD *)a3 + 4) = v10, !v11)) {
    (*(void (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)a2 + 80))(a2, a3);
  }
  else {
    (*(void (**)(uint64_t))(*(void *)a2 + 88))(a2);
  }

  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v6 | 4u);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessageMaybeToArray(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * this) | 2);
  signed int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96))(a2);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v6);
  int v7 = *((_DWORD *)a3 + 4);
  BOOL v8 = __OFSUB__(v7, v6);
  int v9 = v7 - v6;
  if (v9 < 0 != v8 || (uint64_t v10 = *((void *)a3 + 1), *((void *)a3 + 1) = v10 + v6, *((_DWORD *)a3 + 4) = v9, !v10))
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)a2 + 80);
    return v13(a2, a3);
  }
  else
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t))(*(void *)a2 + 88);
    return v11(a2);
  }
}

void wireless_diagnostics::google::protobuf::internal::FieldSkipper::~FieldSkipper(wireless_diagnostics::google::protobuf::internal::FieldSkipper *this)
{
}

double wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap(uint64_t *a1, uint64_t *a2)
{
  if (a1 != a2)
  {
    uint64_t v2 = *a1;
    int v3 = *((_DWORD *)a1 + 4);
    *a1 = *a2;
    double result = *((double *)a2 + 1);
    *a2 = v2;
    uint64_t v5 = a1[1];
    *((double *)a1 + 1) = result;
    *((_DWORD *)a1 + 4) = *((_DWORD *)a2 + 4);
    a2[1] = v5;
    *((_DWORD *)a2 + 4) = v3;
  }
  return result;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(std::string *a1, const std::string::value_type *a2)
{
  return a1;
}

{
  std::string *v3;
  std::string::size_type v4;
  std::string::size_type v5;

  int v3 = a1 + 1;
  uint64_t v4 = *((void *)a2 + 1);
  if (a2[23] >= 0)
  {
    uint64_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(const std::string::value_type **)a2;
    uint64_t v5 = v4;
  }
  std::string::append(v3, a2, v5);
  return a1;
}

void *wireless_diagnostics::google::protobuf::internal::VersionString@<X0>(wireless_diagnostics::google::protobuf::internal *this@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%d.%d.%d", (int)this / 1000000, (int)this / 1000 % 1000, (int)this % 1000);
  char __str[127] = 0;
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

void wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=(uint64_t a1, wireless_diagnostics::google::protobuf::internal::LogMessage *a2)
{
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(void **this)
{
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
}

{
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
}

uint64_t wireless_diagnostics::google::protobuf::internal::DefaultLogHandler(int a1, const char *a2, int a3, uint64_t a4)
{
  uint64_t v4 = (FILE **)MEMORY[0x263EF8348];
  if (*(char *)(a4 + 23) >= 0) {
    uint64_t v5 = (const char *)a4;
  }
  else {
    uint64_t v5 = *(const char **)a4;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "[libprotobuf %s %s:%d] %s\n", (&wireless_diagnostics::google::protobuf::internal::DefaultLogHandler(wireless_diagnostics::google::protobuf::LogLevel,char const*,int,std::string const&)::level_names)[a1], a2, a3, v5);
  signed int v6 = *v4;

  return fflush(v6);
}

uint64_t wireless_diagnostics::google::protobuf::internal::DeleteLogSilencerCount(wireless_diagnostics::google::protobuf::internal *this)
{
  uint64_t result = wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_;
  if (wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_)
  {
    wireless_diagnostics::google::protobuf::internal::Mutex::~Mutex((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
    uint64_t result = MEMORY[0x21668CE50]();
  }
  wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_ = 0;
  return result;
}

void wireless_diagnostics::google::protobuf::internal::InitLogSilencerCount(wireless_diagnostics::google::protobuf::internal *this)
{
}

void sub_2135B5790(_Unwind_Exception *a1)
{
  MEMORY[0x21668CE50](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

atomic_ullong *wireless_diagnostics::google::protobuf::internal::InitLogSilencerCountOnce(wireless_diagnostics::google::protobuf::internal *this)
{
  uint64_t v1 = wireless_diagnostics::google::protobuf::internal::log_silencer_count_init_;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v3[0] = &unk_26C3F7D88;
    v3[1] = wireless_diagnostics::google::protobuf::internal::InitLogSilencerCount;
    char v4 = 0;
    return wireless_diagnostics::google::protobuf::GoogleOnceInitImpl(&wireless_diagnostics::google::protobuf::internal::log_silencer_count_init_, (uint64_t)v3);
  }
  return result;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(std::string *a1, std::string::value_type a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  __s[0] = a2;
  __s[1] = 0;
  __s[127] = 0;
  std::string::append(a1 + 1, __s);
  return a1;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(std::string *a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%d", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

{
  char __str[128];
  uint64_t v5;

  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%u", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(std::string *a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%ld", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

{
  char __str[128];
  uint64_t v5;

  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%lu", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(std::string *a1, double a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x80uLL, "%g", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::Finish(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
  if (*(_DWORD *)this == 3)
  {
    int v2 = 3;
  }
  else
  {
    wireless_diagnostics::google::protobuf::internal::InitLogSilencerCountOnce(this);
    int v3 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_;
    wireless_diagnostics::google::protobuf::internal::Mutex::Lock((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
    int v4 = wireless_diagnostics::google::protobuf::internal::log_silencer_count_;
    wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v3);
    if (v4 > 0) {
      goto LABEL_6;
    }
    int v2 = *(_DWORD *)this;
  }
  wireless_diagnostics::google::protobuf::internal::log_handler_(v2, *((const char **)this + 1), *((_DWORD *)this + 4), (uint64_t)this + 24);
LABEL_6:
  if (*(_DWORD *)this == 3)
  {
    exception = __cxa_allocate_exception(0x30uLL);
    wireless_diagnostics::google::protobuf::FatalException::FatalException(exception, *((void *)this + 1), *((unsigned int *)this + 4), (char *)this + 24);
  }
}

void sub_2135B5C30(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t (*wireless_diagnostics::google::protobuf::SetLogHandler(uint64_t (*a1)()))()
{
  uint64_t v1 = wireless_diagnostics::google::protobuf::internal::log_handler_;
  if (a1) {
    int v2 = a1;
  }
  else {
    int v2 = wireless_diagnostics::google::protobuf::internal::NullLogHandler;
  }
  wireless_diagnostics::google::protobuf::internal::log_handler_ = v2;
  if (v1 == wireless_diagnostics::google::protobuf::internal::NullLogHandler) {
    return 0;
  }
  else {
    return v1;
  }
}

wireless_diagnostics::google::protobuf::LogSilencer *wireless_diagnostics::google::protobuf::LogSilencer::LogSilencer(wireless_diagnostics::google::protobuf::LogSilencer *this)
{
  wireless_diagnostics::google::protobuf::internal::InitLogSilencerCountOnce(this);
  int v2 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Lock((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
  ++wireless_diagnostics::google::protobuf::internal::log_silencer_count_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v2);
  return this;
}

void wireless_diagnostics::google::protobuf::LogSilencer::~LogSilencer(wireless_diagnostics::google::protobuf::LogSilencer *this)
{
  wireless_diagnostics::google::protobuf::internal::InitLogSilencerCountOnce(this);
  uint64_t v1 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Lock((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
  --wireless_diagnostics::google::protobuf::internal::log_silencer_count_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v1);
}

void wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0(wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *this)
{
}

void wireless_diagnostics::google::protobuf::internal::Mutex::~Mutex(pthread_mutex_t **this)
{
  if (*this) {
    MEMORY[0x21668CE50](*this, 0x1000C40FA0F61DDLL);
  }
}

uint64_t wireless_diagnostics::google::protobuf::ghtonl(wireless_diagnostics::google::protobuf *this)
{
  return bswap32(this);
}

void wireless_diagnostics::google::protobuf::ShutdownProtobufLibrary(wireless_diagnostics::google::protobuf *this)
{
  uint64_t v1 = wireless_diagnostics::google::protobuf::internal::shutdown_functions_init;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v5[0] = &unk_26C3F7D88;
    v5[1] = wireless_diagnostics::google::protobuf::internal::InitShutdownFunctions;
    char v6 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl(&wireless_diagnostics::google::protobuf::internal::shutdown_functions_init, (uint64_t)v5);
  }
  int v2 = (void *)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
  if (wireless_diagnostics::google::protobuf::internal::shutdown_functions)
  {
    int v3 = *(void (***)(void))(wireless_diagnostics::google::protobuf::internal::shutdown_functions + 8);
    if (v3 != *(void (***)(void))wireless_diagnostics::google::protobuf::internal::shutdown_functions)
    {
      unint64_t v4 = 0;
      int v3 = *(void (***)(void))wireless_diagnostics::google::protobuf::internal::shutdown_functions;
      do
      {
        v3[v4++]();
        int v2 = (void *)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
        int v3 = *(void (***)(void))wireless_diagnostics::google::protobuf::internal::shutdown_functions;
      }
      while (v4 < (uint64_t)(v2[1] - *v2) >> 3);
    }
    if (v3)
    {
      v2[1] = v3;
      operator delete(v3);
    }
    MEMORY[0x21668CE50](v2, 0x80C40D6874129);
    wireless_diagnostics::google::protobuf::internal::shutdown_functions = 0;
    if (wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex)
    {
      wireless_diagnostics::google::protobuf::internal::Mutex::~Mutex((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex);
      MEMORY[0x21668CE50]();
    }
    wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex = 0;
  }
}

void wireless_diagnostics::google::protobuf::FatalException::~FatalException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26C3F78C0;
  if (SHIBYTE(this[5].__vftable) < 0) {
    operator delete(this[3].__vftable);
  }

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  wireless_diagnostics::google::protobuf::FatalException::~FatalException(this);

  JUMPOUT(0x21668CE50);
}

uint64_t wireless_diagnostics::google::protobuf::FatalException::what(wireless_diagnostics::google::protobuf::FatalException *this)
{
  uint64_t result = (uint64_t)this + 24;
  if (*((char *)this + 47) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::FatalException::FatalException(uint64_t a1, uint64_t a2, int a3, long long *a4)
{
  *(void *)a1 = &unk_26C3F78C0;
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

void sub_2135B602C(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
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
    BOOL v8 = (std::string *)operator new(v6 + 1);
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

void std::vector<void (*)(void)>::__throw_length_error[abi:ne180100]()
{
}

double wireless_diagnostics::google::protobuf::internal::Infinity(wireless_diagnostics::google::protobuf::internal *this)
{
  return INFINITY;
}

double wireless_diagnostics::google::protobuf::internal::NaN(wireless_diagnostics::google::protobuf::internal *this)
{
  return NAN;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
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

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::istream::read()
{
  return MEMORY[0x270F98678]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
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

void operator delete()
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

void operator new()
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

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
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

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int sched_yield(void)
{
  return MEMORY[0x270EDB320]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}
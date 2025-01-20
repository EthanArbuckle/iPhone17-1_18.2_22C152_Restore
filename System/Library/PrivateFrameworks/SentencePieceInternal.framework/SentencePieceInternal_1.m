void google::protobuf::strings::Utf8SafeCEscape()
{
  operator new[]();
}

void sub_25C1E627C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  MEMORY[0x26117FD90](v3, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void google::protobuf::strings::CHexEscape()
{
}

void sub_25C1E63C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  MEMORY[0x26117FD90](v3, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::strto32_adaptor(google::protobuf *this, char **a2, char **a3)
{
  int v3 = (int)a3;
  int v6 = *__error();
  *__error() = 0;
  uint64_t v7 = strtol((const char *)this, a2, v3);
  if (*__error() == 34 && v7 == 0x8000000000000000) {
    return 0x80000000;
  }
  if (*__error() == 34 && v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFLL;
  }
  int v10 = *__error();
  v11 = __error();
  if (!v10 && v7 <= (uint64_t)0xFFFFFFFF7FFFFFFFLL)
  {
    int *v11 = 34;
    return 0x80000000;
  }
  int v12 = *v11;
  v13 = __error();
  if (!v12 && v7 >= 0x80000000)
  {
    int *v13 = 34;
    return 0x7FFFFFFFLL;
  }
  if (!*v13) {
    *__error() = v6;
  }
  return v7;
}

unint64_t google::protobuf::strtou32_adaptor(google::protobuf *this, char **a2, char **a3)
{
  int v3 = (int)a3;
  int v6 = *__error();
  *__error() = 0;
  unint64_t v7 = strtoul((const char *)this, a2, v3);
  if (*__error() == 34 && v7 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v9 = *__error();
  int v10 = __error();
  if (!v9 && HIDWORD(v7))
  {
    *int v10 = 34;
    return 0xFFFFFFFFLL;
  }
  if (!*v10) {
    *__error() = v6;
  }
  return v7;
}

unsigned char *google::protobuf::FastInt64ToBuffer(unint64_t this, unsigned char *a2, char *a3)
{
  unint64_t v3 = this;
  a2[21] = 0;
  if ((this & 0x8000000000000000) != 0)
  {
    if (this < 0xFFFFFFFFFFFFFFF7)
    {
      unint64_t v7 = -10 - this;
      result = a2 + 19;
      a2[20] = (v7 % 0xA) | 0x30;
      unint64_t v8 = v7 / 0xA + 1;
      do
      {
        *result-- = (v8 % 0xA) | 0x30;
        BOOL v9 = v8 > 9;
        v8 /= 0xAuLL;
      }
      while (v9);
    }
    else
    {
      char v6 = 48 - this;
      result = a2 + 19;
      a2[20] = v6;
    }
    unsigned char *result = 45;
  }
  else
  {
    result = a2 + 21;
    do
    {
      *--result = (v3 % 0xA) | 0x30;
      BOOL v5 = v3 >= 0xA;
      v3 /= 0xAuLL;
    }
    while (v5);
  }
  return result;
}

unsigned char *google::protobuf::FastInt32ToBuffer(google::protobuf *this, unsigned char *a2, char *a3)
{
  unsigned int v3 = this;
  a2[11] = 0;
  if ((this & 0x80000000) != 0)
  {
    if (this < 0xFFFFFFF7)
    {
      unsigned int v7 = -10 - this;
      unsigned int v8 = (-10 - (int)this) / 0xAu;
      result = a2 + 9;
      a2[10] = (v7 % 0xA) | 0x30;
      unsigned int v9 = v8 + 1;
      do
      {
        *result-- = (v9 % 0xA) | 0x30;
        BOOL v10 = v9 > 9;
        v9 /= 0xAu;
      }
      while (v10);
    }
    else
    {
      char v6 = 48 - (_BYTE)this;
      result = a2 + 9;
      a2[10] = v6;
    }
    unsigned char *result = 45;
  }
  else
  {
    result = a2 + 11;
    do
    {
      *--result = (v3 % 0xA) | 0x30;
      BOOL v5 = v3 >= 0xA;
      v3 /= 0xAu;
    }
    while (v5);
  }
  return result;
}

uint64_t google::protobuf::FastHexToBuffer(google::protobuf *this, uint64_t a2, char *a3)
{
  int v4 = (int)this;
  if ((this & 0x80000000) != 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v12, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 887);
    BOOL v5 = google::protobuf::internal::LogMessage::operator<<(v12, "CHECK failed: i >= 0: ");
    char v6 = google::protobuf::internal::LogMessage::operator<<(v5, "FastHexToBuffer() wants non-negative integers, not ");
    unsigned int v7 = google::protobuf::internal::LogMessage::operator<<(v6, v4);
    google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
  }
  *(unsigned char *)(a2 + 21) = 0;
  uint64_t v8 = a2 + 21;
  do
  {
    *(unsigned char *)--uint64_t v8 = google::protobuf::strings::AlphaNum::AlphaNum(google::protobuf::strings::Hex)::hexdigits[v4 & 0xF];
    BOOL v9 = v4 <= 15;
    int v4 = v4 >> 4;
  }
  while (!v9);
  return v8;
}

void sub_25C1E67A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::InternalFastHexToBuffer(unint64_t this, uint64_t a2, char *a3)
{
  *(unsigned char *)(a2 + (int)a3) = 0;
  if ((int)a3 >= 1)
  {
    unint64_t v3 = a3 + 1;
    do
    {
      *(unsigned char *)(a2 + (v3 - 2)) = google::protobuf::strings::AlphaNum::AlphaNum(google::protobuf::strings::Hex)::hexdigits[this & 0xF];
      this >>= 4;
      --v3;
    }
    while (v3 > 1);
  }
  return a2;
}

uint64_t google::protobuf::FastHex64ToBuffer(unint64_t this, uint64_t a2, char *a3)
{
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v3 = 15;
  do
  {
    *(unsigned char *)(a2 + v3) = google::protobuf::strings::AlphaNum::AlphaNum(google::protobuf::strings::Hex)::hexdigits[this & 0xF];
    this >>= 4;
    unint64_t v4 = v3-- + 1;
  }
  while (v4 > 1);
  return a2;
}

uint64_t google::protobuf::FastHex32ToBuffer(google::protobuf *this, uint64_t a2, char *a3)
{
  unint64_t v3 = this;
  *(unsigned char *)(a2 + 8) = 0;
  uint64_t v4 = 7;
  do
  {
    *(unsigned char *)(a2 + v4) = google::protobuf::strings::AlphaNum::AlphaNum(google::protobuf::strings::Hex)::hexdigits[v3 & 0xF];
    v3 >>= 4;
    unint64_t v5 = v4-- + 1;
  }
  while (v5 > 1);
  return a2;
}

unsigned char *google::protobuf::FastUInt32ToBufferLeft(google::protobuf *this, unsigned char *a2, char *a3)
{
  if (this >= 0x3B9ACA00)
  {
    unint64_t v3 = this / 0x5F5E100uLL;
    *(_WORD *)a2 = google::protobuf::two_ASCII_digits[v3];
    a2 += 2;
    goto LABEL_3;
  }
  if (this > 0x63)
  {
    if (this >> 4 <= 0x270)
    {
      if (this <= 0x3E7)
      {
        LODWORD(v6) = (unsigned __int16)this / 0x64u;
        *a2++ = v6 + 48;
        goto LABEL_9;
      }
LABEL_8:
      unint64_t v6 = this / 0x64uLL;
      *(_WORD *)a2 = google::protobuf::two_ASCII_digits[v6];
      a2 += 2;
LABEL_9:
      LODWORD(this) = this - 100 * v6;
      goto LABEL_10;
    }
    if (this < 0xF4240)
    {
      if (this >> 5 <= 0xC34)
      {
        LODWORD(v5) = this / 0x2710;
        *a2++ = this / 0x2710 + 48;
        goto LABEL_7;
      }
LABEL_6:
      unint64_t v5 = this / 0x2710uLL;
      *(_WORD *)a2 = google::protobuf::two_ASCII_digits[v5];
      a2 += 2;
LABEL_7:
      LODWORD(this) = this - 10000 * v5;
      goto LABEL_8;
    }
    if (this < 0x5F5E100)
    {
      if (this <= 0x98967F)
      {
        LODWORD(v4) = this / 0xF4240;
        *a2++ = this / 0xF4240 + 48;
        goto LABEL_5;
      }
LABEL_4:
      unint64_t v4 = this / 0xF4240uLL;
      *(_WORD *)a2 = google::protobuf::two_ASCII_digits[v4];
      a2 += 2;
LABEL_5:
      LODWORD(this) = this - 1000000 * v4;
      goto LABEL_6;
    }
    LODWORD(v3) = this / 0x5F5E100;
    *a2++ = this / 0x5F5E100 + 48;
LABEL_3:
    LODWORD(this) = this - 100000000 * v3;
    goto LABEL_4;
  }
  if (this <= 9)
  {
    *a2 = (_BYTE)this + 48;
    unsigned int v7 = a2 + 1;
    goto LABEL_11;
  }
LABEL_10:
  *(_WORD *)a2 = google::protobuf::two_ASCII_digits[this];
  unsigned int v7 = a2 + 2;
LABEL_11:
  *unsigned int v7 = 0;
  return v7;
}

unsigned char *google::protobuf::FastInt32ToBufferLeft(google::protobuf *this, unsigned char *a2, char *a3)
{
  if ((this & 0x80000000) != 0)
  {
    *a2++ = 45;
    this = (google::protobuf *)-(int)this;
  }
  return google::protobuf::FastUInt32ToBufferLeft(this, a2, a3);
}

unsigned char *google::protobuf::FastUInt64ToBufferLeft(google::protobuf *this, unsigned char *a2, char *a3)
{
  int v3 = (int)this;
  if ((unint64_t)this >> 32)
  {
    unint64_t v5 = (unint64_t)this / 0x3B9ACA00;
    unint64_t v6 = (_WORD *)google::protobuf::FastUInt64ToBufferLeft((google::protobuf *)((unint64_t)this / 0x3B9ACA00), (unint64_t)a2, a3);
    unsigned int v7 = v3 - 1000000000 * v5;
    if (v7 >= 0x3B9ACA00)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1068);
      uint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (digits) < (100): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    }
    *unint64_t v6 = google::protobuf::two_ASCII_digits[v7 / 0x989680];
    v6[1] = google::protobuf::two_ASCII_digits[v7 % 0x989680 / 0x186A0uLL];
    unsigned int v9 = v7 % 0x989680 % 0x186A0;
    v6[2] = google::protobuf::two_ASCII_digits[v9 / 0x3E8uLL];
    v9 %= 0x3E8u;
    v6[3] = google::protobuf::two_ASCII_digits[v9 / 0xAuLL];
    v6[4] = (v9 % 0xA + 48);
    return (char *)v6 + 9;
  }
  else
  {
    return google::protobuf::FastUInt32ToBufferLeft(this, a2, a3);
  }
}

void sub_25C1E6B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned char *google::protobuf::FastInt64ToBufferLeft(uint64_t this, unsigned char *a2, char *a3)
{
  if (this < 0)
  {
    *a2++ = 45;
    this = -this;
  }
  return google::protobuf::FastUInt64ToBufferLeft((google::protobuf *)this, a2, a3);
}

void *google::protobuf::SimpleItoa@<X0>(google::protobuf *this@<X0>, char *a2@<X2>, void *a3@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v4 = google::protobuf::FastInt32ToBuffer(this, v6, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

{
  char *v4;
  char v6[32];
  uint64_t v7;

  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v4 = google::protobuf::FastUInt32ToBufferLeft(this, v6, a2);
  return std::string::__init_with_size[abi:ne180100]<char const*,char const*>(a3, v6, v4, v4 - v6);
}

{
  char *v4;
  unsigned char v6[32];
  uint64_t v7;

  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v4 = google::protobuf::FastInt64ToBuffer((unint64_t)this, v6, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

{
  char *v4;
  char v6[32];
  uint64_t v7;

  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v4 = google::protobuf::FastUInt64ToBufferLeft(this, v6, a2);
  return std::string::__init_with_size[abi:ne180100]<char const*,char const*>(a3, v6, v4, v4 - v6);
}

void *google::protobuf::SimpleDtoa@<X0>(double a1@<D0>, char *a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  google::protobuf::DoubleToBuffer((google::protobuf *)__s, a1, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, __s);
}

google::protobuf *google::protobuf::DoubleToBuffer(google::protobuf *this, double a2, char *a3)
{
  if (a2 == INFINITY)
  {
    int v5 = 6712937;
LABEL_5:
    *(_DWORD *)this = v5;
    return this;
  }
  if (a2 == -INFINITY)
  {
    *((unsigned char *)this + 4) = 0;
    int v5 = 1718511917;
    goto LABEL_5;
  }
  if ((snprintf((char *)this, 0x20uLL, "%.*g", 15, a2) - 32) <= 0xFFFFFFE0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1265);
    uint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: snprintf_result > 0 && snprintf_result < kDoubleToBufferSize: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  double v12 = 0.0;
  double v12 = google::protobuf::internal::NoLocaleStrtod(this, 0, v7);
  if (v12 != a2 && (snprintf((char *)this, 0x20uLL, "%.*g", 17, a2) - 32) <= 0xFFFFFFE0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1279);
    char v10 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: snprintf_result > 0 && snprintf_result < kDoubleToBufferSize: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  google::protobuf::DelocalizeRadix(this, v9);
  return this;
}

void sub_25C1E6F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void *google::protobuf::SimpleFtoa@<X0>(float a1@<S0>, char *a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  google::protobuf::FloatToBuffer((google::protobuf *)v6, a1, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, v6);
}

google::protobuf *google::protobuf::FloatToBuffer(google::protobuf *this, float a2, char *a3)
{
  if (a2 == INFINITY)
  {
    int v5 = 6712937;
LABEL_5:
    *(_DWORD *)this = v5;
    return this;
  }
  if (a2 == -INFINITY)
  {
    *((unsigned char *)this + 4) = 0;
    int v5 = 1718511917;
    goto LABEL_5;
  }
  if ((snprintf((char *)this, 0x18uLL, "%.*g", 6, a2) - 24) <= 0xFFFFFFE8)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1383);
    uint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: snprintf_result > 0 && snprintf_result < kFloatToBufferSize: ");
    google::protobuf::internal::LogFinisher::operator=((int)v12, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  *(float *)double v12 = 0.0;
  if ((!google::protobuf::safe_strtof(this, (float *)v12, v7) || *(float *)v12 != a2)
    && (snprintf((char *)this, 0x18uLL, "%.*g", 9, a2) - 24) <= 0xFFFFFFE8)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1391);
    char v10 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: snprintf_result > 0 && snprintf_result < kFloatToBufferSize: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  google::protobuf::DelocalizeRadix(this, v9);
  return this;
}

void sub_25C1E7170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

char *google::protobuf::DelocalizeRadix(google::protobuf *this, char *a2)
{
  result = strchr((char *)this, 46);
  if (!result)
  {
    for (i = (char *)this + 2; ; ++i)
    {
      int v5 = *((unsigned __int8 *)i - 2);
      if ((v5 - 48) >= 0xA
        && ((v5 - 43) > 0x3A || ((1 << (v5 - 43)) & 0x400000004000005) == 0))
      {
        break;
      }
    }
    if (*(i - 2))
    {
      uint64_t v8 = (unsigned __int8 *)(i - 1);
      int v7 = *((unsigned __int8 *)i - 1);
      *((unsigned char *)i - 2) = 46;
      if ((v7 - 48) >= 0xA
        && ((v7 - 43) > 0x3A || ((1 << (v7 - 43)) & 0x400000004000005) == 0))
      {
        if (v7)
        {
          do
          {
            unsigned int v9 = i;
            int v10 = *(unsigned __int8 *)i;
            if ((v10 - 48) < 0xA) {
              break;
            }
            ++i;
            BOOL v11 = (v10 - 43) > 0x3A || ((1 << (v10 - 43)) & 0x400000004000005) == 0;
          }
          while (v11 && v10 != 0);
          size_t v13 = strlen(v9) + 1;
          return (char *)memmove(v8, v9, v13);
        }
      }
    }
  }
  return result;
}

double google::protobuf::internal::NoLocaleStrtod(google::protobuf::internal *this, char *a2, char **a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v19 = 0;
  double v5 = strtod((const char *)this, &v19);
  unint64_t v6 = v19;
  if (a2) {
    *(void *)a2 = v19;
  }
  if (*v6 == 46)
  {
    int v7 = snprintf(&__str, 0x10uLL, "%.1f", 1.5);
    if (__str != 49)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2425);
      uint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v21, "CHECK failed: (temp[0]) == ('1'): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v20, (const char **)&v8->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v21[0].__r_.__value_.__l.__data_);
    }
    if (v23[v7 - 2] != 53)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2426);
      unsigned int v9 = google::protobuf::internal::LogMessage::operator<<(v21, "CHECK failed: (temp[size - 1]) == ('5'): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v20, (const char **)&v9->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v21[0].__r_.__value_.__l.__data_);
    }
    if (v7 >= 7)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2427);
      int v10 = google::protobuf::internal::LogMessage::operator<<(v21, "CHECK failed: (size) <= (6): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v20, (const char **)&v10->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v21[0].__r_.__value_.__l.__data_);
    }
    memset(&v18, 0, sizeof(v18));
    size_t v11 = strlen((const char *)this);
    std::string::reserve(&v18, v11 + v7 - 3);
    std::string::append[abi:ne180100]<char const*,0>(&v18, (char *)this, v6);
    std::string::append(&v18, v23, v7 - 2);
    double v12 = v6 + 1;
    size_t v13 = &v18;
    std::string::append(&v18, v12);
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      size_t v13 = (std::string *)v18.__r_.__value_.__r.__words[0];
    }
    v21[0].__r_.__value_.__r.__words[0] = 0;
    double v5 = strtod((const char *)v13, &v21[0].__r_.__value_.__l.__data_);
    char v14 = HIBYTE(v18.__r_.__value_.__r.__words[2]);
    if (a2 && (int64_t)(v21[0].__r_.__value_.__r.__words[0] - (void)v13) > v19 - (char *)this)
    {
      int v15 = strlen((const char *)this);
      if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v16 = HIBYTE(v18.__r_.__value_.__r.__words[2]);
      }
      else {
        int v16 = v18.__r_.__value_.__r.__words[1];
      }
      *(void *)a2 = (char *)this + v21[0].__r_.__value_.__r.__words[0] - ((void)v13 + v16 - v15);
    }
    if (v14 < 0) {
      operator delete(v18.__r_.__value_.__l.__data_);
    }
  }
  return v5;
}

void sub_25C1E7528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, void *a19)
{
}

uint64_t google::protobuf::safe_strtob(unsigned __int8 *a1, uint64_t a2, char *a3)
{
  if (!a3)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v38, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1305);
    unint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v38, "CHECK failed: value != nullptr: ");
    int v7 = google::protobuf::internal::LogMessage::operator<<(v6, "nullptr output BOOLean given.");
    google::protobuf::internal::LogFinisher::operator=((int)&v37, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v38[0].__r_.__value_.__l.__data_);
  }
  switch(a2)
  {
    case 1:
      uint64_t v8 = 0;
      while (1)
      {
        int v9 = a1[v8];
        if ((v9 - 65) < 0x1A) {
          LOBYTE(v9) = v9 + 32;
        }
        int v10 = aT[v8];
        if ((v10 - 65) < 0x1A) {
          LOBYTE(v10) = v10 + 32;
        }
        if (v9 != v10) {
          break;
        }
        if (a2 == ++v8) {
          goto LABEL_40;
        }
      }
      if (a2 == 1) {
        goto LABEL_33;
      }
      if (a2 == 5) {
        goto LABEL_49;
      }
      if (a2 != 3) {
        goto LABEL_44;
      }
      goto LABEL_23;
    case 3:
LABEL_23:
      uint64_t v14 = 0;
      while (1)
      {
        int v15 = a1[v14];
        if ((v15 - 65) < 0x1A) {
          LOBYTE(v15) = v15 + 32;
        }
        int v16 = aYes[v14];
        if ((v16 - 65) < 0x1A) {
          LOBYTE(v16) = v16 + 32;
        }
        if (v15 != v16) {
          break;
        }
        if (a2 == ++v14) {
          goto LABEL_40;
        }
      }
      if (a2 == 5)
      {
LABEL_49:
        uint64_t v24 = "false";
        v25 = a1;
        uint64_t v26 = a2;
        while (1)
        {
          int v28 = *v25++;
          char v27 = v28;
          char v29 = v28 + 32;
          if ((v28 - 65) < 0x1A) {
            char v27 = v29;
          }
          int v31 = *(unsigned __int8 *)v24++;
          char v30 = v31;
          char v32 = v31 + 32;
          if ((v31 - 65) < 0x1A) {
            char v30 = v32;
          }
          if (v27 != v30) {
            goto LABEL_44;
          }
          if (!--v26) {
            goto LABEL_56;
          }
        }
      }
      if (a2 != 1) {
        goto LABEL_44;
      }
LABEL_33:
      uint64_t v17 = 0;
      while (1)
      {
        int v18 = a1[v17];
        if ((v18 - 65) < 0x1A) {
          LOBYTE(v18) = v18 + 32;
        }
        int v19 = aY[v17];
        if ((v19 - 65) < 0x1A) {
          LOBYTE(v19) = v19 + 32;
        }
        if (v18 != v19) {
          break;
        }
        if (a2 == ++v17) {
          goto LABEL_40;
        }
      }
      int v21 = *a1;
      if ((v21 - 65) < 0x1A) {
        LOBYTE(v21) = v21 + 32;
      }
      if (v21 != 49) {
        goto LABEL_44;
      }
      goto LABEL_40;
    case 4:
      uint64_t v11 = 0;
      break;
    case 5:
      goto LABEL_49;
    default:
      goto LABEL_44;
  }
  while (1)
  {
    int v12 = a1[v11];
    if ((v12 - 65) < 0x1A) {
      LOBYTE(v12) = v12 + 32;
    }
    int v13 = aTrue[v11];
    if ((v13 - 65) < 0x1A) {
      LOBYTE(v13) = v13 + 32;
    }
    if (v12 != v13) {
      break;
    }
    if (++v11 == 4)
    {
LABEL_40:
      char v20 = 1;
      goto LABEL_57;
    }
  }
LABEL_44:
  google::protobuf::StringPiece::StringPiece((google::protobuf::StringPiece *)v36, "f");
  if (google::protobuf::CaseEqual(a1, a2, v36[0], (uint64_t)v36[1])
    || (google::protobuf::StringPiece::StringPiece((google::protobuf::StringPiece *)v35, "no"),
        google::protobuf::CaseEqual(a1, a2, v35[0], (uint64_t)v35[1]))
    || (google::protobuf::StringPiece::StringPiece((google::protobuf::StringPiece *)v34, "n"),
        google::protobuf::CaseEqual(a1, a2, v34[0], (uint64_t)v34[1])))
  {
LABEL_56:
    char v20 = 0;
  }
  else
  {
    google::protobuf::StringPiece::StringPiece((google::protobuf::StringPiece *)v33, "0");
    BOOL v22 = google::protobuf::CaseEqual(a1, a2, v33[0], (uint64_t)v33[1]);
    char v20 = 0;
    uint64_t result = 0;
    if (!v22) {
      return result;
    }
  }
LABEL_57:
  *a3 = v20;
  return 1;
}

void sub_25C1E78B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL google::protobuf::CaseEqual(unsigned __int8 *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  if (a2 != a4) {
    return 0;
  }
  if (a2)
  {
    while (1)
    {
      int v5 = *a1++;
      unsigned __int8 v4 = v5;
      unsigned __int8 v6 = v5 + 32;
      if ((v5 - 65) < 0x1A) {
        unsigned __int8 v4 = v6;
      }
      int v8 = *a3++;
      unsigned __int8 v7 = v8;
      unsigned __int8 v9 = v8 + 32;
      if ((v8 - 65) < 0x1A) {
        unsigned __int8 v7 = v9;
      }
      int v10 = v4 - v7;
      if (v10) {
        break;
      }
      if (!--a2) {
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    int v10 = 0;
  }
  return v10 == 0;
}

BOOL google::protobuf::safe_strtof(google::protobuf *this, float *a2, float *a3)
{
  unsigned __int8 v6 = 0;
  *__error() = 0;
  *a2 = strtof((const char *)this, &v6);
  return *(unsigned char *)this && !*v6 && *__error() == 0;
}

BOOL google::protobuf::safe_strtod(google::protobuf *this, double *a2, char **a3)
{
  *(void *)unsigned __int8 v7 = 0;
  *a2 = google::protobuf::internal::NoLocaleStrtod(this, v7, a3);
  i = this;
  if (*(google::protobuf **)v7 != this)
  {
    for (i = *(google::protobuf **)v7; ; *(void *)unsigned __int8 v7 = i)
    {
      int v5 = *(unsigned __int8 *)i;
      if ((v5 - 9) >= 5 && v5 != 32) {
        break;
      }
      i = (google::protobuf *)((char *)i + 1);
    }
  }
  return *(unsigned char *)this && *(unsigned char *)i == 0;
}

uint64_t google::protobuf::safe_strto32(uint64_t a1, int *a2)
{
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  uint64_t v3 = google::protobuf::safe_int_internal<int>(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_25C1E7ABC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_int_internal<int>(std::string *__str, int *a2)
{
  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    unsigned __int8 v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    int64_t size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    unsigned __int8 v4 = __str;
    int64_t size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  unsigned __int8 v6 = (char *)v4 + size;
  unsigned __int8 v7 = v4;
  if (size >= 1)
  {
    unsigned __int8 v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32) {
        break;
      }
      unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  uint64_t v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6) {
      return 0;
    }
    int v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  int v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1)) {
      return 0;
    }
  }
  uint64_t v11 = __str;
  if ((*((unsigned char *)&__str->__r_.__value_.__s + 23) & 0x80) != 0) {
    uint64_t v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  }
  std::string::basic_string(&v15, __str, (char *)v7 - (char *)v11, v8 - (void)v7, (std::allocator<char> *)&v16);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str->__r_.__value_.__l.__data_);
  }
  *char __str = v15;
  if (v10 == 45) {
    return google::protobuf::safe_parse_negative_int<int>((unsigned __int8 *)__str, a2);
  }
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = *__str;
  }
  uint64_t v12 = google::protobuf::safe_parse_positive_int<int>((unsigned __int8 *)&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v12;
}

void sub_25C1E7C50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_strtou32(uint64_t a1, unsigned int *a2)
{
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  uint64_t v3 = google::protobuf::safe_uint_internal<unsigned int>(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_25C1E7CE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_uint_internal<unsigned int>(std::string *__str, unsigned int *a2)
{
  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    unsigned __int8 v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    int64_t size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    unsigned __int8 v4 = __str;
    int64_t size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  unsigned __int8 v6 = (char *)v4 + size;
  unsigned __int8 v7 = v4;
  if (size >= 1)
  {
    unsigned __int8 v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32) {
        break;
      }
      unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  uint64_t v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6) {
      return 0;
    }
    int v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  int v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1)) {
      return 0;
    }
  }
  uint64_t v11 = __str;
  if ((*((unsigned char *)&__str->__r_.__value_.__s + 23) & 0x80) != 0) {
    uint64_t v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  }
  std::string::basic_string(&v15, __str, (char *)v7 - (char *)v11, v8 - (void)v7, (std::allocator<char> *)&v16);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str->__r_.__value_.__l.__data_);
  }
  *char __str = v15;
  if (v10 == 45) {
    return 0;
  }
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = *__str;
  }
  uint64_t v12 = google::protobuf::safe_parse_positive_int<unsigned int>((unsigned __int8 *)&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v12;
}

void sub_25C1E7E60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_strto64(uint64_t a1, int64_t *a2)
{
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  uint64_t v3 = google::protobuf::safe_int_internal<long long>(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_25C1E7EF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_int_internal<long long>(std::string *__str, int64_t *a2)
{
  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    unsigned __int8 v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    int64_t size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    unsigned __int8 v4 = __str;
    int64_t size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  unsigned __int8 v6 = (char *)v4 + size;
  unsigned __int8 v7 = v4;
  if (size >= 1)
  {
    unsigned __int8 v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32) {
        break;
      }
      unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  uint64_t v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6) {
      return 0;
    }
    int v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  int v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1)) {
      return 0;
    }
  }
  uint64_t v11 = __str;
  if ((*((unsigned char *)&__str->__r_.__value_.__s + 23) & 0x80) != 0) {
    uint64_t v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  }
  std::string::basic_string(&v15, __str, (char *)v7 - (char *)v11, v8 - (void)v7, (std::allocator<char> *)&v16);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str->__r_.__value_.__l.__data_);
  }
  *char __str = v15;
  if (v10 == 45) {
    return google::protobuf::safe_parse_negative_int<long long>((unsigned __int8 *)__str, a2);
  }
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = *__str;
  }
  uint64_t v12 = google::protobuf::safe_parse_positive_int<long long>((unsigned __int8 *)&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v12;
}

void sub_25C1E8084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_strtou64(uint64_t a1, unint64_t *a2)
{
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  uint64_t v3 = google::protobuf::safe_uint_internal<unsigned long long>(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_25C1E8114(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_uint_internal<unsigned long long>(std::string *__str, unint64_t *a2)
{
  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    unsigned __int8 v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    int64_t size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    unsigned __int8 v4 = __str;
    int64_t size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  unsigned __int8 v6 = (char *)v4 + size;
  unsigned __int8 v7 = v4;
  if (size >= 1)
  {
    unsigned __int8 v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32) {
        break;
      }
      unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  uint64_t v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6) {
      return 0;
    }
    int v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  int v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1)) {
      return 0;
    }
  }
  uint64_t v11 = __str;
  if ((*((unsigned char *)&__str->__r_.__value_.__s + 23) & 0x80) != 0) {
    uint64_t v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  }
  std::string::basic_string(&v15, __str, (char *)v7 - (char *)v11, v8 - (void)v7, (std::allocator<char> *)&v16);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str->__r_.__value_.__l.__data_);
  }
  *char __str = v15;
  if (v10 == 45) {
    return 0;
  }
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = *__str;
  }
  uint64_t v12 = google::protobuf::safe_parse_positive_int<unsigned long long>((unsigned __int8 *)&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v12;
}

void sub_25C1E8294(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *google::protobuf::strings::AlphaNum::AlphaNum(void *result, unint64_t a2, char a3)
{
  uint64_t v3 = 0;
  unint64_t v4 = (1 << (4 * a3 - 4)) | a2;
  do
  {
    *((unsigned char *)result + v3 + 47) = google::protobuf::strings::AlphaNum::AlphaNum(google::protobuf::strings::Hex)::hexdigits[a2 & 0xF];
    a2 >>= 4;
    --v3;
    BOOL v5 = v4 > 0xF;
    v4 >>= 4;
  }
  while (v5);
  char *result = (char *)result + v3 + 48;
  result[1] = -v3;
  return result;
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a3, *(void *)(a2 + 8) + *(void *)(a1 + 8), 0);
  if ((a3->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned __int8 v6 = a3;
  }
  else {
    unsigned __int8 v6 = (std::string *)a3->__r_.__value_.__r.__words[0];
  }
  size_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    memcpy(v6, *(const void **)a1, v7);
    uint64_t v8 = (char *)v6 + *(void *)(a1 + 8);
  }
  else
  {
    uint64_t v8 = (char *)v6;
  }
  size_t v9 = *(void *)(a2 + 8);
  if (v9)
  {
    memcpy(v8, *(const void **)a2, v9);
    v8 += *(void *)(a2 + 8);
  }
  std::string::size_type size = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a3->__r_.__value_.__l.__size_;
  }
  if (v8 != (char *)v6 + size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1477);
    uint64_t v11 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
}

void sub_25C1E8410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  a4->__r_.__value_.__r.__words[0] = 0;
  a4->__r_.__value_.__l.__size_ = 0;
  a4->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a4, *(void *)(a2 + 8) + *(void *)(a1 + 8) + *(void *)(a3 + 8), 0);
  if ((a4->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v8 = a4;
  }
  else {
    uint64_t v8 = (std::string *)a4->__r_.__value_.__r.__words[0];
  }
  size_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    memcpy(v8, *(const void **)a1, v9);
    int v10 = (char *)v8 + *(void *)(a1 + 8);
  }
  else
  {
    int v10 = (char *)v8;
  }
  size_t v11 = *(void *)(a2 + 8);
  if (v11)
  {
    memcpy(v10, *(const void **)a2, v11);
    v10 += *(void *)(a2 + 8);
  }
  size_t v12 = *(void *)(a3 + 8);
  if (v12)
  {
    memcpy(v10, *(const void **)a3, v12);
    v10 += *(void *)(a3 + 8);
  }
  std::string::size_type size = HIBYTE(a4->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a4->__r_.__value_.__l.__size_;
  }
  if (v10 != (char *)v8 + size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1487);
    uint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v14->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
  }
}

void sub_25C1E8578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = 0;
  *(void *)(a5 + 8) = 0;
  *(void *)(a5 + 16) = 0;
  std::string::resize((std::string *)a5, *(void *)(a2 + 8) + *(void *)(a1 + 8) + *(void *)(a3 + 8) + *(void *)(a4 + 8), 0);
  if (*(char *)(a5 + 23) >= 0) {
    int v10 = (char *)a5;
  }
  else {
    int v10 = *(char **)a5;
  }
  size_t v11 = google::protobuf::Append4(v10, a1, a2, a3, a4);
  uint64_t v12 = *(unsigned __int8 *)(a5 + 23);
  if ((v12 & 0x80u) != 0) {
    uint64_t v12 = *(void *)(a5 + 8);
  }
  if (v11 != &v10[v12])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1497);
    int v13 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v13->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
  }
}

void sub_25C1E86A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

char *google::protobuf::Append4(char *__dst, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __dst;
  size_t v9 = *(void *)(a2 + 8);
  if (v9)
  {
    memcpy(__dst, *(const void **)a2, v9);
    v8 += *(void *)(a2 + 8);
  }
  size_t v11 = *(void *)(a3 + 8);
  if (v11)
  {
    memcpy(v8, *(const void **)a3, v11);
    v8 += *(void *)(a3 + 8);
  }
  size_t v12 = *(void *)(a4 + 8);
  if (v12)
  {
    memcpy(v8, *(const void **)a4, v12);
    v8 += *(void *)(a4 + 8);
  }
  size_t v13 = *(void *)(a5 + 8);
  if (v13)
  {
    memcpy(v8, *(const void **)a5, v13);
    v8 += *(void *)(a5 + 8);
  }
  return v8;
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = 0;
  *(void *)(a6 + 8) = 0;
  *(void *)(a6 + 16) = 0;
  std::string::resize((std::string *)a6, *(void *)(a2 + 8) + *(void *)(a1 + 8) + *(void *)(a3 + 8) + *(void *)(a4 + 8) + *(void *)(a5 + 8), 0);
  if (*(char *)(a6 + 23) >= 0) {
    size_t v12 = (char *)a6;
  }
  else {
    size_t v12 = *(char **)a6;
  }
  size_t v13 = google::protobuf::Append4(v12, a1, a2, a3, a4);
  char v14 = v13;
  size_t v15 = *(void *)(a5 + 8);
  if (v15)
  {
    memcpy(v13, *(const void **)a5, v15);
    v14 += *(void *)(a5 + 8);
  }
  uint64_t v16 = *(unsigned __int8 *)(a6 + 23);
  if ((v16 & 0x80u) != 0) {
    uint64_t v16 = *(void *)(a6 + 8);
  }
  if (v14 != &v12[v16])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1508);
    uint64_t v17 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v17->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
  }
}

void sub_25C1E88C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(void *)a7 = 0;
  *(void *)(a7 + 8) = 0;
  *(void *)(a7 + 16) = 0;
  std::string::resize((std::string *)a7, *(void *)(a2 + 8)+ *(void *)(a1 + 8)+ *(void *)(a3 + 8)+ *(void *)(a4 + 8)+ *(void *)(a5 + 8)+ *(void *)(a6 + 8), 0);
  if (*(char *)(a7 + 23) >= 0) {
    char v14 = (char *)a7;
  }
  else {
    char v14 = *(char **)a7;
  }
  size_t v15 = google::protobuf::Append4(v14, a1, a2, a3, a4);
  uint64_t v16 = v15;
  size_t v17 = *(void *)(a5 + 8);
  if (v17)
  {
    memcpy(v15, *(const void **)a5, v17);
    v16 += *(void *)(a5 + 8);
  }
  size_t v18 = *(void *)(a6 + 8);
  if (v18)
  {
    memcpy(v16, *(const void **)a6, v18);
    v16 += *(void *)(a6 + 8);
  }
  uint64_t v19 = *(unsigned __int8 *)(a7 + 23);
  if ((v19 & 0x80u) != 0) {
    uint64_t v19 = *(void *)(a7 + 8);
  }
  if (v16 != &v14[v19])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v22, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1520);
    char v20 = google::protobuf::internal::LogMessage::operator<<(v22, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v21, (const char **)&v20->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v22[0].__r_.__value_.__l.__data_);
  }
}

void sub_25C1E8A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(void *)a8 = 0;
  *(void *)(a8 + 8) = 0;
  *(void *)(a8 + 16) = 0;
  std::string::resize((std::string *)a8, *(void *)(a2 + 8)+ *(void *)(a1 + 8)+ *(void *)(a3 + 8)+ *(void *)(a4 + 8)+ *(void *)(a5 + 8)+ *(void *)(a6 + 8)+ *(void *)(a7 + 8), 0);
  if (*(char *)(a8 + 23) >= 0) {
    uint64_t v16 = (char *)a8;
  }
  else {
    uint64_t v16 = *(char **)a8;
  }
  size_t v17 = google::protobuf::Append4(v16, a1, a2, a3, a4);
  size_t v18 = v17;
  size_t v19 = *(void *)(a5 + 8);
  if (v19)
  {
    memcpy(v17, *(const void **)a5, v19);
    v18 += *(void *)(a5 + 8);
  }
  size_t v20 = *(void *)(a6 + 8);
  if (v20)
  {
    memcpy(v18, *(const void **)a6, v20);
    v18 += *(void *)(a6 + 8);
  }
  size_t v21 = *(void *)(a7 + 8);
  if (v21)
  {
    memcpy(v18, *(const void **)a7, v21);
    v18 += *(void *)(a7 + 8);
  }
  uint64_t v22 = *(unsigned __int8 *)(a8 + 23);
  if ((v22 & 0x80u) != 0) {
    uint64_t v22 = *(void *)(a8 + 8);
  }
  if (v18 != &v16[v22])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1534);
    v23 = google::protobuf::internal::LogMessage::operator<<(v25, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v24, (const char **)&v23->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v25[0].__r_.__value_.__l.__data_);
  }
}

void sub_25C1E8C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *(void *)a9 = 0;
  *(void *)(a9 + 8) = 0;
  *(void *)(a9 + 16) = 0;
  std::string::resize((std::string *)a9, *(void *)(a2 + 8)+ *(void *)(a1 + 8)+ *(void *)(a3 + 8)+ *(void *)(a4 + 8)+ *(void *)(a5 + 8)+ *(void *)(a6 + 8)+ *(void *)(a7 + 8)+ *(void *)(a8 + 8), 0);
  if (*(char *)(a9 + 23) >= 0) {
    size_t v18 = (char *)a9;
  }
  else {
    size_t v18 = *(char **)a9;
  }
  size_t v19 = google::protobuf::Append4(v18, a1, a2, a3, a4);
  size_t v20 = google::protobuf::Append4(v19, a5, a6, a7, a8);
  uint64_t v21 = *(unsigned __int8 *)(a9 + 23);
  if ((v21 & 0x80u) != 0) {
    uint64_t v21 = *(void *)(a9 + 8);
  }
  if (v20 != &v18[v21])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1547);
    uint64_t v22 = google::protobuf::internal::LogMessage::operator<<(v24, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v22->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v24[0].__r_.__value_.__l.__data_);
  }
}

void sub_25C1E8D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  *(void *)a9 = 0;
  *(void *)(a9 + 8) = 0;
  *(void *)(a9 + 16) = 0;
  std::string::resize((std::string *)a9, *(void *)(a2 + 8)+ *(void *)(a1 + 8)+ *(void *)(a3 + 8)+ *(void *)(a4 + 8)+ *(void *)(a5 + 8)+ *(void *)(a6 + 8)+ *(void *)(a7 + 8)+ *(void *)(a8 + 8)+ *(void *)(a10 + 8), 0);
  if (*(char *)(a9 + 23) >= 0) {
    size_t v18 = (char *)a9;
  }
  else {
    size_t v18 = *(char **)a9;
  }
  size_t v19 = google::protobuf::Append4(v18, a1, a2, a3, a4);
  size_t v20 = google::protobuf::Append4(v19, a5, a6, a7, a8);
  uint64_t v21 = v20;
  size_t v22 = *(void *)(a10 + 8);
  if (v22)
  {
    memcpy(v20, *(const void **)a10, v22);
    v21 += *(void *)(a10 + 8);
  }
  uint64_t v23 = *(unsigned __int8 *)(a9 + 23);
  if ((v23 & 0x80u) != 0) {
    uint64_t v23 = *(void *)(a9 + 8);
  }
  if (v21 != &v18[v23])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1561);
    char v24 = google::protobuf::internal::LogMessage::operator<<(v27, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v26, (const char **)&v24->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v27[0].__r_.__value_.__l.__data_);
  }
}

void sub_25C1E8F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

std::string *google::protobuf::StrAppend(std::string *this, uint64_t a2)
{
  unint64_t v4 = *(const std::string::value_type **)a2;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unsigned __int8 v6 = &v4[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    unsigned __int8 v6 = (const std::string::value_type *)(v4 - (const std::string::value_type *)this);
  }
  if ((unint64_t)v6 <= size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1574);
    size_t v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    unint64_t v4 = *(const std::string::value_type **)a2;
  }
  return std::string::append(this, v4, *(void *)(a2 + 8));
}

void sub_25C1E9010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::StrAppend(std::string *this, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v6 = *(unsigned char **)a2;
  int v7 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v7 < 0)
  {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    std::string::size_type v9 = (std::string::size_type)&v6[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = v6 - (unsigned char *)this;
  }
  if (v9 <= size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1579);
    int v10 = google::protobuf::internal::LogMessage::operator<<(v23, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v22, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v23[0].__r_.__value_.__l.__data_);
    LOBYTE(v7) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  size_t v11 = *(unsigned char **)a3;
  if ((v7 & 0x80) != 0)
  {
    std::string::size_type v13 = this->__r_.__value_.__l.__size_;
    std::string::size_type v12 = (std::string::size_type)&v11[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type v12 = v11 - (unsigned char *)this;
    std::string::size_type v13 = v7;
  }
  if (v12 <= v13)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1580);
    char v14 = google::protobuf::internal::LogMessage::operator<<(v23, "CHECK failed: (uintptr_t((b).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v22, (const char **)&v14->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v23[0].__r_.__value_.__l.__data_);
    LOBYTE(v7) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v7 & 0x80) != 0) {
    std::string::size_type v15 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v15 = v7;
  }
  std::string::resize(this, *(void *)(a2 + 8) + v15 + *(void *)(a3 + 8), 0);
  uint64_t v16 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    uint64_t v16 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  size_t v17 = (char *)v16 + v15;
  size_t v18 = *(void *)(a2 + 8);
  if (v18)
  {
    memcpy(v17, *(const void **)a2, v18);
    v17 += *(void *)(a2 + 8);
  }
  size_t v19 = *(void *)(a3 + 8);
  if (v19)
  {
    memcpy(v17, *(const void **)a3, v19);
    v17 += *(void *)(a3 + 8);
  }
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type v20 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v20 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  }
  if (v17 != (char *)v16 + v20)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1585);
    uint64_t v21 = google::protobuf::internal::LogMessage::operator<<(v23, "CHECK failed: (out) == (begin + result->size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v22, (const char **)&v21->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v23[0].__r_.__value_.__l.__data_);
  }
}

void sub_25C1E920C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::StrAppend(std::string *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(unsigned char **)a2;
  int v9 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v9 < 0)
  {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    std::string::size_type v11 = (std::string::size_type)&v8[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v11 = v8 - (unsigned char *)this;
  }
  if (v11 <= size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1590);
    std::string::size_type v12 = google::protobuf::internal::LogMessage::operator<<(v30, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v29, (const char **)&v12->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v30[0].__r_.__value_.__l.__data_);
    LOBYTE(v9) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  std::string::size_type v13 = *(unsigned char **)a3;
  if ((v9 & 0x80) != 0)
  {
    std::string::size_type v15 = this->__r_.__value_.__l.__size_;
    std::string::size_type v14 = (std::string::size_type)&v13[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type v14 = v13 - (unsigned char *)this;
    std::string::size_type v15 = v9;
  }
  if (v14 <= v15)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1591);
    uint64_t v16 = google::protobuf::internal::LogMessage::operator<<(v30, "CHECK failed: (uintptr_t((b).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v29, (const char **)&v16->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v30[0].__r_.__value_.__l.__data_);
    LOBYTE(v9) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  size_t v17 = *(unsigned char **)a4;
  if ((v9 & 0x80) != 0)
  {
    std::string::size_type v19 = this->__r_.__value_.__l.__size_;
    std::string::size_type v18 = (std::string::size_type)&v17[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type v18 = v17 - (unsigned char *)this;
    std::string::size_type v19 = v9;
  }
  if (v18 <= v19)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1592);
    std::string::size_type v20 = google::protobuf::internal::LogMessage::operator<<(v30, "CHECK failed: (uintptr_t((c).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v29, (const char **)&v20->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v30[0].__r_.__value_.__l.__data_);
    LOBYTE(v9) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v9 & 0x80) != 0) {
    std::string::size_type v21 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v21 = v9;
  }
  std::string::resize(this, *(void *)(a2 + 8) + *(void *)(a4 + 8) + v21 + *(void *)(a3 + 8), 0);
  char v22 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    char v22 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  uint64_t v23 = (char *)v22 + v21;
  size_t v24 = *(void *)(a2 + 8);
  if (v24)
  {
    memcpy(v23, *(const void **)a2, v24);
    v23 += *(void *)(a2 + 8);
  }
  size_t v25 = *(void *)(a3 + 8);
  if (v25)
  {
    memcpy(v23, *(const void **)a3, v25);
    v23 += *(void *)(a3 + 8);
  }
  size_t v26 = *(void *)(a4 + 8);
  if (v26)
  {
    memcpy(v23, *(const void **)a4, v26);
    v23 += *(void *)(a4 + 8);
  }
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type v27 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v27 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  }
  if (v23 != (char *)v22 + v27)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1598);
    int v28 = google::protobuf::internal::LogMessage::operator<<(v30, "CHECK failed: (out) == (begin + result->size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v29, (const char **)&v28->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v30[0].__r_.__value_.__l.__data_);
  }
}

void sub_25C1E94A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::StrAppend(std::string *this, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10 = *a2;
  int v11 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v11 < 0)
  {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    std::string::size_type v13 = v10 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v13 = v10 - (void)this;
  }
  if (v13 <= size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1603);
    std::string::size_type v14 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v32, (const char **)&v14->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    LOBYTE(v11) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  uint64_t v15 = *a3;
  if ((v11 & 0x80) != 0)
  {
    std::string::size_type v17 = this->__r_.__value_.__l.__size_;
    std::string::size_type v16 = v15 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::string::size_type v16 = v15 - (void)this;
    std::string::size_type v17 = v11;
  }
  if (v16 <= v17)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1604);
    std::string::size_type v18 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: (uintptr_t((b).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v32, (const char **)&v18->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    LOBYTE(v11) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  uint64_t v19 = *a4;
  if ((v11 & 0x80) != 0)
  {
    std::string::size_type v21 = this->__r_.__value_.__l.__size_;
    std::string::size_type v20 = v19 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::string::size_type v20 = v19 - (void)this;
    std::string::size_type v21 = v11;
  }
  if (v20 <= v21)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1605);
    char v22 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: (uintptr_t((c).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v32, (const char **)&v22->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    LOBYTE(v11) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  uint64_t v23 = *a5;
  if ((v11 & 0x80) != 0)
  {
    std::string::size_type v25 = this->__r_.__value_.__l.__size_;
    std::string::size_type v24 = v23 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::string::size_type v24 = v23 - (void)this;
    std::string::size_type v25 = v11;
  }
  if (v24 <= v25)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1606);
    size_t v26 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: (uintptr_t((d).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v32, (const char **)&v26->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    LOBYTE(v11) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v11 & 0x80) != 0) {
    std::string::size_type v27 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v27 = v11;
  }
  std::string::resize(this, a2[1] + a4[1] + a5[1] + v27 + a3[1], 0);
  int v28 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    int v28 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  char v29 = google::protobuf::Append4((char *)v28 + v27, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type v30 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v30 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  }
  if (v29 != (char *)v28 + v30)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1611);
    int v31 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: (out) == (begin + result->size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v32, (const char **)&v31->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
  }
}

void sub_25C1E9788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::GlobalReplaceSubstring(uint64_t a1, uint64_t a2, std::string *this)
{
  if (!this)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1616);
    unsigned __int8 v6 = google::protobuf::internal::LogMessage::operator<<(&v24, "CHECK failed: s != nullptr: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    if (!this->__r_.__value_.__l.__size_) {
      return 0;
    }
  }
  else if (!*((unsigned char *)&this->__r_.__value_.__s + 23))
  {
    return 0;
  }
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::size_type v7 = *(void *)(a1 + 8);
    if (v7)
    {
      memset(&v24, 0, sizeof(v24));
      uint64_t v8 = *(const std::string::value_type **)a1;
      goto LABEL_12;
    }
    return 0;
  }
  std::string::size_type v7 = *(unsigned __int8 *)(a1 + 23);
  if (!*(unsigned char *)(a1 + 23)) {
    return 0;
  }
  memset(&v24, 0, sizeof(v24));
  uint64_t v8 = (const std::string::value_type *)a1;
LABEL_12:
  int v9 = std::string::find(this, v8, 0, v7);
  if (v9 == -1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    int v11 = 0;
    LODWORD(v10) = 0;
    do
    {
      std::string::append(&v24, this, v11, v9 - v11);
      uint64_t v12 = *(unsigned __int8 *)(a2 + 23);
      if ((v12 & 0x80u) == 0) {
        std::string::size_type v13 = (char *)a2;
      }
      else {
        std::string::size_type v13 = *(char **)a2;
      }
      if ((v12 & 0x80u) != 0) {
        uint64_t v12 = *(void *)(a2 + 8);
      }
      std::string::append[abi:ne180100]<std::__wrap_iter<char const*>,0>(&v24, v13, &v13[v12]);
      int v14 = *(char *)(a1 + 23);
      if (v14 >= 0) {
        std::string::size_type v15 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        std::string::size_type v15 = *(void *)(a1 + 8);
      }
      if (v14 >= 0) {
        std::string::size_type v16 = (const std::string::value_type *)a1;
      }
      else {
        std::string::size_type v16 = *(const std::string::value_type **)a1;
      }
      int v17 = v15 + v9;
      std::string::size_type v18 = (int)v15 + v9;
      int v9 = std::string::find(this, v16, v18, v15);
      uint64_t v10 = (v10 + 1);
      int v11 = v17;
    }
    while (v9 != -1);
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
    }
    else {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    }
    std::string::append(&v24, this, v18, size - v18);
    std::string::size_type v20 = this->__r_.__value_.__r.__words[2];
    long long v21 = *(_OWORD *)&this->__r_.__value_.__l.__data_;
    *this = v24;
    *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v21;
    v24.__r_.__value_.__r.__words[2] = v20;
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  return v10;
}

void sub_25C1E99A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::string::append[abi:ne180100]<std::__wrap_iter<char const*>,0>(std::string *this, char *a2, char *a3)
{
  unint64_t v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    uint64_t v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    int v14 = this;
    if ((v6 & 0x80) != 0) {
      int v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    std::string::size_type v15 = (char *)v14 + size;
    while (v4 != a3)
    {
      char v16 = *v4++;
      *v15++ = v16;
    }
    *std::string::size_type v15 = 0;
    std::string::size_type v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v17;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
  }
  else
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      uint64_t v12 = __p;
    }
    else {
      uint64_t v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0) {
      operator delete(__p[0]);
    }
  }
  return this;
}

void sub_25C1E9B2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::CalculateBase64EscapedLen(google::protobuf *this, int a2)
{
  uint64_t v2 = (4 * ((int)this / 3));
  if ((int)this % 3)
  {
    unsigned int v3 = v2 | 3;
    int v4 = v2 + 4;
    if (a2) {
      unsigned int v3 = v2 + 4;
    }
    LODWORD(v2) = v2 | 2;
    if (a2) {
      LODWORD(v2) = v4;
    }
    if ((int)this % 3 == 1) {
      uint64_t v2 = v2;
    }
    else {
      uint64_t v2 = v3;
    }
  }
  if ((int)v2 < (int)this) {
    google::protobuf::CalculateBase64EscapedLen();
  }
  return v2;
}

uint64_t google::protobuf::CalculateBase64EscapedLen(google::protobuf *this)
{
  return google::protobuf::CalculateBase64EscapedLen(this, 1);
}

uint64_t google::protobuf::Base64UnescapeInternal(google::protobuf *this, const char *a2, uint64_t a3, char *a4, uint64_t a5, const signed __int8 *a6)
{
  if (!a3)
  {
    if ((int)a2 >= 4)
    {
      unsigned int v7 = 0;
      LODWORD(v27) = 0;
      while (*(unsigned char *)this)
      {
        if (!*((unsigned char *)this + 1)) {
          break;
        }
        if (!*((unsigned char *)this + 2)) {
          break;
        }
        unsigned int v7 = (*(char *)(a5 + *((unsigned __int8 *)this + 1)) << 12) | (*(char *)(a5 + *(unsigned __int8 *)this) << 18) | (*(char *)(a5 + *((unsigned __int8 *)this + 2)) << 6) | *(char *)(a5 + *((unsigned __int8 *)this + 3));
        if ((v7 & 0x80000000) != 0) {
          break;
        }
        LODWORD(v8) = 0;
        LODWORD(a2) = a2 - 4;
        this = (google::protobuf *)((char *)this + 4);
        int v9 = -1;
LABEL_75:
        int v28 = 0;
        LODWORD(v27) = v27 + 3;
        if ((int)a2 <= 3) {
          goto LABEL_114;
        }
      }
      unsigned int v30 = a2 + 1;
      int v31 = (google::protobuf *)((char *)this + 1);
      char v32 = (google::protobuf *)((char *)this + 2);
      int v33 = a2 - 1;
      v34 = (google::protobuf *)((char *)this + 3);
      int v35 = a2 - 2;
      v36 = (google::protobuf *)((char *)this + 4);
      int v37 = (int)a2;
      while (1)
      {
        uint64_t v38 = *((unsigned __int8 *)v31 - 1);
        int v9 = *(char *)(a5 + v38);
        if ((v9 & 0x80000000) == 0) {
          break;
        }
        this = v31;
        if ((v38 - 9) >= 5 && v38 != 32)
        {
          LODWORD(a2) = v30 - 2;
          goto LABEL_104;
        }
        int v31 = (google::protobuf *)((char *)v31 + 1);
        --v30;
        --v37;
        char v32 = (google::protobuf *)((char *)v32 + 1);
        --v33;
        v34 = (google::protobuf *)((char *)v34 + 1);
        --v35;
        v36 = (google::protobuf *)((char *)v36 + 1);
        if (v30 <= 4)
        {
          LODWORD(a2) = 3;
LABEL_104:
          int v28 = 0;
          LODWORD(v8) = v38;
          goto LABEL_114;
        }
      }
      while (1)
      {
        uint64_t v40 = *((unsigned __int8 *)v32 - 1);
        int v9 = *(char *)(a5 + v40);
        if ((v9 & 0x80000000) == 0) {
          break;
        }
        int v39 = v37;
        this = v32;
        if ((v40 - 9) < 5 || v40 == 32)
        {
          char v32 = (google::protobuf *)((char *)v32 + 1);
          --v37;
          --v33;
          v34 = (google::protobuf *)((char *)v34 + 1);
          --v35;
          v36 = (google::protobuf *)((char *)v36 + 1);
          if (v37 > 3) {
            continue;
          }
        }
        LODWORD(a2) = v39 - 2;
        int v28 = 1;
        LODWORD(v8) = v40;
        goto LABEL_114;
      }
      while (1)
      {
        uint64_t v23 = *((unsigned __int8 *)v34 - 1);
        int v9 = *(char *)(a5 + v23);
        if ((v9 & 0x80000000) == 0) {
          break;
        }
        int v41 = v33;
        this = v34;
        if ((v23 - 9) < 5 || v23 == 32)
        {
          v34 = (google::protobuf *)((char *)v34 + 1);
          --v33;
          --v35;
          v36 = (google::protobuf *)((char *)v36 + 1);
          if (v33 > 2) {
            continue;
          }
        }
        LODWORD(a2) = v41 - 2;
        int v28 = 2;
LABEL_111:
        LODWORD(v8) = v23;
        goto LABEL_114;
      }
      do
      {
        int v42 = v35;
        this = v36;
        uint64_t v8 = *((unsigned __int8 *)v36 - 1);
        int v9 = *(unsigned __int8 *)(a5 + v8);
        if ((*(char *)(a5 + v8) & 0x80000000) == 0)
        {
          LODWORD(a2) = v35 - 2;
          goto LABEL_75;
        }
        if ((v8 - 9) >= 5 && v8 != 32) {
          break;
        }
        v36 = (google::protobuf *)((char *)v36 + 1);
        --v35;
      }
      while (v35 > 1);
      int v9 = (char)v9;
      LODWORD(a2) = v42 - 2;
      int v28 = 3;
      goto LABEL_114;
    }
LABEL_77:
    unsigned int v7 = 0;
    int v28 = 0;
    LODWORD(v27) = 0;
    goto LABEL_78;
  }
  if ((int)a2 < 4) {
    goto LABEL_77;
  }
  uint64_t v6 = 0;
  unsigned int v7 = 0;
  while (*(unsigned char *)this)
  {
    if (!*((unsigned char *)this + 1)) {
      break;
    }
    if (!*((unsigned char *)this + 2)) {
      break;
    }
    unsigned int v7 = (*(char *)(a5 + *((unsigned __int8 *)this + 1)) << 12) | (*(char *)(a5 + *(unsigned __int8 *)this) << 18) | (*(char *)(a5 + *((unsigned __int8 *)this + 2)) << 6) | *(char *)(a5 + *((unsigned __int8 *)this + 3));
    if ((v7 & 0x80000000) != 0) {
      break;
    }
    LODWORD(v8) = 0;
    LODWORD(a2) = a2 - 4;
    this = (google::protobuf *)((char *)this + 4);
    int v9 = -1;
LABEL_37:
    uint64_t v27 = v6 + 3;
    if ((int)v6 + 3 > (int)a4) {
      return 0xFFFFFFFFLL;
    }
    int v28 = 0;
    uint64_t v29 = a3 + v6;
    *(_WORD *)(v29 + 1) = bswap32(v7) >> 16;
    v7 >>= 16;
    *(unsigned char *)uint64_t v29 = v7;
    uint64_t v6 = v27;
    if ((int)a2 <= 3) {
      goto LABEL_114;
    }
  }
  unsigned int v10 = a2 + 1;
  unint64_t v11 = (google::protobuf *)((char *)this + 1);
  uint64_t v12 = (google::protobuf *)((char *)this + 2);
  int v13 = a2 - 1;
  int v14 = (google::protobuf *)((char *)this + 3);
  int v15 = a2 - 2;
  char v16 = (google::protobuf *)((char *)this + 4);
  int v17 = (int)a2;
  while (1)
  {
    this = v11;
    uint64_t v18 = *((unsigned __int8 *)v11 - 1);
    int v19 = *(unsigned __int8 *)(a5 + v18);
    if ((*(char *)(a5 + v18) & 0x80000000) == 0) {
      break;
    }
    if ((v18 - 9) >= 5 && v18 != 32)
    {
      LODWORD(a2) = v10 - 2;
      goto LABEL_100;
    }
    unint64_t v11 = (google::protobuf *)((char *)v11 + 1);
    --v10;
    --v17;
    uint64_t v12 = (google::protobuf *)((char *)v12 + 1);
    --v13;
    int v14 = (google::protobuf *)((char *)v14 + 1);
    --v15;
    char v16 = (google::protobuf *)((char *)v16 + 1);
    if (v10 <= 4)
    {
      LODWORD(a2) = 3;
LABEL_100:
      int v28 = 0;
      int v9 = (char)v19;
      LODWORD(v27) = v6;
      LODWORD(v8) = v18;
      goto LABEL_114;
    }
  }
  while (1)
  {
    this = v12;
    uint64_t v21 = *((unsigned __int8 *)v12 - 1);
    int v22 = *(unsigned __int8 *)(a5 + v21);
    if ((*(char *)(a5 + v21) & 0x80000000) == 0) {
      break;
    }
    int v20 = v17;
    if ((v21 - 9) < 5 || v21 == 32)
    {
      uint64_t v12 = (google::protobuf *)((char *)v12 + 1);
      --v17;
      --v13;
      int v14 = (google::protobuf *)((char *)v14 + 1);
      --v15;
      char v16 = (google::protobuf *)((char *)v16 + 1);
      if (v17 > 3) {
        continue;
      }
    }
    int v9 = (char)v22;
    LODWORD(a2) = v20 - 2;
    int v28 = 1;
    LODWORD(v27) = v6;
    LODWORD(v8) = v21;
    unsigned int v7 = *(unsigned __int8 *)(a5 + v18);
    goto LABEL_114;
  }
  unsigned int v7 = v22 | (v19 << 6);
  while (1)
  {
    this = v14;
    uint64_t v23 = *((unsigned __int8 *)v14 - 1);
    int v24 = *(unsigned __int8 *)(a5 + v23);
    if ((*(char *)(a5 + v23) & 0x80000000) == 0) {
      break;
    }
    int v25 = v13;
    if ((v23 - 9) < 5 || v23 == 32)
    {
      int v14 = (google::protobuf *)((char *)v14 + 1);
      --v13;
      --v15;
      char v16 = (google::protobuf *)((char *)v16 + 1);
      if (v13 > 2) {
        continue;
      }
    }
    int v9 = (char)v24;
    LODWORD(a2) = v25 - 2;
    int v28 = 2;
    LODWORD(v27) = v6;
    goto LABEL_111;
  }
  unsigned int v7 = v24 | (v7 << 6);
  do
  {
    int v26 = v15;
    this = v16;
    uint64_t v8 = *((unsigned __int8 *)v16 - 1);
    int v9 = *(unsigned __int8 *)(a5 + v8);
    if ((*(char *)(a5 + v8) & 0x80000000) == 0)
    {
      unsigned int v7 = v9 | (v7 << 6);
      LODWORD(a2) = v15 - 2;
      goto LABEL_37;
    }
    if ((v8 - 9) >= 5 && v8 != 32) {
      break;
    }
    char v16 = (google::protobuf *)((char *)v16 + 1);
    --v15;
  }
  while (v15 > 1);
  int v9 = (char)v9;
  LODWORD(a2) = v26 - 2;
  int v28 = 3;
  LODWORD(v27) = v6;
LABEL_114:
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_115;
  }
  if (v8 == 61 || v8 == 46) {
    goto LABEL_124;
  }
  if (v8)
  {
    if ((v8 - 9) >= 5 && v8 != 32) {
      return 0xFFFFFFFFLL;
    }
LABEL_115:
    if (v8 != 61 && v8 != 46) {
      goto LABEL_78;
    }
LABEL_124:
    int v43 = a2 + 1;
    v44 = (google::protobuf *)((char *)this - 1);
    goto LABEL_125;
  }
LABEL_78:
  if ((int)a2 >= 1)
  {
LABEL_79:
    int v43 = (int)a2;
    while (1)
    {
      v44 = this;
      unsigned int v46 = *(unsigned __int8 *)this;
      this = (google::protobuf *)((char *)this + 1);
      int v45 = v46;
      int v47 = *(char *)(a5 + v46);
      if ((v47 & 0x80000000) == 0)
      {
        int v49 = v47 | (v7 << 6);
        if (++v28 == 4)
        {
          if (a3)
          {
            if ((int)v27 + 3 > (int)a4) {
              return 0xFFFFFFFFLL;
            }
            int v28 = 0;
            unsigned int v50 = v7 << 6;
            v51 = (unsigned char *)(a3 + (int)v27);
            v51[2] = v49;
            v51[1] = BYTE1(v50);
            unsigned char *v51 = BYTE2(v50);
            LODWORD(v27) = v27 + 3;
            unsigned int v7 = 0;
          }
          else
          {
            int v28 = 0;
            unsigned int v7 = 0;
            LODWORD(v27) = v27 + 3;
          }
        }
        else
        {
          unsigned int v7 = v49;
        }
        this = (google::protobuf *)((char *)v44 + 1);
        LODWORD(a2) = v43 - 1;
        if (v43 < 2)
        {
LABEL_107:
          v44 = (google::protobuf *)((char *)v44 + 1);
          --v43;
          goto LABEL_125;
        }
        goto LABEL_79;
      }
      if ((v45 - 9) >= 5)
      {
        if (v45 > 45)
        {
          if (v45 == 46 || v45 == 61) {
            goto LABEL_125;
          }
          return 0xFFFFFFFFLL;
        }
        if (v45 != 32)
        {
          if (v45) {
            return 0xFFFFFFFFLL;
          }
          goto LABEL_107;
        }
      }
      unsigned int v48 = v43--;
      if (v48 <= 1)
      {
        if ((int)a2 >= 1) {
          int v52 = 1;
        }
        else {
          int v52 = (int)a2;
        }
        int v43 = v52 - 1;
        v44 = (google::protobuf *)((char *)v44 + 1);
        goto LABEL_125;
      }
    }
  }
  int v43 = (int)a2;
  v44 = this;
LABEL_125:
  uint64_t result = 0xFFFFFFFFLL;
  switch(v28)
  {
    case 0:
      break;
    case 1:
      return result;
    case 2:
      if (!a3) {
        goto LABEL_129;
      }
      if ((int)v27 >= (int)a4) {
        return result;
      }
      *(unsigned char *)(a3 + (int)v27) = v7 >> 4;
LABEL_129:
      LODWORD(v27) = v27 + 1;
      int v28 = 2;
      break;
    case 3:
      if (!a3) {
        goto LABEL_134;
      }
      if ((int)v27 + 2 > (int)a4) {
        return result;
      }
      v56 = (unsigned char *)(a3 + (int)v27);
      v56[1] = v7 >> 2;
      unsigned char *v56 = v7 >> 10;
LABEL_134:
      int v28 = 1;
      LODWORD(v27) = v27 + 2;
      break;
    default:
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v62, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1930);
      v54 = google::protobuf::internal::LogMessage::operator<<(v62, "This can't happen; base64 decoder state = ");
      v55 = google::protobuf::internal::LogMessage::operator<<(v54, v28);
      google::protobuf::internal::LogFinisher::operator=((int)&v61, (const char **)&v55->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v62[0].__r_.__value_.__l.__data_);
      int v28 = 0;
      break;
  }
  if (v43 >= 1)
  {
    int v57 = 0;
    int v58 = v43 + 1;
    while (1)
    {
      unsigned int v59 = *(unsigned __int8 *)v44;
      if (v59 > 0x3D) {
        return 0xFFFFFFFFLL;
      }
      if (((1 << v59) & 0x100003E00) == 0)
      {
        if (((1 << v59) & 0x2000400000000000) == 0)
        {
          if (!*(unsigned char *)v44) {
            goto LABEL_144;
          }
          return 0xFFFFFFFFLL;
        }
        ++v57;
      }
      v44 = (google::protobuf *)((char *)v44 + 1);
      if (--v58 <= 1) {
        goto LABEL_144;
      }
    }
  }
  int v57 = 0;
LABEL_144:
  if (v57 == v28 || v57 == 0) {
    return v27;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void sub_25C1EA32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::WebSafeBase64Unescape(google::protobuf *this, const char *a2, uint64_t a3, char *a4, int a5, const signed __int8 *a6)
{
  return google::protobuf::Base64UnescapeInternal(this, a2, a3, a4, (uint64_t)&google::protobuf::kUnWebSafeBase64, a6);
}

BOOL google::protobuf::Base64Unescape@<W0>(google::protobuf *a1@<X0>, const char *a2@<X1>, std::string *a3@<X2>, int a4@<W8>)
{
  return google::protobuf::Base64UnescapeInternal(a3, a1, a2, (uint64_t)&google::protobuf::kUnBase64, a4);
}

BOOL google::protobuf::Base64UnescapeInternal@<W0>(std::string *this@<X2>, google::protobuf *a2@<X0>, const char *a3@<X1>, uint64_t a4@<X3>, int a5@<W8>)
{
  int v9 = (char *)(3 * ((int)a3 / 4) + a3 - (a5 & 0xFFFFFFFC));
  std::string::resize(this, (int)v9, 0);
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    if (this->__r_.__value_.__l.__size_)
    {
      unint64_t v11 = (std::string *)this->__r_.__value_.__r.__words[0];
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v11 = this;
    if (*((unsigned char *)&this->__r_.__value_.__s + 23)) {
      goto LABEL_7;
    }
  }
  unint64_t v11 = 0;
LABEL_7:
  int v12 = google::protobuf::Base64UnescapeInternal(a2, a3, (uint64_t)v11, v9, a4, v10);
  int v13 = v12;
  if (v12 < 0)
  {
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
  }
  else
  {
    if (v12 > (int)v9)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v17, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2073);
      int v14 = google::protobuf::internal::LogMessage::operator<<(v17, "CHECK failed: (len) <= (dest_len): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v16, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v17[0].__r_.__value_.__l.__data_);
    }
    std::string::erase(this, v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  return v13 >= 0;
}

void sub_25C1EA4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL google::protobuf::WebSafeBase64Unescape@<W0>(google::protobuf *a1@<X0>, const char *a2@<X1>, std::string *a3@<X2>, int a4@<W8>)
{
  return google::protobuf::Base64UnescapeInternal(a3, a1, a2, (uint64_t)&google::protobuf::kUnWebSafeBase64, a4);
}

uint64_t google::protobuf::Base64EscapeInternal(google::protobuf *this, const unsigned __int8 *a2, unsigned char *a3, char *a4, uint64_t a5, const char *a6)
{
  if ((int)a2 < 1 || 3 * (int)a4 < 4 * (int)a2) {
    return 0;
  }
  int v7 = (int)a3;
  uint64_t v8 = (char *)this + a2;
  for (i = a3; this < (google::protobuf *)(v8 - 3); i += 4)
  {
    unsigned int v10 = *(_DWORD *)this;
    this = (google::protobuf *)((char *)this + 3);
    unint64_t v11 = bswap32(v10);
    unsigned char *i = *(unsigned char *)(a5 + (v11 >> 26));
    i[1] = *(unsigned char *)(a5 + ((v11 >> 20) & 0x3F));
    i[2] = *(unsigned char *)(a5 + ((v11 >> 14) & 0x3F));
    i[3] = *(unsigned char *)(a5 + ((v11 >> 8) & 0x3F));
  }
  int v12 = v8 - this;
  int v13 = a3 + a4 - i;
  switch(v12)
  {
    case 0:
      goto LABEL_22;
    case 1:
      if (v13 < 2) {
        return 0;
      }
      unint64_t v14 = *(unsigned __int8 *)this;
      unsigned char *i = *(unsigned char *)(a5 + (v14 >> 2));
      i[1] = *(unsigned char *)(a5 + 16 * (v14 & 3));
      if (!a6)
      {
        LODWORD(i) = i + 2;
        goto LABEL_22;
      }
      if (v13 < 4) {
        return 0;
      }
      *((_WORD *)i + 1) = 15677;
      goto LABEL_19;
    case 2:
      if (v13 < 3) {
        return 0;
      }
      unint64_t v17 = bswap32(*(unsigned __int16 *)this);
      unsigned char *i = *(unsigned char *)(a5 + ((unint64_t)WORD1(v17) >> 10));
      i[1] = *(unsigned char *)(a5 + ((v17 >> 20) & 0x3F));
      i[2] = *(unsigned char *)(a5 + ((v17 >> 14) & 0x3CLL));
      if (a6)
      {
        if (v13 < 4) {
          return 0;
        }
        char v18 = 61;
LABEL_18:
        i[3] = v18;
LABEL_19:
        LODWORD(i) = i + 4;
      }
      else
      {
        LODWORD(i) = i + 3;
      }
LABEL_22:
      uint64_t result = (i - v7);
      break;
    case 3:
      if (v13 < 4) {
        return 0;
      }
      char v19 = *(unsigned char *)this;
      unint64_t v20 = bswap32(*(unsigned __int16 *)((char *)this + 1));
      unsigned char *i = *(unsigned char *)(a5 + (*(unsigned char *)this >> 2));
      i[1] = *(unsigned char *)(a5 + ((unint64_t)(WORD1(v20) & 0xFFFCFFFF | ((v19 & 3) << 16)) >> 12));
      i[2] = *(unsigned char *)(a5 + ((v20 >> 22) & 0x3F));
      char v18 = *(unsigned char *)(a5 + ((v20 >> 16) & 0x3F));
      goto LABEL_18;
    default:
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v22, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2181);
      int v15 = google::protobuf::internal::LogMessage::operator<<(v22, "Logic problem? szsrc = ");
      char v16 = google::protobuf::internal::LogMessage::operator<<(v15, v12);
      google::protobuf::internal::LogFinisher::operator=((int)&v21, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v22[0].__r_.__value_.__l.__data_);
      goto LABEL_22;
  }
  return result;
}

void sub_25C1EA6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::Base64Escape(google::protobuf *this, const unsigned __int8 *a2, unsigned char *a3, char *a4)
{
  return google::protobuf::Base64EscapeInternal(this, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", (const char *)1);
}

uint64_t google::protobuf::WebSafeBase64Escape(google::protobuf *this, const unsigned __int8 *a2, unsigned char *a3, char *a4, char *a5)
{
  return google::protobuf::Base64EscapeInternal(this, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_", a5);
}

std::string *google::protobuf::Base64EscapeInternal(google::protobuf *a1, google::protobuf *this, uint64_t a3, const char *a4, uint64_t a5)
{
  int v10 = google::protobuf::CalculateBase64EscapedLen(this, (int)a4);
  std::string::resize((std::string *)a3, v10, 0);
  if (*(char *)(a3 + 23) < 0)
  {
    unint64_t v11 = *(char **)(a3 + 8);
    if (v11) {
      int v12 = *(unsigned char **)a3;
    }
    else {
      int v12 = 0;
    }
  }
  else
  {
    unint64_t v11 = (char *)*(unsigned __int8 *)(a3 + 23);
    if (*(unsigned char *)(a3 + 23)) {
      int v12 = (unsigned char *)a3;
    }
    else {
      int v12 = 0;
    }
  }
  int v13 = google::protobuf::Base64EscapeInternal(a1, (const unsigned __int8 *)this, v12, v11, a5, a4);
  if (v10 != v13)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v17, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2213);
    unint64_t v14 = google::protobuf::internal::LogMessage::operator<<(v17, "CHECK failed: (calc_escaped_size) == (escaped_len): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v16, (const char **)&v14->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v17[0].__r_.__value_.__l.__data_);
  }
  return std::string::erase((std::string *)a3, v13, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_25C1EA828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

std::string *google::protobuf::Base64Escape(google::protobuf *a1, google::protobuf *a2, uint64_t a3, const char *a4)
{
  return google::protobuf::Base64EscapeInternal(a1, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
}

std::string *google::protobuf::WebSafeBase64Escape(google::protobuf *a1, google::protobuf *a2, uint64_t a3, const char *a4)
{
  return google::protobuf::Base64EscapeInternal(a1, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
}

std::string *google::protobuf::Base64Escape(google::protobuf *a1, google::protobuf *a2, uint64_t a3)
{
  return google::protobuf::Base64EscapeInternal(a1, a2, a3, (const char *)1, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
}

std::string *google::protobuf::WebSafeBase64Escape(google::protobuf *a1, google::protobuf *a2, uint64_t a3)
{
  return google::protobuf::Base64EscapeInternal(a1, a2, a3, 0, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
}

std::string *google::protobuf::WebSafeBase64EscapeWithPadding(google::protobuf *a1, google::protobuf *a2, uint64_t a3)
{
  return google::protobuf::Base64EscapeInternal(a1, a2, a3, (const char *)1, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
}

uint64_t google::protobuf::EncodeAsUTF8Char(unint64_t this, void *a2, char *a3)
{
  if (this >= 0x80)
  {
    if (WORD1(this)) {
      unsigned int v5 = (16 * this) & 0x3F0000 | this & 0x3F | (((this >> 18) & 7) << 24) | (((this >> 6) & 0x3F) << 8) | 0xF0808080;
    }
    else {
      unsigned int v5 = (4 * (_WORD)this) & 0x3F00 | this & 0x3F | ((unsigned __int16)this >> 12 << 16) | 0xE08080;
    }
    if (WORD1(this)) {
      unsigned int v6 = 4;
    }
    else {
      unsigned int v6 = 3;
    }
    BOOL v7 = this > 0x7FF;
    if (this <= 0x7FF) {
      this = (4 * (_WORD)this) & 0x1F00 | this & 0x3F | 0xC080;
    }
    else {
      this = v5;
    }
    if (v7) {
      uint64_t v4 = v6;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 1;
  }
  int v9 = google::protobuf::ghtonl((google::protobuf *)this);
  memcpy(a2, (char *)&v9 - v4 + 4, v4);
  return v4;
}

uint64_t google::protobuf::UTF8FirstLetterNumBytes(google::protobuf *this, const char *a2)
{
  if (a2) {
    return google::protobuf::kUTF8LenTbl[*(unsigned __int8 *)this];
  }
  else {
    return 0;
  }
}

void google::protobuf::CleanStringLineEndings(uint64_t a1, std::string *this, int a3)
{
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    if (this->__r_.__value_.__l.__size_) {
      goto LABEL_3;
    }
  }
  else if (*((unsigned char *)&this->__r_.__value_.__s + 23))
  {
LABEL_3:
    if (*(char *)(a1 + 23) < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
    }
    else {
      std::string __p = *(std::string *)a1;
    }
    google::protobuf::CleanStringLineEndings(&__p, a3);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    std::string::append(this, (const std::string::value_type *)p_p, size);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    return;
  }
  int v5 = *(char *)(a1 + 23);
  if (v5 >= 0) {
    unsigned int v6 = (const std::string::value_type *)a1;
  }
  else {
    unsigned int v6 = *(const std::string::value_type **)a1;
  }
  if (v5 >= 0) {
    std::string::size_type v7 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    std::string::size_type v7 = *(void *)(a1 + 8);
  }
  std::string::append(this, v6, v7);
  google::protobuf::CleanStringLineEndings(this, a3);
}

void sub_25C1EAA84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void google::protobuf::CleanStringLineEndings(std::string *this, int a2)
{
  uint64_t v2 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v4 = (std::string *)this->__r_.__value_.__r.__words[0];
    int64_t size = this->__r_.__value_.__l.__size_;
  }
  else
  {
    int64_t size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    uint64_t v4 = this;
  }
  if (size < 1)
  {
    int64_t v5 = 0;
    goto LABEL_37;
  }
  int64_t v5 = 0;
  int64_t v6 = 0;
  char v7 = 0;
  do
  {
    if (v7)
    {
      uint64_t v8 = (char *)v4 + v6;
      int v9 = v4->__r_.__value_.__s.__data_[v6];
      if (v9 != 10)
      {
        if (v9 == 13)
        {
          v4->__r_.__value_.__s.__data_[v5++] = 10;
LABEL_18:
          char v7 = 1;
LABEL_27:
          ++v6;
          continue;
        }
        v4->__r_.__value_.__s.__data_[v5++] = 10;
        goto LABEL_23;
      }
      goto LABEL_19;
    }
    uint64_t v8 = (char *)v4 + v6;
    if (v6 + 8 >= size)
    {
      LOBYTE(v10) = *v8;
LABEL_16:
      if (v10 != 10)
      {
        if (v10 == 13) {
          goto LABEL_18;
        }
LABEL_23:
        if (v6 == v5)
        {
          char v7 = 0;
          int64_t v5 = v6 + 1;
          goto LABEL_27;
        }
        char v7 = 0;
        v4->__r_.__value_.__s.__data_[v5] = *v8;
LABEL_26:
        ++v5;
        goto LABEL_27;
      }
LABEL_19:
      if (v6 != v5) {
        v4->__r_.__value_.__s.__data_[v5] = 10;
      }
      char v7 = 0;
      goto LABEL_26;
    }
    std::string::size_type v10 = *(void *)v8;
    if (((*(void *)v8 - 0xE0E0E0E0E0E0E0ELL) & ~*(void *)v8 & 0x8080808080808080) != 0) {
      goto LABEL_16;
    }
    if (v5 != v6) {
      *(std::string::size_type *)((char *)v4->__r_.__value_.__r.__words + v5) = v10;
    }
    char v7 = 0;
    v5 += 8;
    v6 += 8;
  }
  while (v6 < size);
  if ((v7 & 1) != 0 || a2 && v5 >= 1 && v4->__r_.__value_.__s.__data_[v5 - 1] != 10)
  {
    std::string::resize(this, v5 + 1, 0);
    if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0) {
      uint64_t v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
    }
    v2->__r_.__value_.__s.__data_[v5] = 10;
    return;
  }
LABEL_37:
  if (v5 < size)
  {
    std::string::resize(this, v5, 0);
  }
}

google::protobuf::StringPiece *google::protobuf::StringPiece::StringPiece(google::protobuf::StringPiece *this, const char *__s)
{
  *(void *)this = __s;
  *((void *)this + 1) = 0;
  if (__s)
  {
    size_t v3 = strlen(__s);
    size_t v5 = v3;
    if ((v3 & 0x8000000000000000) != 0) {
      google::protobuf::StringPiece::LogFatalSizeTooBig((google::protobuf::StringPiece *)v3, "size_t to int conversion", v4);
    }
    *((void *)this + 1) = v5;
  }
  return this;
}

std::vector<std::string> **std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](std::vector<std::string> **a1, long long *a2)
{
  uint64_t v4 = *a1;
  std::vector<std::string>::pointer end = (*a1)->__end_;
  int64_t v6 = *a1;
  value = v6->__end_cap_.__value_;
  p_end_cap = (std::allocator<std::string> *)&v6->__end_cap_;
  uint64_t v8 = value;
  if (end >= value)
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)v4->__begin_) >> 3);
    unint64_t v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (char *)v4->__begin_) >> 3);
    if (2 * v14 > v13) {
      unint64_t v13 = 2 * v14;
    }
    if (v14 >= 0x555555555555555) {
      unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v15 = v13;
    }
    __v.__end_cap_.__value_ = p_end_cap;
    if (v15) {
      char v16 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)p_end_cap, v15);
    }
    else {
      char v16 = 0;
    }
    unint64_t v17 = v16 + v12;
    __v.__first_ = v16;
    __v.__begin_ = v17;
    __v.__end_cap_.__value_ = &v16[v15];
    long long v18 = *a2;
    v17->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v18;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    __v.__end_ = v17 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(v4, &__v);
    unint64_t v11 = v4->__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
  }
  else
  {
    long long v10 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    unint64_t v11 = end + 1;
    v4->__end_ = end + 1;
  }
  v4->__end_ = v11;
  return a1;
}

void sub_25C1EADCC(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t google::protobuf::safe_parse_positive_int<int>(unsigned __int8 *a1, int *a2)
{
  if ((char)a1[23] < 0)
  {
    size_t v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    uint64_t v2 = *((void *)v3 + 1);
  }
  else
  {
    uint64_t v2 = a1[23];
  }
  if (v2 < 1)
  {
    int v4 = 0;
LABEL_12:
    uint64_t result = 1;
  }
  else
  {
    int v4 = 0;
    size_t v5 = &a1[v2];
    while (1)
    {
      int v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v4 > 214748364 || (int v7 = 10 * v4, v7 > -2147483601 - v6))
      {
        uint64_t result = 0;
        int v4 = 0x7FFFFFFF;
        goto LABEL_15;
      }
      int v4 = v7 + v6 - 48;
      if (++a1 >= v5) {
        goto LABEL_12;
      }
    }
    uint64_t result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

uint64_t google::protobuf::safe_parse_negative_int<int>(unsigned __int8 *a1, int *a2)
{
  int v2 = (char)a1[23];
  BOOL v3 = v2 < 0;
  if (v2 >= 0) {
    int v4 = a1;
  }
  else {
    int v4 = *(unsigned __int8 **)a1;
  }
  if (v3) {
    uint64_t v5 = *((void *)a1 + 1);
  }
  else {
    uint64_t v5 = a1[23];
  }
  if (v5 < 1)
  {
    int v6 = 0;
LABEL_15:
    uint64_t result = 1;
  }
  else
  {
    int v6 = 0;
    int v7 = &v4[v5];
    while (1)
    {
      int v8 = *v4;
      if ((v8 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v6 < -214748364 || (int v9 = 10 * v6, v9 < v8 + 2147483600))
      {
        uint64_t result = 0;
        int v6 = 0x80000000;
        goto LABEL_18;
      }
      int v6 = v9 - v8 + 48;
      if (++v4 >= v7) {
        goto LABEL_15;
      }
    }
    uint64_t result = 0;
  }
LABEL_18:
  *a2 = v6;
  return result;
}

uint64_t google::protobuf::safe_parse_positive_int<unsigned int>(unsigned __int8 *a1, unsigned int *a2)
{
  if ((char)a1[23] < 0)
  {
    BOOL v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    uint64_t v2 = *((void *)v3 + 1);
  }
  else
  {
    uint64_t v2 = a1[23];
  }
  if (v2 < 1)
  {
    unsigned int v4 = 0;
LABEL_12:
    uint64_t result = 1;
  }
  else
  {
    unsigned int v4 = 0;
    uint64_t v5 = &a1[v2];
    while (1)
    {
      int v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v4 > 0x19999999 || (unsigned int v7 = 10 * v4, v7 > 47 - v6))
      {
        uint64_t result = 0;
        unsigned int v4 = -1;
        goto LABEL_15;
      }
      unsigned int v4 = v7 + v6 - 48;
      if (++a1 >= v5) {
        goto LABEL_12;
      }
    }
    uint64_t result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

uint64_t google::protobuf::safe_parse_positive_int<long long>(unsigned __int8 *a1, uint64_t *a2)
{
  if ((char)a1[23] < 0)
  {
    BOOL v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    uint64_t v2 = *((void *)v3 + 1);
  }
  else
  {
    uint64_t v2 = a1[23];
  }
  if (v2 < 1)
  {
    uint64_t v4 = 0;
LABEL_12:
    uint64_t result = 1;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = &a1[v2];
    while (1)
    {
      int v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v4 > 0xCCCCCCCCCCCCCCCLL || (uint64_t v7 = 10 * v4, v8 = (v6 - 48), v7 > (v8 ^ 0x7FFFFFFFFFFFFFFFLL)))
      {
        uint64_t result = 0;
        uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_15;
      }
      uint64_t v4 = v8 + v7;
      if (++a1 >= v5) {
        goto LABEL_12;
      }
    }
    uint64_t result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

uint64_t google::protobuf::safe_parse_negative_int<long long>(unsigned __int8 *a1, int64_t *a2)
{
  int v2 = (char)a1[23];
  BOOL v3 = v2 < 0;
  if (v2 >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(unsigned __int8 **)a1;
  }
  if (v3) {
    uint64_t v5 = *((void *)a1 + 1);
  }
  else {
    uint64_t v5 = a1[23];
  }
  if (v5 < 1)
  {
    int64_t v6 = 0;
LABEL_15:
    uint64_t result = 1;
  }
  else
  {
    int64_t v6 = 0;
    uint64_t v7 = &v4[v5];
    while (1)
    {
      int v8 = *v4;
      if ((v8 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v6 < (uint64_t)0xF333333333333334
        || (v9 = v8 - 48, uint64_t v10 = 10 * v6, v10 < (uint64_t)(v9 | 0x8000000000000000)))
      {
        uint64_t result = 0;
        int64_t v6 = 0x8000000000000000;
        goto LABEL_18;
      }
      int64_t v6 = v10 - v9;
      if (++v4 >= v7) {
        goto LABEL_15;
      }
    }
    uint64_t result = 0;
  }
LABEL_18:
  *a2 = v6;
  return result;
}

uint64_t google::protobuf::safe_parse_positive_int<unsigned long long>(unsigned __int8 *a1, unint64_t *a2)
{
  if ((char)a1[23] < 0)
  {
    BOOL v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    uint64_t v2 = *((void *)v3 + 1);
  }
  else
  {
    uint64_t v2 = a1[23];
  }
  if (v2 < 1)
  {
    unint64_t v4 = 0;
LABEL_12:
    uint64_t result = 1;
  }
  else
  {
    unint64_t v4 = 0;
    uint64_t v5 = &a1[v2];
    while (1)
    {
      int v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v4 > 0x1999999999999999 || (unsigned int v7 = v6 - 48, v8 = 10 * v4, __CFADD__(v8, v7)))
      {
        uint64_t result = 0;
        unint64_t v4 = -1;
        goto LABEL_15;
      }
      unint64_t v4 = v7 + v8;
      if (++a1 >= v5) {
        goto LABEL_12;
      }
    }
    uint64_t result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

void google::protobuf::StringPiece::operator[]()
{
  __assert_rtn("operator[]", "stringpiece.h", 276, "0 <= i");
}

{
  __assert_rtn("operator[]", "stringpiece.h", 277, "i < length_");
}

void google::protobuf::CalculateBase64EscapedLen()
{
  __assert_rtn("CalculateBase64EscapedLen", "strutil.cc", 1683, "len >= input_len");
}

uint64_t google::protobuf::internal::WireFormatLite::SkipField(google::protobuf::internal::WireFormatLite *this, google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  if (a2 < 8) {
    return 0;
  }
  int v4 = (int)a2;
  uint64_t result = 0;
  switch(a2 & 7)
  {
    case 0:
      int v6 = *(char **)this;
      if (*(void *)this < *((void *)this + 1) && (*v6 & 0x80000000) == 0)
      {
        uint64_t v7 = (uint64_t)(v6 + 1);
        goto LABEL_24;
      }
      google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this);
      return v15 & 1;
    case 1:
      unint64_t v18 = 0;
      if ((int)(*((_DWORD *)this + 2) - *(void *)this) >= 8)
      {
        uint64_t v7 = *(void *)this + 8;
        goto LABEL_24;
      }
      return google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((unint64_t **)this, &v18);
    case 2:
      unsigned int v9 = *(char **)this;
      unint64_t v8 = *((void *)this + 1);
      if (*(void *)this >= v8)
      {
        int v10 = 0;
      }
      else
      {
        int v10 = *v9;
        if ((*v9 & 0x80000000) == 0)
        {
          unint64_t v11 = (unsigned __int8 *)(v9 + 1);
          *(void *)this = v11;
          goto LABEL_12;
        }
      }
      uint64_t Varint32Fallback = google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v10);
      if ((Varint32Fallback & 0x8000000080000000) != 0) {
        return 0;
      }
      int v10 = Varint32Fallback;
      unint64_t v11 = *(unsigned __int8 **)this;
      unint64_t v8 = *((void *)this + 1);
LABEL_12:
      if (v10 <= (int)v8 - (int)v11)
      {
        uint64_t v7 = (uint64_t)&v11[v10];
        goto LABEL_24;
      }
      return google::protobuf::io::CodedInputStream::SkipFallback(this, v10, (int)v8 - (int)v11);
    case 3:
      int v12 = *((_DWORD *)this + 13);
      BOOL v13 = __OFSUB__(v12--, 1);
      *((_DWORD *)this + 13) = v12;
      if (v12 < 0 != v13) {
        return 0;
      }
      uint64_t result = google::protobuf::internal::WireFormatLite::SkipMessage((char **)this, a2, a3);
      if (result)
      {
        int v14 = *((_DWORD *)this + 13);
        if (v14 < *((_DWORD *)this + 14)) {
          *((_DWORD *)this + 13) = v14 + 1;
        }
        return *((_DWORD *)this + 8) == (v4 & 0xFFFFFFF8 | 4);
      }
      return result;
    case 5:
      unsigned int v17 = 0;
      if ((int)(*((_DWORD *)this + 2) - *(void *)this) < 4) {
        return google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((unsigned int **)this, &v17);
      }
      uint64_t v7 = *(void *)this + 4;
LABEL_24:
      *(void *)this = v7;
      return 1;
    default:
      return result;
  }
}

uint64_t google::protobuf::internal::WireFormatLite::SkipMessage(char **this, google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  do
  {
    int v4 = *this;
    if (*this >= this[1])
    {
      LODWORD(TagFallback) = 0;
    }
    else
    {
      unint64_t TagFallback = *v4;
      if ((*v4 & 0x80000000) == 0)
      {
        *this = v4 + 1;
        goto LABEL_6;
      }
    }
    unint64_t TagFallback = google::protobuf::io::CodedInputStream::ReadTagFallback((google::protobuf::io::CodedInputStream *)this, TagFallback);
LABEL_6:
    *((_DWORD *)this + 8) = TagFallback;
    if (TagFallback) {
      BOOL v6 = (TagFallback & 7) == 4;
    }
    else {
      BOOL v6 = 1;
    }
    uint64_t v7 = v6;
  }
  while (!v6
       && (google::protobuf::internal::WireFormatLite::SkipField((google::protobuf::internal::WireFormatLite *)this, (google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) != 0);
  return v7;
}

BOOL google::protobuf::internal::WireFormatLite::SkipField(google::protobuf::internal::WireFormatLite *this, google::protobuf::io::CodedInputStream *a2, google::protobuf::io::EpsCopyOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  if (a2 < 8) {
    return 0;
  }
  unsigned int v5 = a2;
  BOOL v4 = 0;
  switch(a2 & 7)
  {
    case 0:
      unint64_t v8 = *(char **)this;
      if (*(void *)this >= *((void *)this + 1) || *v8 < 0)
      {
        unint64_t Varint64Fallback = google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this);
        if ((v24 & 1) == 0) {
          return 0;
        }
        unint64_t v9 = Varint64Fallback;
      }
      else
      {
        unint64_t v9 = *v8;
        *(void *)this = v8 + 1;
      }
      int v25 = (char *)*((void *)a3 + 8);
      if (*(void *)a3 <= (unint64_t)v25) {
        int v25 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v25);
      }
      if (v5 > 0x7F)
      {
        char *v25 = v5 | 0x80;
        unsigned int v27 = v5 >> 7;
        if (v5 >> 14)
        {
          int v26 = v25 + 2;
          do
          {
            *(v26 - 1) = v27 | 0x80;
            unsigned int v40 = v27 >> 7;
            ++v26;
            unsigned int v41 = v27 >> 14;
            v27 >>= 7;
          }
          while (v41);
          *(v26 - 1) = v40;
        }
        else
        {
          v25[1] = v27;
          int v26 = v25 + 2;
        }
      }
      else
      {
        char *v25 = v5;
        int v26 = v25 + 1;
      }
      *((void *)a3 + 8) = v26;
      if (*(void *)a3 <= (unint64_t)v26) {
        int v26 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v26);
      }
      if (v9 > 0x7F)
      {
        *int v26 = v9 | 0x80;
        unint64_t v42 = v9 >> 7;
        if (v9 >> 14)
        {
          v36 = v26 + 2;
          do
          {
            *(v36 - 1) = v42 | 0x80;
            unint64_t v43 = v42 >> 7;
            ++v36;
            unint64_t v44 = v42 >> 14;
            v42 >>= 7;
          }
          while (v44);
          *(v36 - 1) = v43;
        }
        else
        {
          v26[1] = v42;
          v36 = v26 + 2;
        }
      }
      else
      {
        *int v26 = v9;
        v36 = v26 + 1;
      }
      goto LABEL_72;
    case 1:
      __p.__r_.__value_.__r.__words[0] = 0;
      int v10 = *(std::string::size_type **)this;
      if ((int)(*((_DWORD *)this + 2) - *(void *)this) < 8)
      {
        if (!google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((unint64_t **)this, (unint64_t *)&__p))return 0; {
      }
        }
      else
      {
        __p.__r_.__value_.__r.__words[0] = *v10;
        *(void *)this = v10 + 1;
      }
      unint64_t v11 = (char *)*((void *)a3 + 8);
      if (*(void *)a3 <= (unint64_t)v11) {
        unint64_t v11 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v11);
      }
      if (v5 > 0x7F)
      {
        char *v11 = v5 | 0x80;
        unsigned int v21 = v5 >> 7;
        if (v5 >> 14)
        {
          int v12 = v11 + 2;
          do
          {
            *(v12 - 1) = v21 | 0x80;
            unsigned int v33 = v21 >> 7;
            ++v12;
            unsigned int v34 = v21 >> 14;
            v21 >>= 7;
          }
          while (v34);
          *(v12 - 1) = v33;
        }
        else
        {
          v11[1] = v21;
          int v12 = v11 + 2;
        }
      }
      else
      {
        char *v11 = v5;
        int v12 = v11 + 1;
      }
      *((void *)a3 + 8) = v12;
      std::string::size_type v35 = __p.__r_.__value_.__r.__words[0];
      if (*(void *)a3 <= (unint64_t)v12) {
        int v12 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v12);
      }
      *(void *)int v12 = v35;
      v36 = v12 + 8;
      goto LABEL_72;
    case 2:
      BOOL v13 = *(char **)this;
      if (*(void *)this >= *((void *)this + 1))
      {
        LODWORD(Varint32Fallback) = 0;
      }
      else
      {
        uint64_t Varint32Fallback = *v13;
        if ((*v13 & 0x80000000) == 0)
        {
          *(void *)this = v13 + 1;
          goto LABEL_78;
        }
      }
      uint64_t Varint32Fallback = google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, Varint32Fallback);
      if (Varint32Fallback < 0) {
        return 0;
      }
LABEL_78:
      unsigned int v46 = (char *)*((void *)a3 + 8);
      if (*(void *)a3 <= (unint64_t)v46)
      {
        uint64_t v60 = Varint32Fallback;
        char v61 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v46);
        uint64_t Varint32Fallback = v60;
        unsigned int v46 = v61;
      }
      if (v5 > 0x7F)
      {
        *unsigned int v46 = v5 | 0x80;
        unsigned int v48 = v5 >> 7;
        if (v5 >> 14)
        {
          int v47 = v46 + 2;
          do
          {
            *(v47 - 1) = v48 | 0x80;
            unsigned int v49 = v48 >> 7;
            ++v47;
            unsigned int v50 = v48 >> 14;
            v48 >>= 7;
          }
          while (v50);
          *(v47 - 1) = v49;
        }
        else
        {
          v46[1] = v48;
          int v47 = v46 + 2;
        }
      }
      else
      {
        *unsigned int v46 = v5;
        int v47 = v46 + 1;
      }
      *((void *)a3 + 8) = v47;
      if (*(void *)a3 <= (unint64_t)v47)
      {
        uint64_t v62 = Varint32Fallback;
        v63 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v47);
        uint64_t Varint32Fallback = v62;
        int v47 = v63;
      }
      if (Varint32Fallback > 0x7F)
      {
        *int v47 = Varint32Fallback | 0x80;
        unsigned int v52 = Varint32Fallback >> 7;
        if (Varint32Fallback >> 14)
        {
          v51 = v47 + 2;
          do
          {
            *(v51 - 1) = v52 | 0x80;
            unsigned int v53 = v52 >> 7;
            ++v51;
            unsigned int v54 = v52 >> 14;
            v52 >>= 7;
          }
          while (v54);
          *(v51 - 1) = v53;
        }
        else
        {
          v47[1] = v52;
          v51 = v47 + 2;
        }
      }
      else
      {
        *int v47 = Varint32Fallback;
        v51 = v47 + 1;
      }
      *((void *)a3 + 8) = v51;
      memset(&__p, 0, sizeof(__p));
      BOOL v4 = google::protobuf::io::CodedInputStream::ReadString((const void **)this, &__p, Varint32Fallback);
      if (v4)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          int v56 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        else {
          int v56 = __p.__r_.__value_.__r.__words[1];
        }
        uint64_t v57 = *((void *)a3 + 8);
        if (*(void *)a3 - v57 < v56)
        {
          unsigned int v59 = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(a3, (char *)p_p, v56, *((unsigned __int8 **)a3 + 8));
        }
        else
        {
          uint64_t v58 = v56;
          memcpy(*((void **)a3 + 8), p_p, v56);
          unsigned int v59 = (unsigned __int8 *)(v57 + v58);
        }
        *((void *)a3 + 8) = v59;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      return v4;
    case 3:
      char v15 = (char *)*((void *)a3 + 8);
      if (*(void *)a3 <= (unint64_t)v15) {
        char v15 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v15);
      }
      if (v5 > 0x7F)
      {
        *char v15 = v5 | 0x80;
        unsigned int v20 = v5 >> 7;
        if (v5 >> 14)
        {
          char v16 = v15 + 2;
          do
          {
            *(v16 - 1) = v20 | 0x80;
            unsigned int v28 = v20 >> 7;
            ++v16;
            unsigned int v29 = v20 >> 14;
            v20 >>= 7;
          }
          while (v29);
          *(v16 - 1) = v28;
        }
        else
        {
          v15[1] = v20;
          char v16 = v15 + 2;
        }
      }
      else
      {
        *char v15 = v5;
        char v16 = v15 + 1;
      }
      *((void *)a3 + 8) = v16;
      int v30 = *((_DWORD *)this + 13);
      BOOL v31 = __OFSUB__(v30--, 1);
      *((_DWORD *)this + 13) = v30;
      if (v30 < 0 != v31
        || !google::protobuf::internal::WireFormatLite::SkipMessage((char **)this, (char **)a3, a3, a4))
      {
        return 0;
      }
      int v32 = *((_DWORD *)this + 13);
      if (v32 < *((_DWORD *)this + 14)) {
        *((_DWORD *)this + 13) = v32 + 1;
      }
      return *((_DWORD *)this + 8) == (v5 & 0xFFFFFFF8 | 4);
    case 5:
      LODWORD(__p.__r_.__value_.__l.__data_) = 0;
      unsigned int v17 = *(char **)this;
      if ((int)(*((_DWORD *)this + 2) - *(void *)this) < 4)
      {
        if (!google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((unsigned int **)this, (unsigned int *)&__p))return 0; {
      }
        }
      else
      {
        LODWORD(__p.__r_.__value_.__l.__data_) = *(_DWORD *)v17;
        *(void *)this = v17 + 4;
      }
      unint64_t v18 = (char *)*((void *)a3 + 8);
      if (*(void *)a3 <= (unint64_t)v18) {
        unint64_t v18 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v18);
      }
      if (v5 > 0x7F)
      {
        *unint64_t v18 = v5 | 0x80;
        unsigned int v22 = v5 >> 7;
        if (v5 >> 14)
        {
          char v19 = v18 + 2;
          do
          {
            *(v19 - 1) = v22 | 0x80;
            unsigned int v37 = v22 >> 7;
            ++v19;
            unsigned int v38 = v22 >> 14;
            v22 >>= 7;
          }
          while (v38);
          *(v19 - 1) = v37;
        }
        else
        {
          v18[1] = v22;
          char v19 = v18 + 2;
        }
      }
      else
      {
        *unint64_t v18 = v5;
        char v19 = v18 + 1;
      }
      *((void *)a3 + 8) = v19;
      int data = (int)__p.__r_.__value_.__l.__data_;
      if (*(void *)a3 <= (unint64_t)v19) {
        char v19 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v19);
      }
      *(_DWORD *)char v19 = data;
      v36 = v19 + 4;
LABEL_72:
      *((void *)a3 + 8) = v36;
      BOOL v4 = 1;
      break;
    default:
      return v4;
  }
  return v4;
}

void sub_25C1EBA38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL google::protobuf::internal::WireFormatLite::SkipMessage(char **this, char **a2, google::protobuf::io::CodedOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  while (1)
  {
    BOOL v6 = *this;
    if (*this >= this[1])
    {
      LODWORD(TagFallback) = 0;
    }
    else
    {
      unint64_t TagFallback = *v6;
      if ((*v6 & 0x80000000) == 0)
      {
        *this = v6 + 1;
        goto LABEL_6;
      }
    }
    unint64_t TagFallback = google::protobuf::io::CodedInputStream::ReadTagFallback((google::protobuf::io::CodedInputStream *)this, TagFallback);
LABEL_6:
    *((_DWORD *)this + 8) = TagFallback;
    BOOL v8 = TagFallback == 0;
    if (!TagFallback) {
      return v8;
    }
    if ((TagFallback & 7) == 4) {
      break;
    }
    if ((google::protobuf::internal::WireFormatLite::SkipField((google::protobuf::internal::WireFormatLite *)this, (google::protobuf::io::CodedInputStream *)TagFallback, (google::protobuf::io::EpsCopyOutputStream *)a2, a4) & 1) == 0)return v8; {
  }
    }
  unint64_t v9 = a2[8];
  if (*a2 <= v9) {
    unint64_t v9 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback((google::protobuf::io::EpsCopyOutputStream *)a2, v9);
  }
  if (TagFallback > 0x7F)
  {
    *unint64_t v9 = TagFallback | 0x80;
    unsigned int v11 = TagFallback >> 7;
    if (TagFallback >> 14)
    {
      int v10 = v9 + 2;
      do
      {
        *(v10 - 1) = v11 | 0x80;
        unsigned int v12 = v11 >> 7;
        ++v10;
        unsigned int v13 = v11 >> 14;
        v11 >>= 7;
      }
      while (v13);
      *(v10 - 1) = v12;
    }
    else
    {
      v9[1] = v11;
      int v10 = v9 + 2;
    }
  }
  else
  {
    *unint64_t v9 = TagFallback;
    int v10 = v9 + 1;
  }
  a2[8] = v10;
  return 1;
}

uint64_t google::protobuf::internal::FieldSkipper::SkipField(google::protobuf::internal::FieldSkipper *this, google::protobuf::io::CodedInputStream *a2, google::protobuf::io::CodedInputStream *a3)
{
  return google::protobuf::internal::WireFormatLite::SkipField(a2, a3, a3);
}

uint64_t google::protobuf::internal::FieldSkipper::SkipMessage(google::protobuf::internal::FieldSkipper *this, char **a2, unsigned int a3)
{
  return google::protobuf::internal::WireFormatLite::SkipMessage(a2, (google::protobuf::io::CodedInputStream *)a2, a3);
}

BOOL google::protobuf::internal::CodedOutputStreamFieldSkipper::SkipField(google::protobuf::io::EpsCopyOutputStream **this, google::protobuf::io::CodedInputStream *a2, google::protobuf::io::CodedInputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  return google::protobuf::internal::WireFormatLite::SkipField(a2, a3, this[1], a4);
}

BOOL google::protobuf::internal::CodedOutputStreamFieldSkipper::SkipMessage(char ***this, char **a2, google::protobuf::io::CodedOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  return google::protobuf::internal::WireFormatLite::SkipMessage(a2, this[1], a3, a4);
}

char *google::protobuf::internal::CodedOutputStreamFieldSkipper::SkipUnknownEnum(char *this, unsigned int a2, unsigned int a3)
{
  unsigned int v5 = this;
  BOOL v6 = (void *)*((void *)this + 1);
  uint64_t v7 = (char *)v6[8];
  if (*v6 <= (unint64_t)v7)
  {
    this = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(*((google::protobuf::io::EpsCopyOutputStream **)this + 1), v7);
    uint64_t v7 = this;
  }
  if (a2 > 0x7F)
  {
    *uint64_t v7 = a2 | 0x80;
    unsigned int v9 = a2 >> 7;
    if (a2 >> 14)
    {
      BOOL v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      BOOL v8 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = a2;
    BOOL v8 = v7 + 1;
  }
  v6[8] = v8;
  unsigned int v12 = (google::protobuf::io::EpsCopyOutputStream *)*((void *)v5 + 1);
  unsigned int v13 = (char *)*((void *)v12 + 8);
  if (*(void *)v12 <= (unint64_t)v13)
  {
    this = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(v12, v13);
    unsigned int v13 = this;
  }
  if (a3 > 0x7F)
  {
    char *v13 = a3 | 0x80;
    unint64_t v15 = (unint64_t)(int)a3 >> 7;
    if (a3 >> 14)
    {
      int v14 = v13 + 2;
      do
      {
        *(v14 - 1) = v15 | 0x80;
        unint64_t v16 = v15 >> 7;
        ++v14;
        unint64_t v17 = v15 >> 14;
        v15 >>= 7;
      }
      while (v17);
      *(v14 - 1) = v16;
    }
    else
    {
      v13[1] = v15;
      int v14 = v13 + 2;
    }
  }
  else
  {
    char *v13 = a3;
    int v14 = v13 + 1;
  }
  *((void *)v12 + 8) = v14;
  return this;
}

uint64_t google::protobuf::internal::WireFormatLite::ReadPackedEnumPreserveUnknowns(char **this, unsigned int a2, unsigned int (*a3)(uint64_t), char **a4, int *a5)
{
  unsigned int v10 = *this;
  if (*this >= this[1])
  {
    int v11 = 0;
  }
  else
  {
    int v11 = *v10;
    if ((*v10 & 0x80000000) == 0)
    {
      *this = v10 + 1;
      goto LABEL_6;
    }
  }
  uint64_t Varint32Fallback = google::protobuf::io::CodedInputStream::ReadVarint32Fallback((google::protobuf::io::CodedInputStream *)this, v11);
  int v11 = Varint32Fallback;
  if (Varint32Fallback < 0) {
    return 0;
  }
LABEL_6:
  int v30 = google::protobuf::io::CodedInputStream::PushLimit((google::protobuf::io::CodedInputStream *)this, v11);
  if ((int)google::protobuf::io::CodedInputStream::BytesUntilLimit((google::protobuf::io::CodedInputStream *)this) >= 1)
  {
    unsigned int v13 = 8 * a2;
    char v14 = (8 * a2) | 0x80;
    int v15 = (a2 >> 4) & 0x1FFFFFF;
    while (1)
    {
      unint64_t v16 = *this;
      if (*this >= this[1]) {
        break;
      }
      uint64_t v17 = *v16;
      if (*v16 < 0) {
        goto LABEL_12;
      }
      *this = v16 + 1;
LABEL_13:
      if (a3 && !a3(v17))
      {
        unsigned int v20 = a4[8];
        if (*a4 <= v20) {
          unsigned int v20 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback((google::protobuf::io::EpsCopyOutputStream *)a4, a4[8]);
        }
        if (v13 > 0x7F)
        {
          *unsigned int v20 = v14;
          if (v13 >= 0x4000)
          {
            unsigned int v21 = v20 + 2;
            unsigned int v22 = v15;
            do
            {
              *(v21 - 1) = v22 | 0x80;
              unsigned int v23 = v22 >> 7;
              ++v21;
              unsigned int v24 = v22 >> 14;
              v22 >>= 7;
            }
            while (v24);
            *(v21 - 1) = v23;
          }
          else
          {
            v20[1] = v13 >> 7;
            unsigned int v21 = v20 + 2;
          }
        }
        else
        {
          unsigned int v21 = v20 + 1;
          *unsigned int v20 = v13;
        }
        a4[8] = v21;
        if (*a4 <= v21) {
          unsigned int v21 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback((google::protobuf::io::EpsCopyOutputStream *)a4, v21);
        }
        if (v17 > 0x7F)
        {
          *unsigned int v21 = v17 | 0x80;
          unsigned int v26 = v17 >> 7;
          if (v17 >> 14)
          {
            int v25 = v21 + 2;
            do
            {
              *(v25 - 1) = v26 | 0x80;
              unsigned int v27 = v26 >> 7;
              ++v25;
              unsigned int v28 = v26 >> 14;
              v26 >>= 7;
            }
            while (v28);
            *(v25 - 1) = v27;
          }
          else
          {
            v21[1] = v26;
            int v25 = v21 + 2;
          }
        }
        else
        {
          *unsigned int v21 = v17;
          int v25 = v21 + 1;
        }
        a4[8] = v25;
      }
      else
      {
        uint64_t v18 = *a5;
        if (v18 == a5[1])
        {
          int v19 = v18 + 1;
          google::protobuf::RepeatedField<int>::Reserve(a5, v18 + 1);
          *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a5) + 4 * v18) = v17;
        }
        else
        {
          *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a5) + 4 * v18) = v17;
          int v19 = v18 + 1;
        }
        *a5 = v19;
      }
      if ((int)google::protobuf::io::CodedInputStream::BytesUntilLimit((google::protobuf::io::CodedInputStream *)this) <= 0) {
        goto LABEL_39;
      }
    }
    LODWORD(v17) = 0;
LABEL_12:
    uint64_t v17 = google::protobuf::io::CodedInputStream::ReadVarint32Fallback((google::protobuf::io::CodedInputStream *)this, v17);
    if (v17 < 0) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_39:
  google::protobuf::io::CodedInputStream::PopLimit((uint64_t)this, v30);
  return 1;
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteFloatArray(google::protobuf::internal::WireFormatLite *this, const float *a2, google::protobuf::io::EpsCopyOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  unsigned int v5 = (unsigned __int8 *)*((void *)a3 + 8);
  int64_t v6 = 4 * (int)a2;
  if (*(void *)a3 - (void)v5 < v6)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(a3, (char *)this, v6, v5);
  }
  else
  {
    memcpy(*((void **)a3 + 8), this, v6);
    uint64_t result = &v5[v6];
  }
  *((void *)a3 + 8) = result;
  return result;
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteDoubleArray(google::protobuf::internal::WireFormatLite *this, const double *a2, google::protobuf::io::EpsCopyOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  unsigned int v5 = (unsigned __int8 *)*((void *)a3 + 8);
  int64_t v6 = 8 * (int)a2;
  if (*(void *)a3 - (void)v5 < v6)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(a3, (char *)this, v6, v5);
  }
  else
  {
    memcpy(*((void **)a3 + 8), this, v6);
    uint64_t result = &v5[v6];
  }
  *((void *)a3 + 8) = result;
  return result;
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteBoolArray(google::protobuf::internal::WireFormatLite *this, const BOOL *a2, google::protobuf::io::EpsCopyOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = *((void *)a3 + 8);
  if (*(void *)a3 - v5 < (int)a2)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(a3, (char *)this, (int)a2, *((unsigned __int8 **)a3 + 8));
  }
  else
  {
    uint64_t v6 = (int)a2;
    memcpy(*((void **)a3 + 8), this, (int)a2);
    uint64_t result = (unsigned __int8 *)(v5 + v6);
  }
  *((void *)a3 + 8) = result;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteInt32(char *result, unsigned int a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5 = 8 * result;
  uint64_t v6 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v6)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    uint64_t v6 = result;
  }
  if (v5 > 0x7F)
  {
    *uint64_t v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      uint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      uint64_t v7 = v6 + 2;
    }
  }
  else
  {
    *uint64_t v6 = v5;
    uint64_t v7 = v6 + 1;
  }
  *((void *)this + 8) = v7;
  if (*(void *)this <= (unint64_t)v7)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    uint64_t v7 = result;
  }
  if (a2 > 0x7F)
  {
    *uint64_t v7 = a2 | 0x80;
    unint64_t v12 = (unint64_t)(int)a2 >> 7;
    if (a2 >> 14)
    {
      int v11 = v7 + 2;
      do
      {
        *(v11 - 1) = v12 | 0x80;
        unint64_t v13 = v12 >> 7;
        ++v11;
        unint64_t v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
      *(v11 - 1) = v13;
    }
    else
    {
      v7[1] = v12;
      int v11 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = a2;
    int v11 = v7 + 1;
  }
  *((void *)this + 8) = v11;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteInt64(char *result, unint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5 = 8 * result;
  uint64_t v6 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v6)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    uint64_t v6 = result;
  }
  if (v5 > 0x7F)
  {
    *uint64_t v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      uint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      uint64_t v7 = v6 + 2;
    }
  }
  else
  {
    *uint64_t v6 = v5;
    uint64_t v7 = v6 + 1;
  }
  *((void *)this + 8) = v7;
  if (*(void *)this <= (unint64_t)v7)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    uint64_t v7 = result;
  }
  if (a2 > 0x7F)
  {
    *uint64_t v7 = a2 | 0x80;
    unint64_t v12 = a2 >> 7;
    if (a2 >> 14)
    {
      int v11 = v7 + 2;
      do
      {
        *(v11 - 1) = v12 | 0x80;
        unint64_t v13 = v12 >> 7;
        ++v11;
        unint64_t v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
      *(v11 - 1) = v13;
    }
    else
    {
      v7[1] = v12;
      int v11 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = a2;
    int v11 = v7 + 1;
  }
  *((void *)this + 8) = v11;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteUInt32(char *result, unsigned int a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5 = 8 * result;
  uint64_t v6 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v6)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    uint64_t v6 = result;
  }
  if (v5 > 0x7F)
  {
    *uint64_t v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      uint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      uint64_t v7 = v6 + 2;
    }
  }
  else
  {
    *uint64_t v6 = v5;
    uint64_t v7 = v6 + 1;
  }
  *((void *)this + 8) = v7;
  if (*(void *)this <= (unint64_t)v7)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    uint64_t v7 = result;
  }
  if (a2 > 0x7F)
  {
    *uint64_t v7 = a2 | 0x80;
    unsigned int v12 = a2 >> 7;
    if (a2 >> 14)
    {
      int v11 = v7 + 2;
      do
      {
        *(v11 - 1) = v12 | 0x80;
        unsigned int v13 = v12 >> 7;
        ++v11;
        unsigned int v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
      *(v11 - 1) = v13;
    }
    else
    {
      v7[1] = v12;
      int v11 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = a2;
    int v11 = v7 + 1;
  }
  *((void *)this + 8) = v11;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteSInt32(char *result, int a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5 = 8 * result;
  uint64_t v6 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v6)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    uint64_t v6 = result;
  }
  if (v5 > 0x7F)
  {
    *uint64_t v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      uint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      uint64_t v7 = v6 + 2;
    }
  }
  else
  {
    *uint64_t v6 = v5;
    uint64_t v7 = v6 + 1;
  }
  *((void *)this + 8) = v7;
  unsigned int v11 = (2 * a2) ^ (a2 >> 31);
  if (*(void *)this <= (unint64_t)v7)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    uint64_t v7 = result;
  }
  if (v11 > 0x7F)
  {
    *uint64_t v7 = v11 | 0x80;
    unsigned int v13 = v11 >> 7;
    if (v11 >> 14)
    {
      unsigned int v12 = v7 + 2;
      do
      {
        *(v12 - 1) = v13 | 0x80;
        unsigned int v14 = v13 >> 7;
        ++v12;
        unsigned int v15 = v13 >> 14;
        v13 >>= 7;
      }
      while (v15);
      *(v12 - 1) = v14;
    }
    else
    {
      v7[1] = v13;
      unsigned int v12 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v11;
    unsigned int v12 = v7 + 1;
  }
  *((void *)this + 8) = v12;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteSInt64(char *result, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5 = 8 * result;
  uint64_t v6 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v6)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    uint64_t v6 = result;
  }
  if (v5 > 0x7F)
  {
    *uint64_t v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      uint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      uint64_t v7 = v6 + 2;
    }
  }
  else
  {
    *uint64_t v6 = v5;
    uint64_t v7 = v6 + 1;
  }
  *((void *)this + 8) = v7;
  unint64_t v11 = (2 * a2) ^ (a2 >> 63);
  if (*(void *)this <= (unint64_t)v7)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    uint64_t v7 = result;
  }
  if (v11 > 0x7F)
  {
    *uint64_t v7 = v11 | 0x80;
    unint64_t v13 = v11 >> 7;
    if (v11 >> 14)
    {
      unsigned int v12 = v7 + 2;
      do
      {
        *(v12 - 1) = v13 | 0x80;
        unint64_t v14 = v13 >> 7;
        ++v12;
        unint64_t v15 = v13 >> 14;
        v13 >>= 7;
      }
      while (v15);
      *(v12 - 1) = v14;
    }
    else
    {
      v7[1] = v13;
      unsigned int v12 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v11;
    unsigned int v12 = v7 + 1;
  }
  *((void *)this + 8) = v12;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteFixed32(char *result, int a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  int v5 = (int)result;
  unsigned int v6 = (8 * result) | 5;
  uint64_t v7 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v7)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    uint64_t v7 = result;
  }
  if (v6 > 0x7F)
  {
    *uint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *((void *)this + 8) = v8;
  if (*(void *)this <= (unint64_t)v8)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
    unsigned int v8 = result;
  }
  *(_DWORD *)unsigned int v8 = a2;
  *((void *)this + 8) = v8 + 4;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteFixed64(char *result, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  int v5 = (int)result;
  unsigned int v6 = (8 * result) | 1;
  uint64_t v7 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v7)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    uint64_t v7 = result;
  }
  if (v6 > 0x7F)
  {
    *uint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *((void *)this + 8) = v8;
  if (*(void *)this <= (unint64_t)v8)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
    unsigned int v8 = result;
  }
  *(void *)unsigned int v8 = a2;
  *((void *)this + 8) = v8 + 8;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteFloat(char *result, google::protobuf::io::EpsCopyOutputStream *this, float a3)
{
  int v5 = (int)result;
  unsigned int v6 = (8 * result) | 5;
  uint64_t v7 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v7)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    uint64_t v7 = result;
  }
  if (v6 > 0x7F)
  {
    *uint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *((void *)this + 8) = v8;
  if (*(void *)this <= (unint64_t)v8)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
    unsigned int v8 = result;
  }
  *(float *)unsigned int v8 = a3;
  *((void *)this + 8) = v8 + 4;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteDouble(char *result, google::protobuf::io::EpsCopyOutputStream *this, double a3)
{
  int v5 = (int)result;
  unsigned int v6 = (8 * result) | 1;
  uint64_t v7 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v7)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    uint64_t v7 = result;
  }
  if (v6 > 0x7F)
  {
    *uint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *((void *)this + 8) = v8;
  if (*(void *)this <= (unint64_t)v8)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
    unsigned int v8 = result;
  }
  *(double *)unsigned int v8 = a3;
  *((void *)this + 8) = v8 + 8;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteBool(char *result, char a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5 = 8 * result;
  unsigned int v6 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v6)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    unsigned int v6 = result;
  }
  if (v5 > 0x7F)
  {
    *unsigned int v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      uint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      uint64_t v7 = v6 + 2;
    }
  }
  else
  {
    *unsigned int v6 = v5;
    uint64_t v7 = v6 + 1;
  }
  *((void *)this + 8) = v7;
  if (*(void *)this <= (unint64_t)v7)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    uint64_t v7 = result;
  }
  *uint64_t v7 = a2;
  *((void *)this + 8) = v7 + 1;
  return result;
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteString(int a1, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v6 = (8 * a1) | 2;
  uint64_t v7 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v7) {
    uint64_t v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, *((char **)this + 8));
  }
  if (v6 > 0x7F)
  {
    *uint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *((void *)this + 8) = v8;
  int v12 = *(char *)(a2 + 23);
  if (v12 < 0 && *(void *)(a2 + 8) >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 482);
    unint64_t v13 = google::protobuf::internal::LogMessage::operator<<(v25, "CHECK failed: (value.size()) <= (kint32max): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v24, (const char **)&v13->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v25[0].__r_.__value_.__l.__data_);
    LOBYTE(v12) = *(unsigned char *)(a2 + 23);
    unsigned int v8 = (char *)*((void *)this + 8);
  }
  if ((v12 & 0x80u) == 0) {
    LODWORD(v14) = v12;
  }
  else {
    uint64_t v14 = *(void *)(a2 + 8);
  }
  if (*(void *)this <= (unint64_t)v8) {
    unsigned int v8 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
  }
  if (v14 > 0x7F)
  {
    *unsigned int v8 = v14 | 0x80;
    unsigned int v16 = v14 >> 7;
    if (v14 >> 14)
    {
      unint64_t v15 = (unsigned __int8 *)(v8 + 2);
      do
      {
        *(v15 - 1) = v16 | 0x80;
        unsigned int v17 = v16 >> 7;
        ++v15;
        unsigned int v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      unint64_t v15 = (unsigned __int8 *)(v8 + 2);
    }
  }
  else
  {
    *unsigned int v8 = v14;
    unint64_t v15 = (unsigned __int8 *)(v8 + 1);
  }
  *((void *)this + 8) = v15;
  int v19 = *(char *)(a2 + 23);
  if (v19 >= 0) {
    unsigned int v20 = (char *)a2;
  }
  else {
    unsigned int v20 = *(char **)a2;
  }
  if (v19 >= 0) {
    LODWORD(v21) = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v21 = *(void *)(a2 + 8);
  }
  if (*(void *)this - (void)v15 < (int)v21)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(this, v20, v21, v15);
  }
  else
  {
    uint64_t v22 = (int)v21;
    memcpy(v15, v20, (int)v21);
    uint64_t result = &v15[v22];
  }
  *((void *)this + 8) = result;
  return result;
}

void sub_25C1ECC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteStringMaybeAliased(int a1, void **a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v6 = (8 * a1) | 2;
  uint64_t v7 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v7) {
    uint64_t v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, *((char **)this + 8));
  }
  if (v6 > 0x7F)
  {
    *uint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *((void *)this + 8) = v8;
  int v12 = *((char *)a2 + 23);
  if (v12 < 0 && (unint64_t)a2[1] >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 491);
    unint64_t v13 = google::protobuf::internal::LogMessage::operator<<(v24, "CHECK failed: (value.size()) <= (kint32max): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v13->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v24[0].__r_.__value_.__l.__data_);
    LOBYTE(v12) = *((unsigned char *)a2 + 23);
    unsigned int v8 = (char *)*((void *)this + 8);
  }
  if ((v12 & 0x80u) == 0) {
    LODWORD(v14) = v12;
  }
  else {
    uint64_t v14 = a2[1];
  }
  if (*(void *)this <= (unint64_t)v8) {
    unsigned int v8 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
  }
  if (v14 > 0x7F)
  {
    *unsigned int v8 = v14 | 0x80;
    unsigned int v16 = v14 >> 7;
    if (v14 >> 14)
    {
      unint64_t v15 = v8 + 2;
      do
      {
        *(v15 - 1) = v16 | 0x80;
        unsigned int v17 = v16 >> 7;
        ++v15;
        unsigned int v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      unint64_t v15 = v8 + 2;
    }
  }
  else
  {
    *unsigned int v8 = (char)v14;
    unint64_t v15 = v8 + 1;
  }
  *((void *)this + 8) = v15;
  int v19 = *((char *)a2 + 23);
  if (v19 >= 0) {
    unsigned int v20 = a2;
  }
  else {
    unsigned int v20 = *a2;
  }
  if (v19 >= 0) {
    uint64_t v21 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    uint64_t v21 = *((unsigned int *)a2 + 2);
  }
  uint64_t result = google::protobuf::io::EpsCopyOutputStream::WriteRawMaybeAliased(this, v20, v21, v15);
  *((void *)this + 8) = result;
  return result;
}

void sub_25C1ECE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteBytes(int a1, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v6 = (8 * a1) | 2;
  uint64_t v7 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v7) {
    uint64_t v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, *((char **)this + 8));
  }
  if (v6 > 0x7F)
  {
    *uint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *((void *)this + 8) = v8;
  int v12 = *(char *)(a2 + 23);
  if (v12 < 0 && *(void *)(a2 + 8) >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 498);
    unint64_t v13 = google::protobuf::internal::LogMessage::operator<<(v25, "CHECK failed: (value.size()) <= (kint32max): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v24, (const char **)&v13->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v25[0].__r_.__value_.__l.__data_);
    LOBYTE(v12) = *(unsigned char *)(a2 + 23);
    unsigned int v8 = (char *)*((void *)this + 8);
  }
  if ((v12 & 0x80u) == 0) {
    LODWORD(v14) = v12;
  }
  else {
    uint64_t v14 = *(void *)(a2 + 8);
  }
  if (*(void *)this <= (unint64_t)v8) {
    unsigned int v8 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
  }
  if (v14 > 0x7F)
  {
    *unsigned int v8 = v14 | 0x80;
    unsigned int v16 = v14 >> 7;
    if (v14 >> 14)
    {
      unint64_t v15 = (unsigned __int8 *)(v8 + 2);
      do
      {
        *(v15 - 1) = v16 | 0x80;
        unsigned int v17 = v16 >> 7;
        ++v15;
        unsigned int v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      unint64_t v15 = (unsigned __int8 *)(v8 + 2);
    }
  }
  else
  {
    *unsigned int v8 = v14;
    unint64_t v15 = (unsigned __int8 *)(v8 + 1);
  }
  *((void *)this + 8) = v15;
  int v19 = *(char *)(a2 + 23);
  if (v19 >= 0) {
    unsigned int v20 = (char *)a2;
  }
  else {
    unsigned int v20 = *(char **)a2;
  }
  if (v19 >= 0) {
    LODWORD(v21) = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v21 = *(void *)(a2 + 8);
  }
  if (*(void *)this - (void)v15 < (int)v21)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(this, v20, v21, v15);
  }
  else
  {
    uint64_t v22 = (int)v21;
    memcpy(v15, v20, (int)v21);
    uint64_t result = &v15[v22];
  }
  *((void *)this + 8) = result;
  return result;
}

void sub_25C1ED080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteBytesMaybeAliased(int a1, void **a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v6 = (8 * a1) | 2;
  uint64_t v7 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v7) {
    uint64_t v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, *((char **)this + 8));
  }
  if (v6 > 0x7F)
  {
    *uint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *((void *)this + 8) = v8;
  int v12 = *((char *)a2 + 23);
  if (v12 < 0 && (unint64_t)a2[1] >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 506);
    unint64_t v13 = google::protobuf::internal::LogMessage::operator<<(v24, "CHECK failed: (value.size()) <= (kint32max): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v13->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v24[0].__r_.__value_.__l.__data_);
    LOBYTE(v12) = *((unsigned char *)a2 + 23);
    unsigned int v8 = (char *)*((void *)this + 8);
  }
  if ((v12 & 0x80u) == 0) {
    LODWORD(v14) = v12;
  }
  else {
    uint64_t v14 = a2[1];
  }
  if (*(void *)this <= (unint64_t)v8) {
    unsigned int v8 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
  }
  if (v14 > 0x7F)
  {
    *unsigned int v8 = v14 | 0x80;
    unsigned int v16 = v14 >> 7;
    if (v14 >> 14)
    {
      unint64_t v15 = v8 + 2;
      do
      {
        *(v15 - 1) = v16 | 0x80;
        unsigned int v17 = v16 >> 7;
        ++v15;
        unsigned int v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      unint64_t v15 = v8 + 2;
    }
  }
  else
  {
    *unsigned int v8 = (char)v14;
    unint64_t v15 = v8 + 1;
  }
  *((void *)this + 8) = v15;
  int v19 = *((char *)a2 + 23);
  if (v19 >= 0) {
    unsigned int v20 = a2;
  }
  else {
    unsigned int v20 = *a2;
  }
  if (v19 >= 0) {
    uint64_t v21 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    uint64_t v21 = *((unsigned int *)a2 + 2);
  }
  uint64_t result = google::protobuf::io::EpsCopyOutputStream::WriteRawMaybeAliased(this, v20, v21, v15);
  *((void *)this + 8) = result;
  return result;
}

void sub_25C1ED264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

char *google::protobuf::internal::WireFormatLite::WriteGroup(int a1, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5 = 8 * a1;
  unsigned int v6 = (8 * a1) | 3;
  uint64_t v7 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v7) {
    uint64_t v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
  }
  unsigned int v8 = v5 >> 7;
  if (v6 > 0x7F)
  {
    *uint64_t v7 = v6 | 0x80;
    if (v6 >> 14)
    {
      unsigned int v9 = v7 + 2;
      unsigned int v10 = v5 >> 7;
      do
      {
        *(v9 - 1) = v10 | 0x80;
        unsigned int v11 = v10 >> 7;
        ++v9;
        unsigned int v12 = v10 >> 14;
        v10 >>= 7;
      }
      while (v12);
      *(v9 - 1) = v11;
    }
    else
    {
      v7[1] = v8;
      unsigned int v9 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v6;
    unsigned int v9 = v7 + 1;
  }
  *((void *)this + 8) = v9;
  uint64_t result = (char *)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 96))(a2);
  uint64_t v14 = result;
  *((void *)this + 8) = result;
  unsigned int v15 = v5 | 4;
  if (*(void *)this <= (unint64_t)result)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, result);
    uint64_t v14 = result;
  }
  if (v15 > 0x7F)
  {
    *uint64_t v14 = v5 | 0x84;
    if (v15 >> 14)
    {
      unsigned int v16 = v14 + 2;
      do
      {
        *(v16 - 1) = v8 | 0x80;
        unsigned int v17 = v8 >> 7;
        ++v16;
        unsigned int v18 = v8 >> 14;
        v8 >>= 7;
      }
      while (v18);
      *(v16 - 1) = v17;
    }
    else
    {
      v14[1] = v8;
      unsigned int v16 = v14 + 2;
    }
  }
  else
  {
    *uint64_t v14 = v15;
    unsigned int v16 = v14 + 1;
  }
  *((void *)this + 8) = v16;
  return result;
}

uint64_t google::protobuf::internal::WireFormatLite::WriteMessage(int a1, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v6 = (8 * a1) | 2;
  uint64_t v7 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v7) {
    uint64_t v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
  }
  if (v6 > 0x7F)
  {
    *uint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *((void *)this + 8) = v8;
  unsigned int v12 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 80))(a2);
  unint64_t v13 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v13) {
    unint64_t v13 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v13);
  }
  if (v12 > 0x7F)
  {
    char *v13 = v12 | 0x80;
    unsigned int v15 = v12 >> 7;
    if (v12 >> 14)
    {
      uint64_t v14 = v13 + 2;
      do
      {
        *(v14 - 1) = v15 | 0x80;
        unsigned int v16 = v15 >> 7;
        ++v14;
        unsigned int v17 = v15 >> 14;
        v15 >>= 7;
      }
      while (v17);
      *(v14 - 1) = v16;
    }
    else
    {
      v13[1] = v15;
      uint64_t v14 = v13 + 2;
    }
  }
  else
  {
    char *v13 = v12;
    uint64_t v14 = v13 + 1;
  }
  *((void *)this + 8) = v14;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96))(a2);
  *((void *)this + 8) = result;
  return result;
}

uint64_t google::protobuf::internal::WireFormatLite::WriteSubMessageMaybeToArray(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 96))(a2, *(void *)(a3 + 64));
  *(void *)(a3 + 64) = result;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteGroupMaybeToArray(int a1, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5 = 8 * a1;
  unsigned int v6 = (8 * a1) | 3;
  uint64_t v7 = (char *)*((void *)this + 8);
  if (*(void *)this <= (unint64_t)v7) {
    uint64_t v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
  }
  unsigned int v8 = v5 >> 7;
  if (v6 > 0x7F)
  {
    *uint64_t v7 = v6 | 0x80;
    if (v6 >> 14)
    {
      unsigned int v9 = v7 + 2;
      unsigned int v10 = v5 >> 7;
      do
      {
        *(v9 - 1) = v10 | 0x80;
        unsigned int v11 = v10 >> 7;
        ++v9;
        unsigned int v12 = v10 >> 14;
        v10 >>= 7;
      }
      while (v12);
      *(v9 - 1) = v11;
    }
    else
    {
      v7[1] = v8;
      unsigned int v9 = v7 + 2;
    }
  }
  else
  {
    *uint64_t v7 = v6;
    unsigned int v9 = v7 + 1;
  }
  *((void *)this + 8) = v9;
  (*(void (**)(uint64_t))(*(void *)a2 + 80))(a2);
  uint64_t result = (char *)(*(uint64_t (**)(uint64_t, void, google::protobuf::io::EpsCopyOutputStream *))(*(void *)a2 + 96))(a2, *((void *)this + 8), this);
  uint64_t v14 = result;
  *((void *)this + 8) = result;
  unsigned int v15 = v5 | 4;
  if (*(void *)this <= (unint64_t)result)
  {
    uint64_t result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, result);
    uint64_t v14 = result;
  }
  if (v15 > 0x7F)
  {
    *uint64_t v14 = v5 | 0x84;
    if (v15 >> 14)
    {
      unsigned int v16 = v14 + 2;
      do
      {
        *(v16 - 1) = v8 | 0x80;
        unsigned int v17 = v8 >> 7;
        ++v16;
        unsigned int v18 = v8 >> 14;
        v8 >>= 7;
      }
      while (v18);
      *(v16 - 1) = v17;
    }
    else
    {
      v14[1] = v8;
      unsigned int v16 = v14 + 2;
    }
  }
  else
  {
    *uint64_t v14 = v15;
    unsigned int v16 = v14 + 1;
  }
  *((void *)this + 8) = v16;
  return result;
}

BOOL google::protobuf::internal::WireFormatLite::ReadBytes(char **this, std::string *a2)
{
  BOOL v4 = *this;
  if (*this >= this[1])
  {
    LODWORD(Varint32Fallback) = 0;
  }
  else
  {
    uint64_t Varint32Fallback = *v4;
    if ((*v4 & 0x80000000) == 0)
    {
      *this = v4 + 1;
      goto LABEL_6;
    }
  }
  uint64_t Varint32Fallback = google::protobuf::io::CodedInputStream::ReadVarint32Fallback((google::protobuf::io::CodedInputStream *)this, Varint32Fallback);
  if (Varint32Fallback < 0) {
    return 0;
  }
LABEL_6:
  return google::protobuf::io::CodedInputStream::ReadString((const void **)this, a2, Varint32Fallback);
}

BOOL google::protobuf::internal::WireFormatLite::ReadBytes(char **this, std::string **a2)
{
  BOOL v3 = *a2;
  if (*a2 == (std::string *)&google::protobuf::internal::fixed_address_empty_string) {
    operator new();
  }
  BOOL v4 = *this;
  if (*this >= this[1])
  {
    LODWORD(Varint32Fallback) = 0;
  }
  else
  {
    uint64_t Varint32Fallback = *v4;
    if ((*v4 & 0x80000000) == 0)
    {
      *this = v4 + 1;
      goto LABEL_8;
    }
  }
  uint64_t Varint32Fallback = google::protobuf::io::CodedInputStream::ReadVarint32Fallback((google::protobuf::io::CodedInputStream *)this, Varint32Fallback);
  if (Varint32Fallback < 0) {
    return 0;
  }
LABEL_8:
  return google::protobuf::io::CodedInputStream::ReadString((const void **)this, v3, Varint32Fallback);
}

void google::protobuf::internal::PrintUTF8ErrorLog(google::protobuf::internal *this, const char *a2, const char *a3)
{
  v17[0] = 0;
  v17[1] = 0;
  uint64_t v18 = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  if (this)
  {
    google::protobuf::StringPrintf((google::protobuf *)" '%s'", v15, this);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v15[0];
  }
  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 577);
  unsigned int v5 = google::protobuf::internal::LogMessage::operator<<(v15, "String field");
  unsigned int v6 = google::protobuf::internal::LogMessage::operator<<(v5, (const std::string::value_type *)&__p);
  uint64_t v7 = google::protobuf::internal::LogMessage::operator<<(v6, " contains invalid ");
  unsigned int v8 = google::protobuf::internal::LogMessage::operator<<(v7, "UTF-8 data when ");
  unsigned int v9 = google::protobuf::internal::LogMessage::operator<<(v8, a2);
  unsigned int v10 = google::protobuf::internal::LogMessage::operator<<(v9, " a protocol ");
  unsigned int v11 = google::protobuf::internal::LogMessage::operator<<(v10, "buffer. Use the 'bytes' type if you intend to send raw ");
  unsigned int v12 = google::protobuf::internal::LogMessage::operator<<(v11, "bytes. ");
  unint64_t v13 = google::protobuf::internal::LogMessage::operator<<(v12, (const std::string::value_type *)v17);
  google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v13->__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v18) < 0) {
    operator delete(v17[0]);
  }
}

void sub_25C1ED9CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v22 - 17) < 0) {
    operator delete(*(void **)(v22 - 40));
  }
  _Unwind_Resume(exception_object);
}

BOOL google::protobuf::internal::WireFormatLite::VerifyUtf8String(google::protobuf::internal *a1, const char *a2, int a3, google::protobuf::internal *a4)
{
  BOOL IsStructurallyValidUTF8 = google::protobuf::internal::IsStructurallyValidUTF8(a1, a2);
  if (!IsStructurallyValidUTF8)
  {
    uint64_t v7 = "serializing";
    if (a3 != 1) {
      uint64_t v7 = 0;
    }
    if (a3) {
      unsigned int v8 = v7;
    }
    else {
      unsigned int v8 = "parsing";
    }
    google::protobuf::internal::PrintUTF8ErrorLog(a4, v8, 0);
  }
  return IsStructurallyValidUTF8;
}

uint64_t google::protobuf::internal::WireFormatLite::Int32Size(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
  {
    int v5 = *(_DWORD *)google::protobuf::RepeatedField<int>::Get(a1, v3);
    if (v5 < 0) {
      uint64_t v6 = 10;
    }
    else {
      uint64_t v6 = (9 * (__clz(v5 | 1) ^ 0x1F) + 73) >> 6;
    }
    v4 += v6;
    ++v3;
  }
  while (v1 != v3);
  return v4;
}

uint64_t google::protobuf::internal::WireFormatLite::UInt32Size(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
    v4 += (9 * (__clz(*(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(a1, v3++) | 1) ^ 0x1F) + 73) >> 6;
  while (v1 != v3);
  return v4;
}

uint64_t google::protobuf::internal::WireFormatLite::SInt32Size(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
  {
    int v5 = (int *)google::protobuf::RepeatedField<int>::Get(a1, v3);
    v4 += (9 * (__clz((2 * *v5) ^ (*v5 >> 31) | 1) ^ 0x1F) + 73) >> 6;
    ++v3;
  }
  while (v1 != v3);
  return v4;
}

uint64_t google::protobuf::internal::WireFormatLite::Int64Size(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
    v4 += (9 * (__clz(*(void *)google::protobuf::RepeatedField<long long>::Get(a1, v3++) | 1) ^ 0x3F) + 73) >> 6;
  while (v1 != v3);
  return v4;
}

uint64_t google::protobuf::internal::WireFormatLite::UInt64Size(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
    v4 += (9 * (__clz(*(void *)google::protobuf::RepeatedField<unsigned long long>::Get(a1, v3++) | 1) ^ 0x3F) + 73) >> 6;
  while (v1 != v3);
  return v4;
}

uint64_t google::protobuf::internal::WireFormatLite::SInt64Size(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
  {
    int v5 = (uint64_t *)google::protobuf::RepeatedField<long long>::Get(a1, v3);
    v4 += (9 * (__clz((2 * *v5) ^ (*v5 >> 63) | 1) ^ 0x3F) + 73) >> 6;
    ++v3;
  }
  while (v1 != v3);
  return v4;
}

void google::protobuf::internal::FieldSkipper::~FieldSkipper(google::protobuf::internal::FieldSkipper *this)
{
}

void google::protobuf::internal::CodedOutputStreamFieldSkipper::~CodedOutputStreamFieldSkipper(google::protobuf::internal::CodedOutputStreamFieldSkipper *this)
{
}

uint64_t google::protobuf::io::ArrayInputStream::ArrayInputStream(uint64_t this, const void *a2, int a3, int a4)
{
  *(void *)this = &unk_27098C0D8;
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

BOOL google::protobuf::io::ArrayInputStream::Next(google::protobuf::io::ArrayInputStream *this, const void **a2, int *a3)
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

void google::protobuf::io::ArrayInputStream::BackUp(google::protobuf::io::ArrayInputStream *this, int a2)
{
  int v4 = *((_DWORD *)this + 7);
  if (v4 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 80);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (last_returned_size_) > (0): ");
    uint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v5, "BackUp() can only be called after a successful Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    int v4 = *((_DWORD *)this + 7);
  }
  if (v4 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 82);
    uint64_t v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) <= (last_returned_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 83);
    unsigned int v8 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  *((void *)this + 3) = (*((_DWORD *)this + 6) - a2);
}

void sub_25C1EDF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL google::protobuf::io::ArrayInputStream::Skip(google::protobuf::io::ArrayInputStream *this, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 89);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
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

void sub_25C1EE00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::ArrayInputStream::ByteCount(google::protobuf::io::ArrayInputStream *this)
{
  return *((int *)this + 6);
}

uint64_t google::protobuf::io::ArrayOutputStream::ArrayOutputStream(uint64_t this, void *a2, int a3, int a4)
{
  *(void *)this = &unk_27098C188;
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

BOOL google::protobuf::io::ArrayOutputStream::Next(google::protobuf::io::ArrayOutputStream *this, void **a2, int *a3)
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

void google::protobuf::io::ArrayOutputStream::BackUp(google::protobuf::io::ArrayOutputStream *this, int a2)
{
  int v4 = *((_DWORD *)this + 7);
  if (v4 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 127);
    int v5 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (last_returned_size_) > (0): ");
    int v6 = google::protobuf::internal::LogMessage::operator<<(v5, "BackUp() can only be called after a successful Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    int v4 = *((_DWORD *)this + 7);
  }
  if (v4 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 129);
    int v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) <= (last_returned_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 130);
    unsigned int v8 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  *((void *)this + 3) = (*((_DWORD *)this + 6) - a2);
}

void sub_25C1EE1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::ArrayOutputStream::ByteCount(google::protobuf::io::ArrayOutputStream *this)
{
  return *((int *)this + 6);
}

void *google::protobuf::io::StringOutputStream::StringOutputStream(void *result, uint64_t a2)
{
  char *result = &unk_27098C270;
  result[1] = a2;
  return result;
}

uint64_t google::protobuf::io::StringOutputStream::Next(google::protobuf::io::StringOutputStream *this, void **a2, int *a3)
{
  uint64_t v6 = *((void *)this + 1);
  if (!v6)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 142);
    int v7 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: target_ != NULL: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    uint64_t v6 = *((void *)this + 1);
  }
  if (*(char *)(v6 + 23) < 0)
  {
    unint64_t v8 = *(void *)(v6 + 8);
    unint64_t v9 = (*(void *)(v6 + 16) & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v8 < v9) {
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v8 = *(unsigned __int8 *)(v6 + 23);
    if (*(unsigned __int8 *)(v6 + 23) < 0x16u)
    {
      unint64_t v9 = 22;
      goto LABEL_8;
    }
  }
  unint64_t v9 = 2 * v8;
LABEL_8:
  if (v8 + 0x7FFFFFFF < v9) {
    unint64_t v9 = v8 + 0x7FFFFFFF;
  }
  if (v9 <= 0x10) {
    std::string::size_type v10 = 16;
  }
  else {
    std::string::size_type v10 = v9;
  }
  std::string::resize((std::string *)v6, v10, 0);
  unsigned int v11 = (uint64_t **)*((void *)this + 1);
  if (*((char *)v11 + 23) < 0) {
    unsigned int v11 = (uint64_t **)*v11;
  }
  *a2 = (char *)v11 + v8;
  uint64_t v12 = *((void *)this + 1);
  if (*(char *)(v12 + 23) < 0) {
    uint64_t v12 = *(void *)(v12 + 8);
  }
  else {
    LODWORD(v12) = *(unsigned __int8 *)(v12 + 23);
  }
  *a3 = v12 - v8;
  return 1;
}

void sub_25C1EE328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::io::StringOutputStream::BackUp(google::protobuf::io::StringOutputStream *this, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 169);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  uint64_t v5 = *((void *)this + 1);
  if (!v5)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 170);
    uint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: target_ != NULL: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    uint64_t v5 = *((void *)this + 1);
  }
  LODWORD(v7) = *(char *)(v5 + 23);
  if ((v7 & 0x80000000) != 0) {
    unint64_t v8 = *(void *)(v5 + 8);
  }
  else {
    unint64_t v8 = *(unsigned __int8 *)(v5 + 23);
  }
  if (v8 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 171);
    unint64_t v9 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) <= (target_->size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v9->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    uint64_t v5 = *((void *)this + 1);
    LOBYTE(v7) = *(unsigned char *)(v5 + 23);
  }
  if ((v7 & 0x80) != 0) {
    uint64_t v7 = *(void *)(v5 + 8);
  }
  else {
    uint64_t v7 = v7;
  }
  std::string::resize((std::string *)v5, v7 - a2, 0);
}

void sub_25C1EE474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::StringOutputStream::ByteCount(google::protobuf::io::StringOutputStream *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (!v1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 176);
    uint64_t v3 = google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: target_ != NULL: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
    uint64_t v1 = *((void *)this + 1);
  }
  if (*(char *)(v1 + 23) < 0) {
    return *(void *)(v1 + 8);
  }
  else {
    return *(unsigned __int8 *)(v1 + 23);
  }
}

void sub_25C1EE520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::CopyingInputStream::Skip(google::protobuf::io::CopyingInputStream *this)
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

uint64_t google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor(uint64_t result, uint64_t a2, int a3)
{
  *(void *)BOOL result = &unk_27098C3F0;
  *(void *)(result + 8) = a2;
  *(_WORD *)(result + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_DWORD *)(result + 48) = 0;
  *(_DWORD *)(result + 40) = v3;
  return result;
}

void google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor(google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  *(void *)this = &unk_27098C3F0;
  if (*((unsigned char *)this + 16))
  {
    uint64_t v2 = *((void *)this + 1);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
  }
  uint64_t v3 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v3) {
    MEMORY[0x26117FD90](v3, 0x1000C8077774924);
  }
}

{
  uint64_t vars8;

  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor(this);
  JUMPOUT(0x26117FDC0);
}

uint64_t google::protobuf::io::CopyingInputStreamAdaptor::Next(google::protobuf::io::CopyingInputStreamAdaptor *this, const void **a2, int *a3)
{
  if (*((unsigned char *)this + 17)) {
    return 0;
  }
  google::protobuf::io::CopyingInputStreamAdaptor::AllocateBufferIfNeeded((uint64_t)this);
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
      google::protobuf::io::CopyingInputStreamAdaptor::FreeBuffer(this);
      return 0;
    }
    uint64_t v9 = (const void *)*((void *)this + 4);
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

uint64_t google::protobuf::io::CopyingInputStreamAdaptor::AllocateBufferIfNeeded(uint64_t this)
{
  if (!*(void *)(this + 32)) {
    operator new[]();
  }
  return this;
}

uint64_t google::protobuf::io::CopyingInputStreamAdaptor::FreeBuffer(google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  if (*((_DWORD *)this + 12))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 292);
    uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (backup_bytes_) == (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  *((_DWORD *)this + 11) = 0;
  uint64_t result = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (result) {
    return MEMORY[0x26117FD90](result, 0x1000C8077774924);
  }
  return result;
}

void sub_25C1EE908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::io::CopyingInputStreamAdaptor::BackUp(google::protobuf::io::CopyingInputStreamAdaptor *this, int a2)
{
  if (*((_DWORD *)this + 12) || !*((void *)this + 4))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 248);
    char v4 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: backup_bytes_ == 0 && buffer_.get() != NULL: ");
    uint64_t v5 = google::protobuf::internal::LogMessage::operator<<(v4, " BackUp() can only be called after Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (*((_DWORD *)this + 11) < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 250);
    uint64_t v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) <= (buffer_used_): ");
    uint64_t v7 = google::protobuf::internal::LogMessage::operator<<(v6, " Can't back up over more bytes than were returned by the last call to Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 253);
    int v8 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    uint64_t v9 = google::protobuf::internal::LogMessage::operator<<(v8, " Parameter to BackUp() can't be negative.");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v9->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  *((_DWORD *)this + 12) = a2;
}

void sub_25C1EEA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL google::protobuf::io::CopyingInputStreamAdaptor::Skip(google::protobuf::io::CopyingInputStreamAdaptor *this, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 259);
    char v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
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

void sub_25C1EEB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::CopyingInputStreamAdaptor::ByteCount(google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  return *((void *)this + 3) - *((int *)this + 12);
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor(uint64_t result, uint64_t a2, int a3)
{
  *(void *)uint64_t result = &unk_27098C430;
  *(void *)(result + 8) = a2;
  *(_WORD *)(result + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(_DWORD *)(result + 40) = v3;
  *(_DWORD *)(result + 44) = 0;
  return result;
}

void google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  *(void *)this = &unk_27098C430;
  google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this);
  if (*((unsigned char *)this + 16))
  {
    uint64_t v2 = *((void *)this + 1);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
  }
  uint64_t v3 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v3) {
    MEMORY[0x26117FD90](v3, 0x1000C8077774924);
  }
}

{
  uint64_t vars8;

  google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(this);
  JUMPOUT(0x26117FDC0);
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(google::protobuf::io::CopyingOutputStreamAdaptor *this)
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
  *((void *)this + 4) = 0;
  if (result)
  {
    MEMORY[0x26117FD90](result, 0x1000C8077774924);
    return 0;
  }
  return result;
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::Next(google::protobuf::io::CopyingOutputStreamAdaptor *this, void **a2, int *a3)
{
  if (*((_DWORD *)this + 11) != *((_DWORD *)this + 10)
    || (uint64_t result = google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this), result))
  {
    google::protobuf::io::CopyingInputStreamAdaptor::AllocateBufferIfNeeded((uint64_t)this);
    int v7 = *((_DWORD *)this + 10);
    uint64_t v8 = *((int *)this + 11);
    *a2 = (void *)(*((void *)this + 4) + v8);
    *a3 = v7 - v8;
    *((_DWORD *)this + 11) = *((_DWORD *)this + 10);
    return 1;
  }
  return result;
}

void google::protobuf::io::CopyingOutputStreamAdaptor::BackUp(google::protobuf::io::CopyingOutputStreamAdaptor *this, int a2)
{
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 331);
    char v4 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  int v5 = *((_DWORD *)this + 11);
  if (v5 != *((_DWORD *)this + 10))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 332);
    int v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (buffer_used_) == (buffer_size_): ");
    int v7 = google::protobuf::internal::LogMessage::operator<<(v6, " BackUp() can only be called after Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    int v5 = *((_DWORD *)this + 11);
  }
  if (v5 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 334);
    uint64_t v8 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) <= (buffer_used_): ");
    char v9 = google::protobuf::internal::LogMessage::operator<<(v8, " Can't back up over more bytes than were returned by the last call to Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v9->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    int v5 = *((_DWORD *)this + 11);
  }
  *((_DWORD *)this + 11) = v5 - a2;
}

void sub_25C1EEED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount(google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  return *((void *)this + 3) + *((int *)this + 11);
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::WriteAliasedRaw(google::protobuf::io::CopyingOutputStreamAdaptor *this, char *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  if (*((_DWORD *)this + 10) > (int)a3)
  {
    __n_4[0].__r_.__value_.__r.__words[0] = 0;
    int __n = 0;
    int v6 = (*(uint64_t (**)(google::protobuf::io::CopyingOutputStreamAdaptor *, std::string *, int *))(*(void *)this + 16))(this, __n_4, &__n);
    uint64_t result = 0;
    if (!v6) {
      return result;
    }
    while ((int)v3 > __n)
    {
      memcpy(__n_4[0].__r_.__value_.__l.__data_, a2, __n);
      a2 += __n;
      LODWORD(v3) = v3 - __n;
      if (((*(uint64_t (**)(google::protobuf::io::CopyingOutputStreamAdaptor *, std::string *, int *))(*(void *)this + 16))(this, __n_4, &__n) & 1) == 0)return 0; {
    }
      }
    memcpy(__n_4[0].__r_.__value_.__l.__data_, a2, (int)v3);
    (*(void (**)(google::protobuf::io::CopyingOutputStreamAdaptor *, void))(*(void *)this + 24))(this, (__n - v3));
    return 1;
  }
  uint64_t result = google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(void, char *, uint64_t))(**((void **)this + 1) + 16))(*((void *)this + 1), a2, v3);
    if (result)
    {
      if (*((_DWORD *)this + 11))
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)__n_4, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 350);
        uint64_t v8 = google::protobuf::internal::LogMessage::operator<<(__n_4, "CHECK failed: (buffer_used_) == (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&__n, (const char **)&v8->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&__n_4[0].__r_.__value_.__l.__data_);
      }
      *((void *)this + 3) += (int)v3;
      return 1;
    }
  }
  return result;
}

void sub_25C1EF0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::FreeBuffer(google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  *((_DWORD *)this + 11) = 0;
  uint64_t result = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (result) {
    JUMPOUT(0x26117FD90);
  }
  return result;
}

void *google::protobuf::io::LimitingInputStream::LimitingInputStream(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = &unk_27098C2B8;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  return a1;
}

void google::protobuf::io::LimitingInputStream::~LimitingInputStream(google::protobuf::io::LimitingInputStream *this)
{
  *(void *)this = &unk_27098C2B8;
  if ((*((void *)this + 2) & 0x8000000000000000) != 0) {
    (*(void (**)(void, void))(**((void **)this + 1) + 24))(*((void *)this + 1), -*((_DWORD *)this + 4));
  }
}

{
  uint64_t vars8;

  google::protobuf::io::LimitingInputStream::~LimitingInputStream(this);
  JUMPOUT(0x26117FDC0);
}

uint64_t google::protobuf::io::LimitingInputStream::Next(google::protobuf::io::LimitingInputStream *this, const void **a2, int *a3)
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

uint64_t google::protobuf::io::LimitingInputStream::BackUp(google::protobuf::io::LimitingInputStream *this, uint64_t a2)
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

BOOL google::protobuf::io::LimitingInputStream::Skip(google::protobuf::io::LimitingInputStream *this, uint64_t a2)
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

uint64_t google::protobuf::io::LimitingInputStream::ByteCount(google::protobuf::io::LimitingInputStream *this)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = (*(uint64_t (**)(void))(**((void **)this + 1) + 40))(*((void *)this + 1));
  if (v2 < 0) {
    v3 += *((void *)this + 2);
  }
  return v3 - *((void *)this + 3);
}

void google::protobuf::io::ArrayInputStream::~ArrayInputStream(google::protobuf::io::ArrayInputStream *this)
{
}

void google::protobuf::io::ArrayOutputStream::~ArrayOutputStream(google::protobuf::io::ArrayOutputStream *this)
{
}

uint64_t google::protobuf::io::ZeroCopyOutputStream::AllowsAliasing(google::protobuf::io::ZeroCopyOutputStream *this)
{
  return 0;
}

void google::protobuf::io::StringOutputStream::~StringOutputStream(google::protobuf::io::StringOutputStream *this)
{
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::AllowsAliasing(google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  return 1;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::SetFlag(uint64_t result, int a2, int a3)
{
  int v3 = *(_DWORD *)(result + 8);
  int v4 = v3 & ~a2;
  int v5 = v3 | a2;
  if (!a3) {
    int v5 = v4;
  }
  *(_DWORD *)(result + 8) = v5;
  return result;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::MemoryMappedNormalizerSpec(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_27098B9F8;
  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFE | (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16))(a2);
  if ((*(unsigned int (**)(uint64_t))(*(void *)a2 + 24))(a2)) {
    int v4 = 2;
  }
  else {
    int v4 = 0;
  }
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFD | v4;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a2 + 32))(a2)) {
    int v5 = 4;
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFB | v5;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a2 + 40))(a2)) {
    int v6 = 8;
  }
  else {
    int v6 = 0;
  }
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFF7 | v6;
  return a1;
}

void sentencepiece::MemoryMappedNormalizerSpec::Serialize(sentencepiece::MemoryMappedNormalizerSpec *this@<X0>, uint64_t a2@<X8>)
{
  int v3 = *((_DWORD *)this + 2);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  std::string::resize((std::string *)a2, 4uLL, 0);
  if (*(char *)(a2 + 23) >= 0) {
    int v4 = (_DWORD *)a2;
  }
  else {
    int v4 = *(_DWORD **)a2;
  }
  *int v4 = v3;
}

void sub_25C1EF678(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sentencepiece::PieceTypeInfo::Serialize(sentencepiece::PieceTypeInfo *this@<X0>, uint64_t a2@<X8>)
{
  char v3 = *(unsigned char *)this;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  std::string::resize((std::string *)a2, 1uLL, 0);
  if (*(char *)(a2 + 23) >= 0) {
    int v4 = (unsigned char *)a2;
  }
  else {
    int v4 = *(unsigned char **)a2;
  }
  *int v4 = v3;
}

void sub_25C1EF6E4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sentencepiece::MemoryMappedModelProto::MemoryMappedModelProto(uint64_t a1, _DWORD *a2, unint64_t a3)
{
  *(void *)a1 = &unk_27098B5A0;
  *(void *)(a1 + 16) = &unk_27098B9F8;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = &unk_27098B9F8;
  *(_DWORD *)(a1 + 40) = 0;
  int v6 = (uint64_t *)(a1 + 88);
  sentencepiece::util::Status::Status((void *)(a1 + 88));
  sentencepiece::MemoryMappedModelProto::Init(a1, a2, a3, (sentencepiece::util::Status *)&v8);
  sentencepiece::util::Status::operator=(v6, &v8);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v8);
  return a1;
}

void sub_25C1EF7D4(_Unwind_Exception *a1, uint64_t a2, ...)
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

uint64_t sentencepiece::GetPieceTypeInfo(uint64_t a1, uint64_t a2)
{
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1)) {
    return 1;
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 112))(a1, a2)) {
    return 2;
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 120))(a1, a2)) {
    return 3;
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 128))(a1, a2)) {
    return 4;
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 136))(a1, a2)) {
    return 5;
  }
  int v5 = (sentencepiece::logging *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 144))(a1, a2);
  if ((v5 & 1) == 0)
  {
    if ((int)sentencepiece::logging::GetMinLogLevel(v5) <= 2)
    {
      char v15 = 0;
      int v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"mmap_model_proto.cc", 19);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"(", 1);
      int v7 = (void *)std::ostream::operator<<();
      unint64_t v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)") ", 2);
      char v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"LOG(", 4);
      int v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"ERROR", 5);
      int v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)") ", 2);
      int v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"Unknown piece type: ", 20);
      uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 88))(a1, a2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v13, v14);
      sentencepiece::error::Die::~Die((sentencepiece::error::Die *)&v15);
    }
    return 1;
  }
  return 6;
}

void sub_25C1EFC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
}

void sentencepiece::GetMemoryMappableString(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 72))(a1);
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  memset(&v52, 0, sizeof(v52));
  std::string::resize(&v52, 4uLL, 0);
  int v7 = v4 | 2;
  if (!v5) {
    int v7 = v4;
  }
  int v8 = v7 | (v6 << 30);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v9 = &v52;
  }
  else {
    char v9 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  LODWORD(v9->__r_.__value_.__l.__data_) = v8;
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v10 = &v52;
  }
  else {
    int v10 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v52.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v10, size);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 152))(a1);
  sentencepiece::MemoryMappedNormalizerSpec::MemoryMappedNormalizerSpec((uint64_t)v51, v12);
  sentencepiece::MemoryMappedNormalizerSpec::Serialize((sentencepiece::MemoryMappedNormalizerSpec *)v51, (uint64_t)&v52);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v13 = &v52;
  }
  else {
    uint64_t v13 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v14 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v14 = v52.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v13, v14);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 160))(a1);
  sentencepiece::MemoryMappedNormalizerSpec::MemoryMappedNormalizerSpec((uint64_t)v50, v15);
  sentencepiece::MemoryMappedNormalizerSpec::Serialize((sentencepiece::MemoryMappedNormalizerSpec *)v50, (uint64_t)&v52);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v16 = &v52;
  }
  else {
    unsigned int v16 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v17 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v17 = v52.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v16, v17);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  int v18 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  memset(&v52, 0, sizeof(v52));
  std::string::resize(&v52, 4uLL, 0);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v19 = &v52;
  }
  else {
    int v19 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  LODWORD(v19->__r_.__value_.__l.__data_) = v18;
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v20 = &v52;
  }
  else {
    unsigned int v20 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v21 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v21 = v52.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v20, v21);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  uint64_t v22 = v18;
  if (v18)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      LOBYTE(__p) = sentencepiece::GetPieceTypeInfo(a1, i);
      sentencepiece::PieceTypeInfo::Serialize((sentencepiece::PieceTypeInfo *)&__p, (uint64_t)&v52);
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        char v24 = &v52;
      }
      else {
        char v24 = (std::string *)v52.__r_.__value_.__r.__words[0];
      }
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v25 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v25 = v52.__r_.__value_.__l.__size_;
      }
      std::string::append(a2, (const std::string::value_type *)v24, v25);
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v52.__r_.__value_.__l.__data_);
      }
    }
  }
  sentencepiece::mmap_util::Padding(a2);
  if (v18)
  {
    for (uint64_t j = 0; j != v18; ++j)
    {
      float v27 = (*(float (**)(uint64_t, uint64_t))(*(void *)a1 + 96))(a1, j);
      memset(&v52, 0, sizeof(v52));
      std::string::resize(&v52, 4uLL, 0);
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unsigned int v28 = &v52;
      }
      else {
        unsigned int v28 = (std::string *)v52.__r_.__value_.__r.__words[0];
      }
      *(float *)&v28->__r_.__value_.__l.__data_ = v27;
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unsigned int v29 = &v52;
      }
      else {
        unsigned int v29 = (std::string *)v52.__r_.__value_.__r.__words[0];
      }
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v30 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v30 = v52.__r_.__value_.__l.__size_;
      }
      std::string::append(a2, (const std::string::value_type *)v29, v30);
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v52.__r_.__value_.__l.__data_);
      }
    }
  }
  memset(&v52, 0, sizeof(v52));
  std::string __p = 0;
  unsigned int v48 = 0;
  uint64_t v49 = 0;
  v46[0] = &v52;
  v46[1] = (std::string *)&__p;
  BOOL v31 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
  sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v31, v32);
  unsigned int v33 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
  sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v33, v34);
  std::string::size_type v35 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 40))(a1);
  sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v35, v36);
  unsigned int v37 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v37, v38);
  int v39 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v39, v40);
  if (v18)
  {
    uint64_t v41 = 0;
    do
    {
      unint64_t v42 = (std::string::value_type *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 88))(a1, v41);
      sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v42, v43);
      ++v41;
    }
    while (v22 != v41);
  }
  std::string::append(a2, (const std::string::value_type *)__p, v48 - (unsigned char *)__p);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unint64_t v44 = &v52;
  }
  else {
    unint64_t v44 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v45 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v45 = v52.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v44, v45);
  if (__p)
  {
    unsigned int v48 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
}

void sub_25C1F0238(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v23 + 23) < 0) {
    operator delete(*(void **)v23);
  }
  _Unwind_Resume(exception_object);
}

void sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(std::string **a1, std::string::value_type *__s, std::string::size_type __n)
{
  int v6 = a1[1];
  if (SHIBYTE((*a1)->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type size = (*a1)->__r_.__value_.__l.__size_;
  }
  else {
    LODWORD(size) = HIBYTE((*a1)->__r_.__value_.__r.__words[2]);
  }
  unint64_t v8 = v6->__r_.__value_.__r.__words[2];
  char v9 = (_DWORD *)v6->__r_.__value_.__l.__size_;
  if ((unint64_t)v9 >= v8)
  {
    int v11 = (_DWORD *)v6->__r_.__value_.__r.__words[0];
    uint64_t v12 = (uint64_t)((uint64_t)v9 - v6->__r_.__value_.__r.__words[0]) >> 2;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 62) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v8 - (void)v11;
    if (v14 >> 1 > v13) {
      unint64_t v13 = v14 >> 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15)
    {
      unsigned int v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v6->__r_.__value_.__r.__words[2], v15);
      int v11 = (_DWORD *)v6->__r_.__value_.__r.__words[0];
      char v9 = (_DWORD *)v6->__r_.__value_.__l.__size_;
    }
    else
    {
      unsigned int v16 = 0;
    }
    std::string::size_type v17 = &v16[4 * v12];
    int v18 = &v16[4 * v15];
    *(_DWORD *)std::string::size_type v17 = size;
    int v10 = v17 + 4;
    while (v9 != v11)
    {
      int v19 = *--v9;
      *((_DWORD *)v17 - 1) = v19;
      v17 -= 4;
    }
    v6->__r_.__value_.__r.__words[0] = (std::string::size_type)v17;
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)v10;
    v6->__r_.__value_.__r.__words[2] = (std::string::size_type)v18;
    if (v11) {
      operator delete(v11);
    }
  }
  else
  {
    *char v9 = size;
    int v10 = v9 + 1;
  }
  v6->__r_.__value_.__l.__size_ = (std::string::size_type)v10;
  std::string::append(*a1, __s, __n);
  unsigned int v20 = *a1;
  std::string::push_back(v20, 0);
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
  *(void *)this = &unk_27098B5A0;
  sentencepiece::util::Status::~Status((sentencepiece::MemoryMappedModelProto *)((char *)this + 88));
}

{
  uint64_t vars8;

  *(void *)this = &unk_27098B5A0;
  sentencepiece::util::Status::~Status((sentencepiece::MemoryMappedModelProto *)((char *)this + 88));
  JUMPOUT(0x26117FDC0);
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
  uint64_t v2 = (const char *)(*((void *)this + 10) + *(unsigned int *)(*((void *)this + 9) + 4 * (a2 + 5)));
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

google::protobuf::io::FileInputStream *google::protobuf::io::FileInputStream::FileInputStream(google::protobuf::io::FileInputStream *this, int a2, int a3)
{
  *(void *)this = &unk_27098C098;
  *((void *)this + 1) = &unk_27098C068;
  *((_DWORD *)this + 4) = a2;
  *((_WORD *)this + 10) = 0;
  *((_DWORD *)this + 6) = 0;
  *((unsigned char *)this + 28) = 0;
  google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor((uint64_t)this + 32, (uint64_t)this + 8, a3);
  return this;
}

void sub_25C1F0774(_Unwind_Exception *a1)
{
  google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(v1);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::FileInputStream::CopyingFileInputStream::CopyingFileInputStream(uint64_t this, int a2)
{
  *(void *)this = &unk_27098C068;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  *(unsigned char *)(this + 20) = 0;
  return this;
}

BOOL google::protobuf::io::FileInputStream::Close(google::protobuf::io::FileInputStream *this)
{
  return google::protobuf::io::FileInputStream::CopyingFileInputStream::Close((google::protobuf::io::FileInputStream *)((char *)this + 8));
}

BOOL google::protobuf::io::FileInputStream::CopyingFileInputStream::Close(google::protobuf::io::FileInputStream::CopyingFileInputStream *this)
{
  if (*((unsigned char *)this + 13))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 117);
    uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: !is_closed_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  *((unsigned char *)this + 13) = 1;
  if (v3) {
    *((_DWORD *)this + 4) = *__error();
  }
  return v3 == 0;
}

void sub_25C1F0860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::FileInputStream::Next(google::protobuf::io::FileInputStream *this, const void **a2, int *a3)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::Next((google::protobuf::io::FileInputStream *)((char *)this + 32), a2, a3);
}

void google::protobuf::io::FileInputStream::BackUp(google::protobuf::io::FileInputStream *this, int a2)
{
}

BOOL google::protobuf::io::FileInputStream::Skip(google::protobuf::io::FileInputStream *this, int a2)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::Skip((google::protobuf::io::FileInputStream *)((char *)this + 32), a2);
}

uint64_t google::protobuf::io::FileInputStream::ByteCount(google::protobuf::io::FileInputStream *this)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::ByteCount((google::protobuf::io::FileInputStream *)((char *)this + 32));
}

void google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(google::protobuf::io::FileInputStream::CopyingFileInputStream *this)
{
  *(void *)this = &unk_27098C068;
  if (*((unsigned char *)this + 12))
  {
    if (!google::protobuf::io::FileInputStream::CopyingFileInputStream::Close(this))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 111);
      uint64_t v2 = google::protobuf::internal::LogMessage::operator<<(v6, "close() failed: ");
      int v3 = strerror(*((_DWORD *)this + 4));
      int v4 = google::protobuf::internal::LogMessage::operator<<(v2, v3);
      google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v4->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
    }
  }
}

{
  uint64_t vars8;

  google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(this);
  JUMPOUT(0x26117FDC0);
}

uint64_t google::protobuf::io::anonymous namespace'::close_no_eintr(google::protobuf::io::_anonymous_namespace_ *this)
{
  int v1 = (int)this;
  do
    uint64_t v2 = close(v1);
  while ((v2 & 0x80000000) != 0 && *__error() == 4);
  return v2;
}

ssize_t google::protobuf::io::FileInputStream::CopyingFileInputStream::Read(google::protobuf::io::FileInputStream::CopyingFileInputStream *this, void *a2, int a3)
{
  if (*((unsigned char *)this + 13))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 132);
    int v6 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: !is_closed_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
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

void sub_25C1F0A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::FileInputStream::CopyingFileInputStream::Skip(google::protobuf::io::FileInputStream::CopyingFileInputStream *this, uint64_t a2)
{
  if (*((unsigned char *)this + 13))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 148);
    int v4 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: !is_closed_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  if (*((unsigned char *)this + 20) || lseek(*((_DWORD *)this + 2), (int)a2, 1) == -1)
  {
    *((unsigned char *)this + 20) = 1;
    return google::protobuf::io::CopyingInputStream::Skip(this);
  }
  return a2;
}

void sub_25C1F0B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::FileOutputStream::FileOutputStream(google::protobuf::io::FileOutputStream *this, int a2)
{
  *(void *)this = &unk_27098C140;
  uint64_t result = google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor((uint64_t)this, (uint64_t)this + 48, -1);
  *(void *)uint64_t result = &unk_27098C140;
  *(void *)(result + 48) = &unk_27098C118;
  *(_DWORD *)(result + 56) = a2;
  *(_WORD *)(result + 60) = 0;
  *(_DWORD *)(result + 64) = 0;
  return result;
}

uint64_t google::protobuf::io::FileOutputStream::CopyingFileOutputStream::CopyingFileOutputStream(uint64_t this, int a2)
{
  *(void *)this = &unk_27098C118;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

uint64_t google::protobuf::io::FileOutputStream::Close(google::protobuf::io::FileOutputStream *this)
{
  unsigned int v2 = google::protobuf::io::CopyingOutputStreamAdaptor::Flush(this);
  return google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close((google::protobuf::io::FileOutputStream *)((char *)this + 48)) & v2;
}

BOOL google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close(google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this)
{
  if (*((unsigned char *)this + 13))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 194);
    unsigned int v2 = google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: !is_closed_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  *((unsigned char *)this + 13) = 1;
  if (v3) {
    *((_DWORD *)this + 4) = *__error();
  }
  return v3 == 0;
}

void sub_25C1F0CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::io::FileOutputStream::~FileOutputStream(google::protobuf::io::FileOutputStream *this)
{
  *(void *)this = &unk_27098C140;
  google::protobuf::io::CopyingOutputStreamAdaptor::Flush(this);
  google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream((google::protobuf::io::FileOutputStream *)((char *)this + 48));
  google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(this);
}

{
  uint64_t vars8;

  google::protobuf::io::FileOutputStream::~FileOutputStream(this);
  JUMPOUT(0x26117FDC0);
}

void google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream(google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this)
{
  *(void *)this = &unk_27098C118;
  if (*((unsigned char *)this + 12))
  {
    if (!google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close(this))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 188);
      unsigned int v2 = google::protobuf::internal::LogMessage::operator<<(v6, "close() failed: ");
      int v3 = strerror(*((_DWORD *)this + 4));
      int v4 = google::protobuf::internal::LogMessage::operator<<(v2, v3);
      google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v4->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
    }
  }
}

{
  uint64_t vars8;

  google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream(this);
  JUMPOUT(0x26117FDC0);
}

BOOL google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Write(google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this, char *a2, int a3)
{
  if (*((unsigned char *)this + 13))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 210);
    char v6 = google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: !is_closed_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v13, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
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

void sub_25C1F0F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void *google::protobuf::io::IstreamInputStream::IstreamInputStream(void *a1, uint64_t a2, int a3)
{
  *a1 = &unk_27098C230;
  a1[1] = &unk_27098C200;
  a1[2] = a2;
  google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor((uint64_t)(a1 + 3), (uint64_t)(a1 + 1), a3);
  return a1;
}

void *google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::CopyingIstreamInputStream(void *result, uint64_t a2)
{
  void *result = &unk_27098C200;
  result[1] = a2;
  return result;
}

uint64_t google::protobuf::io::IstreamInputStream::Next(google::protobuf::io::IstreamInputStream *this, const void **a2, int *a3)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::Next((google::protobuf::io::IstreamInputStream *)((char *)this + 24), a2, a3);
}

void google::protobuf::io::IstreamInputStream::BackUp(google::protobuf::io::IstreamInputStream *this, int a2)
{
}

BOOL google::protobuf::io::IstreamInputStream::Skip(google::protobuf::io::IstreamInputStream *this, int a2)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::Skip((google::protobuf::io::IstreamInputStream *)((char *)this + 24), a2);
}

uint64_t google::protobuf::io::IstreamInputStream::ByteCount(google::protobuf::io::IstreamInputStream *this)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::ByteCount((google::protobuf::io::IstreamInputStream *)((char *)this + 24));
}

void google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::~CopyingIstreamInputStream(google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *this)
{
}

uint64_t google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::Read(google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *this, void *a2)
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

void *google::protobuf::io::OstreamOutputStream::OstreamOutputStream(void *a1, uint64_t a2, int a3)
{
  *a1 = &unk_27098C320;
  a1[1] = &unk_27098C2F8;
  a1[2] = a2;
  google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor((uint64_t)(a1 + 3), (uint64_t)(a1 + 1), a3);
  return a1;
}

void *google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::CopyingOstreamOutputStream(void *result, uint64_t a2)
{
  void *result = &unk_27098C2F8;
  result[1] = a2;
  return result;
}

void google::protobuf::io::OstreamOutputStream::~OstreamOutputStream(google::protobuf::io::OstreamOutputStream *this)
{
  *(void *)this = &unk_27098C320;
  int v1 = (google::protobuf::io::OstreamOutputStream *)((char *)this + 24);
  google::protobuf::io::CopyingOutputStreamAdaptor::Flush((google::protobuf::io::OstreamOutputStream *)((char *)this + 24));
  google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(v1);
}

{
  uint64_t vars8;

  google::protobuf::io::OstreamOutputStream::~OstreamOutputStream(this);
  JUMPOUT(0x26117FDC0);
}

uint64_t google::protobuf::io::OstreamOutputStream::Next(google::protobuf::io::OstreamOutputStream *this, void **a2, int *a3)
{
  return google::protobuf::io::CopyingOutputStreamAdaptor::Next((google::protobuf::io::OstreamOutputStream *)((char *)this + 24), a2, a3);
}

void google::protobuf::io::OstreamOutputStream::BackUp(google::protobuf::io::OstreamOutputStream *this, int a2)
{
}

uint64_t google::protobuf::io::OstreamOutputStream::ByteCount(google::protobuf::io::OstreamOutputStream *this)
{
  return google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount((google::protobuf::io::OstreamOutputStream *)((char *)this + 24));
}

void google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::~CopyingOstreamOutputStream(google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *this)
{
}

BOOL google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::Write(google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *this, const void *a2)
{
  return *(_DWORD *)(*((void *)this + 1) + *(void *)(**((void **)this + 1) - 24) + 32) == 0;
}

uint64_t google::protobuf::io::ConcatenatingInputStream::ConcatenatingInputStream(uint64_t result, uint64_t a2, int a3)
{
  *(void *)uint64_t result = &unk_27098C3B0;
  *(void *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = a3;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t google::protobuf::io::ConcatenatingInputStream::Next(google::protobuf::io::ConcatenatingInputStream *this, const void **a2, int *a3)
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

void google::protobuf::io::ConcatenatingInputStream::BackUp(google::protobuf::io::ConcatenatingInputStream *this)
{
  if (*((int *)this + 4) < 1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v4, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 327);
    unsigned int v2 = google::protobuf::internal::LogMessage::operator<<(v4, "Can't BackUp() after failed Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v3, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v4[0].__r_.__value_.__l.__data_);
  }
  else
  {
    int v1 = *(void (**)(void))(***((void ***)this + 1) + 24);
    v1();
  }
}

void sub_25C1F1420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::ConcatenatingInputStream::Skip(google::protobuf::io::ConcatenatingInputStream *this, uint64_t a2)
{
  if (*((int *)this + 4) < 1) {
    return 0;
  }
  uint64_t v4 = *((void *)this + 1);
  do
  {
    uint64_t v5 = (*(uint64_t (**)(void))(**(void **)v4 + 40))();
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(***((void ***)this + 1) + 32))(**((void **)this + 1), a2);
    if (v6) {
      break;
    }
    uint64_t v7 = v5 + (int)a2;
    uint64_t v8 = (*(uint64_t (**)(void))(***((void ***)this + 1) + 40))(**((void **)this + 1));
    if (v7 <= v8)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 341);
      BOOL v9 = google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: (final_byte_count) < (target_byte_count): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v13, (const char **)&v9->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    }
    a2 = (v7 - v8);
    *((void *)this + 3) += v8;
    uint64_t v4 = *((void *)this + 1) + 8;
    *((void *)this + 1) = v4;
    int v10 = *((_DWORD *)this + 4);
    BOOL v11 = __OFSUB__(v10--, 1);
    *((_DWORD *)this + 4) = v10;
  }
  while (!((v10 < 0) ^ v11 | (v10 == 0)));
  return v6;
}

void sub_25C1F15A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::ConcatenatingInputStream::ByteCount(google::protobuf::io::ConcatenatingInputStream *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (*((_DWORD *)this + 4)) {
    v1 += (*(uint64_t (**)(void))(***((void ***)this + 1) + 40))(**((void **)this + 1));
  }
  return v1;
}

void google::protobuf::io::ConcatenatingInputStream::~ConcatenatingInputStream(google::protobuf::io::ConcatenatingInputStream *this)
{
}

uint64_t google::protobuf::io::ZeroCopyOutputStream::WriteAliasedRaw(google::protobuf::io::ZeroCopyOutputStream *this, const void *a2)
{
  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream.cc", 47);
  unsigned int v2 = google::protobuf::internal::LogMessage::operator<<(v5, "This ZeroCopyOutputStream doesn't support aliasing. Reaching here usually means a ZeroCopyOutputStream implementation bug.");
  google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  return 0;
}

void sub_25C1F1768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
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

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return MEMORY[0x270F98230](this, __s, __pos, __n);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98288](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98298](this);
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string::reference std::string::at(std::string *this, std::string::size_type __n)
{
  return (std::string::reference)MEMORY[0x270F98478](this, __n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A8](this, __str, __pos, __n);
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

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984F0](this, __pos, __n, __c);
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

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
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

{
  return MEMORY[0x270F987E0]();
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

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x270EDA848](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
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

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strpbrk(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB668](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x270EDB6A8](a1, a2);
  return result;
}

float strtof(const char *a1, char **a2)
{
  MEMORY[0x270EDB6B8](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}
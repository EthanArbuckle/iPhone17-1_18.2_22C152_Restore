@interface UCAppClipCodeURLEncoder
+ (id)encoderWithExtendedInterfaceWithVersion:(int64_t)a3;
- (UCAppClipCodeURLEncoder)initWithCodingVersion:(int64_t)a3;
- (id).cxx_construct;
- (id)_convertRawURLEncodingBitsToAppClipCodeData:(const void *)a3;
- (id)_errorFromCoderError:(const void *)a3;
- (id)_errorWithCoderErrorCode:(int64_t)a3 codingErrorSymbol:(id)a4 message:(id)a5;
- (id)_errorWithUnsupportedURLComponentType:(int64_t)a3;
- (id)encodeURL:(id)a3 error:(id *)a4;
- (id)encodeURLV0:(id)a3 error:(id *)a4;
- (id)encodeURLV1:(id)a3 error:(id *)a4;
- (id)resultForEncodingURL:(id)a3 error:(id *)a4;
- (int64_t)codingVersion;
- (shared_ptr<UC::SUE::UCSegmentedURLEncodingResult>)_encodeURL:(id)a3 error:(id *)a4;
- (void)clearCaches;
- (void)dealloc;
@end

@implementation UCAppClipCodeURLEncoder

+ (id)encoderWithExtendedInterfaceWithVersion:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCodingVersion:a3];
  return v3;
}

- (UCAppClipCodeURLEncoder)initWithCodingVersion:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UCAppClipCodeURLEncoder;
  v4 = [(UCAppClipCodeURLEncoder *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_codingVersion = a3;
    v4->_compressionVersion = +[UCAppClipCodeEnDecUtility compressionVersionFromPayloadVersion:a3];
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  value = self->_segmentedEncoder.__ptr_.__value_;
  p_segmentedEncoder = &self->_segmentedEncoder;
  v4 = value;
  p_segmentedEncoder->__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((int)p_segmentedEncoder, v4);
  }
  v6.receiver = self;
  v6.super_class = (Class)UCAppClipCodeURLEncoder;
  [(UCAppClipCodeURLEncoder *)&v6 dealloc];
}

- (int64_t)codingVersion
{
  return self->_codingVersion;
}

- (id)_convertRawURLEncodingBitsToAppClipCodeData:(const void *)a3
{
  if (self->_codingVersion)
  {
    int v3 = *((char *)a3 + 23);
    if (v3 >= 0) {
      v4 = (unsigned __int8 *)a3;
    }
    else {
      v4 = *(unsigned __int8 **)a3;
    }
    if (v3 >= 0) {
      uint64_t v5 = *((unsigned __int8 *)a3 + 23);
    }
    else {
      uint64_t v5 = *((void *)a3 + 1);
    }
    UC::appClipCodeVersion1Bytes(v4, v5, v12);
  }
  else
  {
    int v6 = *((char *)a3 + 23);
    if (v6 >= 0) {
      v7 = (unsigned __int8 *)a3;
    }
    else {
      v7 = *(unsigned __int8 **)a3;
    }
    if (v6 >= 0) {
      uint64_t v8 = *((unsigned __int8 *)a3 + 23);
    }
    else {
      uint64_t v8 = *((void *)a3 + 1);
    }
    UC::appClipCodeVersion0Bytes(v7, v8, v12);
  }
  v9 = (void *)v12[0];
  id v10 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:v12[0] length:v12[1] - v12[0]];
  if (v9) {
    operator delete(v9);
  }
  return v10;
}

- (id)encodeURLV0:(id)a3 error:(id *)a4
{
  id v11 = 0;
  [(UCAppClipCodeURLEncoder *)self _encodeURL:a3 error:&v11];
  id v6 = v11;
  v7 = v6;
  if (a4) {
    *a4 = v6;
  }
  if (v12) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    id v9 = [(UCAppClipCodeURLEncoder *)self _convertRawURLEncodingBitsToAppClipCodeData:UC::SUE::UCSegmentedURLEncodingResult::HostResult::getEncodingBits(v12)];
  }
  else {
    id v9 = 0;
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }

  return v9;
}

- (id)encodeURLV1:(id)a3 error:(id *)a4
{
  id v5 = a3;
  p_prefixedURLEncoder = &self->_prefixedURLEncoder;
  if (!self->_prefixedURLEncoder.__ptr_.__value_)
  {
    v7 = (UC::SUE::PrefixedURLEncoderImpl *)operator new(0x20uLL);
    UC::SUE::PrefixedURLEncoderImpl::PrefixedURLEncoderImpl(v7, self->_codingVersion);
    value = p_prefixedURLEncoder->__ptr_.__value_;
    p_prefixedURLEncoder->__ptr_.__value_ = (PrefixedURLEncoderImpl *)v7;
    if (value) {
      std::default_delete<UC::SUE::PrefixedURLEncoderImpl>::operator()[abi:ne180100](self + 16, value);
    }
  }
  id v9 = (NSURL *)+[UCAppClipCodeEnDecUtility prepareURL:v5 withCodingVersion:self->_codingVersion forCompressionVersion:self->_compressionVersion];

  id v10 = (UC::SUE::PrefixedURLEncoderImpl *)p_prefixedURLEncoder->__ptr_.__value_;
  UCURLComponentsFromNSURL(v9, v15);
  UC::SUE::PrefixedURLEncoderImpl::encodeURL(v10, (const UC::UCURLComponents *)v15, &v16);
  UC::UCURLComponents::~UCURLComponents((void **)&v15[0].__r_.__value_.__l.__data_);
  id v11 = [(UCAppClipCodeURLEncoder *)self _convertRawURLEncodingBitsToAppClipCodeData:UC::SUE::UCSegmentedURLEncodingResult::HostResult::getEncodingBits((UC::SUE::UCSegmentedURLEncodingResult::HostResult *)&v16)];
  id v12 = +[UCAppClipCodeEnDecUtility prepareData:v11 withCompressionVersion:self->_compressionVersion forCodingVersion:self->_codingVersion];

  v13 = v17;
  v17 = 0;
  if (v13) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&v17, v13);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }

  return v12;
}

- (id)encodeURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t compressionVersion = self->_compressionVersion;
  if (compressionVersion == 1)
  {
    id v8 = [(UCAppClipCodeURLEncoder *)self encodeURLV1:v6 error:a4];
    goto LABEL_5;
  }
  if (!compressionVersion)
  {
    id v8 = [(UCAppClipCodeURLEncoder *)self encodeURLV0:v6 error:a4];
LABEL_5:
    id v9 = v8;
    goto LABEL_7;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

- (id)resultForEncodingURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v22 = 0;
  [(UCAppClipCodeURLEncoder *)self _encodeURL:v6 error:&v22];
  id v7 = v22;
  id v8 = v7;
  if (a4) {
    *a4 = v7;
  }
  id v9 = 0;
  if (v23 && !v8)
  {
    id v10 = [(UCAppClipCodeURLEncoder *)self _convertRawURLEncodingBitsToAppClipCodeData:UC::SUE::UCSegmentedURLEncodingResult::HostResult::getEncodingBits(v23)];
    id v11 = NSString;
    uint64_t EncodingBits = UC::SUE::UCSegmentedURLEncodingResult::HostResult::getEncodingBits(v23);
    if (*(char *)(EncodingBits + 23) >= 0) {
      uint64_t v13 = EncodingBits;
    }
    else {
      uint64_t v13 = *(void *)EncodingBits;
    }
    id v14 = (id)objc_msgSend(v11, "stringWithFormat:", @"1%s", v13);
    id v9 = +[UCAppClipCodeURLEncodingResult resultWithRawEncodedBits:v14 appClipCodeBytes:v10];
    [(UCAppClipCodeURLEncodingResult *)v9 setUrl:v6];
    HostEncodingResult = (UC::SUE::UCSegmentedURLEncodingResult::HostResult *)UC::SUE::UCSegmentedURLEncodingResult::getHostEncodingResult(v23);
    uint64_t v16 = UC::SUE::UCSegmentedURLEncodingResult::HostResult::getEncodingBits(HostEncodingResult);
    if (*(char *)(v16 + 23) >= 0) {
      uint64_t v17 = *(unsigned __int8 *)(v16 + 23);
    }
    else {
      uint64_t v17 = *(void *)(v16 + 8);
    }
    [(UCAppClipCodeURLEncodingResult *)v9 setHostEncodedBitCount:v17];
    [(UCAppClipCodeURLEncodingResult *)v9 setHasPathOrQueryEncoding:UC::SUE::UCSegmentedURLEncodingResult::getHasPathOrQuery(v23)];
    v18 = (UC::SUE::UCSegmentedURLEncodingResult::HostResult *)UC::SUE::UCSegmentedURLEncodingResult::getHostEncodingResult(v23);
    int FormatType = UC::SUE::UCSegmentedURLEncodingResult::HostResult::getFormatType(v18);
    if (FormatType == 2) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = FormatType == 1;
    }
    [(UCAppClipCodeURLEncodingResult *)v9 setHostEncodingFormat:v20];
    [(UCAppClipCodeURLEncodingResult *)v9 setTemplateType:UC::SUE::UCSegmentedURLEncodingResult::getTemplateType(v23) != 0];
    [(UCAppClipCodeURLEncodingResult *)v9 setSubdomainType:UC::SUE::UCSegmentedURLEncodingResult::HostResult::getFormatType(v23) != 0];
    [(UCAppClipCodeURLEncodingResult *)v9 setNonTemplatePathAndQueryEncodeType:UC::SUE::UCSegmentedURLEncodingResult::getNonTemplatePathAndQueryEncodeType(v23) != 0];
  }
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }

  return v9;
}

- (id)_errorWithUnsupportedURLComponentType:(int64_t)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v7 = @"UCURLCoderUnsupportedURLComponentType";
  id v3 = (id)[NSNumber numberWithInteger:a3];
  v8[0] = v3;
  id v4 = (id)[NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  id v5 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.URLCompression.URLCoderErrorDomain" code:2 userInfo:v4];
  return v5;
}

- (id)_errorWithCoderErrorCode:(int64_t)a3 codingErrorSymbol:(id)a4 message:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (id)[MEMORY[0x263EFF9A0] dictionary];
  id v10 = v9;
  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if (v7) {
    [v10 setObject:v7 forKeyedSubscript:@"UCURLCoderErrorSymbol"];
  }
  id v11 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.URLCompression.URLCoderErrorDomain" code:a3 userInfo:v10];

  return v11;
}

- (id)_errorFromCoderError:(const void *)a3
{
  id v5 = (const void **)((char *)a3 + 8);
  int v6 = *((char *)a3 + 31);
  if (v6 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 31);
  }
  else {
    size_t v7 = *((void *)a3 + 2);
  }
  if (v7 == strlen("UCSegmentedURLCoderErrorDomain")
    && (v6 >= 0 ? (id v8 = v5) : (id v8 = *v5), !memcmp(v8, "UCSegmentedURLCoderErrorDomain", v7))
    || v7 == strlen("UCPrefixedURLCoderErrorDomain")
    && (v6 >= 0 ? (id v9 = v5) : (id v9 = *v5), !memcmp(v9, "UCPrefixedURLCoderErrorDomain", v7)))
  {
    uint64_t v13 = 0;
    switch(*((_DWORD *)a3 + 8))
    {
      case 1:
        id v10 = (void *)MEMORY[0x263F087E8];
        uint64_t v11 = 1;
        goto LABEL_15;
      case 2:
        v15 = self;
        uint64_t v16 = 0;
        goto LABEL_25;
      case 3:
        v15 = self;
        uint64_t v16 = 1;
        goto LABEL_25;
      case 4:
        v15 = self;
        uint64_t v16 = 2;
LABEL_25:
        id v12 = [(UCAppClipCodeURLEncoder *)v15 _errorWithUnsupportedURLComponentType:v16];
        goto LABEL_16;
      case 5:
        int v38 = *((char *)a3 + 63);
        if (v38 >= 0) {
          v39 = (char *)a3 + 40;
        }
        else {
          v39 = (char *)*((void *)a3 + 5);
        }
        if (v38 >= 0) {
          uint64_t v40 = *((unsigned __int8 *)a3 + 63);
        }
        else {
          uint64_t v40 = *((void *)a3 + 6);
        }
        id v20 = nsStringFromString((uint64_t)v39, v40);
        uint64_t v43 = *((void *)a3 + 8);
        v42 = (char *)a3 + 64;
        uint64_t v41 = v43;
        int v44 = v42[23];
        if (v44 >= 0) {
          uint64_t v45 = (uint64_t)v42;
        }
        else {
          uint64_t v45 = v41;
        }
        if (v44 >= 0) {
          uint64_t v46 = v42[23];
        }
        else {
          uint64_t v46 = *((void *)v42 + 1);
        }
        id v27 = nsStringFromString(v45, v46);
        id v28 = [(UCAppClipCodeURLEncoder *)self _errorWithCoderErrorCode:3 codingErrorSymbol:v20 message:v27];
        goto LABEL_65;
      case 6:
        int v17 = *((char *)a3 + 63);
        if (v17 >= 0) {
          v18 = (char *)a3 + 40;
        }
        else {
          v18 = (char *)*((void *)a3 + 5);
        }
        if (v17 >= 0) {
          uint64_t v19 = *((unsigned __int8 *)a3 + 63);
        }
        else {
          uint64_t v19 = *((void *)a3 + 6);
        }
        id v20 = nsStringFromString((uint64_t)v18, v19);
        uint64_t v23 = *((void *)a3 + 8);
        id v22 = (char *)a3 + 64;
        uint64_t v21 = v23;
        int v24 = v22[23];
        if (v24 >= 0) {
          uint64_t v25 = (uint64_t)v22;
        }
        else {
          uint64_t v25 = v21;
        }
        if (v24 >= 0) {
          uint64_t v26 = v22[23];
        }
        else {
          uint64_t v26 = *((void *)v22 + 1);
        }
        id v27 = nsStringFromString(v25, v26);
        id v28 = [(UCAppClipCodeURLEncoder *)self _errorWithCoderErrorCode:4 codingErrorSymbol:v20 message:v27];
        goto LABEL_65;
      case 8:
        int v29 = *((char *)a3 + 63);
        if (v29 >= 0) {
          v30 = (char *)a3 + 40;
        }
        else {
          v30 = (char *)*((void *)a3 + 5);
        }
        if (v29 >= 0) {
          uint64_t v31 = *((unsigned __int8 *)a3 + 63);
        }
        else {
          uint64_t v31 = *((void *)a3 + 6);
        }
        id v20 = nsStringFromString((uint64_t)v30, v31);
        uint64_t v34 = *((void *)a3 + 8);
        v33 = (char *)a3 + 64;
        uint64_t v32 = v34;
        int v35 = v33[23];
        if (v35 >= 0) {
          uint64_t v36 = (uint64_t)v33;
        }
        else {
          uint64_t v36 = v32;
        }
        if (v35 >= 0) {
          uint64_t v37 = v33[23];
        }
        else {
          uint64_t v37 = *((void *)v33 + 1);
        }
        id v27 = nsStringFromString(v36, v37);
        id v28 = [(UCAppClipCodeURLEncoder *)self _errorWithCoderErrorCode:1003 codingErrorSymbol:v20 message:v27];
LABEL_65:
        uint64_t v13 = v28;

        break;
      default:
        break;
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = -1;
LABEL_15:
    id v12 = (id)[v10 errorWithDomain:@"com.apple.URLCompression.URLCoderErrorDomain" code:v11 userInfo:0];
LABEL_16:
    uint64_t v13 = v12;
  }
  return v13;
}

- (shared_ptr<UC::SUE::UCSegmentedURLEncodingResult>)_encodeURL:(id)a3 error:(id *)a4
{
  size_t v7 = v4;
  id v8 = (NSURL *)a3;
  p_segmentedEncoder = &self->_segmentedEncoder;
  if (!self->_segmentedEncoder.__ptr_.__value_)
  {
    id v10 = +[UCResourceFilePath combinedPathAndQueryFilePathForSegmentedURLCoderVersion0];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
    id v11 = +[UCResourceFilePath segmentedPathAndQueryFilePathForSegmentedURLCoderVersion0];

    id v12 = v11;
    std::string::basic_string[abi:ne180100]<0>(&v25, (char *)[v12 UTF8String]);
    id v13 = +[UCResourceFilePath hostFilePathForSegmentedURLCoderVersion0];

    id v14 = v13;
    std::string::basic_string[abi:ne180100]<0>(v31, (char *)[v14 UTF8String]);
    std::allocate_shared[abi:ne180100]<UC::SUE::UCSegmentedURLCoderProvider,std::allocator<UC::SUE::UCSegmentedURLCoderProvider>,std::string &,std::string &,std::string &,void>((uint64_t)v31, (uint64_t)__p, (uint64_t)&v25, &v30);
    if (v32 < 0) {
      operator delete(v31[0]);
    }
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v25.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }

    v15 = operator new(0x18uLL);
    std::string::size_type v16 = (std::string::size_type)v15;
    *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v30;
    if (*((void *)&v30 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v30 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    UC::SUE::SegmentedURLEncoderImpl::SegmentedURLEncoderImpl(v15, &v25);
    __p[0].__r_.__value_.__r.__words[0] = v16;
    if (v25.__r_.__value_.__l.__size_)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v25.__r_.__value_.__l.__size_);
      std::string::size_type v16 = __p[0].__r_.__value_.__r.__words[0];
    }
    __p[0].__r_.__value_.__r.__words[0] = 0;
    value = p_segmentedEncoder->__ptr_.__value_;
    p_segmentedEncoder->__ptr_.__value_ = (SegmentedURLEncoderImpl *)v16;
    if (value)
    {
      std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100](self + 8, value);
      v18 = (void *)__p[0].__r_.__value_.__r.__words[0];
      __p[0].__r_.__value_.__r.__words[0] = 0;
      if (v18) {
        std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((int)__p, v18);
      }
    }
    if (*((void *)&v30 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v30 + 1));
    }
  }
  void *v7 = 0;
  v7[1] = 0;
  if (v8)
  {
    uint64_t v19 = (UC::SUE::SegmentedURLEncoderImpl *)p_segmentedEncoder->__ptr_.__value_;
    UCURLComponentsFromNSURL(v8, __p);
    UC::SUE::SegmentedURLEncoderImpl::encodeURL(v19, (const UC::UCURLComponents *)__p, &v25);
    id v20 = (char *)operator new(0x50uLL);
    *((void *)v20 + 1) = 0;
    *((void *)v20 + 2) = 0;
    *(void *)id v20 = &unk_26E242E18;
    *(_OWORD *)(v20 + 24) = *(_OWORD *)&v25.__r_.__value_.__l.__data_;
    *(_OWORD *)&v25.__r_.__value_.__l.__data_ = 0uLL;
    uint64_t v21 = v26;
    *((void *)v20 + 5) = *((void *)&v25.__r_.__value_.__l + 2);
    *((void *)v20 + 6) = v21;
    *((_DWORD *)v20 + 14) = v27;
    *((void *)v20 + 8) = v28;
    v20[72] = v29;
    void *v7 = v20 + 24;
    v7[1] = v20;
    v25.__r_.__value_.__r.__words[2] = 0;
    uint64_t v28 = 0;
    UC::UCURLComponents::~UCURLComponents((void **)&__p[0].__r_.__value_.__l.__data_);
  }
  else if (a4)
  {
    *a4 = [(UCAppClipCodeURLEncoder *)self _errorWithCoderErrorCode:1001 codingErrorSymbol:0 message:@"Cannot encode a null URL. Make sure a valid URL is provided"];
  }

  result.var1 = v23;
  result.var0 = v22;
  return result;
}

- (void)clearCaches
{
  value = (UC::SUE::UCSegmentedURLCoderProvider **)self->_segmentedEncoder.__ptr_.__value_;
  if (value) {
    UC::SUE::SegmentedURLEncoderImpl::clearCaches(value);
  }
}

- (void).cxx_destruct
{
  value = self->_prefixedURLEncoder.__ptr_.__value_;
  p_prefixedURLEncoder = &self->_prefixedURLEncoder;
  id v4 = value;
  p_prefixedURLEncoder->__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<UC::SUE::PrefixedURLEncoderImpl>::operator()[abi:ne180100]((int)p_prefixedURLEncoder, v4);
  }
  id v8 = self->_segmentedEncoder.__ptr_.__value_;
  p_segmentedEncoder = &self->_segmentedEncoder;
  int v6 = v8;
  p_segmentedEncoder->__ptr_.__value_ = 0;
  if (v8)
  {
    std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((int)p_segmentedEncoder, v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end
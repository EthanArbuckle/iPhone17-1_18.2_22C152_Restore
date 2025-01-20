@interface UCAppClipCodeURLDecoder
+ (id)decoderWithVersion:(int64_t)a3;
- (UCAppClipCodeURLDecoder)initWithCodingVersion:(int64_t)a3;
- (id).cxx_construct;
- (id)_decodeURLWithDataV0:(id)a3 error:(id *)a4;
- (id)_decodeURLWithDataV1:(id)a3 error:(id *)a4;
- (id)_errorWithCoderErrorCode:(int64_t)a3 message:(id)a4;
- (id)decodeURLWithData:(id)a3 error:(id *)a4;
- (int64_t)codingVersion;
- (unique_ptr<UC::UCBitVector,)_bitVectorFromData:(id)a3;
- (void)clearCaches;
- (void)dealloc;
@end

@implementation UCAppClipCodeURLDecoder

+ (id)decoderWithVersion:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCodingVersion:a3];
  return v3;
}

- (UCAppClipCodeURLDecoder)initWithCodingVersion:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UCAppClipCodeURLDecoder;
  v4 = [(UCAppClipCodeURLDecoder *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_codingVersion = a3;
    v4->_compressionVersion = +[UCAppClipCodeEnDecUtility compressionVersionFromPayloadVersion:a3];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[UCAppClipCodeURLDecoder initWithCodingVersion:]((uint64_t)&v5->_codingVersion, (uint64_t)&v5->_compressionVersion, v6, v7, v8, v9, v10, v11);
    }
    v12 = v5;
  }

  return v5;
}

- (void)dealloc
{
  value = self->_segmentedDecoder.__ptr_.__value_;
  p_segmentedDecoder = &self->_segmentedDecoder;
  v4 = value;
  p_segmentedDecoder->__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((int)p_segmentedDecoder, v4);
  }
  uint64_t v6 = self->_prefixedDecoder.__ptr_.__value_;
  self->_prefixedDecoder.__ptr_.__value_ = 0;
  if (v6) {
    std::default_delete<UC::SUE::PrefixedURLEncoderImpl>::operator()[abi:ne180100](self + 16, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)UCAppClipCodeURLDecoder;
  [(UCAppClipCodeURLDecoder *)&v7 dealloc];
}

- (unique_ptr<UC::UCBitVector,)_bitVectorFromData:(id)a3
{
  v4 = v3;
  id v5 = a3;
  uint64_t v6 = (const unsigned __int8 *)[v5 length];
  id v7 = v5;
  UC::bitVectorFromAppClipCodeEncodingData((UC *)[v7 bytes], v6, v4);

  return v8;
}

- (id)_errorWithCoderErrorCode:(int64_t)a3 message:(id)a4
{
  id v5 = a4;
  id v6 = (id)[MEMORY[0x263EFF9A0] dictionary];
  id v7 = v6;
  if (v5) {
    [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  id v8 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.URLCompression.URLCoderErrorDomain" code:a3 userInfo:v7];

  return v8;
}

- (id)decodeURLWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[UCAppClipCodeURLDecoder decodeURLWithData:error:]();
  }
  int64_t compressionVersion = self->_compressionVersion;
  if (compressionVersion == 1)
  {
    id v8 = [(UCAppClipCodeURLDecoder *)self _decodeURLWithDataV1:v6 error:a4];
    goto LABEL_7;
  }
  if (!compressionVersion)
  {
    id v8 = [(UCAppClipCodeURLDecoder *)self _decodeURLWithDataV0:v6 error:a4];
LABEL_7:
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  id v10 = [(UCAppClipCodeURLDecoder *)self _errorWithCoderErrorCode:1002 message:@"Decoding of the data failed. Unsupported code version."];
  uint64_t v9 = 0;
  *a4 = v10;
LABEL_9:

  return v9;
}

- (id)_decodeURLWithDataV0:(id)a3 error:(id *)a4
{
  id v6 = a3;
  p_segmentedDecoder = (UC::SUE::UCSegmentedURLCoderProvider ***)&self->_segmentedDecoder;
  if (!self->_segmentedDecoder.__ptr_.__value_)
  {
    id v8 = +[UCResourceFilePath combinedPathAndQueryFilePathForSegmentedURLCoderVersion0];
    std::string::basic_string[abi:ne180100]<0>(&v31, (char *)[v8 UTF8String]);
    id v9 = +[UCResourceFilePath segmentedPathAndQueryFilePathForSegmentedURLCoderVersion0];

    id v10 = v9;
    std::string::basic_string[abi:ne180100]<0>(v29, (char *)[v10 UTF8String]);
    id v11 = +[UCResourceFilePath hostFilePathForSegmentedURLCoderVersion0];

    id v12 = v11;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v12 UTF8String]);
    std::allocate_shared[abi:ne180100]<UC::SUE::UCSegmentedURLCoderProvider,std::allocator<UC::SUE::UCSegmentedURLCoderProvider>,std::string &,std::string &,std::string &,void>((uint64_t)__p, (uint64_t)&v31, (uint64_t)v29, &v25);
    if (v28 < 0) {
      operator delete(__p[0]);
    }
    if (v30 < 0) {
      operator delete(v29[0]);
    }
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__r_.__value_.__l.__data_);
    }

    v13 = operator new(0x18uLL);
    *(_OWORD *)v29 = v25;
    long long v25 = 0uLL;
    UC::SUE::SegmentedURLDecoderImpl::SegmentedURLDecoderImpl(v13, v29);
    v26 = v13;
    if (v29[1])
    {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v29[1]);
      v13 = v26;
    }
    v26 = 0;
    objc_super v14 = *p_segmentedDecoder;
    unique_ptr<UC::SUE::SegmentedURLDecoderImpl, std::default_delete<UC::SUE::SegmentedURLDecoderImpl>> *p_segmentedDecoder = (UC::SUE::UCSegmentedURLCoderProvider **)v13;
    if (v14)
    {
      std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100](self + 8, v14);
      v15 = v26;
      v26 = 0;
      if (v15) {
        std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((int)&v26, v15);
      }
    }
    if (*((void *)&v25 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v25 + 1));
    }
  }
  [(UCAppClipCodeURLDecoder *)self _bitVectorFromData:v6];
  v16 = (const UC::UCBitVector *)v29[0];
  v17 = (UC::UCBitStream *)operator new(0x30uLL);
  UC::UCBitStream::UCBitStream(v17, v16);
  __p[0] = v17;
  if (UC::readUntilBeginMarkerFound(v17, v18) && UC::UCBitStream::hasMore((UC::UCBitStream *)__p[0]))
  {
    UC::SUE::SegmentedURLDecoderImpl::decodeURL(*p_segmentedDecoder, (UC::UCBitStream *)__p[0], &v31);
    if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v19 = &v31;
    }
    else {
      v19 = (std::string *)v31.__r_.__value_.__r.__words[0];
    }
    id v20 = (id)[NSString stringWithUTF8String:v19];
    id v21 = (id)[NSURL URLWithString:v20];

    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    id v21 = 0;
    if (a4) {
      *a4 = [(UCAppClipCodeURLDecoder *)self _errorWithCoderErrorCode:1002 message:@"The encoding data is malformed"];
    }
  }
  v22 = (void **)__p[0];
  __p[0] = 0;
  if (v22) {
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)__p, v22);
  }
  v23 = (void **)v29[0];
  v29[0] = 0;
  if (v23) {
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)v29, v23);
  }

  return v21;
}

- (id)_decodeURLWithDataV1:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[UCAppClipCodeURLDecoder _decodeURLWithDataV1:error:].cold.4();
  }
  id v6 = +[UCAppClipCodeEnDecUtility perepareData:v5 withCodingVersion:self->_codingVersion forCompressionVersion:self->_compressionVersion];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[UCAppClipCodeURLDecoder _decodeURLWithDataV1:error:]();
  }
  [(UCAppClipCodeURLDecoder *)self _bitVectorFromData:v6];
  id v7 = (UC::UCBitStream *)operator new(0x30uLL);
  UC::UCBitStream::UCBitStream(v7, (const UC::UCBitVector *)v23);
  v22 = v7;
  p_prefixedDecoder = &self->_prefixedDecoder;
  value = self->_prefixedDecoder.__ptr_.__value_;
  if (!value)
  {
    id v10 = (UC::SUE::PrefixedURLDecoderImpl *)operator new(0x20uLL);
    UC::SUE::PrefixedURLDecoderImpl::PrefixedURLDecoderImpl(v10, self->_codingVersion);
    __p[0] = 0;
    id v11 = p_prefixedDecoder->__ptr_.__value_;
    p_prefixedDecoder->__ptr_.__value_ = (PrefixedURLDecoderImpl *)v10;
    if (v11)
    {
      std::default_delete<UC::SUE::PrefixedURLEncoderImpl>::operator()[abi:ne180100](self + 16, v11);
      id v12 = __p[0];
      __p[0] = 0;
      if (v12) {
        std::default_delete<UC::SUE::PrefixedURLEncoderImpl>::operator()[abi:ne180100]((int)__p, v12);
      }
    }
    value = p_prefixedDecoder->__ptr_.__value_;
    id v7 = (UC::UCBitStream *)v22;
  }
  UC::SUE::PrefixedURLDecoderImpl::decodeURL((UC::SUE::PrefixedURLDecoderImpl *)value, v7, (uint64_t)__p);
  if (v21 >= 0) {
    v13 = __p;
  }
  else {
    v13 = (void **)__p[0];
  }
  id v14 = (id)[NSString stringWithUTF8String:v13];
  id v15 = (id)[NSURL URLWithString:v14];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[UCAppClipCodeURLDecoder _decodeURLWithDataV1:error:]();
  }
  id v16 = +[UCAppClipCodeEnDecUtility prepareURL:v15 withCompressionVersion:self->_compressionVersion forCodingVersion:self->_codingVersion];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[UCAppClipCodeURLDecoder _decodeURLWithDataV1:error:]();
  }

  if (v21 < 0) {
    operator delete(__p[0]);
  }
  v17 = (void **)v22;
  v22 = 0;
  if (v17) {
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&v22, v17);
  }
  v18 = (void **)v23;
  v23 = 0;
  if (v18) {
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&v23, v18);
  }

  return v16;
}

- (int64_t)codingVersion
{
  return self->_codingVersion;
}

- (void)clearCaches
{
  value = (UC::SUE::UCSegmentedURLCoderProvider **)self->_segmentedDecoder.__ptr_.__value_;
  if (value) {
    UC::SUE::SegmentedURLEncoderImpl::clearCaches(value);
  }
}

- (void).cxx_destruct
{
  value = self->_prefixedDecoder.__ptr_.__value_;
  p_prefixedDecoder = &self->_prefixedDecoder;
  v4 = value;
  p_prefixedDecoder->__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<UC::SUE::PrefixedURLEncoderImpl>::operator()[abi:ne180100]((int)p_prefixedDecoder, v4);
  }
  id v8 = self->_segmentedDecoder.__ptr_.__value_;
  p_segmentedDecoder = &self->_segmentedDecoder;
  id v6 = v8;
  p_segmentedDecoder->__ptr_.__value_ = 0;
  if (v8)
  {
    std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100]((int)p_segmentedDecoder, v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)initWithCodingVersion:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decodeURLWithData:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22E872000, &_os_log_internal, v0, "-decodeURLWithData: encodingData: %@ compressionVersion: %lu", v1, v2, v3, v4, v5);
}

- (void)_decodeURLWithDataV1:error:.cold.1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_22E872000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "-_decodeURLWithDataV1: Returning prepared URL: %@", v0, 0xCu);
}

- (void)_decodeURLWithDataV1:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22E872000, &_os_log_internal, v0, "-_decodeURLWithDataV1: Decoded urlString: %@, decodedURL: %@", v1, v2, v3, v4, v5);
}

- (void)_decodeURLWithDataV1:error:.cold.3()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_22E872000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "-_decodeURLWithDataV1: finished preparing data. Decoding data: %@", v0, 0xCu);
}

- (void)_decodeURLWithDataV1:error:.cold.4()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = v1;
  _os_log_debug_impl(&dword_22E872000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "-_decodeURLWithDataV1: preparingData: %@ with codingVersion: %lu compressionVersion: %lu", v2, 0x20u);
}

@end
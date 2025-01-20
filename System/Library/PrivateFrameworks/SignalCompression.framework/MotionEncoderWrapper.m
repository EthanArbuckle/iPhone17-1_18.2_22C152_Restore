@interface MotionEncoderWrapper
- (MotionEncoderWrapper)initWithAttributeCount:(unsigned int)a3 componentCount:(unsigned int)a4 quantization:(unsigned int)a5;
- (id).cxx_construct;
- (id)encodeFrameInternal:(const int *)a3 type:(unint64_t *)a4 encodeError:(unint64_t *)a5;
- (id)getEncoderParams;
- (id)motionEncoderWrapperLogSharedInstance;
- (void)dealloc;
@end

@implementation MotionEncoderWrapper

- (id)motionEncoderWrapperLogSharedInstance
{
  if (-[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance]::onceToken != -1) {
    dispatch_once(&-[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance]::onceToken, &__block_literal_global);
  }
  v2 = (void *)-[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance]::sharedInstance;
  return v2;
}

void __61__MotionEncoderWrapper_motionEncoderWrapperLogSharedInstance__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.signalcompression", "motionEncoderWrapper");
  v1 = (void *)-[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance]::sharedInstance;
  -[MotionEncoderWrapper motionEncoderWrapperLogSharedInstance]::sharedInstance = (uint64_t)v0;
}

- (MotionEncoderWrapper)initWithAttributeCount:(unsigned int)a3 componentCount:(unsigned int)a4 quantization:(unsigned int)a5
{
  unsigned __int8 v5 = a5;
  uint64_t v44 = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)MotionEncoderWrapper;
  v8 = [(MotionEncoderWrapper *)&v37 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_36;
  }
  v8->_componentsPerAttribute = a4;
  v8->_attributeCount = a3;
  v8->_quantization = v5;
  v10 = (gcl::motion::Encoder *)operator new(8uLL);
  gcl::motion::Encoder::Encoder(v10);
  v9->encoder = v10;
  *(void *)&v9->_intraFramePeriod = 2;
  std::vector<unsigned char>::vector(&__p, 8uLL);
  int v11 = gcl::motion::Encoder::encodeSequenceParameterSet((gcl::motion::EncoderImpl **)v9->encoder, v9->_attributeCount, v9->_componentsPerAttribute, (unsigned __int8 *)__p, v35 - (unsigned char *)__p, &v9->encParametersLength);
  if (v11)
  {
    v12 = [(MotionEncoderWrapper *)v9 motionEncoderWrapperLogSharedInstance];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MotionEncoderWrapper initWithAttributeCount:componentCount:quantization:](v12);
    }

    encoder = (gcl::motion::EncoderImpl **)v9->encoder;
    if (encoder)
    {
      gcl::motion::Encoder::~Encoder(encoder);
      operator delete(v14);
    }
  }
  else
  {
    v15 = v35;
    if ((unint64_t)v35 >= v36)
    {
      unint64_t v17 = (unint64_t)__p;
      uint64_t v18 = v35 - (unsigned char *)__p;
      uint64_t v19 = v35 - (unsigned char *)__p + 1;
      if (v19 < 0) {
        std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v20 = v36 - (void)__p;
      if (2 * (v36 - (unint64_t)__p) > v19) {
        uint64_t v19 = 2 * v20;
      }
      if (v20 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v21 = v19;
      }
      if (v21) {
        v22 = operator new(v21);
      }
      else {
        v22 = 0;
      }
      v23 = (char *)v22 + v21;
      *((unsigned char *)v22 + v18) = v5;
      uint64_t v16 = (uint64_t)v22 + v18 + 1;
      if (v15 == (char *)v17)
      {
        v22 = (char *)v22 + v18;
      }
      else
      {
        v24 = &v15[~v17];
        do
        {
          char v25 = *--v15;
          (v24--)[(void)v22] = v25;
        }
        while (v15 != (char *)v17);
        v15 = (char *)__p;
      }
      __p = v22;
      v35 = (char *)v16;
      unint64_t v36 = (unint64_t)v23;
      if (v15) {
        operator delete(v15);
      }
    }
    else
    {
      char *v35 = v5;
      uint64_t v16 = (uint64_t)(v15 + 1);
    }
    v35 = (char *)v16;
    ++v9->encParametersLength;
    v26 = (NSData *)(id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", __p);
    encoderParamsData = v9->_encoderParamsData;
    v9->_encoderParamsData = v26;

    unint64_t v28 = gcl::motion::Encoder::estimateMaxEncodedFrameSize((gcl::motion::Encoder *)v9->_attributeCount, v9->_componentsPerAttribute);
    begin = v9->_bitstream.__begin_;
    v9->estimatedEncodedFrameSizeInBytes = v28;
    unint64_t v30 = v9->_bitstream.__end_ - begin;
    if (v28 <= v30)
    {
      if (v28 < v30) {
        v9->_bitstream.__end_ = &begin[v28];
      }
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&v9->_bitstream, v28 - v30);
    }
    v31 = [(MotionEncoderWrapper *)v9 motionEncoderWrapperLogSharedInstance];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      int v39 = 0;
      __int16 v40 = 1024;
      int v41 = 3;
      __int16 v42 = 1024;
      int v43 = 0;
      _os_log_impl(&dword_25C51D000, v31, OS_LOG_TYPE_DEFAULT, "Local Encoder version is %d %d %d", buf, 0x14u);
    }
  }
  if (__p)
  {
    v35 = (char *)__p;
    operator delete(__p);
  }
  if (v11) {
    v32 = 0;
  }
  else {
LABEL_36:
  }
    v32 = v9;

  return v32;
}

- (void)dealloc
{
  encoder = (gcl::motion::EncoderImpl **)self->encoder;
  if (encoder)
  {
    gcl::motion::Encoder::~Encoder(encoder);
    operator delete(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)MotionEncoderWrapper;
  [(MotionEncoderWrapper *)&v5 dealloc];
}

- (id)getEncoderParams
{
  return self->_encoderParamsData;
}

- (id)encodeFrameInternal:(const int *)a3 type:(unint64_t *)a4 encodeError:(unint64_t *)a5
{
  if (a3)
  {
    unint64_t v8 = self->_componentsPerAttribute * (uint64_t)self->_attributeCount;
    size_t v21 = 0;
    uint64_t v22 = 0;
    __p = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<int const*,int const*>(&__p, a3, (uint64_t)&a3[v8], v8);
    if (*a4 == 1)
    {
      LODWORD(v10) = 1;
    }
    else if (*a4 == 2)
    {
      int frameCount = self->_frameCount;
      BOOL v10 = frameCount % self->_intraFramePeriod != 0;
      *a4 = v10;
      self->_int frameCount = frameCount + 1;
    }
    else
    {
      LODWORD(v10) = 0;
    }
    int v17 = 0;
    __int16 v18 = 257;
    unsigned __int8 quantization = self->_quantization;
    unint64_t v16 = 0;
    int v13 = gcl::motion::Encoder::encodeFrame((uint64_t *)self->encoder, (int *)__p, v10, (unint64_t *)self->_bitstream.__begin_, self->_bitstream.__end_ - self->_bitstream.__begin_, &v16, &v17);
    if (v13)
    {
      *a5 = 2;
      v14 = [(MotionEncoderWrapper *)self motionEncoderWrapperLogSharedInstance];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MotionEncoderWrapper encodeFrameInternal:type:encodeError:](v13, v14);
      }

      id v12 = 0;
    }
    else
    {
      id v12 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:self->_bitstream.__begin_ length:v16];
    }
    if (__p)
    {
      size_t v21 = __p;
      operator delete(__p);
    }
  }
  else
  {
    *a5 = 1;
    int v11 = [(MotionEncoderWrapper *)self motionEncoderWrapperLogSharedInstance];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MotionEncoderWrapper encodeFrameInternal:type:encodeError:](v11);
    }

    id v12 = 0;
  }
  return v12;
}

- (void).cxx_destruct
{
  begin = self->_bitstream.__begin_;
  if (begin)
  {
    self->_bitstream.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_encoderParamsData, 0);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void)initWithAttributeCount:(os_log_t)log componentCount:quantization:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25C51D000, log, OS_LOG_TYPE_ERROR, "Could not serialize encoder params", v1, 2u);
}

- (void)encodeFrameInternal:(os_log_t)log type:encodeError:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25C51D000, log, OS_LOG_TYPE_ERROR, "Error Input buffer is null", v1, 2u);
}

- (void)encodeFrameInternal:(int)a1 type:(NSObject *)a2 encodeError:.cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_25C51D000, a2, OS_LOG_TYPE_ERROR, "Error cannot compress inputs %d", (uint8_t *)v2, 8u);
}

@end
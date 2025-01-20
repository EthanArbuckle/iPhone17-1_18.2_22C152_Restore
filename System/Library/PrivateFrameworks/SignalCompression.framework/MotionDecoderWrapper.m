@interface MotionDecoderWrapper
- (MotionDecoderWrapper)initWithEncoderSeqParams:(id)a3;
- (char)getPointerToDataBuffer:(id)a3;
- (id).cxx_construct;
- (id)motionDecoderWrapperLogSharedInstance;
- (int)decodeFrameInternal:(id)a3 decodedFrame:(int *)a4 decodeError:(unint64_t *)a5;
- (int)getAttributeCount;
- (int)getComponentPerAttributeCount;
- (void)dealloc;
@end

@implementation MotionDecoderWrapper

- (id)motionDecoderWrapperLogSharedInstance
{
  if (-[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance]::onceToken != -1) {
    dispatch_once(&-[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance]::onceToken, &__block_literal_global_0);
  }
  v2 = (void *)-[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance]::sharedInstance;
  return v2;
}

void __61__MotionDecoderWrapper_motionDecoderWrapperLogSharedInstance__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.signalcompression", "motionDecoderWrapper");
  v1 = (void *)-[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance]::sharedInstance;
  -[MotionDecoderWrapper motionDecoderWrapperLogSharedInstance]::sharedInstance = (uint64_t)v0;
}

- (char)getPointerToDataBuffer:(id)a3
{
  id v3 = a3;
  return (char *)[v3 bytes];
}

- (MotionDecoderWrapper)initWithEncoderSeqParams:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MotionDecoderWrapper;
  v5 = [(MotionDecoderWrapper *)&v20 init];
  if (v5)
  {
    v6 = (gcl::motion::Decoder *)operator new(8uLL);
    gcl::motion::Decoder::Decoder(v6);
    *((void *)v5 + 1) = v6;
    v7 = (const void *)[v5 getPointerToDataBuffer:v4];
    size_t v8 = [v4 length];
    __p = 0;
    v18 = 0;
    uint64_t v19 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v7, (uint64_t)v7 + v8, v8);
    unint64_t v16 = 0;
    gcl::motion::Decoder::decodeSequenceParameterSet(*((gcl::motion::DecoderImpl ***)v5 + 1), (const unsigned __int8 *)__p, objc_msgSend(v4, "length", 0), &v16, (AttributeInfo *)(v5 + 32));
    uint64_t v9 = *((void *)v5 + 5);
    *(void *)&long long v10 = (int)v9;
    *((void *)&v10 + 1) = SHIDWORD(v9);
    *((_OWORD *)v5 + 1) = v10;
    v11 = (id)[v5 motionDecoderWrapperLogSharedInstance];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = v5[36];
      int v13 = v5[37];
      int v14 = *((unsigned __int16 *)v5 + 19);
      *(_DWORD *)buf = 67110400;
      int v22 = v12;
      __int16 v23 = 1024;
      int v24 = v13;
      __int16 v25 = 1024;
      int v26 = v14;
      __int16 v27 = 1024;
      int v28 = 0;
      __int16 v29 = 1024;
      int v30 = 3;
      __int16 v31 = 1024;
      int v32 = 0;
      _os_log_impl(&dword_25C51D000, v11, OS_LOG_TYPE_DEFAULT, "Remote Encoder version is %d %d %d, Local Encoder version is %d %d %d", buf, 0x26u);
    }

    if (__p)
    {
      v18 = __p;
      operator delete(__p);
    }
  }

  return (MotionDecoderWrapper *)v5;
}

- (void)dealloc
{
  decoder = (gcl::motion::DecoderImpl **)self->decoder;
  if (decoder)
  {
    gcl::motion::Decoder::~Decoder(decoder);
    operator delete(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)MotionDecoderWrapper;
  [(MotionDecoderWrapper *)&v5 dealloc];
}

- (int)getComponentPerAttributeCount
{
  return self->_componentsPerAttribute;
}

- (int)getAttributeCount
{
  return self->_attributeCount;
}

- (int)decodeFrameInternal:(id)a3 decodedFrame:(int *)a4 decodeError:(unint64_t *)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  size_t v9 = [v8 length];
  unint64_t v27 = 0;
  if (!v9)
  {
    int v14 = 0;
    *a5 = 3;
    goto LABEL_12;
  }
  long long v10 = [(MotionDecoderWrapper *)self getPointerToDataBuffer:v8];
  __p = 0;
  __int16 v25 = 0;
  uint64_t v26 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v10, (uint64_t)&v10[v9], v9);
  std::vector<int>::vector(&v23, self->_componentsPerAttribute * self->_attributeCount);
  int v11 = gcl::motion::Decoder::decodeFrame((gcl::motion::DecoderImpl **)self->decoder, (const unsigned __int8 *)__p, v9, &v27, v23.__begin_);
  int v12 = v11;
  if (v11)
  {
    *a5 = 4;
    if (v11 == 7)
    {
      *a5 = 5;
    }
    else if (v11 == 11)
    {
      *a5 = 6;
      int v22 = [(MotionDecoderWrapper *)self motionDecoderWrapperLogSharedInstance];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[MotionDecoderWrapper decodeFrameInternal:decodedFrame:decodeError:]((uint64_t)self, v22);
      }
    }
    int v13 = [(MotionDecoderWrapper *)self motionDecoderWrapperLogSharedInstance];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int CurrentFrameNumber = gcl::motion::Decoder::getCurrentFrameNumber((gcl::motion::Decoder *)self->decoder);
      int v18 = gcl::motion::Decoder::getlastDecodedFrameNumber((gcl::motion::Decoder *)self->decoder);
      int CurrentFrameQP = gcl::motion::Decoder::getCurrentFrameQP((gcl::motion::Decoder *)self->decoder);
      int CurrentFramePayloadLength = gcl::motion::Decoder::getCurrentFramePayloadLength((gcl::motion::Decoder *)self->decoder);
      int CurrentFrameFlags = gcl::motion::Decoder::getCurrentFrameFlags((gcl::motion::Decoder *)self->decoder);
      *(_DWORD *)buf = 67110400;
      int v29 = v12;
      __int16 v30 = 1024;
      int v31 = CurrentFrameNumber;
      __int16 v32 = 1024;
      int v33 = v18;
      __int16 v34 = 1024;
      int v35 = CurrentFrameQP;
      __int16 v36 = 1024;
      int v37 = CurrentFramePayloadLength;
      __int16 v38 = 1024;
      int v39 = CurrentFrameFlags;
      _os_log_error_impl(&dword_25C51D000, v13, OS_LOG_TYPE_ERROR, "Failed to decode with error %d c:%d p:%d q:%d l:%d f:%d", buf, 0x26u);
    }

    int v14 = 0;
    begin = v23.__begin_;
    if (!v23.__begin_) {
      goto LABEL_9;
    }
  }
  else
  {
    begin = v23.__begin_;
    if (v23.__end_ != v23.__begin_) {
      memmove(a4, v23.__begin_, (char *)v23.__end_ - (char *)v23.__begin_);
    }
    int v14 = v27;
    if (!begin) {
      goto LABEL_9;
    }
  }
  v23.__end_ = begin;
  operator delete(begin);
LABEL_9:
  if (__p)
  {
    __int16 v25 = __p;
    operator delete(__p);
  }
LABEL_12:

  return v14;
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((unsigned char *)self + 48) = 0;
  return self;
}

- (void)decodeFrameInternal:(uint64_t)a1 decodedFrame:(NSObject *)a2 decodeError:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 36);
  int v3 = *(unsigned __int8 *)(a1 + 37);
  int v4 = *(unsigned __int16 *)(a1 + 38);
  v5[0] = 67110400;
  v5[1] = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 1024;
  int v11 = 0;
  __int16 v12 = 1024;
  int v13 = 3;
  __int16 v14 = 1024;
  int v15 = 0;
  _os_log_error_impl(&dword_25C51D000, a2, OS_LOG_TYPE_ERROR, "Remote Encoder version is %d %d %d, Local Encoder version is %d %d %d", (uint8_t *)v5, 0x26u);
}

@end
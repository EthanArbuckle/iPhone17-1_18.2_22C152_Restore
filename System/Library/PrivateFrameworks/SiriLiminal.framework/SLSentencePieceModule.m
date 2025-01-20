@interface SLSentencePieceModule
- (SLSentencePieceModule)initWithConfigFile:(id)a3;
- (SLSentencePieceModule)initWithConfigFile:(id)a3 isModelMmap:(BOOL)a4;
- (id).cxx_construct;
- (id)encodeUtterance:(id)a3;
- (int64_t)setSPMEncoderOptions:(id)a3;
- (void)dealloc;
@end

@implementation SLSentencePieceModule

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_processor.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (int64_t)setSPMEncoderOptions:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v4 UTF8String]);
  (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_processor.__ptr_ + 96))(&v7);
  int v5 = sentencepiece::util::Status::code((sentencepiece::util::Status *)&v7);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v7);
  if (v9 < 0) {
    operator delete(__p);
  }

  return v5;
}

- (id)encodeUtterance:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v4 UTF8String]);
  v11 = 0;
  v12 = 0;
  uint64_t v13 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_processor.__ptr_ + 144))(&v10);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v10);
  int v5 = [MEMORY[0x263EFF980] array];
  v6 = v11;
  uint64_t v7 = v12;
  if (v11 != v12)
  {
    do
    {
      v8 = [NSNumber numberWithInt:*v6];
      [v5 addObject:v8];

      ++v6;
    }
    while (v6 != v7);
    v6 = v11;
  }
  if (v6)
  {
    v12 = v6;
    operator delete(v6);
  }
  if (v15 < 0) {
    operator delete(__p);
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_processor.__ptr_)
  {
    cntrl = self->_processor.__cntrl_;
    self->_processor.__ptr_ = 0;
    self->_processor.__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    }
  }
  id v4 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[SLSentencePieceModule dealloc]";
    _os_log_impl(&dword_21EFF4000, v4, OS_LOG_TYPE_DEFAULT, "%s dealloc", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)SLSentencePieceModule;
  [(SLSentencePieceModule *)&v5 dealloc];
}

- (SLSentencePieceModule)initWithConfigFile:(id)a3 isModelMmap:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SLSentencePieceModule;
  uint64_t v7 = [(SLSentencePieceModule *)&v23 init];
  if (v7)
  {
    uint64_t v8 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[SLSentencePieceModule initWithConfigFile:isModelMmap:]";
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_21EFF4000, v8, OS_LOG_TYPE_DEFAULT, "%s path: %@", buf, 0x16u);
    }
    char v9 = operator new(0x90uLL);
    v9[1] = 0;
    v9[2] = 0;
    *char v9 = &unk_26D09E320;
    sentencepiece::SentencePieceProcessor::SentencePieceProcessor((sentencepiece::SentencePieceProcessor *)(v9 + 3));
    *(void *)&long long v11 = v10;
    *((void *)&v11 + 1) = v9;
    v12 = (std::__shared_weak_count *)*((void *)v7 + 2);
    *(_OWORD *)(v7 + 8) = v11;
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    id v13 = v6;
    std::string::basic_string[abi:ne180100]<0>(&v21, (char *)[v13 UTF8String]);
    sentencepiece::util::Status::Status(&v20);
    if (v4) {
      (*(void (**)(uint8_t *__return_ptr))(**((void **)v7 + 1) + 64))(buf);
    }
    else {
      (*(void (**)(uint8_t *__return_ptr))(**((void **)v7 + 1) + 16))(buf);
    }
    sentencepiece::util::Status::operator=(&v20, buf);
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)buf);
    if (v20)
    {
      v14 = (id)SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        sentencepiece::util::Status::ToString((sentencepiece::util::Status *)&v20, &__p);
        char v15 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? &__p
            : (std::string *)__p.__r_.__value_.__r.__words[0];
        *(_DWORD *)buf = 136315906;
        v25 = "-[SLSentencePieceModule initWithConfigFile:isModelMmap:]";
        __int16 v26 = 2112;
        id v27 = v13;
        __int16 v28 = 1024;
        BOOL v29 = v4;
        __int16 v30 = 2080;
        v31 = v15;
        _os_log_impl(&dword_21EFF4000, v14, OS_LOG_TYPE_DEFAULT, "%s Cannot create SPM model at path %@ with mmap: %d with error %s", buf, 0x26u);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }

      sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v20);
      if (v22 < 0) {
        operator delete(v21);
      }
      v16 = 0;
      goto LABEL_24;
    }
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v20);
    if (v22 < 0) {
      operator delete(v21);
    }
  }
  v17 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SLSentencePieceModule initWithConfigFile:isModelMmap:]";
    _os_log_impl(&dword_21EFF4000, v17, OS_LOG_TYPE_DEFAULT, "%s SPM model created", buf, 0xCu);
  }
  v16 = v7;
LABEL_24:

  return v16;
}

- (SLSentencePieceModule)initWithConfigFile:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    char v9 = "-[SLSentencePieceModule initWithConfigFile:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_21EFF4000, v5, OS_LOG_TYPE_DEFAULT, "%s path: %@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = [(SLSentencePieceModule *)self initWithConfigFile:v4 isModelMmap:0];

  return v6;
}

@end
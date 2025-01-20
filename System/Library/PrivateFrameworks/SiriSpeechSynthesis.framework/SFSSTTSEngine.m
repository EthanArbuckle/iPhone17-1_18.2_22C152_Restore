@interface SFSSTTSEngine
- (AudioStreamBasicDescription)asbd;
- (AudioStreamBasicDescription)constructPcmAsbdWithSampleRate:(SEL)a3;
- (NSString)voicePath;
- (SFSSTTSEngine)initWithVoicePath:(id)a3 resourcePath:(id)a4;
- (SFSSTTSEngineCallbackResult)callbackResult;
- (id).cxx_construct;
- (id)loadResourceAtPath:(id)a3 mimeType:(id)a4;
- (id)synthesizeText:(id)a3 loggable:(BOOL)a4 synthesisBegin:(id)a5 synthesisChunk:(id)a6 synthesisEnd:(id)a7;
- (void)dealloc;
- (void)preheat;
- (void)setCallbackResult:(id)a3;
- (void)setVoicePath:(id)a3;
- (void)stopSynthesis;
@end

@implementation SFSSTTSEngine

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackResult, 0);
  objc_storeStrong((id *)&self->_voicePath, 0);
  std::unique_ptr<TTSSynthesizer>::reset[abi:ne180100](&self->_synthesizer.__ptr_.__value_, 0);
}

- (void)setCallbackResult:(id)a3
{
}

- (SFSSTTSEngineCallbackResult)callbackResult
{
  return self->_callbackResult;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[1].mBytesPerFrame;
  return self;
}

- (void)setVoicePath:(id)a3
{
}

- (NSString)voicePath
{
  return self->_voicePath;
}

- (void)preheat
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = mach_absolute_time();
  TTSSynthesizer::preheat(self->_synthesizer.__ptr_.__value_);
  uint64_t v4 = mach_absolute_time();
  v5 = SFSSGetLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    +[SFSpeechSynthesisUtils absoluteTimeToSecond:v4 - v3];
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_22B575000, v5, OS_LOG_TYPE_INFO, "Engine preheating latency: %.3f", (uint8_t *)&v7, 0xCu);
  }
}

- (void)stopSynthesis
{
  uint64_t v3 = SFSSGetLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "Stop synthesis.", buf, 2u);
  }

  TTSSynthesizer::stop_synthesis(self->_synthesizer.__ptr_.__value_);
  uint64_t v4 = SFSSGetLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22B575000, v4, OS_LOG_TYPE_INFO, "Synthesis stopped.", v5, 2u);
  }
}

- (id)synthesizeText:(id)a3 loggable:(BOOL)a4 synthesisBegin:(id)a5 synthesisChunk:(id)a6 synthesisEnd:(id)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [[SFSSTTSEngineCallbackResult alloc] initWithBeginCallback:v12 chunkCallback:v13 endCallback:v14];
  callbackResult = self->_callbackResult;
  self->_callbackResult = v15;

  [(SFSSTTSEngine *)self asbd];
  v26[0] = v28;
  v26[1] = v29;
  uint64_t v27 = v30;
  [(SFSSTTSEngineCallbackResult *)self->_callbackResult setAsbd:v26];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __84__SFSSTTSEngine_synthesizeText_loggable_synthesisBegin_synthesisChunk_synthesisEnd___block_invoke;
  v25[3] = &unk_26489EB00;
  v25[4] = self;
  v36 = 0;
  v35[0] = &unk_26DEBF918;
  v35[1] = MEMORY[0x230F4BDC0](v25);
  v36 = v35;
  id v17 = v11;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v17 UTF8String]);
  [(SFSSTTSEngineCallbackResult *)self->_callbackResult pcmDataBuffer];
  [(SFSSTTSEngineCallbackResult *)self->_callbackResult marker];
  uint64_t v18 = (uint64_t)v36;
  if (!v36) {
    goto LABEL_4;
  }
  if (v36 != v35)
  {
    uint64_t v18 = (*(uint64_t (**)(void))(*v36 + 16))();
LABEL_4:
    v34 = (void *)v18;
    goto LABEL_6;
  }
  v34 = v33;
  (*(void (**)(void *, void *))(v35[0] + 24))(v35, v33);
LABEL_6:
  v19 = (void *)TTSSynthesizer::synthesize_text_with_markers_async();
  std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100](v33);
  if (v24 < 0)
  {
    operator delete(__p);
    if (!v19) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v19)
  {
LABEL_10:
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08338];
    v32 = @"TTSSynthesizer::synthesize_text";
    v21 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v19 = [v20 errorWithDomain:@"SFSpeechSynthesisDeviceErrorDomain" code:v19 userInfo:v21];
  }
LABEL_11:
  std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100](v35);

  return v19;
}

uint64_t __84__SFSSTTSEngine_synthesizeText_loggable_synthesisBegin_synthesisChunk_synthesisEnd___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) callbackResult];
  uint64_t v4 = [v3 synthesisCallback:a2];

  return v4;
}

- (id)loadResourceAtPath:(id)a3 mimeType:(id)a4
{
  v18[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  std::string::basic_string[abi:ne180100]<0>(&v15, (char *)[v7 UTF8String]);
  id v8 = v6;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
  resource = (void *)TTSSynthesizer::load_resource();
  if (v14 < 0) {
    operator delete(__p);
  }
  if (v16 < 0)
  {
    operator delete(v15);
    if (!resource) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (resource)
  {
LABEL_7:
    v10 = (void *)MEMORY[0x263F087E8];
    v17[0] = @"path";
    v17[1] = @"mimeType";
    v18[0] = v7;
    v18[1] = v8;
    v17[2] = *MEMORY[0x263F08338];
    v18[2] = @"TTSSynthesizer::load_resource";
    id v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    resource = [v10 errorWithDomain:@"SFSpeechSynthesisDeviceErrorDomain" code:resource userInfo:v11];
  }
LABEL_8:

  return resource;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SFSSTTSEngine;
  [(SFSSTTSEngine *)&v2 dealloc];
}

- (AudioStreamBasicDescription)constructPcmAsbdWithSampleRate:(SEL)a3
{
  retstr->mSampleRate = a4;
  *(_OWORD *)&retstr->mFormatID = xmmword_22B64D0F0;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_22B64D100;
  return self;
}

- (SFSSTTSEngine)initWithVoicePath:(id)a3 resourcePath:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFSSTTSEngine;
  uint64_t v9 = [(SFSSTTSEngine *)&v15 init];
  v10 = v9;
  if (v9)
  {
    p_voicePath = &v9->_voicePath;
    objc_storeStrong((id *)&v9->_voicePath, a3);
    if (*p_voicePath) {
      operator new();
    }
    id v12 = SFSSGetLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_error_impl(&dword_22B575000, v12, OS_LOG_TYPE_ERROR, "Voice asset path is invalid, path=%@", buf, 0xCu);
    }

    id v13 = 0;
  }
  else
  {
    id v13 = (SFSSTTSEngine *)0;
  }

  return v13;
}

@end
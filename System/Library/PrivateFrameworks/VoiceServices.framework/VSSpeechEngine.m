@interface VSSpeechEngine
+ (BOOL)hasPhaticResponses:(id)a3;
+ (BOOL)isUserCancelError:(id)a3;
+ (id)mimeForFileExtension:(id)a3;
+ (int64_t)engineCurrentCompatibility;
+ (int64_t)engineMinimumCompatibility;
- (AudioStreamBasicDescription)asbd;
- (BOOL)initializeWithResourcePath:(id)a3;
- (NSLock)synthesisLock;
- (NSString)voicePath;
- (VSSpeechEngine)initWithVoicePath:(id)a3 resourcePath:(id)a4;
- (VSSpeechSynthesisCallbackResult)currentCallbackResult;
- (float)pitch;
- (float)rate;
- (float)volume;
- (id)loadResource:(id)a3 error:(id *)a4;
- (id)loadResourceAtPath:(id)a3 mimeType:(id)a4 error:(id *)p_isa;
- (id)synthesizeText:(id)a3 loggable:(BOOL)a4 callback:(id)a5;
- (id)synthesizeText:loggable:callback:;
- (int64_t)powerProfile;
- (uint64_t)synthesizeText:loggable:callback:;
- (unint64_t)pcmBufferSize;
- (void)dealloc;
- (void)preheat;
- (void)setCurrentCallbackResult:(id)a3;
- (void)setPcmBufferSize:(unint64_t)a3;
- (void)setPitch:(float)a3;
- (void)setPowerProfile:(int64_t)a3;
- (void)setRate:(float)a3;
- (void)setSynthesisLock:(id)a3;
- (void)setSynthesizer:(void *)a3;
- (void)setVoicePath:(id)a3;
- (void)setVolume:(float)a3;
- (void)stopAtMarker:(int64_t)a3;
- (void)synthesizeText:loggable:callback:;
- (void)synthesizer;
- (void)unloadResource:(id)a3;
@end

@implementation VSSpeechEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesisLock, 0);
  objc_storeStrong((id *)&self->_currentCallbackResult, 0);
  objc_storeStrong((id *)&self->_voicePath, 0);
}

- (void)setSynthesisLock:(id)a3
{
}

- (NSLock)synthesisLock
{
  return self->_synthesisLock;
}

- (void)setCurrentCallbackResult:(id)a3
{
}

- (VSSpeechSynthesisCallbackResult)currentCallbackResult
{
  return self->_currentCallbackResult;
}

- (void)setSynthesizer:(void *)a3
{
  self->_synthesizer = a3;
}

- (void)synthesizer
{
  return self->_synthesizer;
}

- (void)setPowerProfile:(int64_t)a3
{
  self->_powerProfile = a3;
}

- (int64_t)powerProfile
{
  return self->_powerProfile;
}

- (float)volume
{
  return self->_volume;
}

- (float)pitch
{
  return self->_pitch;
}

- (float)rate
{
  return self->_rate;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[2].mFormatID;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[2].mBytesPerFrame;
  return self;
}

- (void)setPcmBufferSize:(unint64_t)a3
{
  self->_pcmBufferSize = a3;
}

- (unint64_t)pcmBufferSize
{
  return self->_pcmBufferSize;
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
  [(NSLock *)self->_synthesisLock lock];
  uint64_t v3 = mach_absolute_time();
  TTSSynthesizer::preheat((TTSSynthesizer *)self->_synthesizer);
  [(NSLock *)self->_synthesisLock unlock];
  uint64_t v4 = mach_absolute_time();
  v5 = VSGetLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = v4 - v3;
    if (VSAbsoluteTimeToSecond_onceToken != -1) {
      dispatch_once(&VSAbsoluteTimeToSecond_onceToken, &__block_literal_global_7);
    }
    int v7 = 134217984;
    double v8 = *(double *)&VSAbsoluteTimeToSecond_clockFactor * (double)v6;
    _os_log_impl(&dword_20CABC000, v5, OS_LOG_TYPE_INFO, "Engine preheating latency: %.3f", (uint8_t *)&v7, 0xCu);
  }
}

- (void)stopAtMarker:(int64_t)a3
{
  if (a3 == 1)
  {
    id v5 = [(VSSpeechEngine *)self currentCallbackResult];
    [v5 setStopMark:1];
  }
  else if (!a3)
  {
    TTSSynthesizer::stop_synthesis((TTSSynthesizer *)self->_synthesizer);
  }
  id v6 = [(VSSpeechEngine *)self currentCallbackResult];
  [v6 setStopMark:a3];
}

- (id)synthesizeText:(id)a3 loggable:(BOOL)a4 callback:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  [(NSLock *)self->_synthesisLock lock];
  uint64_t v9 = VSGetLogDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_debug_impl(&dword_20CABC000, v9, OS_LOG_TYPE_DEBUG, "VSSpeechEngine %p started synthesis.", (uint8_t *)&buf, 0xCu);
  }

  v10 = [[VSSpeechSynthesisCallbackResult alloc] initWithCallback:v8];
  [(VSSpeechEngine *)self asbd];
  v28[0] = v30;
  v28[1] = v31;
  uint64_t v29 = v32;
  [(VSSpeechSynthesisCallbackResult *)v10 setAsbd:v28];
  [(VSSpeechSynthesisCallbackResult *)v10 setText:v7];
  objc_storeStrong((id *)&self->_currentCallbackResult, v10);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __51__VSSpeechEngine_synthesizeText_loggable_callback___block_invoke;
  v27[3] = &unk_2640E8388;
  v27[4] = self;
  p_long long buf = 0;
  *(void *)&long long buf = &unk_26C1AF660;
  *((void *)&buf + 1) = MEMORY[0x210554730](v27);
  p_long long buf = &buf;
  TTSSynthesizer::set_censor_plaintext((TTSSynthesizer *)self->_synthesizer);
  TTSSynthesizer::set_neural_cost();
  TTSSynthesizer::get_event_bus((uint64_t *)&__p, (TTSSynthesizer *)self->_synthesizer);
  v11 = v10;
  v42[0] = &unk_26C1AF6B8;
  v42[1] = v11;
  v42[3] = v42;
  Observable::on_event();
  std::__function::__value_func<void ()(void const*)>::~__value_func[abi:ne180100](v42);
  if (*((void *)&__p + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__p + 1));
  }
  TTSSynthesizer::get_event_bus((uint64_t *)&__p, (TTSSynthesizer *)self->_synthesizer);
  v12 = v11;
  v41[0] = &unk_26C1AF710;
  v41[1] = v12;
  v41[3] = v41;
  Observable::on_event();
  std::__function::__value_func<void ()(void const*)>::~__value_func[abi:ne180100](v41);
  if (*((void *)&__p + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__p + 1));
  }
  TTSSynthesizer::get_event_bus((uint64_t *)&__p, (TTSSynthesizer *)self->_synthesizer);
  v13 = v12;
  v40[0] = &unk_26C1AF768;
  v40[1] = v13;
  v40[3] = v40;
  Observable::on_event();
  std::__function::__value_func<void ()(void const*)>::~__value_func[abi:ne180100](v40);
  if (*((void *)&__p + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__p + 1));
  }
  TTSSynthesizer::get_event_bus((uint64_t *)&__p, (TTSSynthesizer *)self->_synthesizer);
  v14 = v13;
  v39[0] = &unk_26C1AF7C0;
  v39[1] = v14;
  v39[3] = v39;
  Observable::on_event();
  std::__function::__value_func<void ()(void const*)>::~__value_func[abi:ne180100](v39);
  if (*((void *)&__p + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__p + 1));
  }
  id v15 = v7;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v15 UTF8String]);
  [(VSSpeechSynthesisCallbackResult *)v14 sampleBuffer];
  [(VSSpeechSynthesisCallbackResult *)v14 markerBuffer];
  uint64_t v16 = (uint64_t)p_buf;
  if (!p_buf) {
    goto LABEL_14;
  }
  if (p_buf != &buf)
  {
    uint64_t v16 = (*(uint64_t (**)(void))(*(void *)p_buf + 16))();
LABEL_14:
    v36 = (void *)v16;
    goto LABEL_16;
  }
  v36 = v35;
  (*(void (**)(long long *, void *))(buf + 24))(&buf, v35);
LABEL_16:
  uint64_t v17 = TTSSynthesizer::synthesize_text_with_markers_async();
  std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100](v35);
  if (v38 < 0) {
    operator delete((void *)__p);
  }
  TTSSynthesizer::get_event_bus((uint64_t *)&__p, (TTSSynthesizer *)self->_synthesizer);
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Observable::remove_observer();
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  if (*((void *)&__p + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__p + 1));
  }
  TTSSynthesizer::get_event_bus((uint64_t *)&__p, (TTSSynthesizer *)self->_synthesizer);
  if (v26) {
    atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Observable::remove_observer();
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  if (*((void *)&__p + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__p + 1));
  }
  TTSSynthesizer::get_event_bus((uint64_t *)&__p, (TTSSynthesizer *)self->_synthesizer);
  if (v24) {
    atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Observable::remove_observer();
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  if (*((void *)&__p + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__p + 1));
  }
  TTSSynthesizer::get_event_bus((uint64_t *)&__p, (TTSSynthesizer *)self->_synthesizer);
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Observable::remove_observer();
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (*((void *)&__p + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&__p + 1));
  }
  v18 = VSGetLogDefault();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__p) = 134217984;
    *(void *)((char *)&__p + 4) = self;
    _os_log_debug_impl(&dword_20CABC000, v18, OS_LOG_TYPE_DEBUG, "VSSpeechEngine %p finished synthesis.", (uint8_t *)&__p, 0xCu);
  }

  [(NSLock *)self->_synthesisLock unlock];
  if (v17)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08338];
    v34 = @"TTSSynthesizer::synthesize_text_with_markers_async";
    v20 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v21 = [v19 errorWithDomain:@"VSVocalizerEngine" code:v17 userInfo:v20];
  }
  else
  {
    v21 = 0;
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100](&buf);

  return v21;
}

uint64_t __51__VSSpeechEngine_synthesizeText_loggable_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) currentCallbackResult];
  uint64_t v4 = [v3 synthesisCallback:a2];

  return v4;
}

- (void)synthesizeText:loggable:callback:
{
  JUMPOUT(0x2105540B0);
}

- (uint64_t)synthesizeText:loggable:callback:
{
  return a1;
}

- (id)synthesizeText:loggable:callback:
{
  *a2 = &unk_26C1AF6B8;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (void)unloadResource:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(NSLock *)self->_synthesisLock lock];
    if (v5) {
      [v5 resource];
    }
    else {
      long long v6 = 0uLL;
    }
    TTSSynthesizer::unload_resource();
    if (*((void *)&v6 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v6 + 1));
    }
    [(NSLock *)self->_synthesisLock unlock];
  }
  else
  {
    id v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v6) = 138412290;
      *(void *)((char *)&v6 + 4) = v4;
      _os_log_error_impl(&dword_20CABC000, v5, OS_LOG_TYPE_ERROR, "Unknown voice resource handle to unload: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)loadResource:(id)a3 error:(id *)a4
{
  v27[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 path];
  if (v7)
  {
    id v8 = [v6 pathExtension];
    uint64_t v9 = +[VSSpeechEngine mimeForFileExtension:v8];

    v10 = VSGetLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v23 = v6;
      __int16 v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_20CABC000, v10, OS_LOG_TYPE_INFO, "Loading resource: %@, mime-type: %@", buf, 0x16u);
    }

    if (v9)
    {
      v11 = [(VSSpeechEngine *)self loadResourceAtPath:v7 mimeType:v9 error:a4];
    }
    else
    {
      id v15 = VSGetLogDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v23 = v6;
        _os_log_error_impl(&dword_20CABC000, v15, OS_LOG_TYPE_ERROR, "Unable to find mime-type for '%@'", buf, 0xCu);
      }

      if (a4)
      {
        uint64_t v16 = (void *)MEMORY[0x263F087E8];
        uint64_t v17 = *MEMORY[0x263F08338];
        v20[0] = @"url";
        v20[1] = v17;
        v21[0] = v6;
        v21[1] = @"unknown mime-type";
        v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
        *a4 = [v16 errorWithDomain:@"VSVocalizerEngine" code:1 userInfo:v18];
      }
      uint64_t v9 = 0;
      v11 = 0;
    }
    goto LABEL_15;
  }
  v12 = VSGetLogDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v23 = v6;
    _os_log_error_impl(&dword_20CABC000, v12, OS_LOG_TYPE_ERROR, "Url doesn't conform to RFC 1808 '%@'", buf, 0xCu);
  }

  if (a4)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08338];
    v26[0] = @"url";
    v26[1] = v14;
    v27[0] = v6;
    v27[1] = @"unknown path";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    [v13 errorWithDomain:@"VSVocalizerEngine" code:1 userInfo:v9];
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (id)loadResourceAtPath:(id)a3 mimeType:(id)a4 error:(id *)p_isa
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  [(NSLock *)self->_synthesisLock lock];
  id v10 = v8;
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v10 UTF8String]);
  id v11 = v9;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v11 UTF8String]);
  TTSSynthesizer::load_voice_resource();
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v26 < 0) {
    operator delete(*(void **)buf);
  }
  [(NSLock *)self->_synthesisLock unlock];
  if (v21)
  {
    v12 = objc_alloc_init(VSSpeechEngineVoiceResource);
    p_isa = (id *)&v12->super.isa;
    uint64_t v17 = v21;
    v18 = v22;
    if (v22) {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(VSSpeechEngineVoiceResource *)v12 setResource:&v17];
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }
  else
  {
    v13 = VSGetLogDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_error_impl(&dword_20CABC000, v13, OS_LOG_TYPE_ERROR, "Unable to load resource '%@'", buf, 0xCu);
    }

    if (p_isa)
    {
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      v23[0] = @"path";
      v23[1] = @"mimeType";
      v24[0] = v10;
      v24[1] = v11;
      v23[2] = *MEMORY[0x263F08338];
      v24[2] = @"TTSSynthesizer::load_voice_resource";
      id v15 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
      *p_isa = [v14 errorWithDomain:@"VSVocalizerEngine" code:1 userInfo:v15];

      p_isa = 0;
    }
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }

  return p_isa;
}

- (void)setVolume:(float)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3 <= 0.01) {
    float v3 = 0.01;
  }
  else {
    float v3 = a3;
  }
  if (self->_volume != v3)
  {
    uint64_t v5 = TTSSynthesizer::set_global_property();
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = VSGetLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 134217984;
        uint64_t v9 = v6;
        _os_log_error_impl(&dword_20CABC000, v7, OS_LOG_TYPE_ERROR, "Error setVolume 0x%zx", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      self->_volume = v3;
    }
  }
}

- (void)setRate:(float)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v3 = a3;
  if (v3 < 0.5) {
    double v3 = 0.5;
  }
  if (v3 >= 4.0) {
    double v3 = 4.0;
  }
  float v4 = v3;
  if (self->_rate != v4)
  {
    uint64_t v6 = TTSSynthesizer::set_global_property();
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 134217984;
        uint64_t v10 = v7;
        _os_log_error_impl(&dword_20CABC000, v8, OS_LOG_TYPE_ERROR, "Error setRate 0x%zx", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      self->_rate = v4;
    }
  }
}

- (void)setPitch:(float)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v3 = a3;
  if (v3 < 0.5) {
    double v3 = 0.5;
  }
  if (v3 >= 2.0) {
    double v3 = 2.0;
  }
  float v4 = v3;
  if (self->_pitch != v4)
  {
    uint64_t v6 = TTSSynthesizer::set_global_property();
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 134217984;
        uint64_t v10 = v7;
        _os_log_error_impl(&dword_20CABC000, v8, OS_LOG_TYPE_ERROR, "Error setPitch 0x%zx", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      self->_pitch = v4;
    }
  }
}

- (void)dealloc
{
  synthesizer = (TTSSynthesizer *)self->_synthesizer;
  if (synthesizer)
  {
    TTSSynthesizer::~TTSSynthesizer(synthesizer);
    MEMORY[0x2105540B0]();
  }
  self->_synthesizer = 0;
  v4.receiver = self;
  v4.super_class = (Class)VSSpeechEngine;
  [(VSSpeechEngine *)&v4 dealloc];
}

- (BOOL)initializeWithResourcePath:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  voicePath = self->_voicePath;
  uint64_t v6 = VSGetLogDefault();
  uint64_t v7 = v6;
  if (voicePath)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = self->_voicePath;
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_20CABC000, v7, OS_LOG_TYPE_INFO, "Initializing engine with voice path: %@", buf, 0xCu);
    }

    operator new();
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_20CABC000, v7, OS_LOG_TYPE_ERROR, "Failed to initialize synthesizer due to missing voice path.\n", buf, 2u);
  }

  return 0;
}

- (VSSpeechEngine)initWithVoicePath:(id)a3 resourcePath:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v32 = a4;
  v38.receiver = self;
  v38.super_class = (Class)VSSpeechEngine;
  uint64_t v7 = [(VSSpeechEngine *)&v38 init];
  int v8 = v7;
  uint64_t v33 = v7;
  if (!v7) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v7->_voicePath, a3);
  v33->_volume = 0.8;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)&v33->_rate = _D0;
  uint64_t v14 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
  synthesisLock = v33->_synthesisLock;
  v33->_synthesisLock = v14;

  BOOL v16 = [(VSSpeechEngine *)v33 initializeWithResourcePath:v32];
  int v8 = v33;
  if (!v16)
  {
    v18 = VSGetLogDefault();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v41 = v31;
      __int16 v42 = 2112;
      id v43 = v32;
      _os_log_impl(&dword_20CABC000, v18, OS_LOG_TYPE_DEFAULT, "voice path '%@', resource path '%@'\n", buf, 0x16u);
    }

    v19 = [MEMORY[0x263F08850] defaultManager];
    char v20 = v19;
    long long v30 = [v19 contentsOfDirectoryAtPath:v31 error:0];
    uint64_t v21 = VSGetLogDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [v30 count];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v41) = v22;
      _os_log_impl(&dword_20CABC000, v21, OS_LOG_TYPE_DEFAULT, "%d files under voice path:", buf, 8u);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v23 = v30;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v28 = VSGetLogDefault();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            id v41 = v27;
            _os_log_impl(&dword_20CABC000, v28, OS_LOG_TYPE_DEFAULT, "- %@", buf, 0xCu);
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v24);
    }
    else
    {
    }
    uint64_t v17 = 0;
  }
  else
  {
LABEL_3:
    uint64_t v17 = v8;
  }

  return v17;
}

+ (id)mimeForFileExtension:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"dcb"])
  {
    id v4 = @"application/edct-bin-dictionary";
  }
  else if ([v3 isEqualToString:@"txt"])
  {
    id v4 = @"application/x-vocalizer-rettt+text";
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)hasPhaticResponses:(id)a3
{
  id v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v3 UTF8String]);
  char has_phatic_responses = TTSSynthesizer::has_phatic_responses();
  if (v7 < 0) {
    operator delete(__p);
  }

  return has_phatic_responses;
}

+ (BOOL)isUserCancelError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 code] == 2147485703)
  {
    uint64_t v5 = [v4 domain];
    char v6 = [v5 isEqualToString:@"VSVocalizerEngine"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (int64_t)engineCurrentCompatibility
{
  return (unint64_t)TTSSynthesizer::get_engine_description((TTSSynthesizer *)a1) >> 32;
}

+ (int64_t)engineMinimumCompatibility
{
  return TTSSynthesizer::get_engine_description((TTSSynthesizer *)a1);
}

@end
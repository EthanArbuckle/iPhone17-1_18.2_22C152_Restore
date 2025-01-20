@interface SiriTTSSynthesisEngine
+ (BOOL)hasPhaticResponsesWithVoicePath:(id)a3;
- (AudioStreamBasicDescription)asbd;
- (BOOL)_preheatWithError:(id *)a3;
- (BOOL)_unlockedLoadResourceWithPath:(id)a3 error:(id *)a4;
- (BOOL)_unlockedSynthesize:(id)a3 error:(id *)a4;
- (BOOL)loadResourceWithPath:(id)a3 error:(id *)a4;
- (BOOL)preheatWithError:(id *)a3;
- (BOOL)synthesize:(id)a3 error:(id *)a4;
- (NSLock)lock;
- (NSString)resourcePath;
- (NSString)tag;
- (NSString)voicePath;
- (SiriTTSSynthesisEngine)initWithVoicePath:(id)a3 resourcePath:(id)a4 error:(id *)a5;
- _unlockedSynthesize:error:;
- (id)_unlockedSynthesize:error:;
- (uint64_t)_unlockedSynthesize:error:;
- (void)_unlockedSynthesize:error:;
- (void)_unlockedUnloadResource:(id)a3;
- (void)dealloc;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setLock:(id)a3;
- (void)setSynthesizer:(void *)a3;
- (void)setTag:(id)a3;
- (void)stopSynthesis;
- (void)synthesizer;
- (void)unloadResource:(id)a3;
@end

@implementation SiriTTSSynthesisEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_voicePath, 0);
}

- (void)setLock:(id)a3
{
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setSynthesizer:(void *)a3
{
  self->_synthesizer = a3;
}

- (void)synthesizer
{
  return self->_synthesizer;
}

- (void)setTag:(id)a3
{
}

- (NSString)tag
{
  return self->_tag;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (NSString)voicePath
{
  return self->_voicePath;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_asbd.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[1].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[2].mSampleRate;
  return self;
}

- (BOOL)preheatWithError:(id *)a3
{
  LOBYTE(a3) = [(SiriTTSSynthesisEngine *)self _preheatWithError:a3];
  [(NSLock *)self->_lock unlock];
  return (char)a3;
}

- (BOOL)_preheatWithError:(id *)a3
{
  return 1;
}

- (void)stopSynthesis
{
}

- (BOOL)synthesize:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(NSLock *)self->_lock lock];
  LOBYTE(a4) = [(SiriTTSSynthesisEngine *)self _unlockedSynthesize:v6 error:a4];
  [(NSLock *)self->_lock unlock];

  return (char)a4;
}

- (BOOL)_unlockedSynthesize:(id)a3 error:(id *)a4
{
  v59[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  synthesizer = (TTSSynthesizer *)self->_synthesizer;
  [v6 privacySensitive];
  TTSSynthesizer::set_censor_plaintext(synthesizer);
  [v6 profile];
  TTSSynthesizer::set_neural_cost();
  [v6 neuralSentencePitch];
  TTSSynthesizer::set_global_property();
  [v6 neuralSentencePitchRange];
  TTSSynthesizer::set_global_property();
  [v6 neuralSentenceDuration];
  TTSSynthesizer::set_global_property();
  [v6 neuralSentenceEnergy];
  TTSSynthesizer::set_global_property();
  [v6 neuralSentenceTilt];
  TTSSynthesizer::set_global_property();
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  [v6 rate];
  if (v8 != 0.0)
  {
    [v6 rate];
    if (v9 != 1.0)
    {
      [v6 rate];
      TTSSynthesizer::set_global_property();
    }
  }
  [v6 pitch];
  if (v10 != 0.0)
  {
    [v6 pitch];
    if (v11 != 1.0)
    {
      [v6 pitch];
      TTSSynthesizer::set_global_property();
    }
  }
  [v6 volume];
  if (v12 != 0.0)
  {
    [v6 volume];
    if (v13 != 0.8)
    {
      [v6 volume];
      TTSSynthesizer::set_global_property();
    }
  }
  v14 = [v6 audioHandler];

  if (v14)
  {
    TTSSynthesizer::get_event_bus(&v44, (TTSSynthesizer *)self->_synthesizer);
    id v15 = v6;
    v59[0] = &unk_1EEE1D358;
    v59[1] = v15;
    v59[3] = v59;
    TTSSynthesizerEventBus::on_audio();
    std::__function::__value_func<void ()(std::vector<float> const&)>::~__value_func[abi:ne180100](v59);
    if (v45) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v45);
    }
    std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100]((uint64_t)&v46, (long long *)__p);
    if (__p[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
    }
  }
  v16 = [v6 promptHandler];
  BOOL v17 = v16 == 0;

  if (!v17)
  {
    TTSSynthesizer::get_event_bus(&v44, (TTSSynthesizer *)self->_synthesizer);
    id v18 = v6;
    v58[0] = &unk_1EEE1D3B0;
    v58[1] = v18;
    v58[3] = v58;
    Observable::on_event();
    std::__function::__value_func<void ()(void const*)>::~__value_func[abi:ne180100](v58);
    if (v45) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v45);
    }
    std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100]((uint64_t)&v46, (long long *)__p);
    if (__p[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
    }
  }
  v19 = [v6 wordTimingsHandler];
  BOOL v20 = v19 == 0;

  if (!v20)
  {
    Float64 mSampleRate = self->_asbd.mSampleRate;
    TTSSynthesizer::get_event_bus(&v44, (TTSSynthesizer *)self->_synthesizer);
    id v22 = v6;
    v54 = &unk_1EEE1D408;
    *(float *)&Float64 mSampleRate = mSampleRate;
    int v55 = LODWORD(mSampleRate);
    id v56 = v22;
    v57 = &v54;
    TTSSynthesizerEventBus::on_marker();
    std::__function::__value_func<void ()(std::vector<TTSSynthesizer::Marker> const&)>::~__value_func[abi:ne180100](&v54);
    if (v45) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v45);
    }
    std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100]((uint64_t)&v46, (long long *)__p);
    if (__p[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
    }
  }
  v23 = [v6 neuralFallbackHandler];
  BOOL v24 = v23 == 0;

  if (!v24)
  {
    TTSSynthesizer::get_event_bus(&v44, (TTSSynthesizer *)self->_synthesizer);
    id v25 = v6;
    v53[0] = &unk_1EEE1D460;
    v53[1] = v25;
    v53[3] = v53;
    Observable::on_event();
    std::__function::__value_func<void ()(void const*)>::~__value_func[abi:ne180100](v53);
    if (v45) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v45);
    }
    std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100]((uint64_t)&v46, (long long *)__p);
    if (__p[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
    }
  }
  v26 = [v6 useHydraFrontendHandler];
  BOOL v27 = v26 == 0;

  if (!v27)
  {
    TTSSynthesizer::get_event_bus(&v44, (TTSSynthesizer *)self->_synthesizer);
    id v28 = v6;
    v52[0] = &unk_1EEE1ADB0;
    v52[1] = v28;
    v52[3] = v52;
    Observable::on_event();
    std::__function::__value_func<void ()(void const*)>::~__value_func[abi:ne180100](v52);
    if (v45) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v45);
    }
    std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100]((uint64_t)&v46, (long long *)__p);
    if (__p[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
    }
  }
  v29 = [v6 synthesisIssueHandler];
  BOOL v30 = v29 == 0;

  if (!v30)
  {
    TTSSynthesizer::get_event_bus(&v44, (TTSSynthesizer *)self->_synthesizer);
    id v31 = v6;
    v51[0] = &unk_1EEE1AE08;
    v51[1] = v31;
    v51[3] = v51;
    Observable::on_event();
    std::__function::__value_func<void ()(void const*)>::~__value_func[abi:ne180100](v51);
    if (v45) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v45);
    }
    std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100]((uint64_t)&v46, (long long *)__p);
    if (__p[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
    }
  }
  id v32 = [v6 text];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v32 UTF8String]);
  uint64_t v33 = TTSSynthesizer::synthesize_text();
  if (v43 < 0) {
    operator delete(__p[0]);
  }

  uint64_t v34 = v46;
  for (uint64_t i = v47; v34 != i; v34 += 16)
  {
    TTSSynthesizer::get_event_bus((uint64_t *)__p, (TTSSynthesizer *)self->_synthesizer);
    v36 = *(std::__shared_weak_count **)(v34 + 8);
    v41 = v36;
    if (v36) {
      atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    Observable::remove_observer();
    if (v41) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v41);
    }
    if (__p[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
    }
  }
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  if (a4 && v33)
  {
    v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28588];
    v38 = [NSString stringWithFormat:@"TTSSynthesizer::synthesize_text error: %@", 0];
    v50 = v38;
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    *a4 = [v37 errorWithDomain:@"SiriTTSSynthesisEngine" code:v33 userInfo:v39];
  }
  __p[0] = &v46;
  std::vector<std::shared_ptr<Observer>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v33 == 0;
}

- (void)_unlockedSynthesize:error:
{
  JUMPOUT(0x19F3A3220);
}

- (uint64_t)_unlockedSynthesize:error:
{
  return a1;
}

- (id)_unlockedSynthesize:error:
{
  *a2 = &unk_1EEE1D358;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- _unlockedSynthesize:error:
{
  _DWORD *v2;

  v2 = operator new(0x18uLL);
  *(void *)v2 = &unk_1EEE1D408;
  v2[2] = *(_DWORD *)(a1 + 8);
  *((void *)v2 + 2) = *(id *)(a1 + 16);
  return v2;
}

- (void)unloadResource:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  [(SiriTTSSynthesisEngine *)self _unlockedUnloadResource:v4];
  [(NSLock *)self->_lock unlock];
}

- (void)_unlockedUnloadResource:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 handle];
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
    if (v5)
    {
      [v4 handle];
      TTSSynthesizer::unload_resource();
      if (v6) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
    }
  }
}

- (BOOL)loadResourceWithPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(NSLock *)self->_lock lock];
  LOBYTE(a4) = [(SiriTTSSynthesisEngine *)self _unlockedLoadResourceWithPath:v6 error:a4];
  [(NSLock *)self->_lock unlock];

  return (char)a4;
}

- (BOOL)_unlockedLoadResourceWithPath:(id)a3 error:(id *)a4
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 path];
  std::string::basic_string[abi:ne180100]<0>(&v18, (char *)[v6 UTF8String]);
  id v7 = [v5 mimeType];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v7 UTF8String]);
  TTSSynthesizer::load_voice_resource();
  if (v17 < 0) {
    operator delete(__p);
  }

  if (v19 < 0) {
    operator delete(v18);
  }

  uint64_t v8 = v20;
  if (v20)
  {
    uint64_t v14 = v20;
    id v15 = v21;
    if (v21) {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [v5 setHandle:&v14];
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  else if (a4)
  {
    float v9 = (void *)MEMORY[0x1E4F28C58];
    v22[0] = @"path";
    float v10 = [v5 path];
    v23[0] = v10;
    v22[1] = @"mimeType";
    float v11 = [v5 mimeType];
    v22[2] = *MEMORY[0x1E4F28588];
    v23[1] = v11;
    v23[2] = @"TTSSynthesizer::load_voice_resource";
    float v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
    *a4 = [v9 errorWithDomain:@"SiriTTSSynthesisEngine" code:1 userInfo:v12];
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }

  return v8 != 0;
}

- (void)dealloc
{
  synthesizer = (TTSSynthesizer *)self->_synthesizer;
  if (synthesizer)
  {
    TTSSynthesizer::~TTSSynthesizer(synthesizer);
    MEMORY[0x19F3A3220]();
  }
  self->_synthesizer = 0;
  v4.receiver = self;
  v4.super_class = (Class)SiriTTSSynthesisEngine;
  [(SiriTTSSynthesisEngine *)&v4 dealloc];
}

- (SiriTTSSynthesisEngine)initWithVoicePath:(id)a3 resourcePath:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SiriTTSSynthesisEngine;
  float v12 = [(SiriTTSSynthesisEngine *)&v14 init];
  if (v13 && [v13 length]) {
    operator new();
  }
  if (a5)
  {
    float v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"Empty voice path cannot be used.";
    float v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a5 = [v9 errorWithDomain:@"SiriTTSSynthesisEngine" code:-1 userInfo:v10];
  }
  return 0;
}

+ (BOOL)hasPhaticResponsesWithVoicePath:(id)a3
{
  id v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v3 UTF8String]);
  char has_phatic_responses = TTSSynthesizer::has_phatic_responses();
  if (v7 < 0) {
    operator delete(__p);
  }

  return has_phatic_responses;
}

@end
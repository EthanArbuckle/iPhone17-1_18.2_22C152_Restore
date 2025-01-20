@interface TTSSiriSynthWrapper
- (AVAudioConverter)bufferConverter;
- (AVAudioFormat)engineFormat;
- (AVAudioFormat)outputFormat;
- (BOOL)loadVoiceResource:(id)a3;
- (BOOL)synthesizing;
- (BOOL)unloadVoiceResource:(id)a3;
- (NSArray)neuralStyles;
- (NSMutableOrderedSet)voiceResources;
- (NSString)language;
- (OS_dispatch_queue)synthesisQueue;
- (TTSNeuralStyle)currentNeuralStyle;
- (TTSRulesetRunner)ruleSetRunner;
- (TTSSiriSynthWrapper)initWithVoicePath:(id)a3 language:(id)a4 censorPlainText:(BOOL)a5 delegate:(id)a6 feResourcePath:(id)a7;
- (TTSSiriSynthWrapperDelegate)delegate;
- (TTSSpeechString)processedSpeechString;
- (id)_applyPostRuleRewrites:(id)a3;
- (id)_neuralStyles;
- (id)_rawLiteralCharacterRegexForCurrentLanguage;
- (void)_setProsodyParameters;
- (void)dealloc;
- (void)loadRuleset:(id)a3;
- (void)setBufferConverter:(id)a3;
- (void)setCurrentNeuralStyle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEngineFormat:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setNeuralStyles:(id)a3;
- (void)setOutputFormat:(id)a3;
- (void)setProcessedSpeechString:(id)a3;
- (void)setRuleSetRunner:(id)a3;
- (void)setSynthesisQueue:(id)a3;
- (void)setSynthesizer:(void *)a3;
- (void)setSynthesizing:(BOOL)a3;
- (void)setVoiceResources:(id)a3;
- (void)stopSynthesis;
- (void)synthesizeString:(id)a3;
- (void)synthesizer;
- (void)unloadAllVoiceResources;
@end

@implementation TTSSiriSynthWrapper

- (TTSSiriSynthWrapper)initWithVoicePath:(id)a3 language:(id)a4 censorPlainText:(BOOL)a5 delegate:(id)a6 feResourcePath:(id)a7
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v16.receiver = self;
  v16.super_class = (Class)TTSSiriSynthWrapper;
  [(TTSSiriSynthWrapper *)&v16 init];
  operator new();
}

- (void)dealloc
{
  if ([(TTSSiriSynthWrapper *)self synthesizer])
  {
    v3 = [(TTSSiriSynthWrapper *)self synthesizer];
    if (v3)
    {
      TTSSynthesizer::~TTSSynthesizer(v3);
      MEMORY[0x223C81C40]();
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)TTSSiriSynthWrapper;
  [(TTSSiriSynthWrapper *)&v4 dealloc];
}

- (void)_setProsodyParameters
{
  v3 = [(TTSSiriSynthWrapper *)self currentNeuralStyle];

  if (v3)
  {
    [(TTSSiriSynthWrapper *)self synthesizer];
    objc_super v4 = [(TTSSiriSynthWrapper *)self currentNeuralStyle];
    v5 = v4;
    if (v4) {
      [v4 getStyleVector];
    }
    else {
      __p = 0;
    }
    TTSSynthesizer::set_neural_style();
    if (__p) {
      operator delete(__p);
    }
  }
}

- (id)_rawLiteralCharacterRegexForCurrentLanguage
{
  v2 = [(TTSSiriSynthWrapper *)self language];
  int v3 = [v2 hasPrefix:@"da"];

  if (v3)
  {
    objc_super v4 = [MEMORY[0x263F7EEC8] sharedInstance];
    v5 = [v4 regexForString:@"[æøå]" atStart:0];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_neuralStyles
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  TTSSynthesizer::available_neural_styles(&v20, (TTSSynthesizer *)[(TTSSiriSynthWrapper *)self synthesizer]);
  memset(v19, 0, sizeof(v19));
  v2 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = v20;
  uint64_t v5 = v21;
  if (v20 != v21)
  {
    *(void *)&long long v3 = 136315138;
    long long v14 = v3;
    do
    {
      v6 = [TTSNeuralStyle alloc];
      if (*(char *)(v4 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)v4, *(void *)(v4 + 8));
      }
      else
      {
        long long v7 = *(_OWORD *)v4;
        v18.__r_.__value_.__r.__words[2] = *(void *)(v4 + 16);
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v7;
      }
      __p = 0;
      objc_super v16 = 0;
      uint64_t v17 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, *(const void **)(v4 + 48), *(void *)(v4 + 56), (uint64_t)(*(void *)(v4 + 56) - *(void *)(v4 + 48)) >> 2);
      v8 = [(TTSNeuralStyle *)v6 initWithName:&v18 vector:&__p];
      if (__p)
      {
        objc_super v16 = __p;
        operator delete(__p);
      }
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v18.__r_.__value_.__l.__data_);
        if (!v8)
        {
LABEL_12:
          v9 = AXTTSLogCommon();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            v10 = (const std::string::value_type *)v4;
            if (*(char *)(v4 + 23) < 0) {
              v10 = *(const std::string::value_type **)v4;
            }
            *(_DWORD *)buf = v14;
            *(void *)&buf[4] = v10;
            _os_log_fault_impl(&dword_22149B000, v9, OS_LOG_TYPE_FAULT, "Siri returned style %s for which we have no localization.", buf, 0xCu);
          }

          goto LABEL_14;
        }
      }
      else if (!v8)
      {
        goto LABEL_12;
      }
      objc_msgSend(v2, "addObject:", v8, v14);
LABEL_14:

      v4 += 72;
    }
    while (v4 != v5);
  }
  uint64_t v11 = objc_msgSend(v2, "indexOfObjectPassingTest:", &__block_literal_global, v14);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [v2 objectAtIndexedSubscript:v11];
    [v2 removeObjectAtIndex:v11];
    [v2 insertObject:v12 atIndex:0];
  }
  *(void *)buf = v19;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  v19[0] = (void **)&v20;
  std::vector<TTSSynthesizer::SpeakingStyle>::__destroy_vector::operator()[abi:ne180100](v19);
  return v2;
}

uint64_t __36__TTSSiriSynthWrapper__neuralStyles__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 key];
  uint64_t v3 = [v2 isEqualToString:@"siri"];

  return v3;
}

- (id)_applyPostRuleRewrites:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TTSSiriSynthWrapper *)self _rawLiteralCharacterRegexForCurrentLanguage];
  if (v5)
  {
    v6 = [v4 originalString];
    long long v7 = [MEMORY[0x263F7EEC8] sharedInstance];
    v8 = [v7 regexForString:@"((?<=(\\\\!|\\x1B)\\\\tn=spell\\\\)[\\s\\S]*?(?=((\\\\!|\\x1B)\\\\tn=)|$))" atStart:0];

    v9 = [v4 originalString];
    uint64_t v10 = [v9 length];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __46__TTSSiriSynthWrapper__applyPostRuleRewrites___block_invoke;
    v13[3] = &unk_2645B36C0;
    id v14 = v5;
    id v11 = v6;
    id v15 = v11;
    id v16 = v4;
    objc_msgSend(v8, "enumerateMatchesInString:options:range:usingBlock:", v11, 2, 0, v10, v13);
  }
  return v4;
}

void __46__TTSSiriSynthWrapper__applyPostRuleRewrites___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [v3 range];
    uint64_t v9 = v8;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__TTSSiriSynthWrapper__applyPostRuleRewrites___block_invoke_2;
    v10[3] = &unk_2645B3698;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v6, 2, v7, v9, v10);
  }
}

void __46__TTSSiriSynthWrapper__applyPostRuleRewrites___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v12 = v3;
    uint64_t v5 = [v3 range];
    uint64_t v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);
    uint64_t v8 = [NSString stringWithFormat:@"\x1B\\tn=raw\\%@\x1B\\tn=spell\\"", v7];
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = [v12 range];
    objc_msgSend(v9, "transformRange:to:", v10, v11, v8);

    id v3 = v12;
  }
}

- (void)synthesizeString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TTSSiriSynthWrapper *)self synthesisQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__TTSSiriSynthWrapper_synthesizeString___block_invoke;
  v7[3] = &unk_2645B36E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__TTSSiriSynthWrapper_synthesizeString___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) bufferConverter];
  [v2 reset];

  [*(id *)(a1 + 32) setSynthesizing:1];
  id v3 = *(id *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) ruleSetRunner];
  uint64_t v5 = [v4 processText:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setProcessedSpeechString:v5];

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 processedSpeechString];
  id v8 = [v6 _applyPostRuleRewrites:v7];
  [*(id *)(a1 + 32) setProcessedSpeechString:v8];

  uint64_t v9 = [*(id *)(a1 + 32) processedSpeechString];
  uint64_t v10 = [v9 transformedString];

  id v11 = v10;
  std::string::basic_string[abi:ne180100]<0>(v20, (char *)[v11 UTF8String]);
  __p = 0;
  std::string v18 = 0;
  uint64_t v19 = 0;
  memset(v16, 0, sizeof(v16));
  id v12 = *(id *)(a1 + 32);
  v24 = 0;
  id v13 = operator new(0x28uLL);
  *id v13 = &unk_26D386E38;
  id v14 = v12;
  v13[1] = v14;
  v13[2] = &__p;
  v13[3] = v16;
  void v13[4] = v20;
  v24 = v13;

  [*(id *)(a1 + 32) _setProsodyParameters];
  [*(id *)(a1 + 32) synthesizer];
  std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::__value_func[abi:ne180100]((uint64_t)v22, (uint64_t)v23);
  TTSSynthesizer::synthesize_text_with_markers_async();
  std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100](v22);
  [*(id *)(a1 + 32) setSynthesizing:0];
  id v15 = (void ***)std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100](v23);
  v23[0] = v16;
  std::vector<TTSSynthesizer::Marker>::__destroy_vector::operator()[abi:ne180100](v15);
  if (__p)
  {
    std::string v18 = __p;
    operator delete(__p);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
}

- (void)stopSynthesis
{
  id v3 = [(TTSSiriSynthWrapper *)self ruleSetRunner];
  [v3 cancelProcessing];

  TTSSynthesizer::stop_synthesis((TTSSynthesizer *)[(TTSSiriSynthWrapper *)self synthesizer]);
  id v4 = [(TTSSiriSynthWrapper *)self synthesisQueue];
  dispatch_sync(v4, &__block_literal_global_106);
}

- (void)loadRuleset:(id)a3
{
  id v7 = a3;
  id v4 = [[TTSSiriVoiceResource alloc] init];
  [(TTSSiriVoiceResource *)v4 setType:0];
  [(TTSSiriVoiceResource *)v4 setRuleSet:v7];
  uint64_t v5 = [(TTSSiriSynthWrapper *)self ruleSetRunner];
  [v5 loadRuleSet:v7];

  id v6 = [(TTSSiriSynthWrapper *)self voiceResources];
  [v6 addObject:v4];
}

- (BOOL)loadVoiceResource:(id)a3
{
  id v4 = a3;
  if ([v4 type])
  {
    memset(&v30, 0, sizeof(v30));
    unint64_t v5 = [v4 type];
    if (v5 < 3) {
      std::string::__assign_external(&v30, off_2645B3770[v5], *(void *)&asc_2214AF288[8 * v5]);
    }
    uint64_t v29 = 0;
    id v6 = [v4 resourceData];

    if (v6)
    {
      id v7 = [v4 resourceData];
      [v7 bytes];

      id v8 = [v4 resourceData];
      uint64_t v9 = [v8 length];
    }
    else
    {
      id v12 = [v4 resourceString];
      [v12 cStringUsingEncoding:4];

      id v8 = [v4 resourceString];
      uint64_t v9 = [v8 lengthOfBytesUsingEncoding:4];
    }
    uint64_t v29 = v9;

    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v28, v30.__r_.__value_.__l.__data_, v30.__r_.__value_.__l.__size_);
    }
    else {
      std::string v28 = v30;
    }
    [(TTSSiriSynthWrapper *)self synthesizer];
    TTSSynthesizer::load_voice_resource();
    BOOL v13 = v26 != 0;
    if (v26)
    {
      uint64_t v24 = v26;
      uint64_t v25 = v27;
      if (v27) {
        atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [v4 setSiriVoiceResource:&v24];
      if (v25) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v25);
      }
      id v14 = [(TTSSiriSynthWrapper *)self voiceResources];
      [v14 addObject:v4];
    }
    if (v27) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v27);
    }
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v28.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v30.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v10 = [v4 resourceData];
    if (v10)
    {
      id v11 = [v4 resourceData];
    }
    else
    {
      id v15 = [v4 resourceString];
      id v11 = [v15 dataUsingEncoding:4];
    }
    id v16 = (void *)MEMORY[0x263F7EED0];
    uint64_t v17 = [v4 resourceName];
    std::string v18 = [(TTSSiriSynthWrapper *)self voiceResources];
    uint64_t v19 = objc_msgSend(v16, "rulesetWithData:identifier:priority:", v11, v17, objc_msgSend(v18, "count"));
    [v4 setRuleSet:v19];

    uint64_t v20 = [(TTSSiriSynthWrapper *)self ruleSetRunner];
    char v21 = [v4 ruleSet];
    [v20 loadRuleSet:v21];

    v22 = [(TTSSiriSynthWrapper *)self voiceResources];
    [v22 addObject:v4];

    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)unloadVoiceResource:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TTSSiriSynthWrapper *)self voiceResources];
  [v5 removeObject:v4];

  id v6 = [v4 ruleSet];

  if (v6)
  {
    id v7 = [(TTSSiriSynthWrapper *)self ruleSetRunner];
    id v8 = [v4 ruleSet];
    [v7 unloadRuleset:v8];

    [v4 setRuleSet:0];
    BOOL v9 = 1;
  }
  else
  {
    [(TTSSiriSynthWrapper *)self synthesizer];
    if (v4)
    {
      [v4 siriVoiceResource];
    }
    else
    {
      uint64_t v14 = 0;
      id v15 = 0;
    }
    uint64_t v10 = TTSSynthesizer::unload_resource();
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    uint64_t v12 = 0;
    BOOL v13 = 0;
    [v4 setSiriVoiceResource:&v12];
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    BOOL v9 = v10 == 0;
  }

  return v9;
}

- (void)unloadAllVoiceResources
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(TTSSiriSynthWrapper *)self voiceResources];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [(TTSSiriSynthWrapper *)self unloadVoiceResource:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (TTSNeuralStyle)currentNeuralStyle
{
  return self->_currentNeuralStyle;
}

- (void)setCurrentNeuralStyle:(id)a3
{
}

- (NSArray)neuralStyles
{
  return self->_neuralStyles;
}

- (void)setNeuralStyles:(id)a3
{
}

- (TTSRulesetRunner)ruleSetRunner
{
  return self->_ruleSetRunner;
}

- (void)setRuleSetRunner:(id)a3
{
}

- (BOOL)synthesizing
{
  return self->_synthesizing;
}

- (void)setSynthesizing:(BOOL)a3
{
  self->_synthesizing = a3;
}

- (void)synthesizer
{
  return self->_synthesizer;
}

- (void)setSynthesizer:(void *)a3
{
  self->_synthesizer = a3;
}

- (TTSSiriSynthWrapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TTSSiriSynthWrapperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableOrderedSet)voiceResources
{
  return self->_voiceResources;
}

- (void)setVoiceResources:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (TTSSpeechString)processedSpeechString
{
  return self->_processedSpeechString;
}

- (void)setProcessedSpeechString:(id)a3
{
}

- (OS_dispatch_queue)synthesisQueue
{
  return self->_synthesisQueue;
}

- (void)setSynthesisQueue:(id)a3
{
}

- (AVAudioFormat)engineFormat
{
  return self->_engineFormat;
}

- (void)setEngineFormat:(id)a3
{
}

- (AVAudioFormat)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(id)a3
{
}

- (AVAudioConverter)bufferConverter
{
  return self->_bufferConverter;
}

- (void)setBufferConverter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferConverter, 0);
  objc_storeStrong((id *)&self->_outputFormat, 0);
  objc_storeStrong((id *)&self->_engineFormat, 0);
  objc_storeStrong((id *)&self->_synthesisQueue, 0);
  objc_storeStrong((id *)&self->_processedSpeechString, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_voiceResources, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ruleSetRunner, 0);
  objc_storeStrong((id *)&self->_neuralStyles, 0);
  objc_storeStrong((id *)&self->_currentNeuralStyle, 0);
}

- (void)initWithVoicePath:(os_log_t)log language:censorPlainText:delegate:feResourcePath:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22149B000, log, OS_LOG_TYPE_ERROR, "SiriTTSSynthesizer initialization exception", v1, 2u);
}

- (void)initWithVoicePath:(os_log_t)log language:censorPlainText:delegate:feResourcePath:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_22149B000, log, OS_LOG_TYPE_ERROR, "SiriTTSSynthesizer initialization error: %@", buf, 0xCu);
}

void __40__TTSSiriSynthWrapper_synthesizeString___block_invoke_cold_1(const std::logic_error *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = std::logic_error::what(a1);
  _os_log_fault_impl(&dword_22149B000, a2, OS_LOG_TYPE_FAULT, "Siri threw an exception instead of reporting an error via callback: %s", (uint8_t *)&v3, 0xCu);
}

- (void)loadVoiceResource:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22149B000, log, OS_LOG_TYPE_ERROR, "Siri resource load exception.", v1, 2u);
}

@end
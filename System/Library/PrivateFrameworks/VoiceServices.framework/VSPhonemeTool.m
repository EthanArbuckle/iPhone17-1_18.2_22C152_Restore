@interface VSPhonemeTool
+ (id)generateTTSPhonemes:(id)a3 voicePath:(id)a4 phonemeSystem:(int64_t)a5 error:(id *)a6;
@end

@implementation VSPhonemeTool

+ (id)generateTTSPhonemes:(id)a3 voicePath:(id)a4 phonemeSystem:(int64_t)a5 error:(id *)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if ((unint64_t)a5 > 2)
  {
    v13 = &stru_26C1B0528;
  }
  else
  {
    v11 = (char *)**((void **)&unk_2640E8368 + a5);
    v19[0] = 0;
    v19[1] = 0;
    uint64_t v20 = 0;
    std::string::basic_string[abi:ne180100]<0>(v17, (char *)[v9 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(__p, v11);
    MEMORY[0x210554040](v21, v17, __p);
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v18) < 0) {
      operator delete(v17[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
    SiriTTS::TextToPhoneme::text_to_phoneme();
    *(_OWORD *)v19 = *(_OWORD *)v17;
    uint64_t v20 = v18;
    HIBYTE(v18) = 0;
    LOBYTE(v17[0]) = 0;
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    if (v23) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    if (v20 >= 0) {
      v12 = v19;
    }
    else {
      v12 = (void **)v19[0];
    }
    v13 = [NSString stringWithUTF8String:v12];
    if (SHIBYTE(v20) < 0) {
      operator delete(v19[0]);
    }
  }

  return v13;
}

@end
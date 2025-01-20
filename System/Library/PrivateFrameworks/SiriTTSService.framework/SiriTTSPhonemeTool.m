@interface SiriTTSPhonemeTool
+ (id)generateTTSPhonemes:(id)a3 voicePath:(id)a4 phonemeSystem:(int64_t)a5 error:(id *)a6;
@end

@implementation SiriTTSPhonemeTool

+ (id)generateTTSPhonemes:(id)a3 voicePath:(id)a4 phonemeSystem:(int64_t)a5 error:(id *)a6
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if ((unint64_t)a5 >= 3)
  {
    if (a6)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown phoneme system: %d", a5);
      v28[0] = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      *a6 = [v14 errorWithDomain:@"SiriTTSPhonemeTool" code:1 userInfo:v16];

      a6 = 0;
    }
  }
  else
  {
    v12 = (char *)**((void **)&unk_1E5920238 + a5);
    v25[0] = 0;
    v25[1] = 0;
    uint64_t v26 = 0;
    std::string::basic_string[abi:ne180100]<0>(v20, (char *)[v10 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(__p, v12);
    MEMORY[0x19F3A31A0](v22, v20, __p);
    if (v19 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v21) < 0) {
      operator delete(v20[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v9 UTF8String]);
    SiriTTS::TextToPhoneme::text_to_phoneme();
    *(_OWORD *)v25 = *(_OWORD *)v20;
    uint64_t v26 = v21;
    HIBYTE(v21) = 0;
    LOBYTE(v20[0]) = 0;
    if (v19 < 0) {
      operator delete(__p[0]);
    }
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
    if (v23) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    if (v26 >= 0) {
      v13 = v25;
    }
    else {
      v13 = (void **)v25[0];
    }
    a6 = [NSString stringWithUTF8String:v13];
    if (SHIBYTE(v26) < 0) {
      operator delete(v25[0]);
    }
  }

  return a6;
}

@end
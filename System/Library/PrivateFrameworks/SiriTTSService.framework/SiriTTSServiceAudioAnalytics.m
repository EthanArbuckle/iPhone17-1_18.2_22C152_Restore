@interface SiriTTSServiceAudioAnalytics
+ (void)reportAnalytics:(int64_t)a3 tailspin:(id)a4;
@end

@implementation SiriTTSServiceAudioAnalytics

+ (void)reportAnalytics:(int64_t)a3 tailspin:(id)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  std::string::basic_string[abi:ne180100](__dst, (void *)[v4 cStringUsingEncoding:4], objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4));
  std::string::basic_string[abi:ne180100](__p, (void *)[@"DeviceSynthesisAction: low RTF is detected during synthesis." cStringUsingEncoding:4], objc_msgSend(@"DeviceSynthesisAction: low RTF is detected during synthesis.", "lengthOfBytesUsingEncoding:", 4));
  applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v51, "tailspin");
  if ((v44 & 0x80u) == 0) {
    v5 = __dst;
  }
  else {
    v5 = (void **)__dst[0];
  }
  if ((v44 & 0x80u) == 0) {
    CFIndex v6 = v44;
  }
  else {
    CFIndex v6 = (CFIndex)__dst[1];
  }
  v52[0] = CFStringCreateWithBytes(0, (const UInt8 *)v5, v6, 0x8000100u, 0);
  if (!v52[0])
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3A31C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)&v53, "issue_type");
  applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)&v54, "siritts");
  applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v55, "reason");
  if ((v42 & 0x80u) == 0) {
    v7 = __p;
  }
  else {
    v7 = (void **)__p[0];
  }
  if ((v42 & 0x80u) == 0) {
    CFIndex v8 = v42;
  }
  else {
    CFIndex v8 = (CFIndex)__p[1];
  }
  v56[0] = CFStringCreateWithBytes(0, (const UInt8 *)v7, v8, 0x8000100u, 0);
  if (!v56[0])
  {
    v39 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3A31C0](v39, "Could not construct");
    __cxa_throw(v39, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  keys = 0;
  v49 = 0;
  unint64_t v50 = 0;
  std::vector<void const*>::reserve((void **)&keys, 3uLL);
  values = 0;
  v46 = 0;
  unint64_t v47 = 0;
  std::vector<void const*>::reserve((void **)&values, 3uLL);
  for (uint64_t i = 0; i != 3; ++i)
  {
    v10 = *(void **)&v51[16 * i];
    v11 = v49;
    if ((unint64_t)v49 >= v50)
    {
      v13 = keys;
      uint64_t v14 = v49 - keys;
      unint64_t v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 61) {
        std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v16 = v50 - (void)keys;
      if ((uint64_t)(v50 - (void)keys) >> 2 > v15) {
        unint64_t v15 = v16 >> 2;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v15;
      }
      if (v17) {
        unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v17);
      }
      else {
        uint64_t v18 = 0;
      }
      v19 = (void **)(v17 + 8 * v14);
      *v19 = v10;
      v12 = v19 + 1;
      if (v11 != v13)
      {
        do
        {
          v20 = *--v11;
          *--v19 = v20;
        }
        while (v11 != v13);
        v11 = keys;
      }
      keys = v19;
      unint64_t v50 = v17 + 8 * v18;
      if (v11) {
        operator delete(v11);
      }
    }
    else
    {
      *v49 = v10;
      v12 = v11 + 1;
    }
    v49 = v12;
    v21 = (void *)v52[2 * i];
    v22 = v46;
    if ((unint64_t)v46 >= v47)
    {
      v24 = values;
      uint64_t v25 = v46 - values;
      unint64_t v26 = v25 + 1;
      if ((unint64_t)(v25 + 1) >> 61) {
        std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v27 = v47 - (void)values;
      if ((uint64_t)(v47 - (void)values) >> 2 > v26) {
        unint64_t v26 = v27 >> 2;
      }
      if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v28 = v26;
      }
      if (v28) {
        unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v28);
      }
      else {
        uint64_t v29 = 0;
      }
      v30 = (void **)(v28 + 8 * v25);
      *v30 = v21;
      v23 = v30 + 1;
      if (v22 != v24)
      {
        do
        {
          v31 = *--v22;
          *--v30 = v31;
        }
        while (v22 != v24);
        v22 = values;
      }
      values = v30;
      unint64_t v47 = v28 + 8 * v29;
      if (v22) {
        operator delete(v22);
      }
    }
    else
    {
      *v46 = v21;
      v23 = v22 + 1;
    }
    v46 = v23;
  }
  v32 = keys;
  v33 = values;
  CFDictionaryRef v34 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v34)
  {
    v40 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3A31C0](v40, "Could not construct");
    __cxa_throw(v40, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (v33) {
    operator delete(v33);
  }
  if (v32) {
    operator delete(v32);
  }
  for (uint64_t j = 0; j != -6; j -= 2)
  {
    v36 = (const void *)v56[j];
    if (v36) {
      CFRelease(v36);
    }
    v37 = *(const void **)&v55[j * 8];
    if (v37) {
      CFRelease(v37);
    }
  }
  CAReportingClientSendMessage();
  CFRelease(v34);
  if ((char)v42 < 0) {
    operator delete(__p[0]);
  }
  if ((char)v44 < 0) {
    operator delete(__dst[0]);
  }
}

@end
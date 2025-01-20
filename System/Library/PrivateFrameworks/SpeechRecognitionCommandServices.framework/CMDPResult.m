@interface CMDPResult
+ (vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>,)CMDPTokenSausageFromAFSpeechPhraseArray:(id)a2;
+ (vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>,)CMDPTokenSausageFromCFTokenSausage:(id)a2;
- (CMDPResult)initWithAFSpeechPhraseArray:(id)a3 forLocaleIdentifier:(id)a4;
- (CMDPResult)initWithTokenSausage:(__CFArray *)a3 forLocaleIdentifier:(id)a4;
- (CMDPResult)initWithTokenSausageVec:(void *)a3 forLocaleIdentifier:(id)a4;
- (id).cxx_construct;
- (id)createArrayFromNBestResults:(const void *)a3 withGrammarData:(id)a4;
- (id)initWithTokenSausageVec:forLocaleIdentifier:;
- (id)matchWithGrammars:(id)a3 winningIndex:(int *)a4 winningDistance:(float *)a5;
- (uint64_t)initWithTokenSausageVec:forLocaleIdentifier:;
- (void)initWithTokenSausageVec:forLocaleIdentifier:;
@end

@implementation CMDPResult

- (CMDPResult)initWithTokenSausage:(__CFArray *)a3 forLocaleIdentifier:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CMDPResult;
  v7 = [(CMDPResult *)&v11 init];
  if (v7)
  {
    +[CMDPResult CMDPTokenSausageFromCFTokenSausage:a3];
    v8 = [(CMDPResult *)v7 initWithTokenSausageVec:v10 forLocaleIdentifier:v6];
    v12 = (void **)v10;
    std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::__destroy_vector::operator()[abi:ne180100](&v12);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CMDPResult)initWithAFSpeechPhraseArray:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CMDPResult;
  v8 = [(CMDPResult *)&v11 init];
  if (v8)
  {
    +[CMDPResult CMDPTokenSausageFromAFSpeechPhraseArray:v6];
    v8 = [(CMDPResult *)v8 initWithTokenSausageVec:v10 forLocaleIdentifier:v7];
    v12 = (void **)v10;
    std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::__destroy_vector::operator()[abi:ne180100](&v12);
  }
  return v8;
}

- (CMDPResult)initWithTokenSausageVec:(void *)a3 forLocaleIdentifier:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = (__CFString *)a4;
  v8.receiver = self;
  v8.super_class = (Class)CMDPResult;
  if ([(CMDPResult *)&v8 init])
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (v5)
    {
      CFLocaleCreate(v6, v5);
      operator new();
    }
    CFLocaleCreate(v6, @"en_US");
    operator new();
  }

  return 0;
}

- (id)matchWithGrammars:(id)a3 winningIndex:(int *)a4 winningDistance:(float *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  *a4 = -1;
  *a5 = 3.4028e38;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    int v11 = 0;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        cmdp_fst_util::compose((uint64_t)self->_resultFst.__ptr_.__value_, [*(id *)(*((void *)&v18 + 1) + 8 * i) grammarFst], v17);
        BOOL isEmpty = cmdp_fst_util::isEmpty(v17[0]);
        uint64_t v15 = v17[0];
        if (!isEmpty) {
          cmdp_fst_util::shortestDistance(v17[0]);
        }
        v17[0] = 0;
        if (v15) {
          (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      v11 += i;
    }
    while (v10);
  }
  else
  {
  }
  return 0;
}

- (id)createArrayFromNBestResults:(const void *)a3 withGrammarData:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v46 = a4;
  id v43 = (id)objc_opt_new();
  v45 = objc_opt_new();
  v5 = *(uint64_t **)a3;
  if (*((void *)a3 + 1) == *(void *)a3) {
    std::vector<std::vector<std::pair<std::string,std::string>>>::__throw_out_of_range[abi:ne180100]();
  }
  id v44 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v6 = *v5;
  if (v5[1] == *v5) {
    goto LABEL_79;
  }
  unint64_t v7 = 0;
  char v8 = 0;
  char v42 = 0;
  id v9 = &_os_log_internal;
  do
  {
    uint64_t v10 = 48 * v7 + 95;
    while (1)
    {
      uint64_t v11 = v6 + v10;
      size_t v12 = strlen("<eps>");
      if (*(char *)(v6 + v10 - 48) < 0) {
        break;
      }
      if (v12 != *(unsigned __int8 *)(v6 + v10 - 48))
      {
        v14 = (const void *)(v6 + v10 - 71);
        goto LABEL_20;
      }
      if (v12 == -1) {
        goto LABEL_83;
      }
      if (memcmp((const void *)(v6 + v10 - 71), "<eps>", v12))
      {
        v14 = (const void *)(v6 + 48 * v7 + 24);
LABEL_20:
        uint64_t v15 = (char *)(v6 + v10 - 48);
        goto LABEL_21;
      }
LABEL_13:
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)(v11 - 95);
        if (*(char *)(v6 + v10 - 72) < 0) {
          v13 = (void *)*v13;
        }
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v13;
        _os_log_impl(&dword_23AB39000, v9, OS_LOG_TYPE_DEFAULT, "Deleting Added Word %s", (uint8_t *)&buf, 0xCu);
      }
      ++v7;
      uint64_t v6 = *v5;
      v10 += 48;
      char v8 = 1;
      if (0xAAAAAAAAAAAAAAABLL * ((v5[1] - *v5) >> 4) <= v7) {
        goto LABEL_78;
      }
    }
    if (v12 == *(void *)(v11 - 63))
    {
      if (v12 == -1) {
LABEL_83:
      }
        std::string::__throw_out_of_range[abi:ne180100]();
      v14 = *(const void **)(v6 + v10 - 71);
      if (memcmp(v14, "<eps>", v12)) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
    uint64_t v15 = (char *)(v6 + v10 - 48);
    v14 = *(const void **)(v6 + v10 - 71);
LABEL_21:
    v48 = [v46 objectAtIndex:atoi((const char *)v14)];
    if (v42)
    {
LABEL_24:
      char v42 = 1;
    }
    else
    {
      v16 = [v48 commandIdentifier];
      BOOL v17 = v16 == 0;

      if (!v17)
      {
        long long v18 = [v48 commandIdentifier];
        [v43 setObject:v18 forKey:kCMDPMatchedCommandIdentifier[0]];

        goto LABEL_24;
      }
      char v42 = 0;
    }
    long long v19 = (const char *)(v6 + v10 - 95);
    size_t v20 = strlen("<eps>");
    if ((*(char *)(v6 + v10 - 72) & 0x80000000) == 0)
    {
      if (v20 == *(unsigned __int8 *)(v6 + v10 - 72))
      {
        if (v20 == -1) {
LABEL_85:
        }
          std::string::__throw_out_of_range[abi:ne180100]();
        goto LABEL_32;
      }
      goto LABEL_39;
    }
    if (v20 != *(void *)(v6 + v10 - 87))
    {
      long long v19 = *(const char **)v19;
      goto LABEL_39;
    }
    if (v20 == -1) {
      goto LABEL_85;
    }
    long long v19 = *(const char **)v19;
LABEL_32:
    if (!memcmp(v19, "<eps>", v20))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        long long v21 = (void *)(v6 + v10 - 71);
        if (*v15 < 0) {
          long long v21 = (void *)*v21;
        }
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v21;
        _os_log_impl(&dword_23AB39000, v9, OS_LOG_TYPE_DEFAULT, "Adding Deleted Word %s", (uint8_t *)&buf, 0xCu);
        v22 = 0;
        char v8 = 1;
      }
      else
      {
        v22 = 0;
        char v8 = 1;
      }
    }
    else
    {
LABEL_39:
      v22 = (long long *)*((void *)self->_resultNodes.__begin_ + atoi(v19));
    }
    v47 = [v48 builtInLMIdentifier];
    ++v7;
    uint64_t v23 = *v5;
    if (0xAAAAAAAAAAAAAAABLL * ((v5[1] - *v5) >> 4) <= v7)
    {
      v26 = 0;
    }
    else
    {
      v40 = v22;
      size_t v24 = strlen("<eps>");
      v25 = (const char *)(v23 + v10 - 23);
      if ((*(char *)(v23 + v10) & 0x80000000) == 0)
      {
        if (v24 == *(unsigned __int8 *)(v23 + v10))
        {
          if (v24 == -1) {
LABEL_86:
          }
            std::string::__throw_out_of_range[abi:ne180100]();
          goto LABEL_50;
        }
        goto LABEL_54;
      }
      if (v24 != *(void *)(v23 + v10 - 15))
      {
        v25 = *(const char **)v25;
        goto LABEL_54;
      }
      if (v24 == -1) {
        goto LABEL_86;
      }
      v25 = *(const char **)v25;
LABEL_50:
      if (!memcmp(v25, "<eps>", v24))
      {
        v26 = 0;
        v22 = v40;
      }
      else
      {
LABEL_54:
        v27 = [v46 objectAtIndex:atoi(v25)];
        [v27 builtInLMIdentifier];
        v26 = v22 = v40;
      }
    }
    v28 = [v48 word];
    BOOL v29 = v28 == 0;

    if (!v29)
    {
      v30 = [v48 word];
      goto LABEL_57;
    }
    if (v22)
    {
      v31 = NSString;
      if (*((char *)v22 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&buf, *(const std::string::value_type **)v22, *((void *)v22 + 1));
      }
      else
      {
        long long v32 = *v22;
        buf.__r_.__value_.__r.__words[2] = *((void *)v22 + 2);
        *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v32;
      }
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_std::string buf = &buf;
      }
      else {
        p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
      }
      v30 = [v31 stringWithUTF8String:p_buf];
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
LABEL_57:
      if (v47)
      {
        [v44 appendString:v30];
        if (v26 && v47 == v26)
        {
          [v44 appendString:@" "];
        }
        else
        {
          v34 = NSDictionary;
          v35 = [NSString stringWithString:v44];
          v36 = objc_msgSend(v34, "dictionaryWithObjectsAndKeys:", v35, kCMDPMatchedElementText[0], v47, kCMDPMatchedElementCategoryIdentifier, 0);

          [v45 addObject:v36];
          [v44 setString:&stru_26EE2ED18];
        }
      }
      else
      {
        v33 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v30, kCMDPMatchedElementText[0], 0);
        [v45 addObject:v33];
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CMDPResult createArrayFromNBestResults:withGrammarData:](&v49, v50);
      }
      v30 = 0;
    }

    uint64_t v6 = *v5;
  }
  while (0xAAAAAAAAAAAAAAABLL * ((v5[1] - *v5) >> 4) > v7);
  if (v8)
  {
LABEL_78:
    v38 = kCMDPClosestMatchedElements;
    goto LABEL_80;
  }
LABEL_79:
  v38 = kCMDPMatchedElements;
LABEL_80:
  [v43 setObject:v45 forKey:*v38];

  return v43;
}

+ (vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>,)CMDPTokenSausageFromCFTokenSausage:(id)a2
{
  v4 = a4;
  CFIndex v5 = 0;
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  while (1)
  {
    result = (vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>, std::allocator<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>> *)CFArrayGetCount(v4);
    if ((uint64_t)result <= v5) {
      break;
    }
    memset(v16, 0, sizeof(v16));
    CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v4, v5);
    for (CFIndex i = 0; i < CFArrayGetCount(ValueAtIndex); ++i)
    {
      CFArrayRef v9 = (const __CFArray *)CFArrayGetValueAtIndex(ValueAtIndex, i);
      memset(v15, 0, sizeof(v15));
      if (CFArrayGetCount(v9) > 0)
      {
        uint64_t v10 = CFArrayGetValueAtIndex(v9, 0);
        CFStringRef v11 = (const __CFString *)MEMORY[0x23ECC2150]();
        cmdp_string::CreateCppStringFromCFString(v11, 0, __p);
        MEMORY[0x23ECC2140](v10);
        MEMORY[0x23ECC2120](v10);
        MEMORY[0x23ECC2130](v10);
        MEMORY[0x23ECC2110](v10);
        EARCSpeechRecognitionTokenHasSpaceAfter();
        operator new();
      }
      std::vector<std::vector<std::unique_ptr<CMDPToken>>>::push_back[abi:ne180100](v16, (uint64_t)v15);
      v17.__r_.__value_.__r.__words[0] = (std::string::size_type)v15;
      std::vector<std::unique_ptr<CMDPToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
    }
    std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::push_back[abi:ne180100]((uint64_t *)retstr, (uint64_t)v16);
    v17.__r_.__value_.__r.__words[0] = (std::string::size_type)v16;
    std::vector<std::vector<std::unique_ptr<CMDPToken>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
    ++v5;
    v4 = a4;
  }
  return result;
}

+ (vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>,)CMDPTokenSausageFromAFSpeechPhraseArray:(id)a2
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v6)
  {
    uint64_t v14 = *(void *)v31;
    do
    {
      uint64_t v16 = 0;
      uint64_t v13 = v6;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
        memset(v29, 0, sizeof(v29));
        char v8 = [v7 interpretations];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v17 = v8;
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v36 count:16];
        if (v19)
        {
          uint64_t v18 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v26 != v18) {
                objc_enumerationMutation(v17);
              }
              id v9 = *(id *)(*((void *)&v25 + 1) + 8 * i);
              memset(v24, 0, sizeof(v24));
              id v20 = v9;
              uint64_t v10 = [v9 tokens];
              memset(v23, 0, sizeof(v23));
              id v22 = v10;
              if ([v22 countByEnumeratingWithState:v23 objects:v35 count:16])
              {
                id v11 = **((id **)&v23[0] + 1);
                [v11 text];
                [ objc_claimAutoreleasedReturnValue() UTF8String];
                [v11 startTime];
                [v11 endTime];
                [v11 silenceStartTime];
                [v11 confidenceScore];
                [v11 removeSpaceAfter];
                [v11 removeSpaceBefore];
                operator new();
              }

              std::vector<std::vector<std::unique_ptr<CMDPToken>>>::push_back[abi:ne180100](v29, (uint64_t)v24);
              __p = v24;
              std::vector<std::unique_ptr<CMDPToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v36 count:16];
          }
          while (v19);
        }

        std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::push_back[abi:ne180100]((uint64_t *)retstr, (uint64_t)v29);
        __p = v29;
        std::vector<std::vector<std::unique_ptr<CMDPToken>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        ++v16;
      }
      while (v16 != v13);
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v6);
  }

  return result;
}

- (void).cxx_destruct
{
  std::__tree<std::string>::destroy((uint64_t)&self->_symbol_set, (char *)self->_symbol_set.__tree_.__pair1_.__value_.__left_);
  p_resultNodes = &self->_resultNodes;
  std::vector<std::unique_ptr<CMDPToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_resultNodes);
  std::unique_ptr<CMDPNormalizer>::reset[abi:ne180100](&self->_normalizer.__ptr_.__value_, 0);
  value = self->_resultFst.__ptr_.__value_;
  self->_resultFst.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void *))(*(void *)value + 8))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 7) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = (char *)self + 56;
  return self;
}

- (uint64_t)initWithTokenSausageVec:forLocaleIdentifier:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)initWithTokenSausageVec:forLocaleIdentifier:
{
}

- (id)initWithTokenSausageVec:forLocaleIdentifier:
{
  *a2 = &unk_26EE21960;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (void)createArrayFromNBestResults:(unsigned char *)a1 withGrammarData:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  _os_log_error_impl(&dword_23AB39000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Null RESULT received", v2, 2u);
}

+ (void)CMDPTokenSausageFromCFTokenSausage:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  _os_log_error_impl(&dword_23AB39000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Null token received", v2, 2u);
}

@end
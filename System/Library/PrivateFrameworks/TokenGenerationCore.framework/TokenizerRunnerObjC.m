@interface TokenizerRunnerObjC
+ (NSString)sentencePieceErrorDomain;
- (BOOL)isByte:(int64_t)a3;
- (TokenizerRunnerObjC)initWithTokenizerPath:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)detokenize:(id)a3 error:(id *)a4;
- (id)textForTokenID:(int64_t)a3;
- (id)tokenize:(id)a3 error:(id *)a4;
- (id)vocabulary;
- (int64_t)longestTokenLength;
- (int64_t)tokenIDForText:(id)a3;
- (int64_t)vocabularyCount;
- (void)enumeratePrefixTokenIDsForPrefix:(id)a3 block:(id)a4;
- (void)enumerateTokenIDsForDecodedPrefix:(id)a3 block:(id)a4;
- (void)enumerateTokenIDsForRawPrefix:(id)a3 block:(id)a4;
- (void)prefixMatchesForText:(id)a3 block:(id)a4;
@end

@implementation TokenizerRunnerObjC

+ (NSString)sentencePieceErrorDomain
{
  return (NSString *)@"SentencePiece";
}

- (TokenizerRunnerObjC)initWithTokenizerPath:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TokenizerRunnerObjC;
  id v7 = [(TokenizerRunnerObjC *)&v22 init];
  if (!v7) {
    goto LABEL_13;
  }
  os_log_t v8 = os_log_create("com.apple.tokengenerationinference", "E5LanguageModel");
  v9 = (void *)*((void *)v7 + 16);
  *((void *)v7 + 16) = v8;

  v10 = *((void *)v7 + 16);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v6;
    _os_log_impl(&dword_25F950000, v10, OS_LOG_TYPE_DEFAULT, "Initializing tokenizer with path: %{public}@", buf, 0xCu);
  }
  strlen((const char *)[v6 UTF8String]);
  (*(void (**)(uint64_t *__return_ptr))(*((void *)v7 + 1) + 16))(&v21);
  if (!v21)
  {
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v21);
LABEL_13:
    v19 = (TokenizerRunnerObjC *)v7;
    goto LABEL_14;
  }
  v11 = *((id *)v7 + 16);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = sentencepiece::util::Status::error_message((sentencepiece::util::Status *)&v21);
    -[TokenizerRunnerObjC initWithTokenizerPath:error:]((uint64_t)v12, (uint64_t)buf, v11);
  }

  v13 = *((void *)v7 + 16);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[TokenizerRunnerObjC initWithTokenizerPath:error:](v13);
  }
  if (a4)
  {
    v14 = (void *)MEMORY[0x263F087E8];
    v15 = +[TokenizerRunnerObjC sentencePieceErrorDomain];
    int v16 = sentencepiece::util::Status::code((sentencepiece::util::Status *)&v21);
    uint64_t v23 = *MEMORY[0x263F08320];
    v17 = [NSString stringWithFormat:@"Failed to load tokenizer."];
    v24 = v17;
    v18 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    *a4 = [v14 errorWithDomain:v15 code:v16 userInfo:v18];
  }
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v21);
  v19 = 0;
LABEL_14:

  return v19;
}

- (id)vocabulary
{
  v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = 0;
  p_processor = &self->_processor;
  unint64_t v6 = 0x263F08000uLL;
  while ((int)v4 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor))
  {
    uint64_t v7 = (*((uint64_t (**)(SentencePieceProcessor *, uint64_t))p_processor->_vptr$SentencePieceProcessor + 64))(p_processor, v4);
    v9 = (void *)v8;
    if (v8 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    v10 = (const void *)v7;
    v11 = *(void **)(v6 + 2880);
    if (v8 >= 0x17)
    {
      unint64_t v13 = v6;
      uint64_t v14 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17) {
        uint64_t v14 = v8 | 7;
      }
      uint64_t v15 = v14 + 1;
      v12 = (void **)operator new(v14 + 1);
      __dst[1] = v9;
      int64_t v20 = v15 | 0x8000000000000000;
      __dst[0] = v12;
      unint64_t v6 = v13;
LABEL_10:
      memmove(v12, v10, (size_t)v9);
      goto LABEL_11;
    }
    HIBYTE(v20) = v8;
    v12 = __dst;
    if (v8) {
      goto LABEL_10;
    }
LABEL_11:
    *((unsigned char *)v9 + (void)v12) = 0;
    if (v20 >= 0) {
      int v16 = __dst;
    }
    else {
      int v16 = (void **)__dst[0];
    }
    v17 = [v11 stringWithUTF8String:v16];
    if (SHIBYTE(v20) < 0) {
      operator delete(__dst[0]);
    }
    [v3 addObject:v17];

    uint64_t v4 = (v4 + 1);
  }
  return v3;
}

- (int64_t)longestTokenLength
{
  p_processor = &self->_processor;
  if ((*((int (**)(SentencePieceProcessor *, SEL))self->_processor._vptr$SentencePieceProcessor + 62))(&self->_processor, a2) < 1)return 0; {
  unint64_t v3 = 0;
  }
  uint64_t v4 = 0;
  do
  {
    (*((void (**)(SentencePieceProcessor *, uint64_t))p_processor->_vptr$SentencePieceProcessor + 64))(p_processor, v4);
    if (v3 <= v5) {
      unint64_t v3 = v5;
    }
    uint64_t v4 = (v4 + 1);
  }
  while ((int)v4 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor));
  return v3;
}

- (int64_t)vocabularyCount
{
  return (*((int (**)(void))self->_processor._vptr$SentencePieceProcessor + 62))();
}

- (id)tokenize:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  __p = 0;
  objc_super v22 = 0;
  uint64_t v23 = 0;
  id v6 = a3;
  strlen((const char *)[v6 UTF8String]);
  (*((void (**)(uint64_t *__return_ptr))self->_processor._vptr$SentencePieceProcessor + 18))(&v20);
  if (v20)
  {
    uint64_t v7 = *(id *)&self->_processor.mmappable_data_.__r_.var0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = sentencepiece::util::Status::error_message((sentencepiece::util::Status *)&v20);
      -[TokenizerRunnerObjC tokenize:error:]((uint64_t)v8, (uint64_t)v26, v7);
    }

    if (a4)
    {
      v9 = (void *)MEMORY[0x263F087E8];
      v10 = +[TokenizerRunnerObjC sentencePieceErrorDomain];
      int v11 = sentencepiece::util::Status::code((sentencepiece::util::Status *)&v20);
      uint64_t v24 = *MEMORY[0x263F08320];
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to tokenize text: %{public}s", sentencepiece::util::Status::error_message((sentencepiece::util::Status *)&v20));
      v25 = v12;
      unint64_t v13 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      *a4 = [v9 errorWithDomain:v10 code:v11 userInfo:v13];
    }
    uint64_t v14 = 0;
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v14 = (void *)[v15 initWithCapacity:(v22 - (unsigned char *)__p) >> 2];
    int v16 = (unsigned int *)__p;
    if (v22 != __p)
    {
      unint64_t v17 = 0;
      do
      {
        v18 = [NSNumber numberWithInt:v16[v17]];
        [v14 setObject:v18 atIndexedSubscript:v17];

        ++v17;
        int v16 = (unsigned int *)__p;
      }
      while (v17 < (v22 - (unsigned char *)__p) >> 2);
    }
  }
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v20);
  if (__p)
  {
    objc_super v22 = __p;
    operator delete(__p);
  }

  return v14;
}

- (id)detokenize:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  memset(&v29, 0, sizeof(v29));
  std::vector<int>::resize(&v29, [v6 count]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) intValue];
        v29.__begin_[v9++] = v12;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v8);
  }

  __p[0] = 0;
  __p[1] = 0;
  uint64_t v24 = 0;
  (*((void (**)(uint64_t *__return_ptr))self->_processor._vptr$SentencePieceProcessor + 21))(&v22);
  if (v22)
  {
    unint64_t v13 = *(id *)&self->_processor.mmappable_data_.__r_.var0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = sentencepiece::util::Status::error_message((sentencepiece::util::Status *)&v22);
      -[TokenizerRunnerObjC detokenize:error:]((uint64_t)v14, (uint64_t)v32, v13);
    }

    if (a4)
    {
      id v15 = (void *)MEMORY[0x263F087E8];
      int v16 = +[TokenizerRunnerObjC sentencePieceErrorDomain];
      int v17 = sentencepiece::util::Status::code((sentencepiece::util::Status *)&v22);
      uint64_t v30 = *MEMORY[0x263F08320];
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to detokenize tokens: %{public}s", sentencepiece::util::Status::error_message((sentencepiece::util::Status *)&v22));
      v31 = v18;
      v19 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *a4 = [v15 errorWithDomain:v16 code:v17 userInfo:v19];

      a4 = 0;
    }
  }
  else
  {
    if (v24 >= 0) {
      uint64_t v20 = __p;
    }
    else {
      uint64_t v20 = (void **)__p[0];
    }
    a4 = [NSString stringWithUTF8String:v20];
  }
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v22);
  if (SHIBYTE(v24) < 0) {
    operator delete(__p[0]);
  }
  if (v29.__begin_)
  {
    v29.__end_ = v29.__begin_;
    operator delete(v29.__begin_);
  }

  return a4;
}

- (id)textForTokenID:(int64_t)a3
{
  uint64_t v3 = (*((uint64_t (**)(void))self->_processor._vptr$SentencePieceProcessor + 64))();
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v5 = (const void *)v3;
  id v6 = (void *)v4;
  if (v4 >= 0x17)
  {
    uint64_t v8 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v8 = v4 | 7;
    }
    uint64_t v9 = v8 + 1;
    id v7 = (void **)operator new(v8 + 1);
    __dst[1] = v6;
    int64_t v14 = v9 | 0x8000000000000000;
    __dst[0] = v7;
    goto LABEL_8;
  }
  HIBYTE(v14) = v4;
  id v7 = __dst;
  if (v4) {
LABEL_8:
  }
    memmove(v7, v5, (size_t)v6);
  *((unsigned char *)v6 + (void)v7) = 0;
  if (v14 >= 0) {
    uint64_t v10 = __dst;
  }
  else {
    uint64_t v10 = (void **)__dst[0];
  }
  int v11 = [NSString stringWithUTF8String:v10];
  if (SHIBYTE(v14) < 0) {
    operator delete(__dst[0]);
  }
  return v11;
}

- (int64_t)tokenIDForText:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (const char *)[v4 UTF8String];
  size_t v6 = strlen(v5);
  int64_t v7 = (*((int (**)(SentencePieceProcessor *, const char *, size_t))self->_processor._vptr$SentencePieceProcessor
        + 63))(&self->_processor, v5, v6);

  return v7;
}

- (BOOL)isByte:(int64_t)a3
{
  return (*((uint64_t (**)(void))self->_processor._vptr$SentencePieceProcessor + 69))();
}

- (void)prefixMatchesForText:(id)a3 block:(id)a4
{
  id v6 = a3;
  int64_t v7 = (void (**)(id, void, void **))a4;
  long long v26 = 0;
  long long v27 = 0;
  uint64_t v28 = 0;
  id v8 = v6;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
  uint64_t v10 = self->_processor._vptr$SentencePieceProcessor;
  p_processor = &self->_processor;
  ((void (*)(uint64_t *__return_ptr, SentencePieceProcessor *, void **, uint64_t, void **))v10[75])(&v25, p_processor, __p, 0xFFFFFFFFLL, &v26);
  if (v24 < 0) {
    operator delete(__p[0]);
  }
  if (v25)
  {
    int v11 = (const char *)[v8 UTF8String];
    size_t v12 = strlen(v11);
    uint64_t v13 = 0;
    LOBYTE(__p[0]) = 0;
    while (v13 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor))
    {
      int64_t v14 = (unsigned __int8 *)(*((uint64_t (**)(SentencePieceProcessor *, uint64_t))p_processor->_vptr$SentencePieceProcessor
                                + 64))(p_processor, v13);
      int v16 = v11;
      if (v12)
      {
        int v16 = v11;
        if (v15)
        {
          uint64_t v17 = v15 - 1;
          size_t v18 = v12 - 1;
          int v16 = v11;
          do
          {
            if (*(unsigned __int8 *)v16 != *v14) {
              break;
            }
            ++v16;
            if (!v18) {
              break;
            }
            ++v14;
            --v18;
          }
          while (v17--);
        }
      }
      if (&v11[v12] == v16)
      {
        v7[2](v7, v13, __p);
        if (LOBYTE(__p[0])) {
          break;
        }
      }
      ++v13;
    }
  }
  else
  {
    LOBYTE(__p[0]) = 0;
    uint64_t v20 = v27;
    if (v26 != v27)
    {
      uint64_t v21 = (char *)v26 + 4;
      do
      {
        v7[2](v7, *((int *)v21 - 1), __p);
        if (LOBYTE(__p[0])) {
          BOOL v22 = 1;
        }
        else {
          BOOL v22 = v21 == v20;
        }
        v21 += 4;
      }
      while (!v22);
    }
  }
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v25);
  if (v26)
  {
    long long v27 = (char *)v26;
    operator delete(v26);
  }
}

- (void)enumeratePrefixTokenIDsForPrefix:(id)a3 block:(id)a4
{
  id v6 = a3;
  int64_t v7 = (char *)a4;
  id v24 = v6;
  uint64_t v30 = (char *)[v24 UTF8String];
  uint64_t v8 = 0;
  size_t v31 = strlen(v30);
  p_processor = &self->_processor;
  uint64_t v10 = v7 + 16;
  unint64_t v11 = 0x263F08000uLL;
  uint64_t v25 = v7;
  while (v8 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor))
  {
    uint64_t v28 = (void *)(*((uint64_t (**)(SentencePieceProcessor *, uint64_t))p_processor->_vptr$SentencePieceProcessor
                   + 64))(p_processor, v8);
    size_t v29 = v12;
    if (!v12) {
      goto LABEL_24;
    }
    if (!std::string_view::compare[abi:ne180100](&v28, 0, v31, v30, v31))
    {
      (*((void (**)(char *, uint64_t, __CFString *))v7 + 2))(v7, v8, &stru_270BCF0C8);
      goto LABEL_24;
    }
    if (std::string_view::compare[abi:ne180100](&v30, 0, v29, v28, v29)) {
      goto LABEL_24;
    }
    size_t v13 = v29;
    if (v31 < v29) {
      std::__throw_out_of_range[abi:ne180100]("string_view::substr");
    }
    if (v31 - v29 >= v31) {
      size_t v14 = v31;
    }
    else {
      size_t v14 = v31 - v29;
    }
    if (v14 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v30;
    int v16 = *(void **)(v11 + 2880);
    if (v14 >= 0x17)
    {
      size_t v18 = v10;
      unint64_t v19 = v11;
      uint64_t v20 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17) {
        uint64_t v20 = v14 | 7;
      }
      uint64_t v21 = v20 + 1;
      uint64_t v17 = (void **)operator new(v20 + 1);
      __dst[1] = (void *)v14;
      int64_t v27 = v21 | 0x8000000000000000;
      __dst[0] = v17;
      unint64_t v11 = v19;
      uint64_t v10 = v18;
      int64_t v7 = v25;
    }
    else
    {
      HIBYTE(v27) = v14;
      uint64_t v17 = __dst;
      if (!v14) {
        goto LABEL_19;
      }
    }
    memmove(v17, &v15[v13], v14);
LABEL_19:
    *((unsigned char *)v17 + v14) = 0;
    if (v27 >= 0) {
      BOOL v22 = __dst;
    }
    else {
      BOOL v22 = (void **)__dst[0];
    }
    uint64_t v23 = [v16 stringWithUTF8String:v22];
    (*((void (**)(char *, uint64_t, void *))v7 + 2))(v7, v8, v23);

    if (SHIBYTE(v27) < 0) {
      operator delete(__dst[0]);
    }
LABEL_24:
    ++v8;
  }
}

- (void)enumerateTokenIDsForRawPrefix:(id)a3 block:(id)a4
{
  id v6 = a3;
  int64_t v7 = (char *)a4;
  id v23 = v6;
  uint64_t v8 = (char *)[v23 UTF8String];
  size_t v9 = strlen(v8);
  uint64_t v10 = 0;
  p_processor = &self->_processor;
  size_t v12 = v7 + 16;
  id v24 = v7;
  while (v10 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor))
  {
    uint64_t v27 = (*((uint64_t (**)(SentencePieceProcessor *, uint64_t))p_processor->_vptr$SentencePieceProcessor + 64))(p_processor, v10);
    size_t v28 = v13;
    if (!v13 || std::string_view::compare[abi:ne180100](&v27, 0, v9, v8, v9)) {
      goto LABEL_22;
    }
    if (v28 < v9) {
      std::__throw_out_of_range[abi:ne180100]("string_view::substr");
    }
    if (v28 - v9 >= v28) {
      size_t v14 = v28;
    }
    else {
      size_t v14 = v28 - v9;
    }
    if (v14 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v27;
    int v16 = NSString;
    if (v14 >= 0x17)
    {
      size_t v18 = v12;
      uint64_t v19 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17) {
        uint64_t v19 = v14 | 7;
      }
      uint64_t v20 = v19 + 1;
      uint64_t v17 = (void **)operator new(v19 + 1);
      __dst[1] = (void *)v14;
      int64_t v26 = v20 | 0x8000000000000000;
      __dst[0] = v17;
      size_t v12 = v18;
      int64_t v7 = v24;
    }
    else
    {
      HIBYTE(v26) = v14;
      uint64_t v17 = __dst;
      if (!v14) {
        goto LABEL_17;
      }
    }
    memmove(v17, (const void *)(v15 + v9), v14);
LABEL_17:
    *((unsigned char *)v17 + v14) = 0;
    if (v26 >= 0) {
      uint64_t v21 = __dst;
    }
    else {
      uint64_t v21 = (void **)__dst[0];
    }
    BOOL v22 = [v16 stringWithUTF8String:v21];
    (*((void (**)(char *, uint64_t, void *))v7 + 2))(v7, v10, v22);

    if (SHIBYTE(v26) < 0) {
      operator delete(__dst[0]);
    }
LABEL_22:
    ++v10;
  }
}

- (void)enumerateTokenIDsForDecodedPrefix:(id)a3 block:(id)a4
{
  id v6 = a3;
  int64_t v7 = (void (**)(id, void, void *))a4;
  id v8 = v6;
  size_t v9 = (char *)[v8 UTF8String];
  std::string::size_type v10 = strlen(v9);
  uint64_t v11 = 0;
  memset(&__str, 0, sizeof(__str));
  p_processor = &self->_processor;
  while (v11 < (*((int (**)(SentencePieceProcessor *))p_processor->_vptr$SentencePieceProcessor + 62))(p_processor))
  {
    size_t v13 = operator new(4uLL);
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
    _DWORD *v13 = v11;
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v13 + 1);
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v13 + 1);
    (*((void (**)(std::string *__return_ptr, SentencePieceProcessor *, std::string *, std::string *))p_processor->_vptr$SentencePieceProcessor
     + 21))(&v21, p_processor, &__p, &__str);
    std::string::size_type v14 = v21.__r_.__value_.__r.__words[0];
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v21);
    if (__p.__r_.__value_.__r.__words[0])
    {
      __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (!v14)
    {
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::size_type size = __str.__r_.__value_.__l.__size_;
        if (!__str.__r_.__value_.__l.__size_) {
          goto LABEL_6;
        }
        p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      else
      {
        std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        if (!*((unsigned char *)&__str.__r_.__value_.__s + 23)) {
          goto LABEL_6;
        }
        p_str = &__str;
      }
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)p_str;
      __p.__r_.__value_.__l.__size_ = size;
      if (!std::string_view::compare[abi:ne180100](&__p, 0, v10, v9, v10))
      {
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v17 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v17 = __str.__r_.__value_.__l.__size_;
        }
        std::string::basic_string(&__p, &__str, v10, v17, (std::allocator<char> *)&v21);
        size_t v18 = NSString;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v21, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else {
          std::string v21 = __p;
        }
        if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v19 = &v21;
        }
        else {
          uint64_t v19 = (std::string *)v21.__r_.__value_.__r.__words[0];
        }
        uint64_t v20 = objc_msgSend(v18, "stringWithUTF8String:", v19, *(_OWORD *)&v21.__r_.__value_.__l.__data_, v21.__r_.__value_.__r.__words[2]);
        v7[2](v7, v11, v20);

        if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v21.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
    }
LABEL_6:
    ++v11;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor.mmappable_data_.__r_.var0, 0);
  sentencepiece::SentencePieceProcessor::~SentencePieceProcessor((sentencepiece::SentencePieceProcessor *)&self->_processor);
}

- (id).cxx_construct
{
  return self;
}

- (void)initWithTokenizerPath:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25F950000, log, OS_LOG_TYPE_ERROR, "Failed to load tokenizer.", v1, 2u);
}

- (void)initWithTokenizerPath:(NSObject *)a3 error:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136446210;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_25F950000, a2, a3, "Failed to load tokenizer error message: %{public}s", (uint8_t *)a2);
}

- (void)tokenize:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136446210;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_25F950000, a2, a3, "Failed to tokenize text: %{public}s", (uint8_t *)a2);
}

- (void)detokenize:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136446210;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_25F950000, a2, a3, "Failed to detokenize tokens: %{public}s", (uint8_t *)a2);
}

@end
@interface FTStartSpeechTranslationLoggingRequest
- (FTLanguageDetected)detected_locale;
- (FTStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3;
- (FTStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationLoggingRequest *)a4;
- (FTStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationLoggingRequest *)a4 verify:(BOOL)a5;
- (FTTranslationLocalePair)translation_locale_pair;
- (NSArray)senses;
- (NSArray)user_interacted_senses;
- (NSString)conversation_id;
- (NSString)request_id;
- (NSString)user_selected_locale;
- (NSString)user_selected_sense;
- (Offset<siri::speech::schema_fb::StartSpeechTranslationLoggingRequest>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)senses_objectAtIndex:(unint64_t)a3;
- (id)user_interacted_senses_objectAtIndex:(unint64_t)a3;
- (unint64_t)senses_count;
- (unint64_t)user_interacted_senses_count;
- (void)senses_enumerateObjectsUsingBlock:(id)a3;
- (void)user_interacted_senses_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTStartSpeechTranslationLoggingRequest

- (FTStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3
{
  return [(FTStartSpeechTranslationLoggingRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTStartSpeechTranslationLoggingRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationLoggingRequest *)a4
{
  return [(FTStartSpeechTranslationLoggingRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationLoggingRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTStartSpeechTranslationLoggingRequest;
  v10 = [(FTStartSpeechTranslationLoggingRequest *)&v26 init];
  if (!v10) {
    goto LABEL_13;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_14;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)[*p_data bytes];
    a4 = (const StartSpeechTranslationLoggingRequest *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_13;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_14;
  }
  uint64_t v17 = [*p_data bytes];
  uint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_26027B7E0;
  uint64_t v24 = 0;
  char v25 = 1;
  v19 = (siri::speech::schema_fb::StartSpeechTranslationLoggingRequest *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::StartSpeechTranslationLoggingRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0; {
  else
  }
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)conversation_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)request_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (FTTranslationLocalePair)translation_locale_pair
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_locale_pair"];
  if (!v3)
  {
    uint64_t v4 = [FTTranslationLocalePair alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (uint64_t v7 = *(unsigned __int16 *)v6[8].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    uint64_t v3 = [(FTTranslationLocalePair *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translation_locale_pair"];
  }
  return v3;
}

- (FTLanguageDetected)detected_locale
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"detected_locale"];
  if (!v3)
  {
    uint64_t v4 = [FTLanguageDetected alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    uint64_t v3 = [(FTLanguageDetected *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"detected_locale"];
  }
  return v3;
}

- (NSString)user_selected_locale
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)senses
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"senses"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__FTStartSpeechTranslationLoggingRequest_senses__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTStartSpeechTranslationLoggingRequest *)self senses_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"senses"];
  }
  return (NSArray *)v3;
}

uint64_t __48__FTStartSpeechTranslationLoggingRequest_senses__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)senses_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"senses"];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    v8 = (void *)v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0xFu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[14].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      unint64_t v13 = (unsigned int *)(v12 + 4 + *(unsigned int *)(v12 + 4));
      uint64_t v7 = [[NSString alloc] initWithBytes:v13 + 1 length:*v13 encoding:4];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)senses_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"senses"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xFu && (uint64_t v8 = *(unsigned __int16 *)v7[14].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)senses_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"senses"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xFu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[14].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        v10 = &root[v9 + *(unsigned int *)root[v9].var0];
        uint64_t v11 = *(unsigned int *)v10->var0;
        if (v11)
        {
          uint64_t v12 = 4 - 4 * v11;
          uint64_t v13 = 1;
          uint64_t v14 = 8;
          do
          {
            var0 = (unsigned int *)v10[4 * v13].var0;
            v16 = (void *)[[NSString alloc] initWithBytes:&v10[v14 + *var0] length:*(unsigned int *)((char *)var0 + *var0) encoding:4];
            v4[2](v4, v16, v13 - 1, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            uint64_t v18 = v12 + v14;
            ++v13;
            v14 += 4;
          }
          while (v18 != 8);
        }
      }
    }
  }
}

- (NSString)user_selected_sense
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)user_interacted_senses
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_interacted_senses"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64__FTStartSpeechTranslationLoggingRequest_user_interacted_senses__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTStartSpeechTranslationLoggingRequest *)self user_interacted_senses_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_interacted_senses"];
  }
  return (NSArray *)v3;
}

uint64_t __64__FTStartSpeechTranslationLoggingRequest_user_interacted_senses__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)user_interacted_senses_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_interacted_senses"];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = (void *)v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0x13u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[18].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      uint64_t v13 = (unsigned int *)(v12 + 4 + *(unsigned int *)(v12 + 4));
      uint64_t v7 = [[NSString alloc] initWithBytes:v13 + 1 length:*v13 encoding:4];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)user_interacted_senses_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_interacted_senses"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0x13u && (uint64_t v8 = *(unsigned __int16 *)v7[18].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)user_interacted_senses_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_interacted_senses"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0x13u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[18].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        v10 = &root[v9 + *(unsigned int *)root[v9].var0];
        uint64_t v11 = *(unsigned int *)v10->var0;
        if (v11)
        {
          uint64_t v12 = 4 - 4 * v11;
          uint64_t v13 = 1;
          uint64_t v14 = 8;
          do
          {
            var0 = (unsigned int *)v10[4 * v13].var0;
            v16 = (void *)[[NSString alloc] initWithBytes:&v10[v14 + *var0] length:*(unsigned int *)((char *)var0 + *var0) encoding:4];
            v4[2](v4, v16, v13 - 1, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            uint64_t v18 = v12 + v14;
            ++v13;
            v14 += 4;
          }
          while (v18 != 8);
        }
      }
    }
  }
}

- (Offset<siri::speech::schema_fb::StartSpeechTranslationLoggingRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(FTStartSpeechTranslationLoggingRequest *)self conversation_id];
  unint64_t v5 = v4;
  if (!v4) {
    uint64_t v4 = &stru_270C008E8;
  }
  v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v6, v7);

  uint64_t v8 = [(FTStartSpeechTranslationLoggingRequest *)self request_id];
  uint64_t v9 = v8;
  if (!v8) {
    uint64_t v8 = &stru_270C008E8;
  }
  v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  int v73 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v10, v11);

  uint64_t v12 = [(FTStartSpeechTranslationLoggingRequest *)self translation_locale_pair];
  int v72 = [v12 addObjectToBuffer:a3];

  uint64_t v13 = [(FTStartSpeechTranslationLoggingRequest *)self detected_locale];
  int v71 = [v13 addObjectToBuffer:a3];

  uint64_t v14 = [(FTStartSpeechTranslationLoggingRequest *)self user_selected_locale];
  v15 = v14;
  if (!v14) {
    uint64_t v14 = &stru_270C008E8;
  }
  v16 = (const char *)[(__CFString *)v14 UTF8String];
  size_t v17 = strlen(v16);
  int v70 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v16, v17);

  memset(&v85, 0, sizeof(v85));
  uint64_t v18 = [(FTStartSpeechTranslationLoggingRequest *)self senses];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v85, [v18 count]);

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  unsigned __int8 v19 = [(FTStartSpeechTranslationLoggingRequest *)self senses];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v81 objects:v87 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v82 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = (const char *)[*(id *)(*((void *)&v81 + 1) + 8 * i) UTF8String];
        size_t v24 = strlen(v23);
        int v25 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v23, v24);
        int v26 = v25;
        std::vector<int>::pointer end = v85.__end_;
        if (v85.__end_ >= v85.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v85.__begin_;
          int64_t v30 = v85.__end_ - v85.__begin_;
          unint64_t v31 = v30 + 1;
          if ((unint64_t)(v30 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v32 = (char *)v85.__end_cap_.__value_ - (char *)v85.__begin_;
          if (((char *)v85.__end_cap_.__value_ - (char *)v85.__begin_) >> 1 > v31) {
            unint64_t v31 = v32 >> 1;
          }
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v33 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v33 = v31;
          }
          if (v33)
          {
            v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v85.__end_cap_, v33);
            std::vector<int>::pointer begin = v85.__begin_;
            std::vector<int>::pointer end = v85.__end_;
          }
          else
          {
            v34 = 0;
          }
          v35 = (int *)&v34[4 * v30];
          int *v35 = v26;
          v28 = v35 + 1;
          while (end != begin)
          {
            int v36 = *--end;
            *--v35 = v36;
          }
          v85.__begin_ = v35;
          v85.__end_ = v28;
          v85.__end_cap_.__value_ = (int *)&v34[4 * v33];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v85.__end_ = v25;
          v28 = end + 1;
        }
        v85.__end_ = v28;
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v81 objects:v87 count:16];
    }
    while (v20);
  }

  if (v85.__end_ == v85.__begin_) {
    std::vector<int>::pointer v37 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    std::vector<int>::pointer v37 = v85.__begin_;
  }
  int v69 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v37, v85.__end_ - v85.__begin_);
  v38 = [(FTStartSpeechTranslationLoggingRequest *)self user_selected_sense];
  v39 = v38;
  if (!v38) {
    v38 = &stru_270C008E8;
  }
  v40 = (const char *)[(__CFString *)v38 UTF8String];
  size_t v41 = strlen(v40);
  int v68 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v40, v41);

  memset(&v80, 0, sizeof(v80));
  v42 = [(FTStartSpeechTranslationLoggingRequest *)self user_interacted_senses];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v80, [v42 count]);

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v43 = [(FTStartSpeechTranslationLoggingRequest *)self user_interacted_senses];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v76 objects:v86 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v77 != v45) {
          objc_enumerationMutation(v43);
        }
        v47 = (const char *)[*(id *)(*((void *)&v76 + 1) + 8 * j) UTF8String];
        size_t v48 = strlen(v47);
        int v49 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v47, v48);
        int v50 = v49;
        std::vector<int>::pointer v51 = v80.__end_;
        if (v80.__end_ >= v80.__end_cap_.__value_)
        {
          std::vector<int>::pointer v53 = v80.__begin_;
          int64_t v54 = v80.__end_ - v80.__begin_;
          unint64_t v55 = v54 + 1;
          if ((unint64_t)(v54 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v56 = (char *)v80.__end_cap_.__value_ - (char *)v80.__begin_;
          if (((char *)v80.__end_cap_.__value_ - (char *)v80.__begin_) >> 1 > v55) {
            unint64_t v55 = v56 >> 1;
          }
          if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v57 = v55;
          }
          if (v57)
          {
            v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v80.__end_cap_, v57);
            std::vector<int>::pointer v53 = v80.__begin_;
            std::vector<int>::pointer v51 = v80.__end_;
          }
          else
          {
            v58 = 0;
          }
          v59 = (int *)&v58[4 * v54];
          int *v59 = v50;
          v52 = v59 + 1;
          while (v51 != v53)
          {
            int v60 = *--v51;
            *--v59 = v60;
          }
          v80.__begin_ = v59;
          v80.__end_ = v52;
          v80.__end_cap_.__value_ = (int *)&v58[4 * v57];
          if (v53) {
            operator delete(v53);
          }
        }
        else
        {
          *v80.__end_ = v49;
          v52 = v51 + 1;
        }
        v80.__end_ = v52;
      }
      uint64_t v44 = [v43 countByEnumeratingWithState:&v76 objects:v86 count:16];
    }
    while (v44);
  }

  if (v80.__end_ == v80.__begin_) {
    std::vector<int>::pointer v61 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    std::vector<int>::pointer v61 = v80.__begin_;
  }
  int v62 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v61, v80.__end_ - v80.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v63 = *((_DWORD *)a3 + 8);
  int v64 = *((_DWORD *)a3 + 12);
  int v65 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v73);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v72);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v69);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, v62);
  v66.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v63 - (unsigned __int16)v64 + v65);
  if (v80.__begin_)
  {
    v80.__end_ = v80.__begin_;
    operator delete(v80.__begin_);
  }
  if (v85.__begin_)
  {
    v85.__end_ = v85.__begin_;
    operator delete(v85.__begin_);
  }
  return v66;
}

- (id)flatbuffData
{
  uint64_t v3 = 0;
  char v4 = 0;
  long long v5 = xmmword_26027B7F0;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  __int16 v10 = 256;
  uint64_t v11 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTStartSpeechTranslationLoggingRequest *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__54__FTStartSpeechTranslationLoggingRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
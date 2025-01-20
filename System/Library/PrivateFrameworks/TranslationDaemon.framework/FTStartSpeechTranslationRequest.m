@interface FTStartSpeechTranslationRequest
- (BOOL)restricted_mode;
- (BOOL)streaming_mode;
- (FTStartSpeechRequest)start_speech_request;
- (FTStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3;
- (FTStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4;
- (FTStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4 verify:(BOOL)a5;
- (FTTranslationOptions)options;
- (FTTranslationRequest)translation_request;
- (NSArray)text_to_speech_requests;
- (NSArray)translation_locale_pairs;
- (NSString)app_id;
- (NSString)conversation_id;
- (NSString)request_id;
- (Offset<siri::speech::schema_fb::StartSpeechTranslationRequest>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)text_to_speech_requests_objectAtIndex:(unint64_t)a3;
- (id)translation_locale_pairs_objectAtIndex:(unint64_t)a3;
- (int64_t)opt_in_status;
- (unint64_t)text_to_speech_requests_count;
- (unint64_t)translation_locale_pairs_count;
- (void)text_to_speech_requests_enumerateObjectsUsingBlock:(id)a3;
- (void)translation_locale_pairs_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTStartSpeechTranslationRequest

- (FTStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3
{
  return [(FTStartSpeechTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTStartSpeechTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4
{
  return [(FTStartSpeechTranslationRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTStartSpeechTranslationRequest;
  v10 = [(FTStartSpeechTranslationRequest *)&v26 init];
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
    a4 = (const StartSpeechTranslationRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::StartSpeechTranslationRequest *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::StartSpeechTranslationRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
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

- (NSArray)translation_locale_pairs
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_locale_pairs"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__FTStartSpeechTranslationRequest_translation_locale_pairs__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTStartSpeechTranslationRequest *)self translation_locale_pairs_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translation_locale_pairs"];
  }
  return (NSArray *)v3;
}

uint64_t __59__FTStartSpeechTranslationRequest_translation_locale_pairs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)translation_locale_pairs_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_locale_pairs"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 9u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[8].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTranslationLocalePair alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)translation_locale_pairs_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_locale_pairs"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 9u && (uint64_t v8 = *(unsigned __int16 *)v7[8].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)translation_locale_pairs_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTTranslationLocalePair *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_locale_pairs"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 9u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[8].var0;
      if (v9)
      {
        unsigned __int8 v20 = 0;
        v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = (uint64_t)&v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 4 * v12 - 4;
          do
          {
            uint64_t v17 = [[FTTranslationLocalePair alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
            v4[2](v4, v17, v15, &v20);
            int v18 = v20;

            if (v18) {
              break;
            }
            ++v15;
            uint64_t v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }
}

- (FTStartSpeechRequest)start_speech_request
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"start_speech_request"];
  if (!v3)
  {
    uint64_t v4 = [FTStartSpeechRequest alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    id v3 = [(FTStartSpeechRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"start_speech_request"];
  }
  return v3;
}

- (FTTranslationRequest)translation_request
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_request"];
  if (!v3)
  {
    uint64_t v4 = [FTTranslationRequest alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    id v3 = [(FTTranslationRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translation_request"];
  }
  return v3;
}

- (NSArray)text_to_speech_requests
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"text_to_speech_requests"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__FTStartSpeechTranslationRequest_text_to_speech_requests__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTStartSpeechTranslationRequest *)self text_to_speech_requests_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"text_to_speech_requests"];
  }
  return (NSArray *)v3;
}

uint64_t __58__FTStartSpeechTranslationRequest_text_to_speech_requests__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)text_to_speech_requests_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"text_to_speech_requests"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
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
      id v7 = [[FTTextToSpeechRequest alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)text_to_speech_requests_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"text_to_speech_requests"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xFu && (uint64_t v8 = *(unsigned __int16 *)v7[14].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)text_to_speech_requests_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTTextToSpeechRequest *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"text_to_speech_requests"];
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
        unsigned __int8 v20 = 0;
        v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = (uint64_t)&v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 4 * v12 - 4;
          do
          {
            uint64_t v17 = [[FTTextToSpeechRequest alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
            v4[2](v4, v17, v15, &v20);
            int v18 = v20;

            if (v18) {
              break;
            }
            ++v15;
            uint64_t v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }
}

- (BOOL)restricted_mode
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)app_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (int64_t)opt_in_status
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0) {
    return *(int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (BOOL)streaming_mode
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x17u && (uint64_t v4 = *(unsigned __int16 *)v3[22].var0) != 0 && root[v4].var0[0] != 0;
}

- (FTTranslationOptions)options
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"options"];
  if (!v3)
  {
    uint64_t v4 = [FTTranslationOptions alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (uint64_t v7 = *(unsigned __int16 *)v6[24].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(FTTranslationOptions *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"options"];
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::StartSpeechTranslationRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(FTStartSpeechTranslationRequest *)self conversation_id];
  v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_270C008E8;
  }
  uint64_t v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v9 = [(FTStartSpeechTranslationRequest *)self request_id];
  v10 = v9;
  if (!v9) {
    uint64_t v9 = &stru_270C008E8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  int v68 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  memset(&v80, 0, sizeof(v80));
  uint64_t v13 = [(FTStartSpeechTranslationRequest *)self translation_locale_pairs];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v80, [v13 count]);

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v14 = [(FTStartSpeechTranslationRequest *)self translation_locale_pairs];
  v70 = self;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v77 != v16) {
          objc_enumerationMutation(v14);
        }
        int v18 = [*(id *)(*((void *)&v76 + 1) + 8 * i) addObjectToBuffer:a3];
        int v19 = v18;
        std::vector<int>::pointer end = v80.__end_;
        if (v80.__end_ >= v80.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v80.__begin_;
          int64_t v23 = v80.__end_ - v80.__begin_;
          unint64_t v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v25 = (char *)v80.__end_cap_.__value_ - (char *)v80.__begin_;
          if (((char *)v80.__end_cap_.__value_ - (char *)v80.__begin_) >> 1 > v24) {
            unint64_t v24 = v25 >> 1;
          }
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v26 = v24;
          }
          if (v26)
          {
            v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v80.__end_cap_, v26);
            std::vector<int>::pointer begin = v80.__begin_;
            std::vector<int>::pointer end = v80.__end_;
          }
          else
          {
            v27 = 0;
          }
          v28 = (int *)&v27[4 * v23];
          int *v28 = v19;
          v21 = v28 + 1;
          while (end != begin)
          {
            int v29 = *--end;
            *--v28 = v29;
          }
          v80.__begin_ = v28;
          v80.__end_ = v21;
          v80.__end_cap_.__value_ = (int *)&v27[4 * v26];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v80.__end_ = v18;
          v21 = end + 1;
        }
        v80.__end_ = v21;
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v76 objects:v82 count:16];
    }
    while (v15);
  }

  if (v80.__end_ == v80.__begin_) {
    std::vector<int>::pointer v30 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationLocalePair>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationLocalePair>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationLocalePair>> const&)::t;
  }
  else {
    std::vector<int>::pointer v30 = v80.__begin_;
  }
  int v67 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v30, v80.__end_ - v80.__begin_);
  v31 = [(FTStartSpeechTranslationRequest *)v70 start_speech_request];
  int v66 = [v31 addObjectToBuffer:a3];

  v32 = [(FTStartSpeechTranslationRequest *)v70 translation_request];
  int v65 = [v32 addObjectToBuffer:a3];

  memset(&v75, 0, sizeof(v75));
  v33 = [(FTStartSpeechTranslationRequest *)v70 text_to_speech_requests];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v75, [v33 count]);

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v34 = [(FTStartSpeechTranslationRequest *)v70 text_to_speech_requests];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v72 != v36) {
          objc_enumerationMutation(v34);
        }
        int v38 = [*(id *)(*((void *)&v71 + 1) + 8 * j) addObjectToBuffer:a3];
        int v39 = v38;
        std::vector<int>::pointer v40 = v75.__end_;
        if (v75.__end_ >= v75.__end_cap_.__value_)
        {
          std::vector<int>::pointer v42 = v75.__begin_;
          int64_t v43 = v75.__end_ - v75.__begin_;
          unint64_t v44 = v43 + 1;
          if ((unint64_t)(v43 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v45 = (char *)v75.__end_cap_.__value_ - (char *)v75.__begin_;
          if (((char *)v75.__end_cap_.__value_ - (char *)v75.__begin_) >> 1 > v44) {
            unint64_t v44 = v45 >> 1;
          }
          if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v46 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v46 = v44;
          }
          if (v46)
          {
            v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v75.__end_cap_, v46);
            std::vector<int>::pointer v42 = v75.__begin_;
            std::vector<int>::pointer v40 = v75.__end_;
          }
          else
          {
            v47 = 0;
          }
          v48 = (int *)&v47[4 * v43];
          int *v48 = v39;
          v41 = v48 + 1;
          while (v40 != v42)
          {
            int v49 = *--v40;
            *--v48 = v49;
          }
          v75.__begin_ = v48;
          v75.__end_ = v41;
          v75.__end_cap_.__value_ = (int *)&v47[4 * v46];
          if (v42) {
            operator delete(v42);
          }
        }
        else
        {
          *v75.__end_ = v38;
          v41 = v40 + 1;
        }
        v75.__end_ = v41;
      }
      uint64_t v35 = [v34 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v35);
  }

  if (v75.__end_ == v75.__begin_) {
    std::vector<int>::pointer v50 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest>> const&)::t;
  }
  else {
    std::vector<int>::pointer v50 = v75.__begin_;
  }
  int v51 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v50, v75.__end_ - v75.__begin_);
  int v52 = [(FTStartSpeechTranslationRequest *)v70 restricted_mode];
  v53 = [(FTStartSpeechTranslationRequest *)v70 app_id];
  v54 = v53;
  if (!v53) {
    v53 = &stru_270C008E8;
  }
  v55 = (const char *)[(__CFString *)v53 UTF8String];
  size_t v56 = strlen(v55);
  LODWORD(v55) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v55, v56);

  int v57 = [(FTStartSpeechTranslationRequest *)v70 opt_in_status];
  int v58 = [(FTStartSpeechTranslationRequest *)v70 streaming_mode];
  v59 = [(FTStartSpeechTranslationRequest *)v70 options];
  int v60 = [v59 addObjectToBuffer:a3];

  *((unsigned char *)a3 + 70) = 1;
  LODWORD(v59) = *((_DWORD *)a3 + 8);
  int v61 = *((_DWORD *)a3 + 12);
  int v62 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v67);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v66);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v65);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v51);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 16, v52, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, (int)v55);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 20, v57, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 22, v58, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 24, v60);
  v63.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v59 - (unsigned __int16)v61 + v62);
  if (v75.__begin_)
  {
    v75.__end_ = v75.__begin_;
    operator delete(v75.__begin_);
  }
  if (v80.__begin_)
  {
    v80.__end_ = v80.__begin_;
    operator delete(v80.__begin_);
  }
  return v63;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTStartSpeechTranslationRequest *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__47__FTStartSpeechTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
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
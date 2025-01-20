@interface FTTranslationRequest
- (BOOL)disable_log;
- (BOOL)is_partial;
- (FTSiriPayloadTranslationInfo)siri_payload_translation_info;
- (FTSiriTranslationInfo)siri_translation_info;
- (FTSpeechTranslationInfo)speech_translation_info;
- (FTTranslationOptions)options;
- (FTTranslationRequest)initWithFlatbuffData:(id)a3;
- (FTTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4;
- (FTTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4 verify:(BOOL)a5;
- (FTWebTranslationInfo)web_translation_info;
- (NSArray)translation_phrase;
- (NSString)app_id;
- (NSString)request_id;
- (NSString)sequence_id;
- (NSString)source_language;
- (NSString)speech_id;
- (NSString)target_language;
- (NSString)task;
- (NSString)use_case;
- (Offset<siri::speech::schema_fb::TranslationRequest>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)translation_phrase_objectAtIndex:(unint64_t)a3;
- (int64_t)opt_in_status;
- (unint64_t)translation_phrase_count;
- (void)translation_phrase_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTTranslationRequest

- (FTTranslationRequest)initWithFlatbuffData:(id)a3
{
  return [(FTTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4
{
  return [(FTTranslationRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTranslationRequest;
  v10 = [(FTTranslationRequest *)&v26 init];
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
    a4 = (const TranslationRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TranslationRequest *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TranslationRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)speech_id
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

- (NSString)task
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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

- (NSString)source_language
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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

- (NSString)target_language
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
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)translation_phrase
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_phrase"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__FTTranslationRequest_translation_phrase__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTranslationRequest *)self translation_phrase_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translation_phrase"];
  }
  return (NSArray *)v3;
}

uint64_t __42__FTTranslationRequest_translation_phrase__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)translation_phrase_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_phrase"];
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

- (unint64_t)translation_phrase_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_phrase"];
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

- (void)translation_phrase_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_phrase"];
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

- (FTSiriTranslationInfo)siri_translation_info
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"siri_translation_info"];
  if (!v3)
  {
    uint64_t v4 = [FTSiriTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x11u && (uint64_t v7 = *(unsigned __int16 *)v6[16].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    id v3 = [(FTSiriTranslationInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"siri_translation_info"];
  }
  return v3;
}

- (FTSpeechTranslationInfo)speech_translation_info
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"speech_translation_info"];
  if (!v3)
  {
    uint64_t v4 = [FTSpeechTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x13u && (uint64_t v7 = *(unsigned __int16 *)v6[18].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    id v3 = [(FTSpeechTranslationInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"speech_translation_info"];
  }
  return v3;
}

- (FTSiriPayloadTranslationInfo)siri_payload_translation_info
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"siri_payload_translation_info"];
  if (!v3)
  {
    uint64_t v4 = [FTSiriPayloadTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (uint64_t v7 = *(unsigned __int16 *)v6[20].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    id v3 = [(FTSiriPayloadTranslationInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"siri_payload_translation_info"];
  }
  return v3;
}

- (NSString)sequence_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 22].var0;
  if (*(_WORD *)root[-v3 + 22].var0)
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

- (FTWebTranslationInfo)web_translation_info
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"web_translation_info"];
  if (!v3)
  {
    uint64_t v4 = [FTWebTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (uint64_t v7 = *(unsigned __int16 *)v6[24].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(FTWebTranslationInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"web_translation_info"];
  }
  return v3;
}

- (BOOL)disable_log
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x1Bu && (uint64_t v4 = *(unsigned __int16 *)v3[26].var0) != 0 && root[v4].var0[0] != 0;
}

- (int64_t)opt_in_status
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x1Du && (uint64_t v4 = *(unsigned __int16 *)v3[28].var0) != 0) {
    return *(int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)app_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 30].var0;
  if (*(_WORD *)root[-v3 + 30].var0)
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

- (NSString)use_case
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 32].var0;
  if (*(_WORD *)root[-v3 + 32].var0)
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

- (FTTranslationOptions)options
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"options"];
  if (!v3)
  {
    uint64_t v4 = [FTTranslationOptions alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x23u && (uint64_t v7 = *(unsigned __int16 *)v6[34].var0) != 0) {
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

- (BOOL)is_partial
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x25u && (uint64_t v4 = *(unsigned __int16 *)v3[36].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::TranslationRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(FTTranslationRequest *)self speech_id];
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v4 = &stru_270C008E8;
  }
  v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v6, v7);

  uint64_t v8 = [(FTTranslationRequest *)self request_id];
  uint64_t v9 = v8;
  if (!v8) {
    uint64_t v8 = &stru_270C008E8;
  }
  v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  int v79 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v10, v11);

  uint64_t v12 = [(FTTranslationRequest *)self task];
  uint64_t v13 = v12;
  if (!v12) {
    uint64_t v12 = &stru_270C008E8;
  }
  uint64_t v14 = (const char *)[(__CFString *)v12 UTF8String];
  size_t v15 = strlen(v14);
  int v78 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v14, v15);

  v16 = [(FTTranslationRequest *)self source_language];
  int v17 = v16;
  if (!v16) {
    v16 = &stru_270C008E8;
  }
  uint64_t v18 = (const char *)[(__CFString *)v16 UTF8String];
  size_t v19 = strlen(v18);
  int v77 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v18, v19);

  v20 = [(FTTranslationRequest *)self target_language];
  v21 = v20;
  if (!v20) {
    v20 = &stru_270C008E8;
  }
  v22 = (const char *)[(__CFString *)v20 UTF8String];
  size_t v23 = strlen(v22);
  int v76 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v22, v23);

  memset(&v87, 0, sizeof(v87));
  uint64_t v24 = [(FTTranslationRequest *)self translation_phrase];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v87, [v24 count]);

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  char v25 = [(FTTranslationRequest *)self translation_phrase];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v83 objects:v88 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v84 != v27) {
          objc_enumerationMutation(v25);
        }
        v29 = (const char *)[*(id *)(*((void *)&v83 + 1) + 8 * i) UTF8String];
        size_t v30 = strlen(v29);
        int v31 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v29, v30);
        int v32 = v31;
        std::vector<int>::pointer end = v87.__end_;
        if (v87.__end_ >= v87.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v87.__begin_;
          int64_t v36 = v87.__end_ - v87.__begin_;
          unint64_t v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v38 = (char *)v87.__end_cap_.__value_ - (char *)v87.__begin_;
          if (((char *)v87.__end_cap_.__value_ - (char *)v87.__begin_) >> 1 > v37) {
            unint64_t v37 = v38 >> 1;
          }
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v39 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v39 = v37;
          }
          if (v39)
          {
            v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v87.__end_cap_, v39);
            std::vector<int>::pointer begin = v87.__begin_;
            std::vector<int>::pointer end = v87.__end_;
          }
          else
          {
            v40 = 0;
          }
          v41 = (int *)&v40[4 * v36];
          int *v41 = v32;
          v34 = v41 + 1;
          while (end != begin)
          {
            int v42 = *--end;
            *--v41 = v42;
          }
          v87.__begin_ = v41;
          v87.__end_ = v34;
          v87.__end_cap_.__value_ = (int *)&v40[4 * v39];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v87.__end_ = v31;
          v34 = end + 1;
        }
        v87.__end_ = v34;
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v83 objects:v88 count:16];
    }
    while (v26);
  }

  if (v87.__end_ == v87.__begin_) {
    std::vector<int>::pointer v43 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    std::vector<int>::pointer v43 = v87.__begin_;
  }
  int v75 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v43, v87.__end_ - v87.__begin_);
  v44 = [(FTTranslationRequest *)self siri_translation_info];
  int v74 = [v44 addObjectToBuffer:a3];

  v45 = [(FTTranslationRequest *)self speech_translation_info];
  int v73 = [v45 addObjectToBuffer:a3];

  v46 = [(FTTranslationRequest *)self siri_payload_translation_info];
  int v72 = [v46 addObjectToBuffer:a3];

  v47 = [(FTTranslationRequest *)self sequence_id];
  v48 = v47;
  if (!v47) {
    v47 = &stru_270C008E8;
  }
  v49 = (const char *)[(__CFString *)v47 UTF8String];
  size_t v50 = strlen(v49);
  int v51 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v49, v50);

  v52 = [(FTTranslationRequest *)self web_translation_info];
  int v53 = [v52 addObjectToBuffer:a3];

  int v54 = [(FTTranslationRequest *)self disable_log];
  int v55 = [(FTTranslationRequest *)self opt_in_status];
  v56 = [(FTTranslationRequest *)self app_id];
  v57 = v56;
  if (!v56) {
    v56 = &stru_270C008E8;
  }
  v58 = (const char *)[(__CFString *)v56 UTF8String];
  size_t v59 = strlen(v58);
  int v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v58, v59);

  v61 = [(FTTranslationRequest *)self use_case];
  v62 = v61;
  if (!v61) {
    v61 = &stru_270C008E8;
  }
  v63 = (const char *)[(__CFString *)v61 UTF8String];
  size_t v64 = strlen(v63);
  int v65 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v63, v64);

  v66 = [(FTTranslationRequest *)self options];
  int v67 = [v66 addObjectToBuffer:a3];

  LODWORD(v66) = [(FTTranslationRequest *)self is_partial];
  *((unsigned char *)a3 + 70) = 1;
  int v82 = *((_DWORD *)a3 + 8);
  int v68 = *((_DWORD *)a3 + 12);
  int v71 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v79);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v78);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v77);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v76);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v75);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, v74);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, v73);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 20, v72);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 22, v51);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 24, v53);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 26, v54, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 28, v55, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 30, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 32, v65);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 34, v67);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 36, (int)v66, 0);
  v69.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v82 - (unsigned __int16)v68 + v71);
  if (v87.__begin_)
  {
    v87.__end_ = v87.__begin_;
    operator delete(v87.__begin_);
  }
  return v69;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTranslationRequest *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__36__FTTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
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
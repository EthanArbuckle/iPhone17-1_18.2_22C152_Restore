@interface FTErrorBlamerRequest
- (FTErrorBlamerRequest)initWithFlatbuffData:(id)a3;
- (FTErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4;
- (FTErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4 verify:(BOOL)a5;
- (FTStartSpeechRequest)start_speech_request;
- (FTUserAcousticProfile)user_acoustic_profile;
- (FTUserLanguageProfile)user_language_profile;
- (NSArray)audio_packets;
- (NSArray)contextual_text;
- (NSString)left_context;
- (NSString)ref_transcript;
- (NSString)right_context;
- (Offset<siri::speech::schema_fb::ErrorBlamerRequest>)addObjectToBuffer:(void *)a3;
- (double)latitude;
- (double)longitude;
- (id)audio_packets_objectAtIndex:(unint64_t)a3;
- (id)contextual_text_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (unint64_t)audio_packets_count;
- (unint64_t)contextual_text_count;
- (void)audio_packets_enumerateObjectsUsingBlock:(id)a3;
- (void)contextual_text_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTErrorBlamerRequest

- (FTErrorBlamerRequest)initWithFlatbuffData:(id)a3
{
  return [(FTErrorBlamerRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTErrorBlamerRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4
{
  return [(FTErrorBlamerRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTErrorBlamerRequest;
  v10 = [(FTErrorBlamerRequest *)&v26 init];
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
    a4 = (const ErrorBlamerRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::ErrorBlamerRequest *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::ErrorBlamerRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (FTStartSpeechRequest)start_speech_request
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"start_speech_request"];
  if (!v3)
  {
    v4 = [FTStartSpeechRequest alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTStartSpeechRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"start_speech_request"];
  }
  return v3;
}

- (NSArray)contextual_text
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"contextual_text"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__FTErrorBlamerRequest_contextual_text__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTErrorBlamerRequest *)self contextual_text_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"contextual_text"];
  }
  return (NSArray *)v3;
}

uint64_t __39__FTErrorBlamerRequest_contextual_text__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)contextual_text_objectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"contextual_text"];
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
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
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

- (unint64_t)contextual_text_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"contextual_text"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 7u && (uint64_t v8 = *(unsigned __int16 *)v7[6].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)contextual_text_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"contextual_text"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[6].var0;
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

- (NSString)left_context
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)right_context
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (FTUserLanguageProfile)user_language_profile
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_language_profile"];
  if (!v3)
  {
    uint64_t v4 = [FTUserLanguageProfile alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(FTUserLanguageProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_language_profile"];
  }
  return v3;
}

- (FTUserAcousticProfile)user_acoustic_profile
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_acoustic_profile"];
  if (!v3)
  {
    uint64_t v4 = [FTUserAcousticProfile alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (uint64_t v7 = *(unsigned __int16 *)v6[14].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(FTUserAcousticProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_acoustic_profile"];
  }
  return v3;
}

- (double)latitude
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x11u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[16].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (double)longitude
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x13u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[18].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (NSArray)audio_packets
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"audio_packets"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__FTErrorBlamerRequest_audio_packets__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTErrorBlamerRequest *)self audio_packets_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"audio_packets"];
  }
  return (NSArray *)v3;
}

uint64_t __37__FTErrorBlamerRequest_audio_packets__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)audio_packets_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"audio_packets"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0x15u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[20].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTAudioPacket alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)audio_packets_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"audio_packets"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0x15u && (uint64_t v8 = *(unsigned __int16 *)v7[20].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)audio_packets_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTAudioPacket *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"audio_packets"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0x15u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[20].var0;
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
            int v17 = [[FTAudioPacket alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSString)ref_transcript
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (Offset<siri::speech::schema_fb::ErrorBlamerRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(FTErrorBlamerRequest *)self start_speech_request];
  int v5 = [v4 addObjectToBuffer:a3];

  memset(&v85, 0, sizeof(v85));
  v6 = [(FTErrorBlamerRequest *)self contextual_text];
  int v74 = v5;
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v85, [v6 count]);

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v7 = [(FTErrorBlamerRequest *)self contextual_text];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v81 objects:v87 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v82 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = (const char *)[*(id *)(*((void *)&v81 + 1) + 8 * i) UTF8String];
        size_t v12 = strlen(v11);
        int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);
        int v14 = String;
        std::vector<int>::pointer end = v85.__end_;
        if (v85.__end_ >= v85.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v85.__begin_;
          int64_t v18 = v85.__end_ - v85.__begin_;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v20 = (char *)v85.__end_cap_.__value_ - (char *)v85.__begin_;
          if (((char *)v85.__end_cap_.__value_ - (char *)v85.__begin_) >> 1 > v19) {
            unint64_t v19 = v20 >> 1;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v19;
          }
          if (v21)
          {
            v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v85.__end_cap_, v21);
            std::vector<int>::pointer begin = v85.__begin_;
            std::vector<int>::pointer end = v85.__end_;
          }
          else
          {
            v22 = 0;
          }
          long long v23 = (int *)&v22[4 * v18];
          *long long v23 = v14;
          uint64_t v16 = v23 + 1;
          while (end != begin)
          {
            int v24 = *--end;
            *--long long v23 = v24;
          }
          v85.__begin_ = v23;
          v85.__end_ = v16;
          v85.__end_cap_.__value_ = (int *)&v22[4 * v21];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v85.__end_ = String;
          uint64_t v16 = end + 1;
        }
        v85.__end_ = v16;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v81 objects:v87 count:16];
    }
    while (v8);
  }

  if (v85.__end_ == v85.__begin_) {
    std::vector<int>::pointer v25 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    std::vector<int>::pointer v25 = v85.__begin_;
  }
  int v26 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v25, v85.__end_ - v85.__begin_);
  v27 = [(FTErrorBlamerRequest *)self left_context];
  v28 = v27;
  if (!v27) {
    v27 = &stru_270C008E8;
  }
  v29 = (const char *)[(__CFString *)v27 UTF8String];
  size_t v30 = strlen(v29);
  int v31 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v29, v30);

  v32 = [(FTErrorBlamerRequest *)self right_context];
  v33 = v32;
  if (!v32) {
    v32 = &stru_270C008E8;
  }
  v34 = (const char *)[(__CFString *)v32 UTF8String];
  size_t v35 = strlen(v34);
  int v73 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v34, v35);

  v36 = [(FTErrorBlamerRequest *)self user_language_profile];
  int v72 = [v36 addObjectToBuffer:a3];

  v37 = [(FTErrorBlamerRequest *)self user_acoustic_profile];
  LODWORD(v70) = [v37 addObjectToBuffer:a3];

  [(FTErrorBlamerRequest *)self latitude];
  double v39 = v38;
  [(FTErrorBlamerRequest *)self longitude];
  double v41 = v40;
  memset(&v80, 0, sizeof(v80));
  v42 = [(FTErrorBlamerRequest *)self audio_packets];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v80, [v42 count]);

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v43 = [(FTErrorBlamerRequest *)self audio_packets];
  HIDWORD(v70) = v31;
  int v71 = v26;
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
        int v47 = objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * j), "addObjectToBuffer:", a3, v70);
        int v48 = v47;
        std::vector<int>::pointer v49 = v80.__end_;
        if (v80.__end_ >= v80.__end_cap_.__value_)
        {
          std::vector<int>::pointer v51 = v80.__begin_;
          int64_t v52 = v80.__end_ - v80.__begin_;
          unint64_t v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v54 = (char *)v80.__end_cap_.__value_ - (char *)v80.__begin_;
          if (((char *)v80.__end_cap_.__value_ - (char *)v80.__begin_) >> 1 > v53) {
            unint64_t v53 = v54 >> 1;
          }
          if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v55 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v55 = v53;
          }
          if (v55)
          {
            v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v80.__end_cap_, v55);
            std::vector<int>::pointer v51 = v80.__begin_;
            std::vector<int>::pointer v49 = v80.__end_;
          }
          else
          {
            v56 = 0;
          }
          v57 = (int *)&v56[4 * v52];
          int *v57 = v48;
          v50 = v57 + 1;
          while (v49 != v51)
          {
            int v58 = *--v49;
            *--v57 = v58;
          }
          v80.__begin_ = v57;
          v80.__end_ = v50;
          v80.__end_cap_.__value_ = (int *)&v56[4 * v55];
          if (v51) {
            operator delete(v51);
          }
        }
        else
        {
          *v80.__end_ = v47;
          v50 = v49 + 1;
        }
        v80.__end_ = v50;
      }
      uint64_t v44 = [v43 countByEnumeratingWithState:&v76 objects:v86 count:16];
    }
    while (v44);
  }

  if (v80.__end_ == v80.__begin_) {
    std::vector<int>::pointer v59 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioPacket>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioPacket>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioPacket>> const&)::t;
  }
  else {
    std::vector<int>::pointer v59 = v80.__begin_;
  }
  int v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v59, v80.__end_ - v80.__begin_);
  v61 = [(FTErrorBlamerRequest *)self ref_transcript];
  v62 = v61;
  if (!v61) {
    v61 = &stru_270C008E8;
  }
  v63 = (const char *)[(__CFString *)v61 UTF8String];
  size_t v64 = strlen(v63);
  LODWORD(v63) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v63, v64);

  *((unsigned char *)a3 + 70) = 1;
  int v65 = *((_DWORD *)a3 + 8);
  int v66 = *((_DWORD *)a3 + 12);
  int v67 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v74);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, SHIDWORD(v70));
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v73);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v72);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>(a3, 16, v39, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>(a3, 18, v41, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 20, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 22, (int)v63);
  v68.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v65 - (unsigned __int16)v66 + v67);
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
  return v68;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTErrorBlamerRequest *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__36__FTErrorBlamerRequest_flatbuffData__block_invoke(uint64_t a1)
{
  double result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
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
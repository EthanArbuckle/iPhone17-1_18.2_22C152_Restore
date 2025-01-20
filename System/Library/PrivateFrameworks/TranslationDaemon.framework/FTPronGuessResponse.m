@interface FTPronGuessResponse
- (FTPronGuessResponse)initWithFlatbuffData:(id)a3;
- (FTPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4;
- (FTPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4 verify:(BOOL)a5;
- (FTVocToken)voc_token;
- (NSArray)human_readable_prons;
- (NSArray)tts_pronunciations;
- (NSString)apg_id;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::PronGuessResponse>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)human_readable_prons_objectAtIndex:(unint64_t)a3;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)tts_pronunciations_objectAtIndex:(unint64_t)a3;
- (int)error_code;
- (unint64_t)human_readable_prons_count;
- (unint64_t)tts_pronunciations_count;
- (void)human_readable_prons_enumerateObjectsUsingBlock:(id)a3;
- (void)tts_pronunciations_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTPronGuessResponse

- (FTPronGuessResponse)initWithFlatbuffData:(id)a3
{
  return [(FTPronGuessResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTPronGuessResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4
{
  return [(FTPronGuessResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTPronGuessResponse;
  v10 = [(FTPronGuessResponse *)&v26 init];
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
    a4 = (const PronGuessResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::PronGuessResponse *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::PronGuessResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
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

- (NSString)session_id
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

- (int)error_code
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)error_str
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

- (NSString)apg_id
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

- (FTVocToken)voc_token
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"voc_token"];
  if (!v3)
  {
    uint64_t v4 = [FTVocToken alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (uint64_t v7 = *(unsigned __int16 *)v6[14].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    uint64_t v3 = [(FTVocToken *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"voc_token"];
  }
  return v3;
}

- (NSArray)tts_pronunciations
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tts_pronunciations"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__FTPronGuessResponse_tts_pronunciations__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTPronGuessResponse *)self tts_pronunciations_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"tts_pronunciations"];
  }
  return (NSArray *)v3;
}

uint64_t __41__FTPronGuessResponse_tts_pronunciations__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)tts_pronunciations_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tts_pronunciations"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0x11u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[16].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTPronunciation alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)tts_pronunciations_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tts_pronunciations"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0x11u && (uint64_t v8 = *(unsigned __int16 *)v7[16].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)tts_pronunciations_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTPronunciation *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tts_pronunciations"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0x11u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[16].var0;
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
            uint64_t v17 = [[FTPronunciation alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)human_readable_prons
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"human_readable_prons"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__FTPronGuessResponse_human_readable_prons__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTPronGuessResponse *)self human_readable_prons_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"human_readable_prons"];
  }
  return (NSArray *)v3;
}

uint64_t __43__FTPronGuessResponse_human_readable_prons__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)human_readable_prons_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"human_readable_prons"];
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

- (unint64_t)human_readable_prons_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"human_readable_prons"];
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

- (void)human_readable_prons_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"human_readable_prons"];
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
            uint64_t v16 = (void *)[[NSString alloc] initWithBytes:&v10[v14 + *var0] length:*(unsigned int *)((char *)var0 + *var0) encoding:4];
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

- (Offset<siri::speech::schema_fb::PronGuessResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTPronGuessResponse *)self speech_id];
  v6 = v5;
  if (!v5) {
    unint64_t v5 = &stru_270C008E8;
  }
  uint64_t v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v9 = [(FTPronGuessResponse *)self session_id];
  v10 = v9;
  if (!v9) {
    uint64_t v9 = &stru_270C008E8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  int v71 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  int v70 = [(FTPronGuessResponse *)self error_code];
  uint64_t v13 = [(FTPronGuessResponse *)self error_str];
  uint64_t v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_270C008E8;
  }
  uint64_t v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  int v69 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  int v17 = [(FTPronGuessResponse *)self apg_id];
  uint64_t v18 = v17;
  if (!v17) {
    int v17 = &stru_270C008E8;
  }
  unsigned __int8 v19 = (const char *)[(__CFString *)v17 UTF8String];
  size_t v20 = strlen(v19);
  int v68 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  v21 = [(FTPronGuessResponse *)self voc_token];
  int v67 = [v21 addObjectToBuffer:a3];

  memset(&v82, 0, sizeof(v82));
  v22 = [(FTPronGuessResponse *)self tts_pronunciations];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v82, [v22 count]);

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v23 = [(FTPronGuessResponse *)self tts_pronunciations];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v78 objects:v84 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v79 != v25) {
          objc_enumerationMutation(v23);
        }
        int v27 = [*(id *)(*((void *)&v78 + 1) + 8 * i) addObjectToBuffer:a3];
        int v28 = v27;
        std::vector<int>::pointer end = v82.__end_;
        if (v82.__end_ >= v82.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v82.__begin_;
          int64_t v32 = v82.__end_ - v82.__begin_;
          unint64_t v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v34 = (char *)v82.__end_cap_.__value_ - (char *)v82.__begin_;
          if (((char *)v82.__end_cap_.__value_ - (char *)v82.__begin_) >> 1 > v33) {
            unint64_t v33 = v34 >> 1;
          }
          if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v35 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v35 = v33;
          }
          if (v35)
          {
            v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v82.__end_cap_, v35);
            std::vector<int>::pointer begin = v82.__begin_;
            std::vector<int>::pointer end = v82.__end_;
          }
          else
          {
            v36 = 0;
          }
          v37 = (int *)&v36[4 * v32];
          int *v37 = v28;
          v30 = v37 + 1;
          while (end != begin)
          {
            int v38 = *--end;
            *--v37 = v38;
          }
          v82.__begin_ = v37;
          v82.__end_ = v30;
          v82.__end_cap_.__value_ = (int *)&v36[4 * v35];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v82.__end_ = v27;
          v30 = end + 1;
        }
        v82.__end_ = v30;
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v78 objects:v84 count:16];
    }
    while (v24);
  }

  if (v82.__end_ == v82.__begin_) {
    std::vector<int>::pointer v39 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Pronunciation>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Pronunciation>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Pronunciation>> const&)::t;
  }
  else {
    std::vector<int>::pointer v39 = v82.__begin_;
  }
  int v66 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v39, v82.__end_ - v82.__begin_);
  memset(&v77, 0, sizeof(v77));
  v40 = [(FTPronGuessResponse *)self human_readable_prons];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v77, [v40 count]);

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v41 = [(FTPronGuessResponse *)self human_readable_prons];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v74 != v43) {
          objc_enumerationMutation(v41);
        }
        v45 = (const char *)[*(id *)(*((void *)&v73 + 1) + 8 * j) UTF8String];
        size_t v46 = strlen(v45);
        int v47 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v45, v46);
        int v48 = v47;
        std::vector<int>::pointer v49 = v77.__end_;
        if (v77.__end_ >= v77.__end_cap_.__value_)
        {
          std::vector<int>::pointer v51 = v77.__begin_;
          int64_t v52 = v77.__end_ - v77.__begin_;
          unint64_t v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v54 = (char *)v77.__end_cap_.__value_ - (char *)v77.__begin_;
          if (((char *)v77.__end_cap_.__value_ - (char *)v77.__begin_) >> 1 > v53) {
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
            v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v77.__end_cap_, v55);
            std::vector<int>::pointer v51 = v77.__begin_;
            std::vector<int>::pointer v49 = v77.__end_;
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
          v77.__begin_ = v57;
          v77.__end_ = v50;
          v77.__end_cap_.__value_ = (int *)&v56[4 * v55];
          if (v51) {
            operator delete(v51);
          }
        }
        else
        {
          *v77.__end_ = v47;
          v50 = v49 + 1;
        }
        v77.__end_ = v50;
      }
      uint64_t v42 = [v41 countByEnumeratingWithState:&v73 objects:v83 count:16];
    }
    while (v42);
  }

  if (v77.__end_ == v77.__begin_) {
    std::vector<int>::pointer v59 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    std::vector<int>::pointer v59 = v77.__begin_;
  }
  int v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v59, v77.__end_ - v77.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v61 = *((_DWORD *)a3 + 8);
  int v62 = *((_DWORD *)a3 + 12);
  int v63 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 8, v70, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v69);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v67);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, v66);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, v60);
  v64.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v61 - (unsigned __int16)v62 + v63);
  if (v77.__begin_)
  {
    v77.__end_ = v77.__begin_;
    operator delete(v77.__begin_);
  }
  if (v82.__begin_)
  {
    v82.__end_ = v82.__begin_;
    operator delete(v82.__begin_);
  }
  return v64;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTPronGuessResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__35__FTPronGuessResponse_flatbuffData__block_invoke(uint64_t a1)
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
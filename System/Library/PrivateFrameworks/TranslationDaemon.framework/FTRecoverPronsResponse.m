@interface FTRecoverPronsResponse
- (FTRecoverPronsResponse)initWithFlatbuffData:(id)a3;
- (FTRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4;
- (FTRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4 verify:(BOOL)a5;
- (NSArray)recovery_return_codes;
- (NSArray)voc_tokens;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::RecoverPronsResponse>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)recovery_return_codes_objectAtIndex:(unint64_t)a3;
- (id)voc_tokens_objectAtIndex:(unint64_t)a3;
- (int)error_code;
- (unint64_t)recovery_return_codes_count;
- (unint64_t)voc_tokens_count;
- (void)recovery_return_codes_enumerateObjectsUsingBlock:(id)a3;
- (void)voc_tokens_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTRecoverPronsResponse

- (FTRecoverPronsResponse)initWithFlatbuffData:(id)a3
{
  return [(FTRecoverPronsResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTRecoverPronsResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4
{
  return [(FTRecoverPronsResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTRecoverPronsResponse;
  v10 = [(FTRecoverPronsResponse *)&v26 init];
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
    a4 = (const RecoverPronsResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::RecoverPronsResponse *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::RecoverPronsResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
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

- (NSArray)recovery_return_codes
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"recovery_return_codes"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__FTRecoverPronsResponse_recovery_return_codes__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTRecoverPronsResponse *)self recovery_return_codes_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"recovery_return_codes"];
  }
  return (NSArray *)v3;
}

uint64_t __47__FTRecoverPronsResponse_recovery_return_codes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)recovery_return_codes_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"recovery_return_codes"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0xDu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[12].var0;
    if (v11)
    {
      uint64_t v7 = [NSNumber numberWithInt:*(unsigned int *)root[4 * a3 + 4 + v11 + *(unsigned int *)root[v11].var0].var0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)recovery_return_codes_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"recovery_return_codes"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xDu && (uint64_t v8 = *(unsigned __int16 *)v7[12].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)recovery_return_codes_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"recovery_return_codes"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xDu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[12].var0;
      if (v9)
      {
        unsigned __int8 v18 = 0;
        uint64_t v10 = *(unsigned int *)root[v9].var0;
        uint64_t v11 = *(unsigned int *)root[v9 + v10].var0;
        if (v11)
        {
          uint64_t v12 = 0;
          uint64_t v13 = 4 * v11 - 4;
          uint64_t v14 = (uint64_t)&root[v9 + 4 + v10];
          do
          {
            v15 = [NSNumber numberWithInt:*(unsigned int *)(v14 + 4 * v12)];
            v4[2](v4, v15, v12, &v18);
            int v16 = v18;

            ++v12;
            if (v16) {
              BOOL v17 = 1;
            }
            else {
              BOOL v17 = v13 == 0;
            }
            v13 -= 4;
          }
          while (!v17);
        }
      }
    }
  }
}

- (NSArray)voc_tokens
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"voc_tokens"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__FTRecoverPronsResponse_voc_tokens__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTRecoverPronsResponse *)self voc_tokens_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"voc_tokens"];
  }
  return (NSArray *)v3;
}

uint64_t __36__FTRecoverPronsResponse_voc_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)voc_tokens_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"voc_tokens"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0xFu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[14].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTVocToken alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)voc_tokens_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"voc_tokens"];
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

- (void)voc_tokens_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTVocToken *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"voc_tokens"];
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
        uint64_t v10 = &root[v9];
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
            BOOL v17 = [[FTVocToken alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::RecoverPronsResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTRecoverPronsResponse *)self speech_id];
  v6 = v5;
  if (!v5) {
    unint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v9 = [(FTRecoverPronsResponse *)self session_id];
  uint64_t v10 = v9;
  if (!v9) {
    uint64_t v9 = &stru_270C008E8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  int v62 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  int v61 = [(FTRecoverPronsResponse *)self error_code];
  uint64_t v13 = [(FTRecoverPronsResponse *)self error_str];
  uint64_t v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_270C008E8;
  }
  uint64_t v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  int v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  memset(&v75, 0, sizeof(v75));
  BOOL v17 = [(FTRecoverPronsResponse *)self recovery_return_codes];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v75, [v17 count]);

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  int v18 = [(FTRecoverPronsResponse *)self recovery_return_codes];
  v64 = self;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v72 != v20) {
          objc_enumerationMutation(v18);
        }
        int v22 = [*(id *)(*((void *)&v71 + 1) + 8 * i) intValue];
        int v23 = v22;
        std::vector<int>::pointer end = v75.__end_;
        if (v75.__end_ >= v75.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v75.__begin_;
          int64_t v27 = v75.__end_ - v75.__begin_;
          unint64_t v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v29 = (char *)v75.__end_cap_.__value_ - (char *)v75.__begin_;
          if (((char *)v75.__end_cap_.__value_ - (char *)v75.__begin_) >> 1 > v28) {
            unint64_t v28 = v29 >> 1;
          }
          if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v30 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v30 = v28;
          }
          if (v30)
          {
            v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v75.__end_cap_, v30);
            std::vector<int>::pointer begin = v75.__begin_;
            std::vector<int>::pointer end = v75.__end_;
          }
          else
          {
            v31 = 0;
          }
          v32 = (int *)&v31[4 * v27];
          int *v32 = v23;
          char v25 = v32 + 1;
          while (end != begin)
          {
            int v33 = *--end;
            *--v32 = v33;
          }
          v75.__begin_ = v32;
          v75.__end_ = v25;
          v75.__end_cap_.__value_ = (int *)&v31[4 * v30];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v75.__end_ = v22;
          char v25 = end + 1;
        }
        v75.__end_ = v25;
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v71 objects:v77 count:16];
    }
    while (v19);
  }

  if (v75.__end_ == v75.__begin_) {
    v34 = (const unsigned __int8 *)&apple::aiml::flatbuffers2::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  }
  else {
    v34 = (const unsigned __int8 *)v75.__begin_;
  }
  int v35 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<int>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v34, v75.__end_ - v75.__begin_);
  memset(&v70, 0, sizeof(v70));
  v36 = [(FTRecoverPronsResponse *)v64 voc_tokens];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v70, [v36 count]);

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v37 = [(FTRecoverPronsResponse *)v64 voc_tokens];
  int v65 = v35;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v67 != v39) {
          objc_enumerationMutation(v37);
        }
        int v41 = [*(id *)(*((void *)&v66 + 1) + 8 * j) addObjectToBuffer:a3];
        int v42 = v41;
        std::vector<int>::pointer v43 = v70.__end_;
        if (v70.__end_ >= v70.__end_cap_.__value_)
        {
          std::vector<int>::pointer v45 = v70.__begin_;
          int64_t v46 = v70.__end_ - v70.__begin_;
          unint64_t v47 = v46 + 1;
          if ((unint64_t)(v46 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v48 = (char *)v70.__end_cap_.__value_ - (char *)v70.__begin_;
          if (((char *)v70.__end_cap_.__value_ - (char *)v70.__begin_) >> 1 > v47) {
            unint64_t v47 = v48 >> 1;
          }
          if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v49 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v49 = v47;
          }
          if (v49)
          {
            v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v70.__end_cap_, v49);
            std::vector<int>::pointer v45 = v70.__begin_;
            std::vector<int>::pointer v43 = v70.__end_;
          }
          else
          {
            v50 = 0;
          }
          v51 = (int *)&v50[4 * v46];
          int *v51 = v42;
          v44 = v51 + 1;
          while (v43 != v45)
          {
            int v52 = *--v43;
            *--v51 = v52;
          }
          v70.__begin_ = v51;
          v70.__end_ = v44;
          v70.__end_cap_.__value_ = (int *)&v50[4 * v49];
          if (v45) {
            operator delete(v45);
          }
        }
        else
        {
          *v70.__end_ = v41;
          v44 = v43 + 1;
        }
        v70.__end_ = v44;
      }
      uint64_t v38 = [v37 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v38);
  }

  if (v70.__end_ == v70.__begin_) {
    std::vector<int>::pointer v53 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::VocToken>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::VocToken>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::VocToken>> const&)::t;
  }
  else {
    std::vector<int>::pointer v53 = v70.__begin_;
  }
  int v54 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v53, v70.__end_ - v70.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v55 = *((_DWORD *)a3 + 8);
  int v56 = *((_DWORD *)a3 + 12);
  int v57 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v62);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 8, v61, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v65);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v54);
  v58.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v55 - (unsigned __int16)v56 + v57);
  if (v70.__begin_)
  {
    v70.__end_ = v70.__begin_;
    operator delete(v70.__begin_);
  }
  if (v75.__begin_)
  {
    v75.__end_ = v75.__begin_;
    operator delete(v75.__begin_);
  }
  return v58;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTRecoverPronsResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__38__FTRecoverPronsResponse_flatbuffData__block_invoke(uint64_t a1)
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
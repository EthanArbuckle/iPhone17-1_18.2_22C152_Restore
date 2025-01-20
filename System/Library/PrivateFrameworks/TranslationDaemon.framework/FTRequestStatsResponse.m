@interface FTRequestStatsResponse
- (FTRequestStatsResponse)initWithFlatbuffData:(id)a3;
- (FTRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4;
- (FTRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4 verify:(BOOL)a5;
- (NSArray)BOOL_stats;
- (NSArray)double_stats;
- (NSArray)int32_stats;
- (NSString)language;
- (NSString)request_locale;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::RequestStatsResponse>)addObjectToBuffer:(void *)a3;
- (id)BOOL_stats_objectAtIndex:(unint64_t)a3;
- (id)double_stats_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)int32_stats_objectAtIndex:(unint64_t)a3;
- (unint64_t)BOOL_stats_count;
- (unint64_t)double_stats_count;
- (unint64_t)int32_stats_count;
- (void)BOOL_stats_enumerateObjectsUsingBlock:(id)a3;
- (void)double_stats_enumerateObjectsUsingBlock:(id)a3;
- (void)int32_stats_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTRequestStatsResponse

- (FTRequestStatsResponse)initWithFlatbuffData:(id)a3
{
  return [(FTRequestStatsResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTRequestStatsResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4
{
  return [(FTRequestStatsResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTRequestStatsResponse;
  v10 = [(FTRequestStatsResponse *)&v26 init];
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
    a4 = (const RequestStatsResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::RequestStatsResponse *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::RequestStatsResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSArray)BOOL_stats
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"BOOL_stats"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__FTRequestStatsResponse_BOOL_stats__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTRequestStatsResponse *)self BOOL_stats_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"BOOL_stats"];
  }
  return (NSArray *)v3;
}

uint64_t __36__FTRequestStatsResponse_BOOL_stats__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)BOOL_stats_objectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"BOOL_stats"];
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
  if (*(unsigned __int16 *)v10->var0 >= 5u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[4].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTRequestStatsResponse_BoolStat alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)BOOL_stats_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"BOOL_stats"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)BOOL_stats_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTRequestStatsResponse_BoolStat *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"BOOL_stats"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 5u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[4].var0;
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
            uint64_t v17 = [[FTRequestStatsResponse_BoolStat alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)int32_stats
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"int32_stats"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__FTRequestStatsResponse_int32_stats__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTRequestStatsResponse *)self int32_stats_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"int32_stats"];
  }
  return (NSArray *)v3;
}

uint64_t __37__FTRequestStatsResponse_int32_stats__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)int32_stats_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"int32_stats"];
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
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTRequestStatsResponse_Int32Stat alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)int32_stats_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"int32_stats"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 7u && (uint64_t v8 = *(unsigned __int16 *)v7[6].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)int32_stats_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTRequestStatsResponse_Int32Stat *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"int32_stats"];
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
            uint64_t v17 = [[FTRequestStatsResponse_Int32Stat alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)double_stats
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"double_stats"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__FTRequestStatsResponse_double_stats__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTRequestStatsResponse *)self double_stats_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"double_stats"];
  }
  return (NSArray *)v3;
}

uint64_t __38__FTRequestStatsResponse_double_stats__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)double_stats_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"double_stats"];
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
  if (*(unsigned __int16 *)v10->var0 >= 9u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[8].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTRequestStatsResponse_DoubleStat alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)double_stats_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"double_stats"];
  v4 = v3;
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

- (void)double_stats_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTRequestStatsResponse_DoubleStat *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"double_stats"];
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
            uint64_t v17 = [[FTRequestStatsResponse_DoubleStat alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSString)language
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)speech_id
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)request_locale
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
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

- (Offset<siri::speech::schema_fb::RequestStatsResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  memset(&v97, 0, sizeof(v97));
  uint64_t v5 = [(FTRequestStatsResponse *)self BOOL_stats];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v97, [v5 count]);

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v6 = [(FTRequestStatsResponse *)self BOOL_stats];
  v82 = self;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v93 objects:v100 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v94 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = [*(id *)(*((void *)&v93 + 1) + 8 * i) addObjectToBuffer:a3];
        int v11 = v10;
        std::vector<int>::pointer end = v97.__end_;
        if (v97.__end_ >= v97.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v97.__begin_;
          int64_t v15 = v97.__end_ - v97.__begin_;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v17 = (char *)v97.__end_cap_.__value_ - (char *)v97.__begin_;
          if (((char *)v97.__end_cap_.__value_ - (char *)v97.__begin_) >> 1 > v16) {
            unint64_t v16 = v17 >> 1;
          }
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18)
          {
            uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v97.__end_cap_, v18);
            std::vector<int>::pointer begin = v97.__begin_;
            std::vector<int>::pointer end = v97.__end_;
          }
          else
          {
            uint64_t v19 = 0;
          }
          unsigned __int8 v20 = (int *)&v19[4 * v15];
          int *v20 = v11;
          uint64_t v13 = v20 + 1;
          while (end != begin)
          {
            int v21 = *--end;
            *--unsigned __int8 v20 = v21;
          }
          v97.__begin_ = v20;
          v97.__end_ = v13;
          v97.__end_cap_.__value_ = (int *)&v19[4 * v18];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v97.__end_ = v10;
          uint64_t v13 = end + 1;
        }
        v97.__end_ = v13;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v93 objects:v100 count:16];
    }
    while (v7);
  }

  if (v97.__end_ == v97.__begin_) {
    std::vector<int>::pointer v22 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>> const&)::t;
  }
  else {
    std::vector<int>::pointer v22 = v97.__begin_;
  }
  int v23 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v22, v97.__end_ - v97.__begin_);
  memset(&v92, 0, sizeof(v92));
  uint64_t v24 = [(FTRequestStatsResponse *)v82 int32_stats];
  int v81 = v23;
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v92, [v24 count]);

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  char v25 = [(FTRequestStatsResponse *)v82 int32_stats];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v88 objects:v99 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v89 != v27) {
          objc_enumerationMutation(v25);
        }
        int v29 = [*(id *)(*((void *)&v88 + 1) + 8 * j) addObjectToBuffer:a3];
        int v30 = v29;
        std::vector<int>::pointer v31 = v92.__end_;
        if (v92.__end_ >= v92.__end_cap_.__value_)
        {
          std::vector<int>::pointer v33 = v92.__begin_;
          int64_t v34 = v92.__end_ - v92.__begin_;
          unint64_t v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v36 = (char *)v92.__end_cap_.__value_ - (char *)v92.__begin_;
          if (((char *)v92.__end_cap_.__value_ - (char *)v92.__begin_) >> 1 > v35) {
            unint64_t v35 = v36 >> 1;
          }
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v37 = v35;
          }
          if (v37)
          {
            v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v92.__end_cap_, v37);
            std::vector<int>::pointer v33 = v92.__begin_;
            std::vector<int>::pointer v31 = v92.__end_;
          }
          else
          {
            v38 = 0;
          }
          v39 = (int *)&v38[4 * v34];
          int *v39 = v30;
          v32 = v39 + 1;
          while (v31 != v33)
          {
            int v40 = *--v31;
            *--v39 = v40;
          }
          v92.__begin_ = v39;
          v92.__end_ = v32;
          v92.__end_cap_.__value_ = (int *)&v38[4 * v37];
          if (v33) {
            operator delete(v33);
          }
        }
        else
        {
          *v92.__end_ = v29;
          v32 = v31 + 1;
        }
        v92.__end_ = v32;
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v88 objects:v99 count:16];
    }
    while (v26);
  }

  if (v92.__end_ == v92.__begin_) {
    std::vector<int>::pointer v41 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>> const&)::t;
  }
  else {
    std::vector<int>::pointer v41 = v92.__begin_;
  }
  int v80 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v41, v92.__end_ - v92.__begin_);
  memset(&v87, 0, sizeof(v87));
  v42 = [(FTRequestStatsResponse *)v82 double_stats];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v87, [v42 count]);

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v43 = [(FTRequestStatsResponse *)v82 double_stats];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v83 objects:v98 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v84;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v84 != v45) {
          objc_enumerationMutation(v43);
        }
        int v47 = [*(id *)(*((void *)&v83 + 1) + 8 * k) addObjectToBuffer:a3];
        int v48 = v47;
        std::vector<int>::pointer v49 = v87.__end_;
        if (v87.__end_ >= v87.__end_cap_.__value_)
        {
          std::vector<int>::pointer v51 = v87.__begin_;
          int64_t v52 = v87.__end_ - v87.__begin_;
          unint64_t v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v54 = (char *)v87.__end_cap_.__value_ - (char *)v87.__begin_;
          if (((char *)v87.__end_cap_.__value_ - (char *)v87.__begin_) >> 1 > v53) {
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
            v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v87.__end_cap_, v55);
            std::vector<int>::pointer v51 = v87.__begin_;
            std::vector<int>::pointer v49 = v87.__end_;
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
          v87.__begin_ = v57;
          v87.__end_ = v50;
          v87.__end_cap_.__value_ = (int *)&v56[4 * v55];
          if (v51) {
            operator delete(v51);
          }
        }
        else
        {
          *v87.__end_ = v47;
          v50 = v49 + 1;
        }
        v87.__end_ = v50;
      }
      uint64_t v44 = [v43 countByEnumeratingWithState:&v83 objects:v98 count:16];
    }
    while (v44);
  }

  if (v87.__end_ == v87.__begin_) {
    std::vector<int>::pointer v59 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>> const&)::t;
  }
  else {
    std::vector<int>::pointer v59 = v87.__begin_;
  }
  int v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v59, v87.__end_ - v87.__begin_);
  v61 = [(FTRequestStatsResponse *)v82 language];
  v62 = v61;
  if (!v61) {
    v61 = &stru_270C008E8;
  }
  v63 = (const char *)[(__CFString *)v61 UTF8String];
  size_t v64 = strlen(v63);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v63, v64);

  v66 = [(FTRequestStatsResponse *)v82 speech_id];
  v67 = v66;
  if (!v66) {
    v66 = &stru_270C008E8;
  }
  v68 = (const char *)[(__CFString *)v66 UTF8String];
  size_t v69 = strlen(v68);
  int v70 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v68, v69);

  v71 = [(FTRequestStatsResponse *)v82 request_locale];
  v72 = v71;
  if (!v71) {
    v71 = &stru_270C008E8;
  }
  v73 = (const char *)[(__CFString *)v71 UTF8String];
  size_t v74 = strlen(v73);
  LODWORD(v73) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v73, v74);

  *((unsigned char *)a3 + 70) = 1;
  int v75 = *((_DWORD *)a3 + 8);
  int v76 = *((_DWORD *)a3 + 12);
  int v77 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v81);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v80);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, (int)v73);
  v78.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v75 - (unsigned __int16)v76 + v77);
  if (v87.__begin_)
  {
    v87.__end_ = v87.__begin_;
    operator delete(v87.__begin_);
  }
  if (v92.__begin_)
  {
    v92.__end_ = v92.__begin_;
    operator delete(v92.__begin_);
  }
  if (v97.__begin_)
  {
    v97.__end_ = v97.__begin_;
    operator delete(v97.__begin_);
  }
  return v78;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTRequestStatsResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__38__FTRequestStatsResponse_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__47__FTRequestStatsResponse_BoolStat_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

apple::aiml::flatbuffers2::DetachedBuffer *__48__FTRequestStatsResponse_Int32Stat_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

apple::aiml::flatbuffers2::DetachedBuffer *__49__FTRequestStatsResponse_DoubleStat_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

@end
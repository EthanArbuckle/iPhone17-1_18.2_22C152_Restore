@interface FTTokenProns
- (FTTokenProns)initWithFlatbuffData:(id)a3;
- (FTTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4;
- (FTTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4 verify:(BOOL)a5;
- (NSArray)normalized_prons;
- (NSArray)prons;
- (NSArray)sanitized_sequences;
- (NSString)orthography;
- (Offset<siri::speech::schema_fb::TokenProns>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)normalized_prons_objectAtIndex:(unint64_t)a3;
- (id)prons_objectAtIndex:(unint64_t)a3;
- (id)sanitized_sequences_objectAtIndex:(unint64_t)a3;
- (unint64_t)normalized_prons_count;
- (unint64_t)prons_count;
- (unint64_t)sanitized_sequences_count;
- (void)normalized_prons_enumerateObjectsUsingBlock:(id)a3;
- (void)prons_enumerateObjectsUsingBlock:(id)a3;
- (void)sanitized_sequences_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTTokenProns

- (FTTokenProns)initWithFlatbuffData:(id)a3
{
  return [(FTTokenProns *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTokenProns *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4
{
  return [(FTTokenProns *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTokenProns;
  v10 = [(FTTokenProns *)&v26 init];
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
    a4 = (const TokenProns *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TokenProns *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TokenProns::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)orthography
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

- (NSArray)sanitized_sequences
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"sanitized_sequences"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __35__FTTokenProns_sanitized_sequences__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTokenProns *)self sanitized_sequences_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"sanitized_sequences"];
  }
  return (NSArray *)v3;
}

uint64_t __35__FTTokenProns_sanitized_sequences__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)sanitized_sequences_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"sanitized_sequences"];
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
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTokenProns_SanitizedSequence alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)sanitized_sequences_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"sanitized_sequences"];
  uint64_t v4 = v3;
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

- (void)sanitized_sequences_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTTokenProns_SanitizedSequence *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"sanitized_sequences"];
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
            uint64_t v17 = [[FTTokenProns_SanitizedSequence alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)prons
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prons"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __21__FTTokenProns_prons__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTokenProns *)self prons_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"prons"];
  }
  return (NSArray *)v3;
}

uint64_t __21__FTTokenProns_prons__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)prons_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prons"];
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
      id v7 = [[FTPronChoice alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)prons_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prons"];
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

- (void)prons_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTPronChoice *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prons"];
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
            uint64_t v17 = [[FTPronChoice alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)normalized_prons
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_prons"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __32__FTTokenProns_normalized_prons__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTokenProns *)self normalized_prons_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"normalized_prons"];
  }
  return (NSArray *)v3;
}

uint64_t __32__FTTokenProns_normalized_prons__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)normalized_prons_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_prons"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0xBu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[10].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTPronChoice alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)normalized_prons_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_prons"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (uint64_t v8 = *(unsigned __int16 *)v7[10].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)normalized_prons_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTPronChoice *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_prons"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xBu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[10].var0;
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
            uint64_t v17 = [[FTPronChoice alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::TokenProns>)addObjectToBuffer:(void *)a3
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTTokenProns *)self orthography];
  v6 = v5;
  if (!v5) {
    unint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  memset(&v88, 0, sizeof(v88));
  uint64_t v9 = [(FTTokenProns *)self sanitized_sequences];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v88, [v9 count]);

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v10 = [(FTTokenProns *)self sanitized_sequences];
  v72 = self;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v84 objects:v91 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v85 != v12) {
          objc_enumerationMutation(v10);
        }
        int v14 = [*(id *)(*((void *)&v84 + 1) + 8 * i) addObjectToBuffer:a3];
        int v15 = v14;
        std::vector<int>::pointer end = v88.__end_;
        if (v88.__end_ >= v88.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v88.__begin_;
          int64_t v19 = v88.__end_ - v88.__begin_;
          unint64_t v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v21 = (char *)v88.__end_cap_.__value_ - (char *)v88.__begin_;
          if (((char *)v88.__end_cap_.__value_ - (char *)v88.__begin_) >> 1 > v20) {
            unint64_t v20 = v21 >> 1;
          }
          if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v20;
          }
          if (v22)
          {
            long long v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v88.__end_cap_, v22);
            std::vector<int>::pointer begin = v88.__begin_;
            std::vector<int>::pointer end = v88.__end_;
          }
          else
          {
            long long v23 = 0;
          }
          uint64_t v24 = (int *)&v23[4 * v19];
          *uint64_t v24 = v15;
          uint64_t v17 = v24 + 1;
          while (end != begin)
          {
            int v25 = *--end;
            *--uint64_t v24 = v25;
          }
          v88.__begin_ = v24;
          v88.__end_ = v17;
          v88.__end_cap_.__value_ = (int *)&v23[4 * v22];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v88.__end_ = v14;
          uint64_t v17 = end + 1;
        }
        v88.__end_ = v17;
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v84 objects:v91 count:16];
    }
    while (v11);
  }

  if (v88.__end_ == v88.__begin_) {
    std::vector<int>::pointer v26 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>> const&)::t;
  }
  else {
    std::vector<int>::pointer v26 = v88.__begin_;
  }
  int v70 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v26, v88.__end_ - v88.__begin_);
  memset(&v83, 0, sizeof(v83));
  v27 = [(FTTokenProns *)v72 prons];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v83, [v27 count]);

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v28 = [(FTTokenProns *)v72 prons];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v79 objects:v90 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v80;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v80 != v30) {
          objc_enumerationMutation(v28);
        }
        int v32 = [*(id *)(*((void *)&v79 + 1) + 8 * j) addObjectToBuffer:a3];
        int v33 = v32;
        std::vector<int>::pointer v34 = v83.__end_;
        if (v83.__end_ >= v83.__end_cap_.__value_)
        {
          std::vector<int>::pointer v36 = v83.__begin_;
          int64_t v37 = v83.__end_ - v83.__begin_;
          unint64_t v38 = v37 + 1;
          if ((unint64_t)(v37 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v39 = (char *)v83.__end_cap_.__value_ - (char *)v83.__begin_;
          if (((char *)v83.__end_cap_.__value_ - (char *)v83.__begin_) >> 1 > v38) {
            unint64_t v38 = v39 >> 1;
          }
          if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v40 = v38;
          }
          if (v40)
          {
            v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v83.__end_cap_, v40);
            std::vector<int>::pointer v36 = v83.__begin_;
            std::vector<int>::pointer v34 = v83.__end_;
          }
          else
          {
            v41 = 0;
          }
          v42 = (int *)&v41[4 * v37];
          int *v42 = v33;
          v35 = v42 + 1;
          while (v34 != v36)
          {
            int v43 = *--v34;
            *--v42 = v43;
          }
          v83.__begin_ = v42;
          v83.__end_ = v35;
          v83.__end_cap_.__value_ = (int *)&v41[4 * v40];
          if (v36) {
            operator delete(v36);
          }
        }
        else
        {
          *v83.__end_ = v32;
          v35 = v34 + 1;
        }
        v83.__end_ = v35;
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v79 objects:v90 count:16];
    }
    while (v29);
  }

  if (v83.__end_ == v83.__begin_) {
    std::vector<int>::pointer v44 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>> const&)::t;
  }
  else {
    std::vector<int>::pointer v44 = v83.__begin_;
  }
  int v45 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v44, v83.__end_ - v83.__begin_);
  memset(&v78, 0, sizeof(v78));
  v46 = [(FTTokenProns *)v72 normalized_prons];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v78, [v46 count]);

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v47 = [(FTTokenProns *)v72 normalized_prons];
  int v73 = v45;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v74 objects:v89 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v75;
    do
    {
      for (uint64_t k = 0; k != v48; ++k)
      {
        if (*(void *)v75 != v49) {
          objc_enumerationMutation(v47);
        }
        int v51 = [*(id *)(*((void *)&v74 + 1) + 8 * k) addObjectToBuffer:a3];
        int v52 = v51;
        std::vector<int>::pointer v53 = v78.__end_;
        if (v78.__end_ >= v78.__end_cap_.__value_)
        {
          std::vector<int>::pointer v55 = v78.__begin_;
          int64_t v56 = v78.__end_ - v78.__begin_;
          unint64_t v57 = v56 + 1;
          if ((unint64_t)(v56 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v58 = (char *)v78.__end_cap_.__value_ - (char *)v78.__begin_;
          if (((char *)v78.__end_cap_.__value_ - (char *)v78.__begin_) >> 1 > v57) {
            unint64_t v57 = v58 >> 1;
          }
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v59 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v59 = v57;
          }
          if (v59)
          {
            v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v78.__end_cap_, v59);
            std::vector<int>::pointer v55 = v78.__begin_;
            std::vector<int>::pointer v53 = v78.__end_;
          }
          else
          {
            v60 = 0;
          }
          v61 = (int *)&v60[4 * v56];
          int *v61 = v52;
          v54 = v61 + 1;
          while (v53 != v55)
          {
            int v62 = *--v53;
            *--v61 = v62;
          }
          v78.__begin_ = v61;
          v78.__end_ = v54;
          v78.__end_cap_.__value_ = (int *)&v60[4 * v59];
          if (v55) {
            operator delete(v55);
          }
        }
        else
        {
          *v78.__end_ = v51;
          v54 = v53 + 1;
        }
        v78.__end_ = v54;
      }
      uint64_t v48 = [v47 countByEnumeratingWithState:&v74 objects:v89 count:16];
    }
    while (v48);
  }

  if (v78.__end_ == v78.__begin_) {
    std::vector<int>::pointer v63 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>> const&)::t;
  }
  else {
    std::vector<int>::pointer v63 = v78.__begin_;
  }
  int v64 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v63, v78.__end_ - v78.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v65 = *((_DWORD *)a3 + 8);
  int v66 = *((_DWORD *)a3 + 12);
  int v67 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v73);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v64);
  v68.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v65 - (unsigned __int16)v66 + v67);
  if (v78.__begin_)
  {
    v78.__end_ = v78.__begin_;
    operator delete(v78.__begin_);
  }
  if (v83.__begin_)
  {
    v83.__end_ = v83.__begin_;
    operator delete(v83.__begin_);
  }
  if (v88.__begin_)
  {
    v88.__end_ = v88.__begin_;
    operator delete(v88.__begin_);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTokenProns *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__28__FTTokenProns_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __50__FTTokenProns_SanitizedSequence_sanitized_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

apple::aiml::flatbuffers2::DetachedBuffer *__46__FTTokenProns_SanitizedSequence_flatbuffData__block_invoke(uint64_t a1)
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
@interface FTSetSpeechContext
- (FTSetSpeechContext)initWithFlatbuffData:(id)a3;
- (FTSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4;
- (FTSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4 verify:(BOOL)a5;
- (NSArray)context_with_pron_hints;
- (NSArray)contextual_text;
- (NSString)left_context;
- (NSString)right_context;
- (Offset<siri::speech::schema_fb::SetSpeechContext>)addObjectToBuffer:(void *)a3;
- (id)context_with_pron_hints_objectAtIndex:(unint64_t)a3;
- (id)contextual_text_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (unint64_t)context_with_pron_hints_count;
- (unint64_t)contextual_text_count;
- (void)context_with_pron_hints_enumerateObjectsUsingBlock:(id)a3;
- (void)contextual_text_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTSetSpeechContext

- (FTSetSpeechContext)initWithFlatbuffData:(id)a3
{
  return [(FTSetSpeechContext *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTSetSpeechContext *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4
{
  return [(FTSetSpeechContext *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTSetSpeechContext;
  v10 = [(FTSetSpeechContext *)&v26 init];
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
    a4 = (const SetSpeechContext *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::SetSpeechContext *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::SetSpeechContext::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSArray)contextual_text
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"contextual_text"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__FTSetSpeechContext_contextual_text__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTSetSpeechContext *)self contextual_text_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"contextual_text"];
  }
  return (NSArray *)v3;
}

uint64_t __37__FTSetSpeechContext_contextual_text__block_invoke(uint64_t a1, uint64_t a2)
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
  if (*(unsigned __int16 *)v10->var0 >= 5u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[4].var0;
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
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
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
    if (*(unsigned __int16 *)v8->var0 >= 5u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[4].var0;
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)right_context
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

- (NSArray)context_with_pron_hints
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_with_pron_hints"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__FTSetSpeechContext_context_with_pron_hints__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTSetSpeechContext *)self context_with_pron_hints_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"context_with_pron_hints"];
  }
  return (NSArray *)v3;
}

uint64_t __45__FTSetSpeechContext_context_with_pron_hints__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)context_with_pron_hints_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_with_pron_hints"];
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
      id v7 = [[FTContextWithPronHints alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)context_with_pron_hints_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_with_pron_hints"];
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

- (void)context_with_pron_hints_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTContextWithPronHints *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_with_pron_hints"];
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
            int v17 = [[FTContextWithPronHints alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::SetSpeechContext>)addObjectToBuffer:(void *)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  memset(&v71, 0, sizeof(v71));
  uint64_t v4 = [(FTSetSpeechContext *)self contextual_text];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v71, [v4 count]);

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  unint64_t v5 = [(FTSetSpeechContext *)self contextual_text];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v68 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = (const char *)[*(id *)(*((void *)&v67 + 1) + 8 * i) UTF8String];
        size_t v10 = strlen(v9);
        int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v9, v10);
        int v12 = String;
        std::vector<int>::pointer end = v71.__end_;
        if (v71.__end_ >= v71.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v71.__begin_;
          int64_t v16 = v71.__end_ - v71.__begin_;
          unint64_t v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v18 = (char *)v71.__end_cap_.__value_ - (char *)v71.__begin_;
          if (((char *)v71.__end_cap_.__value_ - (char *)v71.__begin_) >> 1 > v17) {
            unint64_t v17 = v18 >> 1;
          }
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v17;
          }
          if (v19)
          {
            unsigned __int8 v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v71.__end_cap_, v19);
            std::vector<int>::pointer begin = v71.__begin_;
            std::vector<int>::pointer end = v71.__end_;
          }
          else
          {
            unsigned __int8 v20 = 0;
          }
          v21 = (int *)&v20[4 * v16];
          int *v21 = v12;
          uint64_t v14 = v21 + 1;
          while (end != begin)
          {
            int v22 = *--end;
            *--v21 = v22;
          }
          v71.__begin_ = v21;
          v71.__end_ = v14;
          v71.__end_cap_.__value_ = (int *)&v20[4 * v19];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v71.__end_ = String;
          uint64_t v14 = end + 1;
        }
        v71.__end_ = v14;
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v6);
  }

  if (v71.__end_ == v71.__begin_) {
    std::vector<int>::pointer v23 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    std::vector<int>::pointer v23 = v71.__begin_;
  }
  int v24 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v23, v71.__end_ - v71.__begin_);
  char v25 = [(FTSetSpeechContext *)self left_context];
  objc_super v26 = v25;
  if (!v25) {
    char v25 = &stru_270C008E8;
  }
  v27 = (const char *)[(__CFString *)v25 UTF8String];
  size_t v28 = strlen(v27);
  int v29 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27, v28);

  v30 = [(FTSetSpeechContext *)self right_context];
  v31 = v30;
  if (!v30) {
    v30 = &stru_270C008E8;
  }
  v32 = (const char *)[(__CFString *)v30 UTF8String];
  size_t v33 = strlen(v32);
  int v34 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v32, v33);

  memset(&v66, 0, sizeof(v66));
  v35 = [(FTSetSpeechContext *)self context_with_pron_hints];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v66, [v35 count]);

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v36 = [(FTSetSpeechContext *)self context_with_pron_hints];
  int v59 = v34;
  int v60 = v29;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v63 != v38) {
          objc_enumerationMutation(v36);
        }
        int v40 = [*(id *)(*((void *)&v62 + 1) + 8 * j) addObjectToBuffer:a3];
        int v41 = v40;
        std::vector<int>::pointer v42 = v66.__end_;
        if (v66.__end_ >= v66.__end_cap_.__value_)
        {
          std::vector<int>::pointer v44 = v66.__begin_;
          int64_t v45 = v66.__end_ - v66.__begin_;
          unint64_t v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v47 = (char *)v66.__end_cap_.__value_ - (char *)v66.__begin_;
          if (((char *)v66.__end_cap_.__value_ - (char *)v66.__begin_) >> 1 > v46) {
            unint64_t v46 = v47 >> 1;
          }
          if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v48 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v48 = v46;
          }
          if (v48)
          {
            v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v66.__end_cap_, v48);
            std::vector<int>::pointer v44 = v66.__begin_;
            std::vector<int>::pointer v42 = v66.__end_;
          }
          else
          {
            v49 = 0;
          }
          v50 = (int *)&v49[4 * v45];
          int *v50 = v41;
          v43 = v50 + 1;
          while (v42 != v44)
          {
            int v51 = *--v42;
            *--v50 = v51;
          }
          v66.__begin_ = v50;
          v66.__end_ = v43;
          v66.__end_cap_.__value_ = (int *)&v49[4 * v48];
          if (v44) {
            operator delete(v44);
          }
        }
        else
        {
          *v66.__end_ = v40;
          v43 = v42 + 1;
        }
        v66.__end_ = v43;
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v37);
  }

  if (v66.__end_ == v66.__begin_) {
    std::vector<int>::pointer v52 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ContextWithPronHints>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ContextWithPronHints>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ContextWithPronHints>> const&)::t;
  }
  else {
    std::vector<int>::pointer v52 = v66.__begin_;
  }
  int v53 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v52, v66.__end_ - v66.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v54 = *((_DWORD *)a3 + 8);
  int v55 = *((_DWORD *)a3 + 12);
  int v56 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v24);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v59);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v53);
  v57.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v54 - (unsigned __int16)v55 + v56);
  if (v66.__begin_)
  {
    v66.__end_ = v66.__begin_;
    operator delete(v66.__begin_);
  }
  if (v71.__begin_)
  {
    v71.__end_ = v71.__begin_;
    operator delete(v71.__begin_);
  }
  return v57;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTSetSpeechContext *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__34__FTSetSpeechContext_flatbuffData__block_invoke(uint64_t a1)
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
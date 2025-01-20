@interface FTBatchTranslationCacheContainer
- (BOOL)contains_masked_profanity;
- (FTBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3;
- (FTBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3 root:(const BatchTranslationCacheContainer *)a4;
- (FTBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3 root:(const BatchTranslationCacheContainer *)a4 verify:(BOOL)a5;
- (NSArray)spans;
- (NSString)request_id;
- (NSString)translated_text;
- (NSString)translated_text_romanized;
- (Offset<siri::speech::schema_fb::BatchTranslationCacheContainer>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)spans_objectAtIndex:(unint64_t)a3;
- (int)sentence_count;
- (unint64_t)spans_count;
- (void)spans_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTBatchTranslationCacheContainer

- (FTBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationCacheContainer *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationCacheContainer *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3 root:(const BatchTranslationCacheContainer *)a4
{
  return [(FTBatchTranslationCacheContainer *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3 root:(const BatchTranslationCacheContainer *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTBatchTranslationCacheContainer;
  v10 = [(FTBatchTranslationCacheContainer *)&v26 init];
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
    a4 = (const BatchTranslationCacheContainer *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::BatchTranslationCacheContainer *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::BatchTranslationCacheContainer::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)request_id
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

- (NSString)translated_text
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

- (NSArray)spans
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"spans"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__FTBatchTranslationCacheContainer_spans__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTBatchTranslationCacheContainer *)self spans_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"spans"];
  }
  return (NSArray *)v3;
}

uint64_t __41__FTBatchTranslationCacheContainer_spans__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)spans_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"spans"];
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
      id v7 = [[FTRepeatedSpan alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)spans_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"spans"];
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

- (void)spans_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTRepeatedSpan *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"spans"];
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
            uint64_t v17 = [[FTRepeatedSpan alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (int)sentence_count
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)translated_text_romanized
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

- (BOOL)contains_masked_profanity
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::BatchTranslationCacheContainer>)addObjectToBuffer:(void *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(FTBatchTranslationCacheContainer *)self request_id];
  v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  v10 = [(FTBatchTranslationCacheContainer *)self translated_text];
  uint64_t v11 = v10;
  if (!v10) {
    v10 = &stru_270C008E8;
  }
  uint64_t v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  LODWORD(v44) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);

  memset(&v50, 0, sizeof(v50));
  uint64_t v14 = [(FTBatchTranslationCacheContainer *)self spans];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v50, [v14 count]);

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v15 = [(FTBatchTranslationCacheContainer *)self spans];
  HIDWORD(v44) = String;
  v45 = self;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(v15);
        }
        int v19 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * i), "addObjectToBuffer:", a3, v44);
        int v20 = v19;
        std::vector<int>::pointer end = v50.__end_;
        if (v50.__end_ >= v50.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v50.__begin_;
          int64_t v24 = v50.__end_ - v50.__begin_;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v26 = (char *)v50.__end_cap_.__value_ - (char *)v50.__begin_;
          if (((char *)v50.__end_cap_.__value_ - (char *)v50.__begin_) >> 1 > v25) {
            unint64_t v25 = v26 >> 1;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27)
          {
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v50.__end_cap_, v27);
            std::vector<int>::pointer begin = v50.__begin_;
            std::vector<int>::pointer end = v50.__end_;
          }
          else
          {
            v28 = 0;
          }
          v29 = (int *)&v28[4 * v24];
          int *v29 = v20;
          v22 = v29 + 1;
          while (end != begin)
          {
            int v30 = *--end;
            *--v29 = v30;
          }
          v50.__begin_ = v29;
          v50.__end_ = v22;
          v50.__end_cap_.__value_ = (int *)&v28[4 * v27];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v50.__end_ = v19;
          v22 = end + 1;
        }
        v50.__end_ = v22;
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v16);
  }

  if (v50.__end_ == v50.__begin_) {
    std::vector<int>::pointer v31 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  }
  else {
    std::vector<int>::pointer v31 = v50.__begin_;
  }
  int v32 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v31, v50.__end_ - v50.__begin_);
  int v33 = [(FTBatchTranslationCacheContainer *)v45 sentence_count];
  v34 = [(FTBatchTranslationCacheContainer *)v45 translated_text_romanized];
  v35 = v34;
  if (!v34) {
    v34 = &stru_270C008E8;
  }
  v36 = (const char *)[(__CFString *)v34 UTF8String];
  size_t v37 = strlen(v36);
  LODWORD(v36) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v36, v37);

  int v38 = [(FTBatchTranslationCacheContainer *)v45 contains_masked_profanity];
  *((unsigned char *)a3 + 70) = 1;
  int v39 = *((_DWORD *)a3 + 8);
  int v40 = *((_DWORD *)a3 + 12);
  int v41 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, SHIDWORD(v44));
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v44);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v32);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 10, v33, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, (int)v36);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 14, v38, 0);
  v42.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v39 - (unsigned __int16)v40 + v41);
  if (v50.__begin_)
  {
    v50.__end_ = v50.__begin_;
    operator delete(v50.__begin_);
  }
  return v42;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTBatchTranslationCacheContainer *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__48__FTBatchTranslationCacheContainer_flatbuffData__block_invoke(uint64_t a1)
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
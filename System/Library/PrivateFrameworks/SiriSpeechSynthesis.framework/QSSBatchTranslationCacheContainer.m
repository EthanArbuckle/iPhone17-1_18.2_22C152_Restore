@interface QSSBatchTranslationCacheContainer
- (NSArray)spans;
- (NSString)request_id;
- (NSString)translated_text;
- (Offset<siri::speech::schema_fb::BatchTranslationCacheContainer>)addObjectToBuffer:(void *)a3;
- (QSSBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3;
- (QSSBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3 root:(const BatchTranslationCacheContainer *)a4;
- (QSSBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3 root:(const BatchTranslationCacheContainer *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)sentence_count;
@end

@implementation QSSBatchTranslationCacheContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_22B64D0D0;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(QSSBatchTranslationCacheContainer *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__49__QSSBatchTranslationCacheContainer_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::BatchTranslationCacheContainer>)addObjectToBuffer:(void *)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSBatchTranslationCacheContainer *)self request_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(QSSBatchTranslationCacheContainer *)self translated_text];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_26DEBFAF8;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  unsigned int v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  memset(&v48, 0, sizeof(v48));
  v15 = [(QSSBatchTranslationCacheContainer *)self spans];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v48, [v15 count]);

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v16 = [(QSSBatchTranslationCacheContainer *)self spans];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v49 count:16];
  unsigned int v40 = v14;
  unsigned int v41 = String;
  v42 = self;
  begin = v48.__begin_;
  if (v17)
  {
    uint64_t v19 = *(void *)v45;
    value = v48.__end_cap_.__value_;
    v43 = v16;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v45 != v19) {
          objc_enumerationMutation(v16);
        }
        int v22 = [*(id *)(*((void *)&v44 + 1) + 8 * i) addObjectToBuffer:a3];
        int v23 = v22;
        std::vector<int>::pointer end = v48.__end_;
        if (v48.__end_ >= value)
        {
          uint64_t v26 = v48.__end_ - begin;
          unint64_t v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 62)
          {
            v48.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v27) {
            unint64_t v27 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v28 = v27;
          }
          if (v28) {
            unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v28);
          }
          else {
            uint64_t v29 = 0;
          }
          v30 = (int *)(v28 + 4 * v26);
          int *v30 = v23;
          v25 = v30 + 1;
          while (end != begin)
          {
            int v31 = *--end;
            *--v30 = v31;
          }
          value = (int *)(v28 + 4 * v29);
          v48.__end_ = v25;
          if (begin) {
            operator delete(begin);
          }
          begin = v30;
          v16 = v43;
        }
        else
        {
          *v48.__end_ = v22;
          v25 = end + 1;
        }
        v48.__end_ = v25;
      }
      v48.__end_cap_.__value_ = value;
      v48.__begin_ = begin;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v17);
  }
  else
  {
    v25 = v48.__end_;
  }

  if (v25 == begin) {
    v32 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  }
  else {
    v32 = begin;
  }
  unsigned int v33 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v32, v25 - begin);
  int v34 = [(QSSBatchTranslationCacheContainer *)v42 sentence_count];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v35 = *((_DWORD *)a3 + 8);
  int v36 = *((_DWORD *)a3 + 12);
  int v37 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v41);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v33);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v34);
  v38.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v35 - v36 + v37);
  if (begin)
  {
    v48.__end_ = begin;
    operator delete(begin);
  }
  return v38;
}

- (int)sentence_count
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSArray)spans
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"spans"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 9u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[8].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSRepeatedSpan alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"spans"];
  }
  return (NSArray *)v3;
}

- (NSString)translated_text
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)request_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3 root:(const BatchTranslationCacheContainer *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v41.receiver = self;
  v41.super_class = (Class)QSSBatchTranslationCacheContainer;
  uint64_t v10 = [(QSSBatchTranslationCacheContainer *)&v41 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_40;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_41;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    size_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const BatchTranslationCacheContainer *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_39;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_41;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v36 = v18;
  unint64_t v37 = v19;
  long long v38 = xmmword_22B64D0E0;
  uint64_t v39 = 0;
  char v40 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_39;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v36, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 4u))
  {
    goto LABEL_41;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    int v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    int v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v36, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 6u))
  {
    goto LABEL_41;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
    uint64_t v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  }
  else {
    uint64_t v26 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v36, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 8u))
  {
    goto LABEL_41;
  }
  unint64_t v27 = 0;
  uint64_t v28 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v28) < 9u) {
    goto LABEL_34;
  }
  if (*(_WORD *)((char *)root - v28 + 8))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v36, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v28 + 8)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v28 + 8)), 4uLL, 0))
    {
      unint64_t v27 = 0;
      uint64_t v28 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v28) < 9u) {
        goto LABEL_34;
      }
      goto LABEL_31;
    }
LABEL_41:
    int v34 = 0;
    goto LABEL_42;
  }
LABEL_31:
  uint64_t v29 = *(unsigned __int16 *)((char *)root - v28 + 8);
  if (v29) {
    unint64_t v27 = (_DWORD *)((char *)root + v29 + *(unsigned int *)((char *)root + v29));
  }
  else {
    unint64_t v27 = 0;
  }
LABEL_34:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RepeatedSpan>((flatbuffers::Verifier *)&v36, v27))goto LABEL_41; {
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  }
  if (*v30 >= 0xBu)
  {
    uint64_t v31 = v30[5];
    if (v31)
    {
      if (v37 < 5 || v37 - 4 < (unint64_t)root + v31 - v36) {
        goto LABEL_41;
      }
    }
  }
LABEL_39:
  uint64_t v32 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v36);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v32;

LABEL_40:
  int v34 = v11;
LABEL_42:

  return v34;
}

- (QSSBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3 root:(const BatchTranslationCacheContainer *)a4
{
  return [(QSSBatchTranslationCacheContainer *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationCacheContainer *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationCacheContainer *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
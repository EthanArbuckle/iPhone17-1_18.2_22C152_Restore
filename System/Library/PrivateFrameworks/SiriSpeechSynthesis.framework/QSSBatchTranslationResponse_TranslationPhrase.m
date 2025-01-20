@interface QSSBatchTranslationResponse_TranslationPhrase
- (BOOL)low_confidence;
- (NSArray)repeated_spans;
- (NSString)meta_info;
- (NSString)translation_phrase;
- (Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>)addObjectToBuffer:(void *)a3;
- (QSSBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3;
- (QSSBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4;
- (QSSBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4 verify:(BOOL)a5;
- (float)confidence;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSBatchTranslationResponse_TranslationPhrase

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
  v2.var0 = [(QSSBatchTranslationResponse_TranslationPhrase *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

- (Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>)addObjectToBuffer:(void *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  [(QSSBatchTranslationResponse_TranslationPhrase *)self confidence];
  float v6 = v5;
  long long v7 = [(QSSBatchTranslationResponse_TranslationPhrase *)self translation_phrase];
  long long v8 = v7;
  if (!v7) {
    long long v7 = &stru_26DEBFAF8;
  }
  long long v9 = (const char *)[(__CFString *)v7 UTF8String];
  size_t v10 = strlen(v9);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v9, v10);

  __int16 v12 = [(QSSBatchTranslationResponse_TranslationPhrase *)self meta_info];
  uint64_t v13 = v12;
  if (!v12) {
    __int16 v12 = &stru_26DEBFAF8;
  }
  v14 = (const char *)[(__CFString *)v12 UTF8String];
  size_t v15 = strlen(v14);
  LODWORD(v14) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  BOOL v16 = [(QSSBatchTranslationResponse_TranslationPhrase *)self low_confidence];
  memset(&v50, 0, sizeof(v50));
  v17 = [(QSSBatchTranslationResponse_TranslationPhrase *)self repeated_spans];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v50, [v17 count]);

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v18 = [(QSSBatchTranslationResponse_TranslationPhrase *)self repeated_spans];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v51 count:16];
  int v42 = v16;
  unsigned int v43 = v14;
  unsigned int v44 = String;
  begin = v50.__begin_;
  if (v19)
  {
    uint64_t v21 = *(void *)v47;
    value = v50.__end_cap_.__value_;
    v45 = v18;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v47 != v21) {
          objc_enumerationMutation(v18);
        }
        v24 = a3;
        int v25 = [*(id *)(*((void *)&v46 + 1) + 8 * i) addObjectToBuffer:a3];
        int v26 = v25;
        std::vector<int>::pointer end = v50.__end_;
        if (v50.__end_ >= value)
        {
          uint64_t v29 = v50.__end_ - begin;
          unint64_t v30 = v29 + 1;
          if ((unint64_t)(v29 + 1) >> 62)
          {
            v50.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v30) {
            unint64_t v30 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v31 = v30;
          }
          if (v31) {
            unint64_t v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v31);
          }
          else {
            uint64_t v32 = 0;
          }
          v33 = (int *)(v31 + 4 * v29);
          int *v33 = v26;
          v28 = v33 + 1;
          a3 = v24;
          while (end != begin)
          {
            int v34 = *--end;
            *--v33 = v34;
          }
          value = (int *)(v31 + 4 * v32);
          v50.__end_ = v28;
          if (begin) {
            operator delete(begin);
          }
          begin = v33;
          v18 = v45;
        }
        else
        {
          *v50.__end_ = v25;
          v28 = end + 1;
          a3 = v24;
        }
        v50.__end_ = v28;
      }
      v50.__end_cap_.__value_ = value;
      v50.__begin_ = begin;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v19);
  }
  else
  {
    v28 = v50.__end_;
  }

  if (v28 == begin) {
    v35 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  }
  else {
    v35 = begin;
  }
  unsigned int v36 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v35, v28 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v37 = *((_DWORD *)a3 + 8);
  int v38 = *((_DWORD *)a3 + 12);
  int v39 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)a3, 4, v6);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v44);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v43);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 10, v42);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v36);
  v40.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v37 - v38 + v39);
  if (begin)
  {
    v50.__end_ = begin;
    operator delete(begin);
  }
  return v40;
}

- (NSArray)repeated_spans
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"repeated_spans"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    float v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xDu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[12].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        size_t v10 = &v7[v8 + 4];
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
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"repeated_spans"];
  }
  return (NSArray *)v3;
}

- (BOOL)low_confidence
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)meta_info
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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

- (NSString)translation_phrase
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

- (float)confidence
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 5u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[4].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (QSSBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSBatchTranslationResponse_TranslationPhrase;
  size_t v10 = [(QSSBatchTranslationResponse_TranslationPhrase *)&v30 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_16;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      uint64_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const TranslationPhrase *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_16;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v25 = v18;
      unint64_t v26 = v19;
      long long v27 = xmmword_22B64D0E0;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (QSSBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4
{
  return [(QSSBatchTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
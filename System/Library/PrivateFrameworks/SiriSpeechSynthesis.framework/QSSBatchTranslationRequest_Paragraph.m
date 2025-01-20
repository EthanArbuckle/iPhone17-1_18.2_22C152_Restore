@interface QSSBatchTranslationRequest_Paragraph
- (NSArray)span;
- (NSString)paragraph_id;
- (NSString)text;
- (Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>)addObjectToBuffer:(void *)a3;
- (QSSBatchTranslationRequest_Paragraph)initWithFlatbuffData:(id)a3;
- (QSSBatchTranslationRequest_Paragraph)initWithFlatbuffData:(id)a3 root:(const Paragraph *)a4;
- (QSSBatchTranslationRequest_Paragraph)initWithFlatbuffData:(id)a3 root:(const Paragraph *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSBatchTranslationRequest_Paragraph

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
  v2.var0 = [(QSSBatchTranslationRequest_Paragraph *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

- (Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>)addObjectToBuffer:(void *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSBatchTranslationRequest_Paragraph *)self paragraph_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(QSSBatchTranslationRequest_Paragraph *)self text];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_26DEBFAF8;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  LODWORD(v12) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  memset(&v43, 0, sizeof(v43));
  v14 = [(QSSBatchTranslationRequest_Paragraph *)self span];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v43, [v14 count]);

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(QSSBatchTranslationRequest_Paragraph *)self span];
  uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  unint64_t v37 = __PAIR64__(String, v12);
  begin = v43.__begin_;
  if (v15)
  {
    uint64_t v17 = *(void *)v40;
    value = v43.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(obj);
        }
        int v20 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "addObjectToBuffer:", a3, v37);
        int v21 = v20;
        std::vector<int>::pointer end = v43.__end_;
        if (v43.__end_ >= value)
        {
          uint64_t v24 = v43.__end_ - begin;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62)
          {
            v43.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v25) {
            unint64_t v25 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v26 = v25;
          }
          if (v26) {
            unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v26);
          }
          else {
            uint64_t v27 = 0;
          }
          v28 = (int *)(v26 + 4 * v24);
          int *v28 = v21;
          v23 = v28 + 1;
          while (end != begin)
          {
            int v29 = *--end;
            *--v28 = v29;
          }
          value = (int *)(v26 + 4 * v27);
          v43.__end_ = v23;
          if (begin) {
            operator delete(begin);
          }
          begin = v28;
        }
        else
        {
          *v43.__end_ = v20;
          v23 = end + 1;
        }
        v43.__end_ = v23;
      }
      v43.__end_cap_.__value_ = value;
      v43.__begin_ = begin;
      uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v15);
  }
  else
  {
    v23 = v43.__end_;
  }

  if (v23 == begin) {
    v30 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::Span>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::Span>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::Span>> const&)::t;
  }
  else {
    v30 = begin;
  }
  unsigned int v31 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v30, v23 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v32 = *((_DWORD *)a3 + 8);
  int v33 = *((_DWORD *)a3 + 12);
  int v34 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, HIDWORD(v37));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v37);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v31);
  v35.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v32 - v33 + v34);
  if (begin)
  {
    v43.__end_ = begin;
    operator delete(begin);
  }
  return v35;
}

- (NSArray)span
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"span"];
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
            __int16 v12 = [[QSSSpan alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"span"];
  }
  return (NSArray *)v3;
}

- (NSString)text
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

- (NSString)paragraph_id
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

- (QSSBatchTranslationRequest_Paragraph)initWithFlatbuffData:(id)a3 root:(const Paragraph *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSBatchTranslationRequest_Paragraph;
  uint64_t v10 = [(QSSBatchTranslationRequest_Paragraph *)&v30 init];
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
      size_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const Paragraph *)v13 + *v13;
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
      root = (siri::speech::schema_fb::BatchTranslationRequest_::Paragraph *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::BatchTranslationRequest_::Paragraph::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSBatchTranslationRequest_Paragraph)initWithFlatbuffData:(id)a3 root:(const Paragraph *)a4
{
  return [(QSSBatchTranslationRequest_Paragraph *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationRequest_Paragraph *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSBatchTranslationRequest_Paragraph)initWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationRequest_Paragraph *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
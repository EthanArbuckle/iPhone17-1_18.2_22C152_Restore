@interface QSSTranslationResponse_TranslationToken
- (BOOL)add_space_after;
- (NSString)token;
- (Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>)addObjectToBuffer:(void *)a3;
- (QSSAlignment)mt_alignment;
- (QSSTranslationResponse_TranslationToken)initWithFlatbuffData:(id)a3;
- (QSSTranslationResponse_TranslationToken)initWithFlatbuffData:(id)a3 root:(const TranslationToken *)a4;
- (QSSTranslationResponse_TranslationToken)initWithFlatbuffData:(id)a3 root:(const TranslationToken *)a4 verify:(BOOL)a5;
- (float)confidence;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTranslationResponse_TranslationToken

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
  v2.var0 = [(QSSTranslationResponse_TranslationToken *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

- (Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSTranslationResponse_TranslationToken *)self token];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  LODWORD(v7) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  [(QSSTranslationResponse_TranslationToken *)self confidence];
  float v10 = v9;
  uint64_t v11 = [(QSSTranslationResponse_TranslationToken *)self mt_alignment];
  unsigned int v12 = [v11 addObjectToBuffer:a3];

  int v13 = [(QSSTranslationResponse_TranslationToken *)self add_space_after];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v15 = *((void *)a3 + 5);
  uint64_t v14 = *((void *)a3 + 6);
  uint64_t v16 = *((void *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v7);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)a3, 6, v10);
  if (v12)
  {
    int v17 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v12);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v17);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 10, v13);
  return (Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v16 - (int)v14 + (int)v15);
}

- (BOOL)add_space_after
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0 && root[v4].var0[0] != 0;
}

- (QSSAlignment)mt_alignment
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"mt_alignment"];
  if (!v3)
  {
    uint64_t v4 = [QSSAlignment alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (uint64_t v7 = *(unsigned __int16 *)v6[8].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(QSSAlignment *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"mt_alignment"];
  }
  return v3;
}

- (float)confidence
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 7u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[6].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (NSString)token
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSTranslationResponse_TranslationToken)initWithFlatbuffData:(id)a3 root:(const TranslationToken *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTranslationResponse_TranslationToken;
  float v10 = [(QSSTranslationResponse_TranslationToken *)&v30 init];
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
      int v13 = (unsigned int *)[*p_data bytes];
      a4 = (const TranslationToken *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TranslationResponse_::TranslationToken *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TranslationResponse_::TranslationToken::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSTranslationResponse_TranslationToken)initWithFlatbuffData:(id)a3 root:(const TranslationToken *)a4
{
  return [(QSSTranslationResponse_TranslationToken *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTranslationResponse_TranslationToken *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTranslationResponse_TranslationToken)initWithFlatbuffData:(id)a3
{
  return [(QSSTranslationResponse_TranslationToken *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
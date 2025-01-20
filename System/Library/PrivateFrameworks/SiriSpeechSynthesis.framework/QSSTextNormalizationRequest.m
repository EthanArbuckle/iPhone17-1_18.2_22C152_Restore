@interface QSSTextNormalizationRequest
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)text;
- (Offset<siri::speech::schema_fb::TextNormalizationRequest>)addObjectToBuffer:(void *)a3;
- (QSSTextNormalizationRequest)initWithFlatbuffData:(id)a3;
- (QSSTextNormalizationRequest)initWithFlatbuffData:(id)a3 root:(const TextNormalizationRequest *)a4;
- (QSSTextNormalizationRequest)initWithFlatbuffData:(id)a3 root:(const TextNormalizationRequest *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)nbest_variants_max;
@end

@implementation QSSTextNormalizationRequest

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
  v2.var0 = [(QSSTextNormalizationRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__43__QSSTextNormalizationRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextNormalizationRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSTextNormalizationRequest *)self speech_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(QSSTextNormalizationRequest *)self session_id];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_26DEBFAF8;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  unsigned int v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v15 = [(QSSTextNormalizationRequest *)self language];
  v16 = v15;
  if (!v15) {
    v15 = &stru_26DEBFAF8;
  }
  v17 = (const char *)[(__CFString *)v15 UTF8String];
  size_t v18 = strlen(v17);
  unsigned int v19 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  v20 = [(QSSTextNormalizationRequest *)self text];
  v21 = v20;
  if (!v20) {
    v20 = &stru_26DEBFAF8;
  }
  v22 = (const char *)[(__CFString *)v20 UTF8String];
  size_t v23 = strlen(v22);
  LODWORD(v22) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v22, v23);

  int v24 = [(QSSTextNormalizationRequest *)self nbest_variants_max];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v25 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v14);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v19);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v22);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v24);
  return (Offset<siri::speech::schema_fb::TextNormalizationRequest>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v25);
}

- (int)nbest_variants_max
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)text
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)language
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)speech_id
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
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSTextNormalizationRequest)initWithFlatbuffData:(id)a3 root:(const TextNormalizationRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v44.receiver = self;
  v44.super_class = (Class)QSSTextNormalizationRequest;
  uint64_t v10 = [(QSSTextNormalizationRequest *)&v44 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_44;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      size_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const TextNormalizationRequest *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_44;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v39 = v18;
      unint64_t v40 = v19;
      long long v41 = xmmword_22B64D0E0;
      uint64_t v42 = 0;
      char v43 = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (flatbuffers::Table *)v11->_root;
      if (root)
      {
        if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v39, v11->_root->var0)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 4u))
        {
          goto LABEL_44;
        }
        v21 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
          size_t v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
        }
        else {
          size_t v23 = 0;
        }
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v23)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 6u))
        {
          goto LABEL_44;
        }
        int v24 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
          v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
        }
        else {
          v26 = 0;
        }
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v26)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 8u))
        {
          goto LABEL_44;
        }
        v27 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v27 >= 9u && (uint64_t v28 = v27[4]) != 0) {
          v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
        }
        else {
          v29 = 0;
        }
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v29)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xAu)
          || ((v30 = (unsigned __int16 *)((char *)root - *(int *)root), *v30 < 0xBu) || (uint64_t v31 = v30[5]) == 0
            ? (v32 = 0)
            : (v32 = (const unsigned __int8 *)root + v31 + *(unsigned int *)((char *)root + v31)),
              !flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v32)
           || (v33 = (unsigned __int16 *)((char *)root - *(int *)root), *v33 >= 0xDu)
           && (uint64_t v34 = v33[6]) != 0
           && (v40 < 5 || v40 - 4 < (unint64_t)root + v34 - v39)))
        {
LABEL_44:
          v37 = 0;
          goto LABEL_45;
        }
      }
    }
    uint64_t v35 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v39);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v35;
  }
  v37 = v11;
LABEL_45:

  return v37;
}

- (QSSTextNormalizationRequest)initWithFlatbuffData:(id)a3 root:(const TextNormalizationRequest *)a4
{
  return [(QSSTextNormalizationRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextNormalizationRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextNormalizationRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSTextNormalizationRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
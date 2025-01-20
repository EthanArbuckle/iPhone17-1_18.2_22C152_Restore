@interface QSSErrorBlamerResponse
- (NSString)blamer_report;
- (NSString)return_str;
- (Offset<siri::speech::schema_fb::ErrorBlamerResponse>)addObjectToBuffer:(void *)a3;
- (QSSErrorBlamerResponse)initWithFlatbuffData:(id)a3;
- (QSSErrorBlamerResponse)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerResponse *)a4;
- (QSSErrorBlamerResponse)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
@end

@implementation QSSErrorBlamerResponse

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
  v2.var0 = [(QSSErrorBlamerResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__38__QSSErrorBlamerResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::ErrorBlamerResponse>)addObjectToBuffer:(void *)a3
{
  int v5 = [(QSSErrorBlamerResponse *)self return_code];
  char v6 = [(QSSErrorBlamerResponse *)self return_str];
  long long v7 = v6;
  if (!v6) {
    char v6 = &stru_26DEBFAF8;
  }
  long long v8 = (const char *)[(__CFString *)v6 UTF8String];
  size_t v9 = strlen(v8);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v8, v9);

  uint64_t v11 = [(QSSErrorBlamerResponse *)self blamer_report];
  __int16 v12 = v11;
  if (!v11) {
    uint64_t v11 = &stru_26DEBFAF8;
  }
  uint64_t v13 = (const char *)[(__CFString *)v11 UTF8String];
  size_t v14 = strlen(v13);
  LODWORD(v13) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v13, v14);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v15 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v5);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v13);
  return (Offset<siri::speech::schema_fb::ErrorBlamerResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v15);
}

- (NSString)blamer_report
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

- (NSString)return_str
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

- (int)return_code
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (QSSErrorBlamerResponse)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v36.receiver = self;
  v36.super_class = (Class)QSSErrorBlamerResponse;
  uint64_t v10 = [(QSSErrorBlamerResponse *)&v36 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_32;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      uint64_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const ErrorBlamerResponse *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_32;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v31 = v18;
      unint64_t v32 = v19;
      long long v33 = xmmword_22B64D0E0;
      uint64_t v34 = 0;
      char v35 = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (flatbuffers::Table *)v11->_root;
      if (root)
      {
        if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v31, v11->_root->var0)
          || (v21 = (unsigned __int16 *)((char *)root - *(int *)root), unsigned int v22 = *v21, v22 >= 5)
          && v21[2]
          && (v32 < 5 || v32 - 4 < (unint64_t)root + v21[2] - v31)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v31, 6u)
          || (v22 < 7 || !v21[3]
            ? (v23 = 0)
            : (v23 = (const unsigned __int8 *)root + v21[3] + *(unsigned int *)((char *)root + v21[3])),
              !flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v31, v23)
           || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v31, 8u)
           || ((v24 = (unsigned __int16 *)((char *)root - *(int *)root), *v24 < 9u) || (uint64_t v25 = v24[4]) == 0
             ? (v26 = 0)
             : (v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25)),
               !flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v31, v26))))
        {
LABEL_32:
          v29 = 0;
          goto LABEL_33;
        }
      }
    }
    uint64_t v27 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v31);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v27;
  }
  v29 = v11;
LABEL_33:

  return v29;
}

- (QSSErrorBlamerResponse)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerResponse *)a4
{
  return [(QSSErrorBlamerResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSErrorBlamerResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSErrorBlamerResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSErrorBlamerResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
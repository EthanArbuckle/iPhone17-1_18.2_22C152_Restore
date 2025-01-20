@interface QSSRequestStatsResponse_DoubleStat
- (NSString)name;
- (Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>)addObjectToBuffer:(void *)a3;
- (QSSRequestStatsResponse_DoubleStat)initWithFlatbuffData:(id)a3;
- (QSSRequestStatsResponse_DoubleStat)initWithFlatbuffData:(id)a3 root:(const DoubleStat *)a4;
- (QSSRequestStatsResponse_DoubleStat)initWithFlatbuffData:(id)a3 root:(const DoubleStat *)a4 verify:(BOOL)a5;
- (double)value;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSRequestStatsResponse_DoubleStat

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
  v2.var0 = [(QSSRequestStatsResponse_DoubleStat *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

- (Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSRequestStatsResponse_DoubleStat *)self name];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  LODWORD(v7) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  [(QSSRequestStatsResponse_DoubleStat *)self value];
  double v10 = v9;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v11 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v7);
  flatbuffers::FlatBufferBuilder::AddElement<double>((flatbuffers::vector_downward *)a3, 6, v10);
  return (Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v11);
}

- (double)value
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 7u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[6].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (NSString)name
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

- (QSSRequestStatsResponse_DoubleStat)initWithFlatbuffData:(id)a3 root:(const DoubleStat *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRequestStatsResponse_DoubleStat;
  double v10 = [(QSSRequestStatsResponse_DoubleStat *)&v30 init];
  int v11 = v10;
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
      a4 = (const DoubleStat *)v13 + *v13;
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
      root = (siri::speech::schema_fb::RequestStatsResponse_::DoubleStat *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RequestStatsResponse_::DoubleStat::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSRequestStatsResponse_DoubleStat)initWithFlatbuffData:(id)a3 root:(const DoubleStat *)a4
{
  return [(QSSRequestStatsResponse_DoubleStat *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSRequestStatsResponse_DoubleStat *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSRequestStatsResponse_DoubleStat)initWithFlatbuffData:(id)a3
{
  return [(QSSRequestStatsResponse_DoubleStat *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
@interface QSSSiriPayloadTranslationInfo
- (NSString)post_itn_payload;
- (NSString)pre_itn_payload;
- (Offset<siri::speech::schema_fb::SiriPayloadTranslationInfo>)addObjectToBuffer:(void *)a3;
- (QSSRecognitionSausage)pre_sausage_payload;
- (QSSSiriPayloadTranslationInfo)initWithFlatbuffData:(id)a3;
- (QSSSiriPayloadTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriPayloadTranslationInfo *)a4;
- (QSSSiriPayloadTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriPayloadTranslationInfo *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSSiriPayloadTranslationInfo

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
  v2.var0 = [(QSSSiriPayloadTranslationInfo *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__45__QSSSiriPayloadTranslationInfo_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::SiriPayloadTranslationInfo>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSSiriPayloadTranslationInfo *)self pre_itn_payload];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(QSSSiriPayloadTranslationInfo *)self post_itn_payload];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_26DEBFAF8;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  LODWORD(v12) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v14 = [(QSSSiriPayloadTranslationInfo *)self pre_sausage_payload];
  unsigned int v15 = [v14 addObjectToBuffer:a3];

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v16 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v12);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v15);
  return (Offset<siri::speech::schema_fb::SiriPayloadTranslationInfo>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v16);
}

- (QSSRecognitionSausage)pre_sausage_payload
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_sausage_payload"];
  if (!v3)
  {
    v4 = [QSSRecognitionSausage alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (uint64_t v7 = *(unsigned __int16 *)v6[8].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(QSSRecognitionSausage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"pre_sausage_payload"];
  }
  return v3;
}

- (NSString)post_itn_payload
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)pre_itn_payload
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

- (QSSSiriPayloadTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriPayloadTranslationInfo *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSSiriPayloadTranslationInfo;
  uint64_t v10 = [(QSSSiriPayloadTranslationInfo *)&v30 init];
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
      a4 = (const SiriPayloadTranslationInfo *)v13 + *v13;
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
      root = (siri::speech::schema_fb::SiriPayloadTranslationInfo *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::SiriPayloadTranslationInfo::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSSiriPayloadTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriPayloadTranslationInfo *)a4
{
  return [(QSSSiriPayloadTranslationInfo *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSSiriPayloadTranslationInfo *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSSiriPayloadTranslationInfo)initWithFlatbuffData:(id)a3
{
  return [(QSSSiriPayloadTranslationInfo *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
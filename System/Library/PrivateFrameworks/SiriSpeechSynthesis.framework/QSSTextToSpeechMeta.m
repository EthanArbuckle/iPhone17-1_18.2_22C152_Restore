@interface QSSTextToSpeechMeta
- (Offset<siri::speech::schema_fb::TextToSpeechMeta>)addObjectToBuffer:(void *)a3;
- (QSSTextToSpeechMeta)initWithFlatbuffData:(id)a3;
- (QSSTextToSpeechMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechMeta *)a4;
- (QSSTextToSpeechMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechMeta *)a4 verify:(BOOL)a5;
- (QSSTextToSpeechResource)resource;
- (QSSTextToSpeechVoice)voice;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTextToSpeechMeta

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
  v2.var0 = [(QSSTextToSpeechMeta *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__35__QSSTextToSpeechMeta_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechMeta>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSTextToSpeechMeta *)self voice];
  unsigned int v6 = [v5 addObjectToBuffer:a3];

  long long v7 = [(QSSTextToSpeechMeta *)self resource];
  unsigned int v8 = [v7 addObjectToBuffer:a3];

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v9 = *((void *)a3 + 5);
  uint64_t v10 = *((void *)a3 + 6);
  uint64_t v11 = *((void *)a3 + 4);
  if (v6)
  {
    int v12 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v6);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v12);
  }
  if (v8)
  {
    int v13 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v8);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v13);
  }
  return (Offset<siri::speech::schema_fb::TextToSpeechMeta>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v11 - (int)v10 + (int)v9);
}

- (QSSTextToSpeechResource)resource
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"resource"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechResource alloc];
    root = self->_root;
    unsigned int v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
      unsigned int v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      unsigned int v8 = 0;
    }
    v3 = [(QSSTextToSpeechResource *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"resource"];
  }
  return v3;
}

- (QSSTextToSpeechVoice)voice
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"voice"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechVoice alloc];
    root = self->_root;
    unsigned int v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      unsigned int v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      unsigned int v8 = 0;
    }
    v3 = [(QSSTextToSpeechVoice *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"voice"];
  }
  return v3;
}

- (QSSTextToSpeechMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechMeta *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTextToSpeechMeta;
  uint64_t v10 = [(QSSTextToSpeechMeta *)&v30 init];
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
      a4 = (const TextToSpeechMeta *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TextToSpeechMeta *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechMeta::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSTextToSpeechMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechMeta *)a4
{
  return [(QSSTextToSpeechMeta *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechMeta *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextToSpeechMeta)initWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechMeta *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
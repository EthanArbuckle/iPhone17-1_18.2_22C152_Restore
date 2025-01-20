@interface QSSAudioFrame
- (NSData)audio_bytes;
- (Offset<siri::speech::schema_fb::AudioFrame>)addObjectToBuffer:(void *)a3;
- (QSSAudioFrame)initWithFlatbuffData:(id)a3;
- (QSSAudioFrame)initWithFlatbuffData:(id)a3 root:(const AudioFrame *)a4;
- (QSSAudioFrame)initWithFlatbuffData:(id)a3 root:(const AudioFrame *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (void)audio_bytes:(id)a3;
@end

@implementation QSSAudioFrame

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
  v2.var0 = [(QSSAudioFrame *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__29__QSSAudioFrame_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::AudioFrame>)addObjectToBuffer:(void *)a3
{
  v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3812000000;
  __int16 v12 = __Block_byref_object_copy__645;
  uint64_t v13 = __Block_byref_object_dispose__646;
  v14 = &unk_22B66C18D;
  int v15 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__QSSAudioFrame_addObjectToBuffer___block_invoke;
  v8[3] = &unk_26489E988;
  v8[4] = &v9;
  v8[5] = a3;
  [(QSSAudioFrame *)self audio_bytes:v8];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v3);
  v3[70] = 1;
  uint64_t v4 = *((void *)v3 + 5);
  uint64_t v5 = *((void *)v3 + 6);
  uint64_t v6 = *((void *)v3 + 4);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v3, 4, *((_DWORD *)v10 + 12));
  LODWORD(v3) = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v3, (int)v6 - (int)v5 + (int)v4);
  _Block_object_dispose(&v9, 8);
  return (Offset<siri::speech::schema_fb::AudioFrame>)v3;
}

uint64_t __35__QSSAudioFrame_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result = flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>(*(flatbuffers::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = result;
  return result;
}

- (void)audio_bytes:(id)a3
{
  id v4 = a3;
  root = self->_root;
  uint64_t v6 = *(int *)root->var0;
  uint64_t v7 = *(unsigned __int16 *)root[-v6 + 4].var0;
  if (*(_WORD *)root[-v6 + 4].var0)
  {
    uint64_t v8 = *(unsigned int *)root[v7].var0;
    uint64_t v9 = &root[v7 + v8];
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    uint64_t v8 = *(unsigned int *)root->var0;
  }
  id v10 = v4;
  (*((void (**)(id, const AudioFrame *, void))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);
}

- (NSData)audio_bytes
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
  return (NSData *)[MEMORY[0x263EFF8F8] dataWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0];
}

- (QSSAudioFrame)initWithFlatbuffData:(id)a3 root:(const AudioFrame *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSAudioFrame;
  id v10 = [(QSSAudioFrame *)&v30 init];
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
      a4 = (const AudioFrame *)v13 + *v13;
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
      root = (siri::speech::schema_fb::AudioFrame *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::AudioFrame::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSAudioFrame)initWithFlatbuffData:(id)a3 root:(const AudioFrame *)a4
{
  return [(QSSAudioFrame *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSAudioFrame *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSAudioFrame)initWithFlatbuffData:(id)a3
{
  return [(QSSAudioFrame *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
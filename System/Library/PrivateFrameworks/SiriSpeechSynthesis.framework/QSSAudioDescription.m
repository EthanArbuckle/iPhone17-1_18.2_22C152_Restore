@interface QSSAudioDescription
- (Offset<siri::speech::schema_fb::AudioDescription>)addObjectToBuffer:(void *)a3;
- (QSSAudioDescription)initWithFlatbuffData:(id)a3;
- (QSSAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4;
- (QSSAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4 verify:(BOOL)a5;
- (double)sample_rate;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (unsigned)bits_per_channel;
- (unsigned)bytes_per_frame;
- (unsigned)bytes_per_packet;
- (unsigned)channels_per_frame;
- (unsigned)format_flags;
- (unsigned)format_id;
- (unsigned)frames_per_packet;
- (unsigned)reserved;
@end

@implementation QSSAudioDescription

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
  v2.var0 = [(QSSAudioDescription *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__35__QSSAudioDescription_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::AudioDescription>)addObjectToBuffer:(void *)a3
{
  v4 = self;
  [(QSSAudioDescription *)self sample_rate];
  double v6 = v5;
  int v7 = [(QSSAudioDescription *)v4 format_id];
  int v8 = [(QSSAudioDescription *)v4 format_flags];
  int v9 = [(QSSAudioDescription *)v4 bytes_per_packet];
  int v10 = [(QSSAudioDescription *)v4 frames_per_packet];
  int v11 = [(QSSAudioDescription *)v4 bytes_per_frame];
  int v12 = [(QSSAudioDescription *)v4 channels_per_frame];
  int v13 = [(QSSAudioDescription *)v4 bits_per_channel];
  LODWORD(v4) = [(QSSAudioDescription *)v4 reserved];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v14 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<double>((flatbuffers::vector_downward *)a3, 4, v6);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v7);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v8);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v9);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v11);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v12);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v13);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, (int)v4);
  return (Offset<siri::speech::schema_fb::AudioDescription>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v14);
}

- (unsigned)reserved
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)bits_per_channel
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (uint64_t v4 = *(unsigned __int16 *)v3[18].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)channels_per_frame
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)bytes_per_frame
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)frames_per_packet
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

- (unsigned)bytes_per_packet
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

- (unsigned)format_flags
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)format_id
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (double)sample_rate
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 5u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[4].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (QSSAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSAudioDescription;
  int v10 = [(QSSAudioDescription *)&v30 init];
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
      int v13 = (unsigned int *)[*p_data bytes];
      a4 = (const AudioDescription *)v13 + *v13;
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
      root = (siri::speech::schema_fb::AudioDescription *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::AudioDescription::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4
{
  return [(QSSAudioDescription *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSAudioDescription *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSAudioDescription)initWithFlatbuffData:(id)a3
{
  return [(QSSAudioDescription *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
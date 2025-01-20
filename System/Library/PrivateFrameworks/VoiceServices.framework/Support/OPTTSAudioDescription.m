@interface OPTTSAudioDescription
- (AudioStreamBasicDescription)audioStreamBasicDescription;
- (OPTTSAudioDescription)initWithFlatbuffData:(id)a3;
- (OPTTSAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4;
- (OPTTSAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::AudioDescription>)addObjectToBuffer:(void *)a3;
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

@implementation OPTTSAudioDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_226CFFD00;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(OPTTSAudioDescription *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__37__OPTTSAudioDescription_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x22A667720);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::AudioDescription>)addObjectToBuffer:(void *)a3
{
  [(OPTTSAudioDescription *)self sample_rate];
  double v6 = v5;
  int v29 = [(OPTTSAudioDescription *)self format_id];
  int v30 = [(OPTTSAudioDescription *)self format_flags];
  int v7 = [(OPTTSAudioDescription *)self bytes_per_packet];
  int v8 = [(OPTTSAudioDescription *)self frames_per_packet];
  int v9 = [(OPTTSAudioDescription *)self bytes_per_frame];
  int v10 = [(OPTTSAudioDescription *)self channels_per_frame];
  int v11 = [(OPTTSAudioDescription *)self bits_per_channel];
  int v12 = [(OPTTSAudioDescription *)self reserved];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v14 = *((void *)a3 + 5);
  uint64_t v13 = *((void *)a3 + 6);
  uint64_t v15 = *((void *)a3 + 4);
  if (v6 != 0.0 || *((unsigned char *)a3 + 80))
  {
    uint64_t v28 = *((void *)a3 + 5);
    uint64_t v14 = *((void *)a3 + 4);
    flatbuffers::FlatBufferBuilder::Align((flatbuffers::FlatBufferBuilder *)a3, 8uLL);
    flatbuffers::vector_downward::ensure_space((flatbuffers::vector_downward *)a3, 8uLL);
    uint64_t v16 = *((void *)a3 + 6);
    *(double *)(v16 - 8) = v6;
    v16 -= 8;
    *((void *)a3 + 6) = v16;
    int v17 = v7;
    int v18 = v8;
    int v19 = v9;
    int v20 = v10;
    int v21 = v11;
    int v22 = v12;
    uint64_t v23 = (*((_DWORD *)a3 + 8) - v16 + *((_DWORD *)a3 + 10));
    flatbuffers::vector_downward::ensure_space((flatbuffers::vector_downward *)a3, 8uLL);
    uint64_t v24 = v23 | 0x400000000;
    int v12 = v22;
    int v11 = v21;
    int v10 = v20;
    int v9 = v19;
    int v8 = v18;
    int v7 = v17;
    **((void **)a3 + 7) = v24;
    *((void *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    unsigned int v25 = *((unsigned __int16 *)a3 + 34);
    if (v25 <= 4) {
      LOWORD(v25) = 4;
    }
    LODWORD(v15) = v14;
    LODWORD(v14) = v28;
    *((_WORD *)a3 + 34) = v25;
  }
  int v26 = v15 - v13 + v14;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v29);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v30);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v7);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v8);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v9);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v11);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v12);
  return (Offset<siri::speech::schema_fb::AudioDescription>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v26);
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

- (OPTTSAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OPTTSAudioDescription;
  int v10 = [(OPTTSAudioDescription *)&v30 init];
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
      long long v27 = xmmword_226CFFD10;
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
          uint64_t v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  uint64_t v23 = v11;
LABEL_17:

  return v23;
}

- (OPTTSAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4
{
  return [(OPTTSAudioDescription *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSAudioDescription *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSAudioDescription)initWithFlatbuffData:(id)a3
{
  return [(OPTTSAudioDescription *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (AudioStreamBasicDescription)audioStreamBasicDescription
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  retstr->mFormatID = [(OPTTSAudioDescription *)self format_id];
  [(OPTTSAudioDescription *)self sample_rate];
  retstr->mSampleRate = v5;
  retstr->mFormatFlags = [(OPTTSAudioDescription *)self format_flags];
  retstr->mBytesPerPacket = [(OPTTSAudioDescription *)self bytes_per_packet];
  retstr->mFramesPerPacket = [(OPTTSAudioDescription *)self frames_per_packet];
  retstr->mBytesPerFrame = [(OPTTSAudioDescription *)self bytes_per_frame];
  retstr->mChannelsPerFrame = [(OPTTSAudioDescription *)self channels_per_frame];
  retstr->mBitsPerChannel = [(OPTTSAudioDescription *)self bits_per_channel];
  double result = (AudioStreamBasicDescription *)[(OPTTSAudioDescription *)self reserved];
  retstr->mReserved = result;
  return result;
}

@end
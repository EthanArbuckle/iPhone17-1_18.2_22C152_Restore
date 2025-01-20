@interface QSSTextToSpeechCacheMetaInfo
- (BOOL)enable_word_timing_info;
- (NSString)original_session_id;
- (NSString)text;
- (Offset<siri::speech::schema_fb::TextToSpeechCacheMetaInfo>)addObjectToBuffer:(void *)a3;
- (QSSAudioDescription)decoder_description;
- (QSSAudioDescription)playback_description;
- (QSSTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3;
- (QSSTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheMetaInfo *)a4;
- (QSSTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheMetaInfo *)a4 verify:(BOOL)a5;
- (QSSTextToSpeechMeta)meta_info;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)audio_length;
- (int64_t)audio_type;
@end

@implementation QSSTextToSpeechCacheMetaInfo

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
  v2.var0 = [(QSSTextToSpeechCacheMetaInfo *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__44__QSSTextToSpeechCacheMetaInfo_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechCacheMetaInfo>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSTextToSpeechCacheMetaInfo *)self meta_info];
  unsigned int v6 = [v5 addObjectToBuffer:a3];

  int v7 = [(QSSTextToSpeechCacheMetaInfo *)self audio_type];
  int v8 = [(QSSTextToSpeechCacheMetaInfo *)self enable_word_timing_info];
  long long v9 = [(QSSTextToSpeechCacheMetaInfo *)self decoder_description];
  unsigned int v24 = [v9 addObjectToBuffer:a3];

  uint64_t v10 = [(QSSTextToSpeechCacheMetaInfo *)self playback_description];
  unsigned int v11 = [v10 addObjectToBuffer:a3];

  int v12 = [(QSSTextToSpeechCacheMetaInfo *)self audio_length];
  uint64_t v13 = [(QSSTextToSpeechCacheMetaInfo *)self text];
  v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_26DEBFAF8;
  }
  v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v15, v16);

  v18 = [(QSSTextToSpeechCacheMetaInfo *)self original_session_id];
  v19 = v18;
  if (!v18) {
    v18 = &stru_26DEBFAF8;
  }
  v20 = (const char *)[(__CFString *)v18 UTF8String];
  size_t v21 = strlen(v20);
  LODWORD(v20) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v20, v21);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v22 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v6);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v7);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 8, v8);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v24);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v11);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v12);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v20);
  return (Offset<siri::speech::schema_fb::TextToSpeechCacheMetaInfo>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v22);
}

- (NSString)original_session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    unsigned int v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    unsigned int v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  int v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)text
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    unsigned int v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    unsigned int v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  int v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (int)audio_length
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (QSSAudioDescription)playback_description
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"playback_description"];
  if (!v3)
  {
    uint64_t v4 = [QSSAudioDescription alloc];
    root = self->_root;
    unsigned int v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      int v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      int v8 = 0;
    }
    uint64_t v3 = [(QSSAudioDescription *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"playback_description"];
  }
  return v3;
}

- (QSSAudioDescription)decoder_description
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"decoder_description"];
  if (!v3)
  {
    uint64_t v4 = [QSSAudioDescription alloc];
    root = self->_root;
    unsigned int v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
      int v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      int v8 = 0;
    }
    uint64_t v3 = [(QSSAudioDescription *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"decoder_description"];
  }
  return v3;
}

- (BOOL)enable_word_timing_info
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0 && root[v4].var0[0] != 0;
}

- (int64_t)audio_type
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return *(unsigned int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (QSSTextToSpeechMeta)meta_info
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"meta_info"];
  if (!v3)
  {
    uint64_t v4 = [QSSTextToSpeechMeta alloc];
    root = self->_root;
    unsigned int v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      int v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      int v8 = 0;
    }
    uint64_t v3 = [(QSSTextToSpeechMeta *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"meta_info"];
  }
  return v3;
}

- (QSSTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheMetaInfo *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTextToSpeechCacheMetaInfo;
  uint64_t v10 = [(QSSTextToSpeechCacheMetaInfo *)&v30 init];
  unsigned int v11 = v10;
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
      a4 = (const TextToSpeechCacheMetaInfo *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TextToSpeechCacheMetaInfo *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechCacheMetaInfo::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheMetaInfo *)a4
{
  return [(QSSTextToSpeechCacheMetaInfo *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechCacheMetaInfo *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechCacheMetaInfo *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
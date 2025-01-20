@interface FTTextToSpeechCacheMetaInfo
- (BOOL)enable_word_timing_info;
- (FTAudioDescription)decoder_description;
- (FTAudioDescription)playback_description;
- (FTTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3;
- (FTTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheMetaInfo *)a4;
- (FTTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheMetaInfo *)a4 verify:(BOOL)a5;
- (FTTextToSpeechMeta)meta_info;
- (NSString)original_session_id;
- (NSString)text;
- (Offset<siri::speech::schema_fb::TextToSpeechCacheMetaInfo>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)audio_length;
- (int64_t)audio_type;
@end

@implementation FTTextToSpeechCacheMetaInfo

- (FTTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechCacheMetaInfo *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechCacheMetaInfo *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheMetaInfo *)a4
{
  return [(FTTextToSpeechCacheMetaInfo *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTextToSpeechCacheMetaInfo)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheMetaInfo *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechCacheMetaInfo;
  v10 = [(FTTextToSpeechCacheMetaInfo *)&v26 init];
  if (!v10) {
    goto LABEL_13;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_14;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechCacheMetaInfo *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_13;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_14;
  }
  uint64_t v17 = [*p_data bytes];
  uint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_26027B7E0;
  uint64_t v24 = 0;
  char v25 = 1;
  v19 = (siri::speech::schema_fb::TextToSpeechCacheMetaInfo *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TextToSpeechCacheMetaInfo::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (FTTextToSpeechMeta)meta_info
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"meta_info"];
  if (!v3)
  {
    v4 = [FTTextToSpeechMeta alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTTextToSpeechMeta *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"meta_info"];
  }
  return v3;
}

- (int64_t)audio_type
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return *(int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (BOOL)enable_word_timing_info
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0 && root[v4].var0[0] != 0;
}

- (FTAudioDescription)decoder_description
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"decoder_description"];
  if (!v3)
  {
    uint64_t v4 = [FTAudioDescription alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTAudioDescription *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"decoder_description"];
  }
  return v3;
}

- (FTAudioDescription)playback_description
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"playback_description"];
  if (!v3)
  {
    uint64_t v4 = [FTAudioDescription alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTAudioDescription *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"playback_description"];
  }
  return v3;
}

- (int)audio_length
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

- (NSString)text
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)original_session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (Offset<siri::speech::schema_fb::TextToSpeechCacheMetaInfo>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(FTTextToSpeechCacheMetaInfo *)self meta_info];
  int v6 = [v5 addObjectToBuffer:a3];

  int v7 = [(FTTextToSpeechCacheMetaInfo *)self audio_type];
  int v8 = [(FTTextToSpeechCacheMetaInfo *)self enable_word_timing_info];
  id v9 = [(FTTextToSpeechCacheMetaInfo *)self decoder_description];
  int v24 = [v9 addObjectToBuffer:a3];

  v10 = [(FTTextToSpeechCacheMetaInfo *)self playback_description];
  int v11 = [v10 addObjectToBuffer:a3];

  int v12 = [(FTTextToSpeechCacheMetaInfo *)self audio_length];
  unint64_t v13 = [(FTTextToSpeechCacheMetaInfo *)self text];
  uint64_t v14 = v13;
  if (!v13) {
    unint64_t v13 = &stru_270C008E8;
  }
  v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  uint64_t v18 = [(FTTextToSpeechCacheMetaInfo *)self original_session_id];
  v19 = v18;
  if (!v18) {
    uint64_t v18 = &stru_270C008E8;
  }
  v20 = (const char *)[(__CFString *)v18 UTF8String];
  size_t v21 = strlen(v20);
  LODWORD(v20) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v20, v21);

  *((unsigned char *)a3 + 70) = 1;
  int v22 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v6);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 6, v7, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 8, v8, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v24);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 14, v12, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, (int)v20);
  return (Offset<siri::speech::schema_fb::TextToSpeechCacheMetaInfo>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v22);
}

- (id)flatbuffData
{
  uint64_t v3 = 0;
  char v4 = 0;
  long long v5 = xmmword_26027B7F0;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  __int16 v10 = 256;
  uint64_t v11 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTextToSpeechCacheMetaInfo *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__43__FTTextToSpeechCacheMetaInfo_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
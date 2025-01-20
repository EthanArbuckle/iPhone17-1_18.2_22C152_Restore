@interface FTMultilingualStreamingRequest
+ (Class)content_immutableClassForType:(int64_t)a3;
+ (int64_t)content_typeForImmutableObject:(id)a3;
- (FLTBFBufferAccessor)content;
- (FTAudioPacket)contentAsFTAudioPacket;
- (FTFinishAudio)contentAsFTFinishAudio;
- (FTLanguageDetected)contentAsFTLanguageDetected;
- (FTMultilingualStreamingRequest)initWithFlatbuffData:(id)a3;
- (FTMultilingualStreamingRequest)initWithFlatbuffData:(id)a3 root:(const MultilingualStreamingRequest *)a4;
- (FTMultilingualStreamingRequest)initWithFlatbuffData:(id)a3 root:(const MultilingualStreamingRequest *)a4 verify:(BOOL)a5;
- (FTSetRequestOrigin)contentAsFTSetRequestOrigin;
- (FTSetSpeechContext)contentAsFTSetSpeechContext;
- (FTSetSpeechProfile)contentAsFTSetSpeechProfile;
- (FTStartMultilingualSpeechRequest)contentAsFTStartMultilingualSpeechRequest;
- (FTUpdateAudioInfo)contentAsFTUpdateAudioInfo;
- (Offset<siri::speech::qss_fb::MultilingualStreamingRequest>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation FTMultilingualStreamingRequest

- (FTMultilingualStreamingRequest)initWithFlatbuffData:(id)a3
{
  return [(FTMultilingualStreamingRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTMultilingualStreamingRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTMultilingualStreamingRequest)initWithFlatbuffData:(id)a3 root:(const MultilingualStreamingRequest *)a4
{
  return [(FTMultilingualStreamingRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTMultilingualStreamingRequest)initWithFlatbuffData:(id)a3 root:(const MultilingualStreamingRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTMultilingualStreamingRequest;
  v10 = [(FTMultilingualStreamingRequest *)&v30 init];
  v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_15;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)[*p_data bytes];
      a4 = (const MultilingualStreamingRequest *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_15;
      }
      uint64_t v18 = [*p_data bytes];
      uint64_t v19 = [*p_data length];
      uint64_t v25 = v18;
      uint64_t v26 = v19;
      long long v27 = xmmword_26027B7E0;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      root = (siri::speech::qss_fb::MultilingualStreamingRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::MultilingualStreamingRequest::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
        {
LABEL_15:
          v23 = 0;
          goto LABEL_16;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_16:

  return v23;
}

- (int64_t)content_type
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return root[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (FTStartMultilingualSpeechRequest)contentAsFTStartMultilingualSpeechRequest
{
  if ([(FTMultilingualStreamingRequest *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      uint64_t v4 = [FTStartMultilingualSpeechRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTStartMultilingualSpeechRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTUpdateAudioInfo)contentAsFTUpdateAudioInfo
{
  if ([(FTMultilingualStreamingRequest *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      uint64_t v4 = [FTUpdateAudioInfo alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTUpdateAudioInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetRequestOrigin)contentAsFTSetRequestOrigin
{
  if ([(FTMultilingualStreamingRequest *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      uint64_t v4 = [FTSetRequestOrigin alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSetRequestOrigin *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetSpeechContext)contentAsFTSetSpeechContext
{
  if ([(FTMultilingualStreamingRequest *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      uint64_t v4 = [FTSetSpeechContext alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSetSpeechContext *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetSpeechProfile)contentAsFTSetSpeechProfile
{
  if ([(FTMultilingualStreamingRequest *)self content_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      uint64_t v4 = [FTSetSpeechProfile alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSetSpeechProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAudioPacket)contentAsFTAudioPacket
{
  if ([(FTMultilingualStreamingRequest *)self content_type] == 6)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      uint64_t v4 = [FTAudioPacket alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTAudioPacket *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTFinishAudio)contentAsFTFinishAudio
{
  if ([(FTMultilingualStreamingRequest *)self content_type] == 7)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      uint64_t v4 = [FTFinishAudio alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTFinishAudio *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTLanguageDetected)contentAsFTLanguageDetected
{
  if ([(FTMultilingualStreamingRequest *)self content_type] == 8)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      uint64_t v4 = [FTLanguageDetected alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTLanguageDetected *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FLTBFBufferAccessor)content
{
  switch([(FTMultilingualStreamingRequest *)self content_type])
  {
    case 1:
      v3 = [(FTMultilingualStreamingRequest *)self contentAsFTStartMultilingualSpeechRequest];
      break;
    case 2:
      v3 = [(FTMultilingualStreamingRequest *)self contentAsFTUpdateAudioInfo];
      break;
    case 3:
      v3 = [(FTMultilingualStreamingRequest *)self contentAsFTSetRequestOrigin];
      break;
    case 4:
      v3 = [(FTMultilingualStreamingRequest *)self contentAsFTSetSpeechContext];
      break;
    case 5:
      v3 = [(FTMultilingualStreamingRequest *)self contentAsFTSetSpeechProfile];
      break;
    case 6:
      v3 = [(FTMultilingualStreamingRequest *)self contentAsFTAudioPacket];
      break;
    case 7:
      v3 = [(FTMultilingualStreamingRequest *)self contentAsFTFinishAudio];
      break;
    case 8:
      v3 = [(FTMultilingualStreamingRequest *)self contentAsFTLanguageDetected];
      break;
    default:
      v3 = 0;
      break;
  }
  return (FLTBFBufferAccessor *)v3;
}

+ (Class)content_immutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (int64_t)content_typeForImmutableObject:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 8;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::MultilingualStreamingRequest>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(FTMultilingualStreamingRequest *)self content_type];
  if ([(FTMultilingualStreamingRequest *)self content_type] == 1)
  {
    v6 = [(FTMultilingualStreamingRequest *)self contentAsFTStartMultilingualSpeechRequest];
    int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    int v7 = 0;
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 2)
  {
    v8 = [(FTMultilingualStreamingRequest *)self contentAsFTUpdateAudioInfo];
    int v9 = [v8 addObjectToBuffer:a3];
  }
  else
  {
    int v9 = 0;
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 3)
  {
    v10 = [(FTMultilingualStreamingRequest *)self contentAsFTSetRequestOrigin];
    int v11 = [v10 addObjectToBuffer:a3];
  }
  else
  {
    int v11 = 0;
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 4)
  {
    v12 = [(FTMultilingualStreamingRequest *)self contentAsFTSetSpeechContext];
    int v13 = [v12 addObjectToBuffer:a3];
  }
  else
  {
    int v13 = 0;
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 5)
  {
    unint64_t v14 = [(FTMultilingualStreamingRequest *)self contentAsFTSetSpeechProfile];
    int v15 = [v14 addObjectToBuffer:a3];
  }
  else
  {
    int v15 = 0;
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 6)
  {
    v16 = [(FTMultilingualStreamingRequest *)self contentAsFTAudioPacket];
    int v17 = [v16 addObjectToBuffer:a3];
  }
  else
  {
    int v17 = 0;
  }
  int v32 = v13;
  if ([(FTMultilingualStreamingRequest *)self content_type] == 7)
  {
    uint64_t v18 = [(FTMultilingualStreamingRequest *)self contentAsFTFinishAudio];
    unsigned int v19 = [v18 addObjectToBuffer:a3];

    uint64_t v28 = v19;
  }
  else
  {
    uint64_t v28 = 0;
  }
  int v20 = v11;
  int v30 = v17;
  int v31 = v15;
  if ([(FTMultilingualStreamingRequest *)self content_type] == 8)
  {
    uint64_t v21 = [(FTMultilingualStreamingRequest *)self contentAsFTLanguageDetected];
    int v22 = [v21 addObjectToBuffer:a3];

    int v23 = v22;
  }
  else
  {
    int v23 = 0;
  }
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v24 = *((void *)a3 + 5);
  uint64_t v25 = *((void *)a3 + 6);
  uint64_t v26 = *((void *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 4, v5, 0);
  if ([(FTMultilingualStreamingRequest *)self content_type] == 1) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v7);
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 2) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v9);
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 3) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v20);
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 4) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v32);
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v31);
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 6) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v30);
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 7) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v29);
  }
  if ([(FTMultilingualStreamingRequest *)self content_type] == 8) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v23);
  }
  return (Offset<siri::speech::qss_fb::MultilingualStreamingRequest>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v26- (unsigned __int16)v25+ (unsigned __int16)v24);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTMultilingualStreamingRequest *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__46__FTMultilingualStreamingRequest_flatbuffData__block_invoke(uint64_t a1)
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
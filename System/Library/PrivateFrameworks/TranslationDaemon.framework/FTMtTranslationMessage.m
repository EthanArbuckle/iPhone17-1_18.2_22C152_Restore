@interface FTMtTranslationMessage
+ (Class)session_message_immutableClassForType:(int64_t)a3;
+ (int64_t)session_message_typeForImmutableObject:(id)a3;
- (FLTBFBufferAccessor)session_message;
- (FTMtTranslationMessage)initWithFlatbuffData:(id)a3;
- (FTMtTranslationMessage)initWithFlatbuffData:(id)a3 root:(const MtTranslationMessage *)a4;
- (FTMtTranslationMessage)initWithFlatbuffData:(id)a3 root:(const MtTranslationMessage *)a4 verify:(BOOL)a5;
- (FTTranslationRequest)session_messageAsFTTranslationRequest;
- (FTTranslationResponse)session_messageAsFTTranslationResponse;
- (Offset<siri::speech::qss_fb::MtTranslationMessage>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)session_message_type;
@end

@implementation FTMtTranslationMessage

- (FTMtTranslationMessage)initWithFlatbuffData:(id)a3
{
  return [(FTMtTranslationMessage *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTMtTranslationMessage *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTMtTranslationMessage)initWithFlatbuffData:(id)a3 root:(const MtTranslationMessage *)a4
{
  return [(FTMtTranslationMessage *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTMtTranslationMessage)initWithFlatbuffData:(id)a3 root:(const MtTranslationMessage *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTMtTranslationMessage;
  v10 = [(FTMtTranslationMessage *)&v30 init];
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
      a4 = (const MtTranslationMessage *)v13 + *v13;
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
      root = (siri::speech::qss_fb::MtTranslationMessage *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::MtTranslationMessage::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
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

- (int64_t)session_message_type
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

- (FTTranslationRequest)session_messageAsFTTranslationRequest
{
  if ([(FTMtTranslationMessage *)self session_message_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTTranslationRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTTranslationRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTTranslationResponse)session_messageAsFTTranslationResponse
{
  if ([(FTMtTranslationMessage *)self session_message_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTTranslationResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTTranslationResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FLTBFBufferAccessor)session_message
{
  int64_t v3 = [(FTMtTranslationMessage *)self session_message_type];
  if (v3 == 2)
  {
    uint64_t v4 = [(FTMtTranslationMessage *)self session_messageAsFTTranslationResponse];
  }
  else if (v3 == 1)
  {
    uint64_t v4 = [(FTMtTranslationMessage *)self session_messageAsFTTranslationRequest];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (FLTBFBufferAccessor *)v4;
}

+ (Class)session_message_immutableClassForType:(int64_t)a3
{
  if (a3 == 1 || a3 == 2)
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (Class)v4;
}

+ (int64_t)session_message_typeForImmutableObject:(id)a3
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
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::MtTranslationMessage>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(FTMtTranslationMessage *)self session_message_type];
  if ([(FTMtTranslationMessage *)self session_message_type] == 1)
  {
    v6 = [(FTMtTranslationMessage *)self session_messageAsFTTranslationRequest];
    int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    int v7 = 0;
  }
  if ([(FTMtTranslationMessage *)self session_message_type] == 2)
  {
    v8 = [(FTMtTranslationMessage *)self session_messageAsFTTranslationResponse];
    int v9 = [v8 addObjectToBuffer:a3];

    int v10 = v9;
  }
  else
  {
    int v10 = 0;
  }
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v11 = *((void *)a3 + 5);
  uint64_t v12 = *((void *)a3 + 6);
  uint64_t v13 = *((void *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 4, v5, 0);
  if ([(FTMtTranslationMessage *)self session_message_type] == 1) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v7);
  }
  if ([(FTMtTranslationMessage *)self session_message_type] == 2) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v10);
  }
  return (Offset<siri::speech::qss_fb::MtTranslationMessage>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v13- (unsigned __int16)v12+ (unsigned __int16)v11);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTMtTranslationMessage *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__38__FTMtTranslationMessage_flatbuffData__block_invoke(uint64_t a1)
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
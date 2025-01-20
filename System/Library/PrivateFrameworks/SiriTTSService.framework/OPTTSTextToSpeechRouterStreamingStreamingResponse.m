@interface OPTTSTextToSpeechRouterStreamingStreamingResponse
+ (Class)content_immutableClassForType:(int64_t)a3;
+ (int64_t)content_typeForImmutableObject:(id)a3;
- (FLTBFBufferAccessor)content;
- (OPTTSBeginTextToSpeechStreamingResponse)contentAsOPTTSBeginTextToSpeechStreamingResponse;
- (OPTTSFinalTextToSpeechStreamingResponse)contentAsOPTTSFinalTextToSpeechStreamingResponse;
- (OPTTSPartialTextToSpeechStreamingResponse)contentAsOPTTSPartialTextToSpeechStreamingResponse;
- (OPTTSTextToSpeechRouterStreamingStreamingResponse)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechRouterStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingResponse *)a4;
- (OPTTSTextToSpeechRouterStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingResponse *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingResponse>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation OPTTSTextToSpeechRouterStreamingStreamingResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_19CEE1A10;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__65__OPTTSTextToSpeechRouterStreamingStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingResponse>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self content_type];
  if ([(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self content_type] == 1)
  {
    char v6 = [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self contentAsOPTTSBeginTextToSpeechStreamingResponse];
    unsigned int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self content_type] == 2)
  {
    long long v8 = [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self contentAsOPTTSPartialTextToSpeechStreamingResponse];
    unsigned int v9 = [v8 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v9 = 0;
  }
  if ([(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self content_type] == 3)
  {
    uint64_t v10 = [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self contentAsOPTTSFinalTextToSpeechStreamingResponse];
    unsigned int v11 = [v10 addObjectToBuffer:a3];

    unsigned int v12 = v11;
  }
  else
  {
    unsigned int v12 = 0;
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v13 = *((void *)a3 + 5);
  uint64_t v14 = *((void *)a3 + 6);
  uint64_t v15 = *((void *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)a3, 4, v5);
  if ([(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self content_type] == 1) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<void>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7);
  }
  if ([(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self content_type] == 2) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<void>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v9);
  }
  if ([(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self content_type] == 3) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<void>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12);
  }
  return (Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingResponse>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v15 - (int)v14 + (int)v13);
}

- (FLTBFBufferAccessor)content
{
  int64_t v3 = [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self content_type];
  switch(v3)
  {
    case 3:
      v4 = [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self contentAsOPTTSFinalTextToSpeechStreamingResponse];
      break;
    case 2:
      v4 = [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self contentAsOPTTSPartialTextToSpeechStreamingResponse];
      break;
    case 1:
      v4 = [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self contentAsOPTTSBeginTextToSpeechStreamingResponse];
      break;
    default:
      v4 = 0;
      break;
  }
  return (FLTBFBufferAccessor *)v4;
}

- (OPTTSFinalTextToSpeechStreamingResponse)contentAsOPTTSFinalTextToSpeechStreamingResponse
{
  if ([(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self content_type] == 3)
  {
    int64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [OPTTSFinalTextToSpeechStreamingResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      int64_t v3 = [(OPTTSFinalTextToSpeechStreamingResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    int64_t v3 = 0;
  }
  return v3;
}

- (OPTTSPartialTextToSpeechStreamingResponse)contentAsOPTTSPartialTextToSpeechStreamingResponse
{
  if ([(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self content_type] == 2)
  {
    int64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [OPTTSPartialTextToSpeechStreamingResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      int64_t v3 = [(OPTTSPartialTextToSpeechStreamingResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    int64_t v3 = 0;
  }
  return v3;
}

- (OPTTSBeginTextToSpeechStreamingResponse)contentAsOPTTSBeginTextToSpeechStreamingResponse
{
  if ([(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self content_type] == 1)
  {
    int64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [OPTTSBeginTextToSpeechStreamingResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      int64_t v3 = [(OPTTSBeginTextToSpeechStreamingResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    int64_t v3 = 0;
  }
  return v3;
}

- (int64_t)content_type
{
  root = self->_root;
  int64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return root[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (OPTTSTextToSpeechRouterStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v34.receiver = self;
  v34.super_class = (Class)OPTTSTextToSpeechRouterStreamingStreamingResponse;
  uint64_t v10 = [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)&v34 init];
  unsigned int v11 = v10;
  if (!v10) {
    goto LABEL_37;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_38;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechRouterStreamingStreamingResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (v5)
  {
    unint64_t v14 = [*p_data bytes];
    uint64_t v15 = [*p_data length];
    unint64_t var0 = (unint64_t)v11->_root->var0;
    if (var0 < v14 || var0 > v14 + v15) {
      goto LABEL_38;
    }
    uint64_t v18 = [*p_data bytes];
    unint64_t v19 = [*p_data length];
    uint64_t v29 = v18;
    unint64_t v30 = v19;
    long long v31 = xmmword_19CEE1A20;
    uint64_t v32 = 0;
    char v33 = 1;
    if (v19 >= 0x7FFFFFFF) {
      __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
    }
    root = (apple::aiml::flatbuffers2::Table *)v11->_root;
    if (root)
    {
      if (!apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)&v29, v11->_root->var0))goto LABEL_38; {
      v21 = (unsigned __int16 *)((char *)root - *(int *)root);
      }
      unsigned int v22 = *v21;
      if (v22 >= 5 && v21[2] && (v30 < 2 || v30 - 1 < (unint64_t)root + v21[2] - v29)) {
        goto LABEL_38;
      }
      if (!apple::aiml::flatbuffers2::Table::VerifyOffset(root, (const apple::aiml::flatbuffers2::Verifier *)&v29, 6u)) {
        goto LABEL_38;
      }
      if (v22 >= 7)
      {
        if (v21[3])
        {
          v23 = (apple::aiml::flatbuffers2::Table *)((char *)root + v21[3] + *(unsigned int *)((char *)root + v21[3]));
          goto LABEL_24;
        }
LABEL_23:
        v23 = 0;
LABEL_24:
        if (v21[2])
        {
          int v24 = *((unsigned __int8 *)root + v21[2]);
          if (v24 == 3)
          {
            if (v23
              && !siri::speech::schema_fb::FinalTextToSpeechStreamingResponse::Verify(v23, (apple::aiml::flatbuffers2::Verifier *)&v29))
            {
              goto LABEL_38;
            }
          }
          else if (v24 == 2)
          {
            if (v23
              && !siri::speech::schema_fb::PartialTextToSpeechStreamingResponse::Verify(v23, (apple::aiml::flatbuffers2::Verifier *)&v29))
            {
              goto LABEL_38;
            }
          }
          else if (v24 == 1 {
                 && v23
          }
                 && !siri::speech::schema_fb::BeginTextToSpeechStreamingResponse::Verify(v23, (apple::aiml::flatbuffers2::Verifier *)&v29))
          {
LABEL_38:
            v27 = 0;
            goto LABEL_39;
          }
        }
        goto LABEL_36;
      }
      if (v22 >= 5) {
        goto LABEL_23;
      }
    }
  }
LABEL_36:
  uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v29);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v25;

LABEL_37:
  v27 = v11;
LABEL_39:

  return v27;
}

- (OPTTSTextToSpeechRouterStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingResponse *)a4
{
  return [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechRouterStreamingStreamingResponse)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRouterStreamingStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
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
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (Class)content_immutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = objc_opt_class();
  }
  return (Class)v4;
}

@end
@interface OPTTSTextToSpeechRouterStreamingStreamingRequest
+ (Class)content_immutableClassForType:(int64_t)a3;
+ (int64_t)content_typeForImmutableObject:(id)a3;
- (FLTBFBufferAccessor)content;
- (OPTTSStartTextToSpeechStreamingRequest)contentAsOPTTSStartTextToSpeechStreamingRequest;
- (OPTTSTextToSpeechRouterStreamingStreamingRequest)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechRouterStreamingStreamingRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingRequest *)a4;
- (OPTTSTextToSpeechRouterStreamingStreamingRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingRequest *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingRequest>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation OPTTSTextToSpeechRouterStreamingStreamingRequest

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
  v2.var0 = [(OPTTSTextToSpeechRouterStreamingStreamingRequest *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__64__OPTTSTextToSpeechRouterStreamingStreamingRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingRequest>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(OPTTSTextToSpeechRouterStreamingStreamingRequest *)self content_type];
  if ([(OPTTSTextToSpeechRouterStreamingStreamingRequest *)self content_type] == 1)
  {
    char v6 = [(OPTTSTextToSpeechRouterStreamingStreamingRequest *)self contentAsOPTTSStartTextToSpeechStreamingRequest];
    unsigned int v7 = [v6 addObjectToBuffer:a3];

    unsigned int v8 = v7;
  }
  else
  {
    unsigned int v8 = 0;
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v10 = *((void *)a3 + 5);
  uint64_t v9 = *((void *)a3 + 6);
  uint64_t v11 = *((void *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)a3, 4, v5);
  if ([(OPTTSTextToSpeechRouterStreamingStreamingRequest *)self content_type] == 1) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<void>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8);
  }
  return (Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingRequest>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v11 - (int)v9 + (int)v10);
}

- (FLTBFBufferAccessor)content
{
  if ([(OPTTSTextToSpeechRouterStreamingStreamingRequest *)self content_type] == 1)
  {
    v3 = [(OPTTSTextToSpeechRouterStreamingStreamingRequest *)self contentAsOPTTSStartTextToSpeechStreamingRequest];
  }
  else
  {
    v3 = 0;
  }
  return (FLTBFBufferAccessor *)v3;
}

- (OPTTSStartTextToSpeechStreamingRequest)contentAsOPTTSStartTextToSpeechStreamingRequest
{
  if ([(OPTTSTextToSpeechRouterStreamingStreamingRequest *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [OPTTSStartTextToSpeechStreamingRequest alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        unsigned int v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        unsigned int v8 = 0;
      }
      v3 = [(OPTTSStartTextToSpeechStreamingRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
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

- (OPTTSTextToSpeechRouterStreamingStreamingRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)OPTTSTextToSpeechRouterStreamingStreamingRequest;
  uint64_t v10 = [(OPTTSTextToSpeechRouterStreamingStreamingRequest *)&v33 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_29;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_30;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechRouterStreamingStreamingRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_28;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_30;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v28 = v18;
  unint64_t v29 = v19;
  long long v30 = xmmword_19CEE1A20;
  uint64_t v31 = 0;
  char v32 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (apple::aiml::flatbuffers2::Table *)v11->_root;
  if (!root) {
    goto LABEL_28;
  }
  if (!apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)&v28, v11->_root->var0))goto LABEL_30; {
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  }
  unsigned int v22 = *v21;
  if (v22 >= 5 && v21[2] && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28)) {
    goto LABEL_30;
  }
  if (!apple::aiml::flatbuffers2::Table::VerifyOffset(root, (const apple::aiml::flatbuffers2::Verifier *)&v28, 6u)) {
    goto LABEL_30;
  }
  if (v22 >= 7)
  {
    if (v21[3])
    {
      v23 = (apple::aiml::flatbuffers2::Table *)((char *)root + v21[3] + *(unsigned int *)((char *)root + v21[3]));
LABEL_24:
      if (!v21[2]
        || !v23
        || *((unsigned char *)root + v21[2]) != 1
        || siri::speech::schema_fb::StartTextToSpeechStreamingRequest::Verify(v23, (apple::aiml::flatbuffers2::Verifier *)&v28))
      {
        goto LABEL_28;
      }
LABEL_30:
      v26 = 0;
      goto LABEL_31;
    }
LABEL_23:
    v23 = 0;
    goto LABEL_24;
  }
  if (v22 >= 5) {
    goto LABEL_23;
  }
LABEL_28:
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v28);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_29:
  v26 = v11;
LABEL_31:

  return v26;
}

- (OPTTSTextToSpeechRouterStreamingStreamingRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingRequest *)a4
{
  return [(OPTTSTextToSpeechRouterStreamingStreamingRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRouterStreamingStreamingRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechRouterStreamingStreamingRequest)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRouterStreamingStreamingRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

+ (int64_t)content_typeForImmutableObject:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

+ (Class)content_immutableClassForType:(int64_t)a3
{
  if (a3 == 1)
  {
    int64_t v4 = objc_opt_class();
  }
  else
  {
    int64_t v4 = 0;
  }
  return (Class)v4;
}

@end
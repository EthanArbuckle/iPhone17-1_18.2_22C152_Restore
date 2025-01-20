@interface FTBatchTranslationStreamingResponse
+ (Class)content_immutableClassForType:(int64_t)a3;
+ (int64_t)content_typeForImmutableObject:(id)a3;
- (FLTBFBufferAccessor)content;
- (FTBatchTranslationResponse)contentAsFTBatchTranslationResponse;
- (FTBatchTranslationStreamingResponse)initWithFlatbuffData:(id)a3;
- (FTBatchTranslationStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationStreamingResponse *)a4;
- (FTBatchTranslationStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationStreamingResponse *)a4 verify:(BOOL)a5;
- (FTFinalBlazarResponse)contentAsFTFinalBlazarResponse;
- (FTTranslationSupportedLanguagesResponse)contentAsFTTranslationSupportedLanguagesResponse;
- (Offset<siri::speech::qss_fb::BatchTranslationStreamingResponse>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation FTBatchTranslationStreamingResponse

- (FTBatchTranslationStreamingResponse)initWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTBatchTranslationStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationStreamingResponse *)a4
{
  return [(FTBatchTranslationStreamingResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTBatchTranslationStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationStreamingResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTBatchTranslationStreamingResponse;
  v10 = [(FTBatchTranslationStreamingResponse *)&v30 init];
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
      a4 = (const BatchTranslationStreamingResponse *)v13 + *v13;
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
      root = (siri::speech::qss_fb::BatchTranslationStreamingResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::BatchTranslationStreamingResponse::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
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

- (FTBatchTranslationResponse)contentAsFTBatchTranslationResponse
{
  if ([(FTBatchTranslationStreamingResponse *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      uint64_t v4 = [FTBatchTranslationResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTBatchTranslationResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTFinalBlazarResponse)contentAsFTFinalBlazarResponse
{
  if ([(FTBatchTranslationStreamingResponse *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      uint64_t v4 = [FTFinalBlazarResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTFinalBlazarResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTTranslationSupportedLanguagesResponse)contentAsFTTranslationSupportedLanguagesResponse
{
  if ([(FTBatchTranslationStreamingResponse *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      uint64_t v4 = [FTTranslationSupportedLanguagesResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTTranslationSupportedLanguagesResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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
  int64_t v3 = [(FTBatchTranslationStreamingResponse *)self content_type];
  switch(v3)
  {
    case 3:
      uint64_t v4 = [(FTBatchTranslationStreamingResponse *)self contentAsFTTranslationSupportedLanguagesResponse];
      break;
    case 2:
      uint64_t v4 = [(FTBatchTranslationStreamingResponse *)self contentAsFTFinalBlazarResponse];
      break;
    case 1:
      uint64_t v4 = [(FTBatchTranslationStreamingResponse *)self contentAsFTBatchTranslationResponse];
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  return (FLTBFBufferAccessor *)v4;
}

+ (Class)content_immutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
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
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::BatchTranslationStreamingResponse>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(FTBatchTranslationStreamingResponse *)self content_type];
  if ([(FTBatchTranslationStreamingResponse *)self content_type] == 1)
  {
    v6 = [(FTBatchTranslationStreamingResponse *)self contentAsFTBatchTranslationResponse];
    int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    int v7 = 0;
  }
  if ([(FTBatchTranslationStreamingResponse *)self content_type] == 2)
  {
    v8 = [(FTBatchTranslationStreamingResponse *)self contentAsFTFinalBlazarResponse];
    int v9 = [v8 addObjectToBuffer:a3];
  }
  else
  {
    int v9 = 0;
  }
  if ([(FTBatchTranslationStreamingResponse *)self content_type] == 3)
  {
    v10 = [(FTBatchTranslationStreamingResponse *)self contentAsFTTranslationSupportedLanguagesResponse];
    int v11 = [v10 addObjectToBuffer:a3];

    int v12 = v11;
  }
  else
  {
    int v12 = 0;
  }
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v13 = *((void *)a3 + 5);
  uint64_t v14 = *((void *)a3 + 6);
  uint64_t v15 = *((void *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 4, v5, 0);
  if ([(FTBatchTranslationStreamingResponse *)self content_type] == 1) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v7);
  }
  if ([(FTBatchTranslationStreamingResponse *)self content_type] == 2) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v9);
  }
  if ([(FTBatchTranslationStreamingResponse *)self content_type] == 3) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v12);
  }
  return (Offset<siri::speech::qss_fb::BatchTranslationStreamingResponse>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v15- (unsigned __int16)v14+ (unsigned __int16)v13);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTBatchTranslationStreamingResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__51__FTBatchTranslationStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
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
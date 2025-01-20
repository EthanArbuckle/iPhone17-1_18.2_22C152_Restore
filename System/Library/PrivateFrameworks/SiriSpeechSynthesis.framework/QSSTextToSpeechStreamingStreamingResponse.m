@interface QSSTextToSpeechStreamingStreamingResponse
- (Offset<siri::speech::qss_fb::TextToSpeechStreamingStreamingResponse>)addObjectToBuffer:(void *)a3;
- (QSSBeginTextToSpeechStreamingResponse)contentAsQSSBeginTextToSpeechStreamingResponse;
- (QSSFinalTextToSpeechStreamingResponse)contentAsQSSFinalTextToSpeechStreamingResponse;
- (QSSPartialTextToSpeechStreamingResponse)contentAsQSSPartialTextToSpeechStreamingResponse;
- (QSSQssAckResponse)contentAsQSSQssAckResponse;
- (QSSTextToSpeechStreamingStreamingResponse)initWithFlatbuffData:(id)a3;
- (QSSTextToSpeechStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechStreamingStreamingResponse *)a4;
- (QSSTextToSpeechStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechStreamingStreamingResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation QSSTextToSpeechStreamingStreamingResponse

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
  v2.var0 = [(QSSTextToSpeechStreamingStreamingResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__57__QSSTextToSpeechStreamingStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::qss_fb::TextToSpeechStreamingStreamingResponse>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(QSSTextToSpeechStreamingStreamingResponse *)self content_type];
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 1)
  {
    char v6 = [(QSSTextToSpeechStreamingStreamingResponse *)self contentAsQSSQssAckResponse];
    unsigned int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 2)
  {
    long long v8 = [(QSSTextToSpeechStreamingStreamingResponse *)self contentAsQSSBeginTextToSpeechStreamingResponse];
    unsigned int v9 = [v8 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v9 = 0;
  }
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 3)
  {
    uint64_t v10 = [(QSSTextToSpeechStreamingStreamingResponse *)self contentAsQSSPartialTextToSpeechStreamingResponse];
    unsigned int v11 = [v10 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v11 = 0;
  }
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 4)
  {
    __int16 v12 = [(QSSTextToSpeechStreamingStreamingResponse *)self contentAsQSSFinalTextToSpeechStreamingResponse];
    unsigned int v13 = [v12 addObjectToBuffer:a3];

    unsigned int v14 = v13;
  }
  else
  {
    unsigned int v14 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v15 = *((void *)a3 + 5);
  uint64_t v16 = *((void *)a3 + 6);
  uint64_t v17 = *((void *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v5);
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 1) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  }
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 2) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v9);
  }
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 3) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v11);
  }
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 4) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v14);
  }
  return (Offset<siri::speech::qss_fb::TextToSpeechStreamingStreamingResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v17 - (int)v16 + (int)v15);
}

- (QSSFinalTextToSpeechStreamingResponse)contentAsQSSFinalTextToSpeechStreamingResponse
{
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSFinalTextToSpeechStreamingResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSFinalTextToSpeechStreamingResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSPartialTextToSpeechStreamingResponse)contentAsQSSPartialTextToSpeechStreamingResponse
{
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSPartialTextToSpeechStreamingResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSPartialTextToSpeechStreamingResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSBeginTextToSpeechStreamingResponse)contentAsQSSBeginTextToSpeechStreamingResponse
{
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSBeginTextToSpeechStreamingResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSBeginTextToSpeechStreamingResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSQssAckResponse)contentAsQSSQssAckResponse
{
  if ([(QSSTextToSpeechStreamingStreamingResponse *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSQssAckResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSQssAckResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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

- (QSSTextToSpeechStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechStreamingStreamingResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)QSSTextToSpeechStreamingStreamingResponse;
  uint64_t v10 = [(QSSTextToSpeechStreamingStreamingResponse *)&v33 init];
  unsigned int v11 = v10;
  if (!v10) {
    goto LABEL_38;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_39;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    unsigned int v13 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechStreamingStreamingResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_37;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_39;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v28 = v18;
  unint64_t v29 = v19;
  long long v30 = xmmword_22B64D0E0;
  uint64_t v31 = 0;
  char v32 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_37;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v11->_root->var0)
    || (v21 = (unsigned __int16 *)((char *)root - *(int *)root), unsigned int v22 = *v21, v22 >= 5)
    && v21[2]
    && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v28, 6u))
  {
LABEL_39:
    v26 = 0;
    goto LABEL_40;
  }
  if (v22 >= 7)
  {
    v23 = (unsigned __int8 *)v21[3];
    if (v21[3]) {
      v23 = &v23[(void)root + *(unsigned int *)&v23[(void)root]];
    }
    goto LABEL_24;
  }
  if (v22 >= 5)
  {
    v23 = 0;
LABEL_24:
    if (v21[2])
    {
      switch(*((unsigned char *)root + v21[2]))
      {
        case 0:
          break;
        case 1:
          if (v23 && !flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v23)) {
            goto LABEL_39;
          }
          break;
        case 2:
          if (v23
            && !siri::speech::schema_fb::BeginTextToSpeechStreamingResponse::Verify((siri::speech::schema_fb::BeginTextToSpeechStreamingResponse *)v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_39;
          }
          break;
        case 3:
          if (!v23
            || siri::speech::schema_fb::PartialTextToSpeechStreamingResponse::Verify((siri::speech::schema_fb::PartialTextToSpeechStreamingResponse *)v23, (flatbuffers::Verifier *)&v28))
          {
            break;
          }
          goto LABEL_39;
        case 4:
          if (v23
            && !siri::speech::schema_fb::FinalTextToSpeechStreamingResponse::Verify((siri::speech::schema_fb::FinalTextToSpeechStreamingResponse *)v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_39;
          }
          break;
        default:
          goto LABEL_39;
      }
    }
  }
LABEL_37:
  uint64_t v24 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v28);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_38:
  v26 = v11;
LABEL_40:

  return v26;
}

- (QSSTextToSpeechStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechStreamingStreamingResponse *)a4
{
  return [(QSSTextToSpeechStreamingStreamingResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechStreamingStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextToSpeechStreamingStreamingResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechStreamingStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
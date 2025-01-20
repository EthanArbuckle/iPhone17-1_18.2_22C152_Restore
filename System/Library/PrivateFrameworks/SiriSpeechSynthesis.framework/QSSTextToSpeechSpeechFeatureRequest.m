@interface QSSTextToSpeechSpeechFeatureRequest
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest>)addObjectToBuffer:(void *)a3;
- (QSSTextToSpeechSpeechFeatureInputText)text;
- (QSSTextToSpeechSpeechFeatureInputWave)wave_data;
- (QSSTextToSpeechSpeechFeatureModelIdentifier)model_id;
- (QSSTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3;
- (QSSTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureRequest *)a4;
- (QSSTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureRequest *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTextToSpeechSpeechFeatureRequest

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
  v2.var0 = [(QSSTextToSpeechSpeechFeatureRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__51__QSSTextToSpeechSpeechFeatureRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSTextToSpeechSpeechFeatureRequest *)self speech_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(QSSTextToSpeechSpeechFeatureRequest *)self session_id];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_26DEBFAF8;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  LODWORD(v12) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v14 = [(QSSTextToSpeechSpeechFeatureRequest *)self model_id];
  unsigned int v15 = [v14 addObjectToBuffer:a3];

  v16 = [(QSSTextToSpeechSpeechFeatureRequest *)self text];
  unsigned int v17 = [v16 addObjectToBuffer:a3];

  v18 = [(QSSTextToSpeechSpeechFeatureRequest *)self wave_data];
  unsigned int v19 = [v18 addObjectToBuffer:a3];

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v20 = *((void *)a3 + 5);
  uint64_t v21 = *((void *)a3 + 6);
  uint64_t v22 = *((void *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v12);
  if (v15)
  {
    int v23 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v15);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v23);
  }
  if (v17)
  {
    int v24 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v17);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v24);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v19);
  return (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v22 - (int)v21 + (int)v20);
}

- (QSSTextToSpeechSpeechFeatureInputWave)wave_data
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"wave_data"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechSpeechFeatureInputWave alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(QSSTextToSpeechSpeechFeatureInputWave *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"wave_data"];
  }
  return v3;
}

- (QSSTextToSpeechSpeechFeatureInputText)text
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"text"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechSpeechFeatureInputText alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(QSSTextToSpeechSpeechFeatureInputText *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"text"];
  }
  return v3;
}

- (QSSTextToSpeechSpeechFeatureModelIdentifier)model_id
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"model_id"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechSpeechFeatureModelIdentifier alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (uint64_t v7 = *(unsigned __int16 *)v6[8].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(QSSTextToSpeechSpeechFeatureModelIdentifier *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"model_id"];
  }
  return v3;
}

- (NSString)session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)speech_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v42.receiver = self;
  v42.super_class = (Class)QSSTextToSpeechSpeechFeatureRequest;
  uint64_t v10 = [(QSSTextToSpeechSpeechFeatureRequest *)&v42 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_40;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      size_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const TextToSpeechSpeechFeatureRequest *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_40;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v37 = v18;
      unint64_t v38 = v19;
      long long v39 = xmmword_22B64D0E0;
      uint64_t v40 = 0;
      LOBYTE(v41) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (flatbuffers::Table *)v11->_root;
      if (root)
      {
        if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v37, v11->_root->var0)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 4u))
        {
          goto LABEL_40;
        }
        uint64_t v21 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
          int v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
        }
        else {
          int v23 = 0;
        }
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v23)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 6u))
        {
          goto LABEL_40;
        }
        int v24 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
          v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
        }
        else {
          v26 = 0;
        }
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v26)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 8u)
          || (v27 = (unsigned __int16 *)((char *)root - *(int *)root), *v27 >= 9u)
          && (uint64_t v28 = v27[4]) != 0
          && !siri::speech::schema_fb::CancelRequest::Verify((flatbuffers::Table *)((char *)root + v28 + *(unsigned int *)((char *)root + v28)), (flatbuffers::Verifier *)&v37)|| !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 0xAu)|| (v29 = (unsigned __int16 *)((char *)root - *(int *)root), *v29 >= 0xBu)&& (uint64_t v30 = v29[5]) != 0&& !siri::speech::schema_fb::TextToSpeechSpeechFeatureInputText::Verify((flatbuffers::Table *)((char *)root + v30 + *(unsigned int *)((char *)root + v30)), (flatbuffers::Verifier *)&v37)|| !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 0xCu)|| (v31 = (unsigned __int16 *)((char *)root - *(int *)root), *v31 >= 0xDu)&& (v32 = v31[6]) != 0&& !siri::speech::schema_fb::TextToSpeechVoiceResource::Verify((flatbuffers::Table *)((char *)root + v32 + *(unsigned int *)((char *)root + v32)), (flatbuffers::Verifier *)&v37))
        {
LABEL_40:
          v35 = 0;
          goto LABEL_41;
        }
      }
    }
    uint64_t v33 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v37, v38, v39, v40, v41);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v33;
  }
  v35 = v11;
LABEL_41:

  return v35;
}

- (QSSTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureRequest *)a4
{
  return [(QSSTextToSpeechSpeechFeatureRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechSpeechFeatureRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechSpeechFeatureRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
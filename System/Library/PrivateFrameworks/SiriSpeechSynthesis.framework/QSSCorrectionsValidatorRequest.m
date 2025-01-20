@interface QSSCorrectionsValidatorRequest
- (NSString)corrected_utterance;
- (NSString)language;
- (NSString)original_utterance;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::CorrectionsValidatorRequest>)addObjectToBuffer:(void *)a3;
- (QSSCorrectionsValidatorRequest)initWithFlatbuffData:(id)a3;
- (QSSCorrectionsValidatorRequest)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorRequest *)a4;
- (QSSCorrectionsValidatorRequest)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorRequest *)a4 verify:(BOOL)a5;
- (QSSRecognitionResult)recognition_result;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSCorrectionsValidatorRequest

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
  v2.var0 = [(QSSCorrectionsValidatorRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__46__QSSCorrectionsValidatorRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::CorrectionsValidatorRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSCorrectionsValidatorRequest *)self speech_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(QSSCorrectionsValidatorRequest *)self session_id];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_26DEBFAF8;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  unsigned int v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v15 = [(QSSCorrectionsValidatorRequest *)self language];
  v16 = v15;
  if (!v15) {
    v15 = &stru_26DEBFAF8;
  }
  v17 = (const char *)[(__CFString *)v15 UTF8String];
  size_t v18 = strlen(v17);
  unsigned int v19 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  v20 = [(QSSCorrectionsValidatorRequest *)self recognition_result];
  unsigned int v21 = [v20 addObjectToBuffer:a3];

  v22 = [(QSSCorrectionsValidatorRequest *)self original_utterance];
  v23 = v22;
  if (!v22) {
    v22 = &stru_26DEBFAF8;
  }
  v24 = (const char *)[(__CFString *)v22 UTF8String];
  size_t v25 = strlen(v24);
  unsigned int v26 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v24, v25);

  v27 = [(QSSCorrectionsValidatorRequest *)self corrected_utterance];
  v28 = v27;
  if (!v27) {
    v27 = &stru_26DEBFAF8;
  }
  v29 = (const char *)[(__CFString *)v27 UTF8String];
  size_t v30 = strlen(v29);
  LODWORD(v29) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v29, v30);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v31 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v14);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v19);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v21);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v26);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v29);
  return (Offset<siri::speech::schema_fb::CorrectionsValidatorRequest>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v31);
}

- (NSString)corrected_utterance
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
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
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)original_utterance
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
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
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSRecognitionResult)recognition_result
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"recognition_result"];
  if (!v3)
  {
    uint64_t v4 = [QSSRecognitionResult alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    uint64_t v3 = [(QSSRecognitionResult *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"recognition_result"];
  }
  return v3;
}

- (NSString)language
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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

- (QSSCorrectionsValidatorRequest)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v47.receiver = self;
  v47.super_class = (Class)QSSCorrectionsValidatorRequest;
  uint64_t v10 = [(QSSCorrectionsValidatorRequest *)&v47 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_51;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      size_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const CorrectionsValidatorRequest *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_51;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v42 = v18;
      unint64_t v43 = v19;
      long long v44 = xmmword_22B64D0E0;
      uint64_t v45 = 0;
      LOBYTE(v46) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (flatbuffers::Table *)v11->_root;
      if (root)
      {
        if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v42, v11->_root->var0)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 4u))
        {
          goto LABEL_51;
        }
        unsigned int v21 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
          v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
        }
        else {
          v23 = 0;
        }
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v23)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 6u))
        {
          goto LABEL_51;
        }
        v24 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
          unsigned int v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
        }
        else {
          unsigned int v26 = 0;
        }
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v26)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 8u))
        {
          goto LABEL_51;
        }
        v27 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v27 >= 9u && (uint64_t v28 = v27[4]) != 0) {
          v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
        }
        else {
          v29 = 0;
        }
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v29)) {
          goto LABEL_51;
        }
        if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0xAu)) {
          goto LABEL_51;
        }
        size_t v30 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v30 >= 0xBu)
        {
          uint64_t v31 = v30[5];
          if (v31)
          {
            if (!siri::speech::schema_fb::RecognitionResult::Verify((flatbuffers::Table *)((char *)root + v31 + *(unsigned int *)((char *)root + v31)), (flatbuffers::Verifier *)&v42))goto LABEL_51; {
          }
            }
        }
        if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0xCu)) {
          goto LABEL_51;
        }
        v32 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v32 >= 0xDu && (uint64_t v33 = v32[6]) != 0) {
          v34 = (const unsigned __int8 *)root + v33 + *(unsigned int *)((char *)root + v33);
        }
        else {
          v34 = 0;
        }
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v34)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0xEu)
          || ((v35 = (unsigned __int16 *)((char *)root - *(int *)root), *v35 < 0xFu) || (uint64_t v36 = v35[7]) == 0
            ? (v37 = 0)
            : (v37 = (const unsigned __int8 *)root + v36 + *(unsigned int *)((char *)root + v36)),
              !flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v37)))
        {
LABEL_51:
          v40 = 0;
          goto LABEL_52;
        }
      }
    }
    uint64_t v38 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v42, v43, v44, v45, v46);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v38;
  }
  v40 = v11;
LABEL_52:

  return v40;
}

- (QSSCorrectionsValidatorRequest)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorRequest *)a4
{
  return [(QSSCorrectionsValidatorRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSCorrectionsValidatorRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSCorrectionsValidatorRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSCorrectionsValidatorRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
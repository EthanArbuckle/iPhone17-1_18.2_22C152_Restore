@interface QSSCorrectionsValidatorResponse
- (NSArray)corrections;
- (NSString)language;
- (NSString)return_str;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::CorrectionsValidatorResponse>)addObjectToBuffer:(void *)a3;
- (QSSCorrectionsValidatorResponse)initWithFlatbuffData:(id)a3;
- (QSSCorrectionsValidatorResponse)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorResponse *)a4;
- (QSSCorrectionsValidatorResponse)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
@end

@implementation QSSCorrectionsValidatorResponse

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
  v2.var0 = [(QSSCorrectionsValidatorResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__47__QSSCorrectionsValidatorResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::CorrectionsValidatorResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSCorrectionsValidatorResponse *)self speech_id];
  char v6 = v5;
  v60 = (flatbuffers::FlatBufferBuilder *)a3;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  long long v9 = [(QSSCorrectionsValidatorResponse *)self session_id];
  uint64_t v10 = (flatbuffers::FlatBufferBuilder *)a3;
  uint64_t v11 = v9;
  if (!v9) {
    long long v9 = &stru_26DEBFAF8;
  }
  __int16 v12 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v13 = strlen(v12);
  unsigned int v58 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v14 = [(QSSCorrectionsValidatorResponse *)self language];
  v15 = v14;
  if (!v14) {
    v14 = &stru_26DEBFAF8;
  }
  v16 = (const char *)[(__CFString *)v14 UTF8String];
  size_t v17 = strlen(v16);
  unsigned int v57 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v16, v17);

  int v56 = [(QSSCorrectionsValidatorResponse *)self return_code];
  v18 = [(QSSCorrectionsValidatorResponse *)self return_str];
  v19 = v18;
  if (!v18) {
    v18 = &stru_26DEBFAF8;
  }
  v20 = (const char *)[(__CFString *)v18 UTF8String];
  size_t v21 = strlen(v20);
  unsigned int v55 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v20, v21);

  v22 = [(QSSCorrectionsValidatorResponse *)self corrections];
  unint64_t v23 = [v22 count];
  if (v23)
  {
    if (v23 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v23);
    v26 = &v24[4 * v25];
  }
  else
  {
    v24 = 0;
    v26 = 0;
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v27 = [(QSSCorrectionsValidatorResponse *)self corrections];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v62;
    v30 = v24;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v62 != v29) {
          objc_enumerationMutation(v27);
        }
        int v32 = [*(id *)(*((void *)&v61 + 1) + 8 * i) addObjectToBuffer:v10];
        int v33 = v32;
        if (v30 >= v26)
        {
          uint64_t v34 = (v30 - v24) >> 2;
          unint64_t v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v26 - v24) >> 1 > v35) {
            unint64_t v35 = (v26 - v24) >> 1;
          }
          if ((unint64_t)(v26 - v24) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v36 = v35;
          }
          if (v36) {
            unint64_t v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v36);
          }
          else {
            uint64_t v37 = 0;
          }
          v38 = (char *)(v36 + 4 * v34);
          *(_DWORD *)v38 = v33;
          v39 = v38 + 4;
          while (v30 != v24)
          {
            int v40 = *((_DWORD *)v30 - 1);
            v30 -= 4;
            *((_DWORD *)v38 - 1) = v40;
            v38 -= 4;
          }
          v26 = (char *)(v36 + 4 * v37);
          if (v24) {
            operator delete(v24);
          }
          v24 = v38;
          v30 = v39;
          uint64_t v10 = v60;
        }
        else
        {
          *(_DWORD *)v30 = v32;
          v30 += 4;
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v28);
  }
  else
  {
    v30 = v24;
  }

  uint64_t v41 = v30 - v24;
  v42 = v10;
  if (v30 == v24) {
    v43 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::CorrectionsAlignment>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::CorrectionsAlignment>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::CorrectionsAlignment>> const&)::t;
  }
  else {
    v43 = v24;
  }
  uint64_t v44 = v41 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v42, v41 >> 2, 4uLL);
  if (v24 == v30)
  {
    LODWORD(v44) = 0;
  }
  else
  {
    v45 = v43 - 4;
    uint64_t v46 = v44;
    do
    {
      int v47 = flatbuffers::FlatBufferBuilder::ReferTo(v60, *(_DWORD *)&v45[4 * v46]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v60, v47);
      --v46;
    }
    while (v46);
  }
  unsigned int v48 = flatbuffers::FlatBufferBuilder::EndVector(v60, v44);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v60);
  *((unsigned char *)v60 + 70) = 1;
  int v49 = *((_DWORD *)v60 + 8);
  int v50 = *((_DWORD *)v60 + 12);
  int v51 = *((_DWORD *)v60 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v60, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v60, 6, v58);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v60, 8, v57);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v60, 10, v56);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v60, 12, v55);
  if (v48)
  {
    int v52 = flatbuffers::FlatBufferBuilder::ReferTo(v60, v48);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v60, 14, v52);
  }
  v53.var0 = flatbuffers::FlatBufferBuilder::EndTable(v60, v49 - v50 + v51);
  if (v24) {
    operator delete(v24);
  }
  return v53;
}

- (NSArray)corrections
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"corrections"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xFu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[14].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSCorrectionsAlignment alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"corrections"];
  }
  return (NSArray *)v3;
}

- (NSString)return_str
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (int)return_code
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)language
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSCorrectionsValidatorResponse)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v45.receiver = self;
  v45.super_class = (Class)QSSCorrectionsValidatorResponse;
  uint64_t v10 = [(QSSCorrectionsValidatorResponse *)&v45 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_53;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_54;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    size_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const CorrectionsValidatorResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_52;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_54;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v40 = v18;
  unint64_t v41 = v19;
  long long v42 = xmmword_22B64D0E0;
  uint64_t v43 = 0;
  char v44 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_52;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v40, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 4u))
  {
    goto LABEL_54;
  }
  size_t v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    unint64_t v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    unint64_t v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 6u))
  {
    goto LABEL_54;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  }
  else {
    v26 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 8u))
  {
    goto LABEL_54;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (uint64_t v28 = v27[4]) != 0) {
    uint64_t v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  }
  else {
    uint64_t v29 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v29)) {
    goto LABEL_54;
  }
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v31 = *v30;
  if (v31 >= 0xB && v30[5] && (v41 < 5 || v41 - 4 < (unint64_t)root + v30[5] - v40)) {
    goto LABEL_54;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 0xCu)) {
    goto LABEL_54;
  }
  int v32 = v31 >= 0xD && v30[6] ? (const unsigned __int8 *)root + v30[6] + *(unsigned int *)((char *)root + v30[6]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v32)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 0xEu))
  {
    goto LABEL_54;
  }
  int v33 = 0;
  uint64_t v34 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v34) < 0xFu) {
    goto LABEL_51;
  }
  if (*(_WORD *)((char *)root - v34 + 14))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v40, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v34 + 14)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v34 + 14)), 4uLL, 0))
    {
      int v33 = 0;
      uint64_t v34 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v34) < 0xFu) {
        goto LABEL_51;
      }
      goto LABEL_47;
    }
LABEL_54:
    v38 = 0;
    goto LABEL_55;
  }
LABEL_47:
  uint64_t v35 = *(unsigned __int16 *)((char *)root - v34 + 14);
  if (v35) {
    int v33 = (_DWORD *)((char *)root + v35 + *(unsigned int *)((char *)root + v35));
  }
  else {
    int v33 = 0;
  }
LABEL_51:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::CorrectionsAlignment>((flatbuffers::Verifier *)&v40, v33))goto LABEL_54; {
LABEL_52:
  }
  uint64_t v36 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v40);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v36;

LABEL_53:
  v38 = v11;
LABEL_55:

  return v38;
}

- (QSSCorrectionsValidatorResponse)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorResponse *)a4
{
  return [(QSSCorrectionsValidatorResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSCorrectionsValidatorResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSCorrectionsValidatorResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSCorrectionsValidatorResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
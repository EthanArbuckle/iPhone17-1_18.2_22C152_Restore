@interface QSSTextNormalizationResponse
- (NSArray)tokens;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::TextNormalizationResponse>)addObjectToBuffer:(void *)a3;
- (QSSTextNormalizationResponse)initWithFlatbuffData:(id)a3;
- (QSSTextNormalizationResponse)initWithFlatbuffData:(id)a3 root:(const TextNormalizationResponse *)a4;
- (QSSTextNormalizationResponse)initWithFlatbuffData:(id)a3 root:(const TextNormalizationResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)error_code;
@end

@implementation QSSTextNormalizationResponse

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
  v2.var0 = [(QSSTextNormalizationResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__44__QSSTextNormalizationResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextNormalizationResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v4 = [(QSSTextNormalizationResponse *)self speech_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v8 = [(QSSTextNormalizationResponse *)self session_id];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DEBFAF8;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  unsigned int v51 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  __int16 v12 = [(QSSTextNormalizationResponse *)self tokens];
  unint64_t v13 = [v12 count];
  v14 = a3;
  if (v13)
  {
    if (v13 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v13);
    v17 = &v15[4 * v16];
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v18 = [(QSSTextNormalizationResponse *)self tokens];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v55 objects:v59 count:16];
  v53 = self;
  if (v19)
  {
    uint64_t v20 = *(void *)v56;
    v21 = v15;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v56 != v20) {
          objc_enumerationMutation(v18);
        }
        int v23 = [*(id *)(*((void *)&v55 + 1) + 8 * i) addObjectToBuffer:v14];
        int v24 = v23;
        if (v21 >= v17)
        {
          uint64_t v25 = (v21 - v15) >> 2;
          unint64_t v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v17 - v15) >> 1 > v26) {
            unint64_t v26 = (v17 - v15) >> 1;
          }
          if ((unint64_t)(v17 - v15) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v26;
          }
          if (v27) {
            unint64_t v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v27);
          }
          else {
            uint64_t v28 = 0;
          }
          v29 = (char *)(v27 + 4 * v25);
          *(_DWORD *)v29 = v24;
          v30 = v29 + 4;
          while (v21 != v15)
          {
            int v31 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v29 - 1) = v31;
            v29 -= 4;
          }
          v17 = (char *)(v27 + 4 * v28);
          if (v15) {
            operator delete(v15);
          }
          v15 = v29;
          v21 = v30;
          v14 = a3;
        }
        else
        {
          *(_DWORD *)v21 = v23;
          v21 += 4;
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v19);
  }
  else
  {
    v21 = v15;
  }

  uint64_t v32 = v21 - v15;
  if (v21 == v15) {
    v33 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::NormalizedToken>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::NormalizedToken>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::NormalizedToken>> const&)::t;
  }
  else {
    v33 = v15;
  }
  uint64_t v34 = v32 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v32 >> 2, 4uLL);
  if (v15 == v21)
  {
    LODWORD(v34) = 0;
  }
  else
  {
    v35 = v33 - 4;
    uint64_t v36 = v34;
    do
    {
      int v37 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v35[4 * v36]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v37);
      --v36;
    }
    while (v36);
  }
  unsigned int v38 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v34);
  int v39 = [(QSSTextNormalizationResponse *)v53 error_code];
  v40 = [(QSSTextNormalizationResponse *)v53 error_str];
  v41 = v40;
  if (!v40) {
    v40 = &stru_26DEBFAF8;
  }
  v42 = (const char *)[(__CFString *)v40 UTF8String];
  size_t v43 = strlen(v42);
  unsigned int v44 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v42, v43);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v45 = *((_DWORD *)a3 + 8);
  int v46 = *((_DWORD *)a3 + 12);
  int v47 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v51);
  if (v38)
  {
    int v48 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v38);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v48);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v39);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v44);
  v49.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v45 - v46 + v47);
  if (v15) {
    operator delete(v15);
  }
  return v49;
}

- (NSString)error_str
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (int)error_code
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

- (NSArray)tokens
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tokens"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 9u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[8].var0;
      if (v6)
      {
        size_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSNormalizedToken alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"tokens"];
  }
  return (NSArray *)v3;
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSTextNormalizationResponse)initWithFlatbuffData:(id)a3 root:(const TextNormalizationResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v42.receiver = self;
  v42.super_class = (Class)QSSTextNormalizationResponse;
  uint64_t v10 = [(QSSTextNormalizationResponse *)&v42 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_46;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_47;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    unint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const TextNormalizationResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_45;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_47;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v37 = v18;
  unint64_t v38 = v19;
  long long v39 = xmmword_22B64D0E0;
  uint64_t v40 = 0;
  char v41 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_45;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v37, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 4u))
  {
    goto LABEL_47;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    int v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    int v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 6u))
  {
    goto LABEL_47;
  }
  int v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
    unint64_t v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  }
  else {
    unint64_t v26 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 8u))
  {
    goto LABEL_47;
  }
  unint64_t v27 = 0;
  uint64_t v28 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v28) < 9u) {
    goto LABEL_34;
  }
  if (*(_WORD *)((char *)root - v28 + 8))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v37, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v28 + 8)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v28 + 8)), 4uLL, 0))
    {
      unint64_t v27 = 0;
      uint64_t v28 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v28) < 9u) {
        goto LABEL_34;
      }
      goto LABEL_31;
    }
LABEL_47:
    v35 = 0;
    goto LABEL_48;
  }
LABEL_31:
  uint64_t v29 = *(unsigned __int16 *)((char *)root - v28 + 8);
  if (v29) {
    unint64_t v27 = (_DWORD *)((char *)root + v29 + *(unsigned int *)((char *)root + v29));
  }
  else {
    unint64_t v27 = 0;
  }
LABEL_34:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::NormalizedToken>((flatbuffers::Verifier *)&v37, v27))goto LABEL_47; {
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  }
  unsigned int v31 = *v30;
  if (v31 >= 0xB && v30[5] && (v38 < 5 || v38 - 4 < (unint64_t)root + v30[5] - v37)) {
    goto LABEL_47;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 0xCu)) {
    goto LABEL_47;
  }
  uint64_t v32 = v31 >= 0xD && v30[6] ? (const unsigned __int8 *)root + v30[6] + *(unsigned int *)((char *)root + v30[6]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v32)) {
    goto LABEL_47;
  }
LABEL_45:
  uint64_t v33 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v37);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v33;

LABEL_46:
  v35 = v11;
LABEL_48:

  return v35;
}

- (QSSTextNormalizationResponse)initWithFlatbuffData:(id)a3 root:(const TextNormalizationResponse *)a4
{
  return [(QSSTextNormalizationResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextNormalizationResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextNormalizationResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSTextNormalizationResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
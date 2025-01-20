@interface QSSLmScorerResponse
- (NSArray)tokens;
- (NSString)return_str;
- (Offset<siri::speech::schema_fb::LmScorerResponse>)addObjectToBuffer:(void *)a3;
- (QSSLmScorerResponse)initWithFlatbuffData:(id)a3;
- (QSSLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4;
- (QSSLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4 verify:(BOOL)a5;
- (double)ppl;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
@end

@implementation QSSLmScorerResponse

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
  v2.var0 = [(QSSLmScorerResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__35__QSSLmScorerResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::LmScorerResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  int v45 = [(QSSLmScorerResponse *)self return_code];
  uint64_t v5 = [(QSSLmScorerResponse *)self return_str];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  long long v9 = [(QSSLmScorerResponse *)self tokens];
  unint64_t v10 = [v9 count];
  if (v10)
  {
    if (v10 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v10);
    uint64_t v13 = &v11[4 * v12];
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v14 = [(QSSLmScorerResponse *)self tokens];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
  v46 = self;
  if (v15)
  {
    uint64_t v16 = *(void *)v49;
    v17 = v11;
    v47 = v14;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v49 != v16) {
          objc_enumerationMutation(v14);
        }
        v19 = a3;
        int v20 = [*(id *)(*((void *)&v48 + 1) + 8 * i) addObjectToBuffer:a3];
        int v21 = v20;
        if (v17 >= v13)
        {
          uint64_t v22 = (v17 - v11) >> 2;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v13 - v11) >> 1 > v23) {
            unint64_t v23 = (v13 - v11) >> 1;
          }
          if ((unint64_t)(v13 - v11) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v23;
          }
          if (v24) {
            unint64_t v24 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v24);
          }
          else {
            uint64_t v25 = 0;
          }
          v26 = (char *)(v24 + 4 * v22);
          *(_DWORD *)v26 = v21;
          v27 = v26 + 4;
          a3 = v19;
          while (v17 != v11)
          {
            int v28 = *((_DWORD *)v17 - 1);
            v17 -= 4;
            *((_DWORD *)v26 - 1) = v28;
            v26 -= 4;
          }
          uint64_t v13 = (char *)(v24 + 4 * v25);
          if (v11) {
            operator delete(v11);
          }
          uint64_t v11 = v26;
          v17 = v27;
          v14 = v47;
        }
        else
        {
          *(_DWORD *)v17 = v20;
          v17 += 4;
          a3 = v19;
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v15);
  }
  else
  {
    v17 = v11;
  }

  uint64_t v29 = v17 - v11;
  if (v17 == v11) {
    v30 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::LmScorerToken>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::LmScorerToken>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::LmScorerToken>> const&)::t;
  }
  else {
    v30 = v11;
  }
  uint64_t v31 = v29 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v29 >> 2, 4uLL);
  if (v11 == v17)
  {
    LODWORD(v31) = 0;
  }
  else
  {
    v32 = v30 - 4;
    uint64_t v33 = v31;
    do
    {
      int v34 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v32[4 * v33]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v34);
      --v33;
    }
    while (v33);
  }
  unsigned int v35 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v31);
  [(QSSLmScorerResponse *)v46 ppl];
  double v37 = v36;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v38 = *((_DWORD *)a3 + 8);
  int v39 = *((_DWORD *)a3 + 12);
  int v40 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v45);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, String);
  if (v35)
  {
    int v41 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v35);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v41);
  }
  flatbuffers::FlatBufferBuilder::AddElement<double>((flatbuffers::vector_downward *)a3, 10, v37);
  v42.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v38 - v39 + v40);
  if (v11) {
    operator delete(v11);
  }
  return v42;
}

- (double)ppl
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xBu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[10].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (NSArray)tokens
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tokens"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 9u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[8].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        unint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            uint64_t v12 = [[QSSLmScorerToken alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
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

- (NSString)return_str
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

- (int)return_code
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (QSSLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v41.receiver = self;
  v41.super_class = (Class)QSSLmScorerResponse;
  unint64_t v10 = [(QSSLmScorerResponse *)&v41 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_42;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_43;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const LmScorerResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_41;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_43;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v36 = v18;
  unint64_t v37 = v19;
  long long v38 = xmmword_22B64D0E0;
  uint64_t v39 = 0;
  char v40 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_41;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v36, v11->_root->var0)) {
    goto LABEL_43;
  }
  int v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v22 = *v21;
  if (v22 >= 5 && v21[2] && (v37 < 5 || v37 - 4 < (unint64_t)root + v21[2] - v36)) {
    goto LABEL_43;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 6u)) {
    goto LABEL_43;
  }
  unint64_t v23 = v22 >= 7 && v21[3] ? (const unsigned __int8 *)root + v21[3] + *(unsigned int *)((char *)root + v21[3]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v36, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 8u))
  {
    goto LABEL_43;
  }
  uint64_t v24 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v24) < 9u) {
    goto LABEL_37;
  }
  if (*(_WORD *)((char *)root - v24 + 8))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v36, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v24 + 8)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v24 + 8)), 4uLL, 0))
    {
      uint64_t v24 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v24) < 9u) {
        goto LABEL_37;
      }
      uint64_t v25 = -v24;
      goto LABEL_31;
    }
LABEL_43:
    int v34 = 0;
    goto LABEL_44;
  }
  uint64_t v25 = -v24;
LABEL_31:
  uint64_t v26 = *(unsigned __int16 *)((char *)root + v25 + 8);
  if (v26)
  {
    v27 = (_DWORD *)((char *)root + v26 + *(unsigned int *)((char *)root + v26));
    if (*v27)
    {
      unint64_t v28 = 0;
      uint64_t v29 = v27 + 1;
      while (siri::speech::schema_fb::LmScorerToken::Verify((siri::speech::schema_fb::LmScorerToken *)((char *)v29 + *v29), (flatbuffers::Verifier *)&v36))
      {
        ++v28;
        ++v29;
        if (v28 >= *v27)
        {
          LODWORD(v24) = *(_DWORD *)root;
          goto LABEL_37;
        }
      }
      goto LABEL_43;
    }
  }
LABEL_37:
  v30 = (unsigned __int16 *)((char *)root - (int)v24);
  if (*v30 >= 0xBu)
  {
    uint64_t v31 = v30[5];
    if (v31)
    {
      if (v37 < 9 || v37 - 8 < (unint64_t)root + v31 - v36) {
        goto LABEL_43;
      }
    }
  }
LABEL_41:
  uint64_t v32 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v36);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v32;

LABEL_42:
  int v34 = v11;
LABEL_44:

  return v34;
}

- (QSSLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4
{
  return [(QSSLmScorerResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSLmScorerResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSLmScorerResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSLmScorerResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
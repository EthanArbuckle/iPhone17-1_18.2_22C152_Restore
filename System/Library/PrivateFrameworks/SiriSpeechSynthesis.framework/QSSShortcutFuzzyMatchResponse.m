@interface QSSShortcutFuzzyMatchResponse
- (NSArray)shortcut_score_pairs;
- (NSString)utterance;
- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse>)addObjectToBuffer:(void *)a3;
- (QSSShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3;
- (QSSShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchResponse *)a4;
- (QSSShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
@end

@implementation QSSShortcutFuzzyMatchResponse

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
  v2.var0 = [(QSSShortcutFuzzyMatchResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__45__QSSShortcutFuzzyMatchResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSShortcutFuzzyMatchResponse *)self utterance];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  long long v9 = [(QSSShortcutFuzzyMatchResponse *)self shortcut_score_pairs];
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

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v14 = [(QSSShortcutFuzzyMatchResponse *)self shortcut_score_pairs];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v45 objects:v49 count:16];
  v43 = self;
  if (v15)
  {
    uint64_t v16 = *(void *)v46;
    v17 = v11;
    v44 = v14;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v14);
        }
        int v19 = [*(id *)(*((void *)&v45 + 1) + 8 * i) addObjectToBuffer:a3];
        int v20 = v19;
        if (v17 >= v13)
        {
          uint64_t v21 = (v17 - v11) >> 2;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v13 - v11) >> 1 > v22) {
            unint64_t v22 = (v13 - v11) >> 1;
          }
          if ((unint64_t)(v13 - v11) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v23 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v23 = v22;
          }
          if (v23) {
            unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v23);
          }
          else {
            uint64_t v24 = 0;
          }
          v25 = (char *)(v23 + 4 * v21);
          *(_DWORD *)v25 = v20;
          v26 = v25 + 4;
          while (v17 != v11)
          {
            int v27 = *((_DWORD *)v17 - 1);
            v17 -= 4;
            *((_DWORD *)v25 - 1) = v27;
            v25 -= 4;
          }
          uint64_t v13 = (char *)(v23 + 4 * v24);
          if (v11) {
            operator delete(v11);
          }
          uint64_t v11 = v25;
          v17 = v26;
          v14 = v44;
        }
        else
        {
          *(_DWORD *)v17 = v19;
          v17 += 4;
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v15);
  }
  else
  {
    v17 = v11;
  }

  uint64_t v28 = v17 - v11;
  if (v17 == v11) {
    v29 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse_::ShortcutScorePair>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse_::ShortcutScorePair>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse_::ShortcutScorePair>> const&)::t;
  }
  else {
    v29 = v11;
  }
  uint64_t v30 = v28 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v28 >> 2, 4uLL);
  if (v11 == v17)
  {
    LODWORD(v30) = 0;
  }
  else
  {
    v31 = v29 - 4;
    uint64_t v32 = v30;
    do
    {
      int v33 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v31[4 * v32]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v33);
      --v32;
    }
    while (v32);
  }
  unsigned int v34 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v30);
  int v35 = [(QSSShortcutFuzzyMatchResponse *)v43 return_code];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v36 = *((_DWORD *)a3 + 8);
  int v37 = *((_DWORD *)a3 + 12);
  int v38 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  if (v34)
  {
    int v39 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v34);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v39);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v35);
  v40.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v36 - v37 + v38);
  if (v11) {
    operator delete(v11);
  }
  return v40;
}

- (int)return_code
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSArray)shortcut_score_pairs
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"shortcut_score_pairs"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[6].var0;
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
            uint64_t v12 = [[QSSShortcutFuzzyMatchResponse_ShortcutScorePair alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"shortcut_score_pairs"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__63__QSSShortcutFuzzyMatchResponse_ShortcutScorePair_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (NSString)utterance
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

- (QSSShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v41.receiver = self;
  v41.super_class = (Class)QSSShortcutFuzzyMatchResponse;
  unint64_t v10 = [(QSSShortcutFuzzyMatchResponse *)&v41 init];
  uint64_t v11 = v10;
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
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const ShortcutFuzzyMatchResponse *)v13 + *v13;
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
    goto LABEL_37;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v36, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 4u))
  {
    goto LABEL_39;
  }
  uint64_t v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    unint64_t v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    unint64_t v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v36, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 6u))
  {
    goto LABEL_39;
  }
  uint64_t v24 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v24) < 7u) {
    goto LABEL_33;
  }
  if (*(_WORD *)((char *)root - v24 + 6))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v36, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v24 + 6)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v24 + 6)), 4uLL, 0))
    {
      uint64_t v24 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v24) < 7u) {
        goto LABEL_33;
      }
      uint64_t v25 = -v24;
      goto LABEL_27;
    }
LABEL_39:
    unsigned int v34 = 0;
    goto LABEL_40;
  }
  uint64_t v25 = -v24;
LABEL_27:
  uint64_t v26 = *(unsigned __int16 *)((char *)root + v25 + 6);
  if (v26)
  {
    int v27 = (_DWORD *)((char *)root + v26 + *(unsigned int *)((char *)root + v26));
    if (*v27)
    {
      unint64_t v28 = 0;
      v29 = v27 + 1;
      while (siri::speech::schema_fb::RequestStatsResponse_::DoubleStat::Verify((siri::speech::schema_fb::RequestStatsResponse_::DoubleStat *)((char *)v29 + *v29), (flatbuffers::Verifier *)&v36))
      {
        ++v28;
        ++v29;
        if (v28 >= *v27)
        {
          LODWORD(v24) = *(_DWORD *)root;
          goto LABEL_33;
        }
      }
      goto LABEL_39;
    }
  }
LABEL_33:
  uint64_t v30 = (unsigned __int16 *)((char *)root - (int)v24);
  if (*v30 >= 9u)
  {
    uint64_t v31 = v30[4];
    if (v31)
    {
      if (v37 < 5 || v37 - 4 < (unint64_t)root + v31 - v36) {
        goto LABEL_39;
      }
    }
  }
LABEL_37:
  uint64_t v32 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v36);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v32;

LABEL_38:
  unsigned int v34 = v11;
LABEL_40:

  return v34;
}

- (QSSShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchResponse *)a4
{
  return [(QSSShortcutFuzzyMatchResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSShortcutFuzzyMatchResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSShortcutFuzzyMatchResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
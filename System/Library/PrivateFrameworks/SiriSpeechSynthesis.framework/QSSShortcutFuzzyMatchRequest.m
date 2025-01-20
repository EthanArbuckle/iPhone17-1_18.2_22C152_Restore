@interface QSSShortcutFuzzyMatchRequest
- (NSArray)shortcuts;
- (NSString)context;
- (NSString)device_type;
- (NSString)interaction_id;
- (NSString)locale;
- (NSString)request_id;
- (NSString)session_id;
- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest>)addObjectToBuffer:(void *)a3;
- (QSSShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3;
- (QSSShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4;
- (QSSShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4 verify:(BOOL)a5;
- (QSSShortcutFuzzyMatchRequest_StringTokenPair)utterance;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSShortcutFuzzyMatchRequest

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
  v2.var0 = [(QSSShortcutFuzzyMatchRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__44__QSSShortcutFuzzyMatchRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  v4 = [(QSSShortcutFuzzyMatchRequest *)self utterance];
  unsigned int v69 = [v4 addObjectToBuffer:a3];

  uint64_t v5 = [(QSSShortcutFuzzyMatchRequest *)self shortcuts];
  unint64_t v6 = [v5 count];
  long long v7 = a3;
  v71 = self;
  if (v6)
  {
    if (v6 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    long long v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v6);
    uint64_t v10 = &v8[4 * v9];
  }
  else
  {
    long long v8 = 0;
    uint64_t v10 = 0;
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v11 = [(QSSShortcutFuzzyMatchRequest *)self shortcuts];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v73 objects:v77 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v74;
    v14 = v8;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v74 != v13) {
          objc_enumerationMutation(v11);
        }
        int v16 = [*(id *)(*((void *)&v73 + 1) + 8 * i) addObjectToBuffer:v7];
        int v17 = v16;
        if (v14 >= v10)
        {
          uint64_t v18 = (v14 - v8) >> 2;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v10 - v8) >> 1 > v19) {
            unint64_t v19 = (v10 - v8) >> 1;
          }
          if ((unint64_t)(v10 - v8) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v19;
          }
          if (v20) {
            unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v20);
          }
          else {
            uint64_t v21 = 0;
          }
          v22 = (char *)(v20 + 4 * v18);
          *(_DWORD *)v22 = v17;
          v23 = v22 + 4;
          while (v14 != v8)
          {
            int v24 = *((_DWORD *)v14 - 1);
            v14 -= 4;
            *((_DWORD *)v22 - 1) = v24;
            v22 -= 4;
          }
          uint64_t v10 = (char *)(v20 + 4 * v21);
          if (v8) {
            operator delete(v8);
          }
          long long v8 = v22;
          v14 = v23;
          long long v7 = a3;
        }
        else
        {
          *(_DWORD *)v14 = v16;
          v14 += 4;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v73 objects:v77 count:16];
    }
    while (v12);
  }
  else
  {
    v14 = v8;
  }

  v25 = v71;
  uint64_t v26 = v14 - v8;
  if (v14 == v8) {
    v27 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>> const&)::t;
  }
  else {
    v27 = v8;
  }
  uint64_t v28 = v26 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v26 >> 2, 4uLL);
  if (v8 == v14)
  {
    LODWORD(v28) = 0;
  }
  else
  {
    v29 = v27 - 4;
    uint64_t v30 = v28;
    do
    {
      int v31 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v29[4 * v30]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v31);
      --v30;
    }
    while (v30);
    v25 = v71;
  }
  unsigned int v70 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v28);
  v32 = [(QSSShortcutFuzzyMatchRequest *)v25 request_id];
  v33 = v32;
  if (!v32) {
    v32 = &stru_26DEBFAF8;
  }
  v34 = (const char *)[(__CFString *)v32 UTF8String];
  size_t v35 = strlen(v34);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v34, v35);

  v36 = [(QSSShortcutFuzzyMatchRequest *)v25 session_id];
  v37 = v36;
  if (!v36) {
    v36 = &stru_26DEBFAF8;
  }
  v38 = (const char *)[(__CFString *)v36 UTF8String];
  size_t v39 = strlen(v38);
  unsigned int v40 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v38, v39);

  v41 = [(QSSShortcutFuzzyMatchRequest *)v25 interaction_id];
  v42 = v41;
  if (!v41) {
    v41 = &stru_26DEBFAF8;
  }
  v43 = (const char *)[(__CFString *)v41 UTF8String];
  size_t v44 = strlen(v43);
  unsigned int v45 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v43, v44);

  v46 = [(QSSShortcutFuzzyMatchRequest *)v25 locale];
  v47 = v46;
  if (!v46) {
    v46 = &stru_26DEBFAF8;
  }
  v48 = (const char *)[(__CFString *)v46 UTF8String];
  size_t v49 = strlen(v48);
  unsigned int v50 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v48, v49);

  v51 = [(QSSShortcutFuzzyMatchRequest *)v25 device_type];
  v52 = v51;
  if (!v51) {
    v51 = &stru_26DEBFAF8;
  }
  v53 = (const char *)[(__CFString *)v51 UTF8String];
  size_t v54 = strlen(v53);
  unsigned int v55 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v53, v54);

  v56 = [(QSSShortcutFuzzyMatchRequest *)v25 context];
  v57 = v56;
  if (!v56) {
    v56 = &stru_26DEBFAF8;
  }
  v58 = (const char *)[(__CFString *)v56 UTF8String];
  size_t v59 = strlen(v58);
  unsigned int v60 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v58, v59);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v61 = *((_DWORD *)a3 + 8);
  int v62 = *((_DWORD *)a3 + 12);
  int v63 = *((_DWORD *)a3 + 10);
  if (v69)
  {
    int v64 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v69);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v64);
  }
  if (v70)
  {
    int v65 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v70);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v65);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v45);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v50);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v55);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v60);
  v66.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v61 - v62 + v63);
  if (v8) {
    operator delete(v8);
  }
  return v66;
}

- (NSString)context
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    unint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)device_type
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    unint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)locale
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    unint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)interaction_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    unint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    unint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)request_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    unint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)shortcuts
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"shortcuts"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[6].var0;
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
            uint64_t v12 = [[QSSShortcutFuzzyMatchRequest_StringTokenPair alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"shortcuts"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__60__QSSShortcutFuzzyMatchRequest_StringTokenPair_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (QSSShortcutFuzzyMatchRequest_StringTokenPair)utterance
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"utterance"];
  if (!v3)
  {
    uint64_t v4 = [QSSShortcutFuzzyMatchRequest_StringTokenPair alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(QSSShortcutFuzzyMatchRequest_StringTokenPair *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"utterance"];
  }
  return v3;
}

- (QSSShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v55.receiver = self;
  v55.super_class = (Class)QSSShortcutFuzzyMatchRequest;
  uint64_t v10 = [(QSSShortcutFuzzyMatchRequest *)&v55 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_66;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_67;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const ShortcutFuzzyMatchRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_65;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_67;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v50 = v18;
  unint64_t v51 = v19;
  long long v52 = xmmword_22B64D0E0;
  uint64_t v53 = 0;
  LOBYTE(v54) = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_65;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v50, v11->_root->var0)) {
    goto LABEL_67;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 4u)) {
    goto LABEL_67;
  }
  uint64_t v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u)
  {
    uint64_t v22 = v21[2];
    if (v22)
    {
      if (!siri::speech::schema_fb::ContextWithPronHints::Verify((flatbuffers::Table *)((char *)root + v22 + *(unsigned int *)((char *)root + v22)), (flatbuffers::Verifier *)&v50))goto LABEL_67; {
    }
      }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 6u)) {
    goto LABEL_67;
  }
  uint64_t v23 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v23) < 7u) {
    goto LABEL_28;
  }
  if (*(_WORD *)((char *)root - v23 + 6))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v50, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v23 + 6)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v23 + 6)), 4uLL, 0))
    {
      uint64_t v23 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v23) < 7u) {
        goto LABEL_28;
      }
      goto LABEL_23;
    }
LABEL_67:
    v48 = 0;
    goto LABEL_68;
  }
LABEL_23:
  uint64_t v24 = *(unsigned __int16 *)((char *)root - v23 + 6);
  if (v24)
  {
    v25 = (_DWORD *)((char *)root + v24 + *(unsigned int *)((char *)root + v24));
    if (*v25)
    {
      unint64_t v26 = 0;
      v27 = v25 + 1;
      while (siri::speech::schema_fb::ContextWithPronHints::Verify((siri::speech::schema_fb::ContextWithPronHints *)((char *)v27 + *v27), (flatbuffers::Verifier *)&v50))
      {
        ++v26;
        ++v27;
        if (v26 >= *v25) {
          goto LABEL_28;
        }
      }
      goto LABEL_67;
    }
  }
LABEL_28:
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 8u)) {
    goto LABEL_67;
  }
  uint64_t v28 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v28 >= 9u && (uint64_t v29 = v28[4]) != 0) {
    uint64_t v30 = (const unsigned __int8 *)root + v29 + *(unsigned int *)((char *)root + v29);
  }
  else {
    uint64_t v30 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v30)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 0xAu))
  {
    goto LABEL_67;
  }
  int v31 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v31 >= 0xBu && (uint64_t v32 = v31[5]) != 0) {
    v33 = (const unsigned __int8 *)root + v32 + *(unsigned int *)((char *)root + v32);
  }
  else {
    v33 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v33)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 0xCu))
  {
    goto LABEL_67;
  }
  v34 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v34 >= 0xDu && (uint64_t v35 = v34[6]) != 0) {
    v36 = (const unsigned __int8 *)root + v35 + *(unsigned int *)((char *)root + v35);
  }
  else {
    v36 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v36)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 0xEu))
  {
    goto LABEL_67;
  }
  v37 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v37 >= 0xFu && (uint64_t v38 = v37[7]) != 0) {
    size_t v39 = (const unsigned __int8 *)root + v38 + *(unsigned int *)((char *)root + v38);
  }
  else {
    size_t v39 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v39)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 0x10u))
  {
    goto LABEL_67;
  }
  unsigned int v40 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v40 >= 0x11u && (uint64_t v41 = v40[8]) != 0) {
    v42 = (const unsigned __int8 *)root + v41 + *(unsigned int *)((char *)root + v41);
  }
  else {
    v42 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v42)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 0x12u))
  {
    goto LABEL_67;
  }
  v43 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v43 >= 0x13u && (uint64_t v44 = v43[9]) != 0) {
    unsigned int v45 = (const unsigned __int8 *)root + v44 + *(unsigned int *)((char *)root + v44);
  }
  else {
    unsigned int v45 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v45)) {
    goto LABEL_67;
  }
LABEL_65:
  uint64_t v46 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v50, v51, v52, v53, v54);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v46;

LABEL_66:
  v48 = v11;
LABEL_68:

  return v48;
}

- (QSSShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4
{
  return [(QSSShortcutFuzzyMatchRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSShortcutFuzzyMatchRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSShortcutFuzzyMatchRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
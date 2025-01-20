@interface QSSRecoverPronsResponse
- (NSArray)recovery_return_codes;
- (NSArray)voc_tokens;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::RecoverPronsResponse>)addObjectToBuffer:(void *)a3;
- (QSSRecoverPronsResponse)initWithFlatbuffData:(id)a3;
- (QSSRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4;
- (QSSRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)error_code;
@end

@implementation QSSRecoverPronsResponse

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
  v2.var0 = [(QSSRecoverPronsResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__39__QSSRecoverPronsResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::RecoverPronsResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  v4 = [(QSSRecoverPronsResponse *)self speech_id];
  uint64_t v5 = v4;
  v75 = (flatbuffers::FlatBufferBuilder *)a3;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v8 = [(QSSRecoverPronsResponse *)self session_id];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DEBFAF8;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  unsigned int v72 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  int v71 = [(QSSRecoverPronsResponse *)self error_code];
  __int16 v12 = [(QSSRecoverPronsResponse *)self error_str];
  uint64_t v13 = v12;
  if (!v12) {
    __int16 v12 = &stru_26DEBFAF8;
  }
  v14 = (const char *)[(__CFString *)v12 UTF8String];
  size_t v15 = strlen(v14);
  unsigned int v16 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  memset(&v84, 0, sizeof(v84));
  v17 = [(QSSRecoverPronsResponse *)self recovery_return_codes];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v84, [v17 count]);

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v18 = [(QSSRecoverPronsResponse *)self recovery_return_codes];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v80 objects:v86 count:16];
  unsigned int v70 = v16;
  begin = v84.__begin_;
  if (v19)
  {
    uint64_t v21 = *(void *)v81;
    value = v84.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v81 != v21) {
          objc_enumerationMutation(v18);
        }
        int v24 = [*(id *)(*((void *)&v80 + 1) + 8 * i) intValue];
        int v25 = v24;
        std::vector<int>::pointer end = v84.__end_;
        if (v84.__end_ >= value)
        {
          uint64_t v28 = v84.__end_ - begin;
          unint64_t v29 = v28 + 1;
          if ((unint64_t)(v28 + 1) >> 62)
          {
            v84.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v29) {
            unint64_t v29 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v30 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v30 = v29;
          }
          if (v30) {
            unint64_t v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v30);
          }
          else {
            uint64_t v31 = 0;
          }
          v32 = (int *)(v30 + 4 * v28);
          int *v32 = v25;
          v27 = v32 + 1;
          while (end != begin)
          {
            int v33 = *--end;
            *--v32 = v33;
          }
          value = (int *)(v30 + 4 * v31);
          v84.__end_ = v27;
          if (begin) {
            operator delete(begin);
          }
          begin = v32;
        }
        else
        {
          *v84.__end_ = v24;
          v27 = end + 1;
        }
        v84.__end_ = v27;
      }
      v84.__end_cap_.__value_ = value;
      v84.__begin_ = begin;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v80 objects:v86 count:16];
    }
    while (v19);
  }
  else
  {
    v27 = v84.__end_;
  }

  unint64_t v34 = (unint64_t)v75;
  if (v27 == begin) {
    v35 = (int *)&flatbuffers::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  }
  else {
    v35 = begin;
  }
  unsigned int v36 = flatbuffers::FlatBufferBuilder::CreateVector<int>(v75, v35, v27 - begin);
  v37 = [(QSSRecoverPronsResponse *)self voc_tokens];
  unint64_t v38 = [v37 count];
  unsigned int v69 = v36;
  if (v38)
  {
    if (v38 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v38);
    v41 = &v39[4 * v40];
  }
  else
  {
    v39 = 0;
    v41 = 0;
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v42 = [(QSSRecoverPronsResponse *)self voc_tokens];
  uint64_t v43 = [v42 countByEnumeratingWithState:&v76 objects:v85 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v77;
    v45 = v39;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v77 != v44) {
          objc_enumerationMutation(v42);
        }
        int v47 = [*(id *)(*((void *)&v76 + 1) + 8 * j) addObjectToBuffer:v34];
        int v48 = v47;
        if (v45 >= v41)
        {
          uint64_t v49 = (v45 - v39) >> 2;
          unint64_t v50 = v49 + 1;
          if ((unint64_t)(v49 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v41 - v39) >> 1 > v50) {
            unint64_t v50 = (v41 - v39) >> 1;
          }
          if ((unint64_t)(v41 - v39) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v51 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v51 = v50;
          }
          if (v51) {
            unint64_t v51 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v51);
          }
          else {
            uint64_t v52 = 0;
          }
          v53 = (char *)(v51 + 4 * v49);
          *(_DWORD *)v53 = v48;
          v54 = v53 + 4;
          while (v45 != v39)
          {
            int v55 = *((_DWORD *)v45 - 1);
            v45 -= 4;
            *((_DWORD *)v53 - 1) = v55;
            v53 -= 4;
          }
          v41 = (char *)(v51 + 4 * v52);
          if (v39) {
            operator delete(v39);
          }
          v39 = v53;
          v45 = v54;
          unint64_t v34 = (unint64_t)v75;
        }
        else
        {
          *(_DWORD *)v45 = v47;
          v45 += 4;
        }
      }
      uint64_t v43 = [v42 countByEnumeratingWithState:&v76 objects:v85 count:16];
    }
    while (v43);
  }
  else
  {
    v45 = v39;
  }

  uint64_t v56 = v45 - v39;
  if (v45 == v39) {
    v57 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::VocToken>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::VocToken>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::VocToken>> const&)::t;
  }
  else {
    v57 = v39;
  }
  uint64_t v58 = v56 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)v34, v56 >> 2, 4uLL);
  if (v39 == v45)
  {
    LODWORD(v58) = 0;
  }
  else
  {
    v59 = v57 - 4;
    uint64_t v60 = v58;
    do
    {
      int v61 = flatbuffers::FlatBufferBuilder::ReferTo(v75, *(_DWORD *)&v59[4 * v60]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v75, v61);
      --v60;
    }
    while (v60);
    unint64_t v34 = (unint64_t)v75;
  }
  unsigned int v62 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)v34, v58);
  flatbuffers::FlatBufferBuilder::NotNested(v34);
  *(unsigned char *)(v34 + 70) = 1;
  int v63 = *(_DWORD *)(v34 + 32);
  int v64 = *(_DWORD *)(v34 + 48);
  int v65 = *(_DWORD *)(v34 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v34, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v34, 6, v72);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v34, 8, v71);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v34, 10, v70);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v34, 12, v69);
  if (v62)
  {
    int v66 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v34, v62);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v34, 14, v66);
  }
  v67.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v34, v63 - v64 + v65);
  if (v39) {
    operator delete(v39);
  }
  if (v84.__begin_) {
    operator delete(v84.__begin_);
  }
  return v67;
}

- (NSArray)voc_tokens
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"voc_tokens"];
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
        size_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSVocToken alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"voc_tokens"];
  }
  return (NSArray *)v3;
}

- (NSArray)recovery_return_codes
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"recovery_return_codes"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xDu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[12].var0;
      if (v6)
      {
        size_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        var0 = (unsigned int *)v7[v8 + 4].var0;
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [NSNumber numberWithInt:*var0];
            [v3 addObject:v12];

            ++var0;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"recovery_return_codes"];
  }
  return (NSArray *)v3;
}

- (NSString)error_str
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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

- (int)error_code
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
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

- (QSSRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v44.receiver = self;
  v44.super_class = (Class)QSSRecoverPronsResponse;
  uint64_t v10 = [(QSSRecoverPronsResponse *)&v44 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_51;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_52;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const RecoverPronsResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_50;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_52;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v39 = v18;
  unint64_t v40 = v19;
  long long v41 = xmmword_22B64D0E0;
  uint64_t v42 = 0;
  char v43 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_50;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v39, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 4u))
  {
    goto LABEL_52;
  }
  uint64_t v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 6u))
  {
    goto LABEL_52;
  }
  int v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  }
  else {
    v26 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v26)) {
    goto LABEL_52;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v28 = *v27;
  if (v28 >= 9 && v27[4] && (v40 < 5 || v40 - 4 < (unint64_t)root + v27[4] - v39)) {
    goto LABEL_52;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xAu)) {
    goto LABEL_52;
  }
  unint64_t v29 = v28 >= 0xB && v27[5] ? (const unsigned __int8 *)root + v27[5] + *(unsigned int *)((char *)root + v27[5]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v29)) {
    goto LABEL_52;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xCu)) {
    goto LABEL_52;
  }
  unint64_t v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v30 >= 0xDu)
  {
    uint64_t v31 = v30[6];
    if (v31)
    {
      if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v39, (const unsigned __int8 *)root + v31 + *(unsigned int *)((char *)root + v31), 4uLL, 0))goto LABEL_52; {
    }
      }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xEu)) {
    goto LABEL_52;
  }
  v32 = 0;
  uint64_t v33 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v33) < 0xFu) {
    goto LABEL_49;
  }
  if (*(_WORD *)((char *)root - v33 + 14))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v39, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v33 + 14)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v33 + 14)), 4uLL, 0))
    {
      v32 = 0;
      uint64_t v33 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v33) < 0xFu) {
        goto LABEL_49;
      }
      goto LABEL_45;
    }
LABEL_52:
    v37 = 0;
    goto LABEL_53;
  }
LABEL_45:
  uint64_t v34 = *(unsigned __int16 *)((char *)root - v33 + 14);
  if (v34) {
    v32 = (_DWORD *)((char *)root + v34 + *(unsigned int *)((char *)root + v34));
  }
  else {
    v32 = 0;
  }
LABEL_49:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::VocToken>((flatbuffers::Verifier *)&v39, v32))goto LABEL_52; {
LABEL_50:
  }
  uint64_t v35 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v39);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v35;

LABEL_51:
  v37 = v11;
LABEL_53:

  return v37;
}

- (QSSRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4
{
  return [(QSSRecoverPronsResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSRecoverPronsResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSRecoverPronsResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSRecoverPronsResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
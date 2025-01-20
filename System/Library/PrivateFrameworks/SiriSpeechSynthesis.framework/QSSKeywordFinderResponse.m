@interface QSSKeywordFinderResponse
- (NSArray)n_best_list;
- (NSString)language;
- (NSString)return_str;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::KeywordFinderResponse>)addObjectToBuffer:(void *)a3;
- (QSSKeywordFinderResponse)initWithFlatbuffData:(id)a3;
- (QSSKeywordFinderResponse)initWithFlatbuffData:(id)a3 root:(const KeywordFinderResponse *)a4;
- (QSSKeywordFinderResponse)initWithFlatbuffData:(id)a3 root:(const KeywordFinderResponse *)a4 verify:(BOOL)a5;
- (QSSRecognitionSausage)corrected_sausage;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
@end

@implementation QSSKeywordFinderResponse

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
  v2.var0 = [(QSSKeywordFinderResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__40__QSSKeywordFinderResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::KeywordFinderResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  v4 = [(QSSKeywordFinderResponse *)self speech_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v9 = [(QSSKeywordFinderResponse *)self session_id];
  uint64_t v10 = v9;
  if (!v9) {
    long long v9 = &stru_26DEBFAF8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  unsigned int v13 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  v14 = [(QSSKeywordFinderResponse *)self language];
  v15 = v14;
  if (!v14) {
    v14 = &stru_26DEBFAF8;
  }
  v16 = (const char *)[(__CFString *)v14 UTF8String];
  size_t v17 = strlen(v16);
  unsigned int v53 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v16, v17);

  int v52 = [(QSSKeywordFinderResponse *)self return_code];
  v18 = [(QSSKeywordFinderResponse *)self return_str];
  v19 = v18;
  if (!v18) {
    v18 = &stru_26DEBFAF8;
  }
  v20 = (const char *)[(__CFString *)v18 UTF8String];
  size_t v21 = strlen(v20);
  unsigned int v51 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v20, v21);

  v22 = [(QSSKeywordFinderResponse *)self corrected_sausage];
  unsigned int v23 = [v22 addObjectToBuffer:a3];

  memset(&v59, 0, sizeof(v59));
  v24 = [(QSSKeywordFinderResponse *)self n_best_list];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v59, [v24 count]);

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v25 = [(QSSKeywordFinderResponse *)self n_best_list];
  v26 = a3;
  uint64_t v27 = [v25 countByEnumeratingWithState:&v55 objects:v60 count:16];
  unint64_t v49 = __PAIR64__(v13, v23);
  unsigned int v50 = String;
  begin = v59.__begin_;
  if (v27)
  {
    uint64_t v29 = *(void *)v56;
    value = v59.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v56 != v29) {
          objc_enumerationMutation(v25);
        }
        int v32 = objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * i), "addObjectToBuffer:", v26, v49);
        int v33 = v32;
        std::vector<int>::pointer end = v59.__end_;
        if (v59.__end_ >= value)
        {
          uint64_t v36 = v59.__end_ - begin;
          unint64_t v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62)
          {
            v59.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v37) {
            unint64_t v37 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v38 = v37;
          }
          if (v38) {
            unint64_t v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v38);
          }
          else {
            uint64_t v39 = 0;
          }
          v40 = (int *)(v38 + 4 * v36);
          int *v40 = v33;
          v35 = v40 + 1;
          while (end != begin)
          {
            int v41 = *--end;
            *--v40 = v41;
          }
          value = (int *)(v38 + 4 * v39);
          v59.__end_ = v35;
          if (begin) {
            operator delete(begin);
          }
          begin = v40;
          v26 = a3;
        }
        else
        {
          *v59.__end_ = v32;
          v35 = end + 1;
        }
        v59.__end_ = v35;
      }
      v59.__end_cap_.__value_ = value;
      v59.__begin_ = begin;
      uint64_t v27 = [v25 countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v27);
  }
  else
  {
    v35 = v59.__end_;
  }

  if (v35 == begin) {
    v42 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  }
  else {
    v42 = begin;
  }
  unsigned int v43 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v42, v35 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v44 = *((_DWORD *)a3 + 8);
  int v45 = *((_DWORD *)a3 + 12);
  int v46 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v50);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, HIDWORD(v49));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v53);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v52);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v51);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v43);
  v47.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v44 - v45 + v46);
  if (begin)
  {
    v59.__end_ = begin;
    operator delete(begin);
  }
  return v47;
}

- (NSArray)n_best_list
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_list"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x11u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[16].var0;
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
            size_t v12 = [[QSSRecognitionChoice alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"n_best_list"];
  }
  return (NSArray *)v3;
}

- (QSSRecognitionSausage)corrected_sausage
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"corrected_sausage"];
  if (!v3)
  {
    v4 = [QSSRecognitionSausage alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (uint64_t v7 = *(unsigned __int16 *)v6[14].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    v3 = [(QSSRecognitionSausage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"corrected_sausage"];
  }
  return v3;
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
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
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSKeywordFinderResponse)initWithFlatbuffData:(id)a3 root:(const KeywordFinderResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v47.receiver = self;
  v47.super_class = (Class)QSSKeywordFinderResponse;
  uint64_t v10 = [(QSSKeywordFinderResponse *)&v47 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_57;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_58;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    unsigned int v13 = (unsigned int *)[*p_data bytes];
    a4 = (const KeywordFinderResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_56;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_58;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v42 = v18;
  unint64_t v43 = v19;
  long long v44 = xmmword_22B64D0E0;
  uint64_t v45 = 0;
  char v46 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_56;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v42, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 4u))
  {
    goto LABEL_58;
  }
  size_t v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    unsigned int v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    unsigned int v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 6u))
  {
    goto LABEL_58;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  }
  else {
    v26 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 8u))
  {
    goto LABEL_58;
  }
  uint64_t v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (uint64_t v28 = v27[4]) != 0) {
    uint64_t v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  }
  else {
    uint64_t v29 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v29)) {
    goto LABEL_58;
  }
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v31 = *v30;
  if (v31 >= 0xB && v30[5] && (v43 < 5 || v43 - 4 < (unint64_t)root + v30[5] - v42)) {
    goto LABEL_58;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0xCu)) {
    goto LABEL_58;
  }
  int v32 = v31 >= 0xD && v30[6] ? (const unsigned __int8 *)root + v30[6] + *(unsigned int *)((char *)root + v30[6]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v32)) {
    goto LABEL_58;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0xEu)) {
    goto LABEL_58;
  }
  int v33 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v33 >= 0xFu)
  {
    uint64_t v34 = v33[7];
    if (v34)
    {
      if (!siri::speech::schema_fb::RecognitionSausage::Verify((flatbuffers::Table *)((char *)root + v34 + *(unsigned int *)((char *)root + v34)), (flatbuffers::Verifier *)&v42))goto LABEL_58; {
    }
      }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0x10u)) {
    goto LABEL_58;
  }
  v35 = 0;
  uint64_t v36 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v36) < 0x11u) {
    goto LABEL_55;
  }
  if (*(_WORD *)((char *)root - v36 + 16))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v42, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v36 + 16)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v36 + 16)), 4uLL, 0))
    {
      v35 = 0;
      uint64_t v36 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v36) < 0x11u) {
        goto LABEL_55;
      }
      goto LABEL_51;
    }
LABEL_58:
    v40 = 0;
    goto LABEL_59;
  }
LABEL_51:
  uint64_t v37 = *(unsigned __int16 *)((char *)root - v36 + 16);
  if (v37) {
    v35 = (_DWORD *)((char *)root + v37 + *(unsigned int *)((char *)root + v37));
  }
  else {
    v35 = 0;
  }
LABEL_55:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionChoice>((flatbuffers::Verifier *)&v42, v35))goto LABEL_58; {
LABEL_56:
  }
  uint64_t v38 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v42);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v38;

LABEL_57:
  v40 = v11;
LABEL_59:

  return v40;
}

- (QSSKeywordFinderResponse)initWithFlatbuffData:(id)a3 root:(const KeywordFinderResponse *)a4
{
  return [(QSSKeywordFinderResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSKeywordFinderResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSKeywordFinderResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSKeywordFinderResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
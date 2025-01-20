@interface QSSItnResponse
- (NSArray)formatted_words_list;
- (NSString)language;
- (NSString)return_str;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::ItnResponse>)addObjectToBuffer:(void *)a3;
- (QSSItnResponse)initWithFlatbuffData:(id)a3;
- (QSSItnResponse)initWithFlatbuffData:(id)a3 root:(const ItnResponse *)a4;
- (QSSItnResponse)initWithFlatbuffData:(id)a3 root:(const ItnResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
@end

@implementation QSSItnResponse

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
  v2.var0 = [(QSSItnResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__30__QSSItnResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::ItnResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v4 = [(QSSItnResponse *)self speech_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v8 = [(QSSItnResponse *)self session_id];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DEBFAF8;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  unsigned int v49 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  __int16 v12 = [(QSSItnResponse *)self language];
  uint64_t v13 = v12;
  if (!v12) {
    __int16 v12 = &stru_26DEBFAF8;
  }
  v14 = (const char *)[(__CFString *)v12 UTF8String];
  size_t v15 = strlen(v14);
  unsigned int v48 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  int v47 = [(QSSItnResponse *)self return_code];
  v16 = [(QSSItnResponse *)self return_str];
  v17 = v16;
  if (!v16) {
    v16 = &stru_26DEBFAF8;
  }
  v18 = (const char *)[(__CFString *)v16 UTF8String];
  size_t v19 = strlen(v18);
  unsigned int v20 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  memset(&v56, 0, sizeof(v56));
  v21 = [(QSSItnResponse *)self formatted_words_list];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v56, [v21 count]);

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v22 = [(QSSItnResponse *)self formatted_words_list];
  v23 = a3;
  uint64_t v24 = [v22 countByEnumeratingWithState:&v52 objects:v57 count:16];
  unsigned int v46 = v20;
  begin = v56.__begin_;
  if (v24)
  {
    uint64_t v26 = *(void *)v53;
    value = v56.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v53 != v26) {
          objc_enumerationMutation(v22);
        }
        int v29 = [*(id *)(*((void *)&v52 + 1) + 8 * i) addObjectToBuffer:v23];
        int v30 = v29;
        std::vector<int>::pointer end = v56.__end_;
        if (v56.__end_ >= value)
        {
          uint64_t v33 = v56.__end_ - begin;
          unint64_t v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62)
          {
            v56.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v34) {
            unint64_t v34 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v35 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v35 = v34;
          }
          if (v35) {
            unint64_t v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v35);
          }
          else {
            uint64_t v36 = 0;
          }
          v37 = (int *)(v35 + 4 * v33);
          int *v37 = v30;
          v32 = v37 + 1;
          while (end != begin)
          {
            int v38 = *--end;
            *--v37 = v38;
          }
          value = (int *)(v35 + 4 * v36);
          v56.__end_ = v32;
          if (begin) {
            operator delete(begin);
          }
          begin = v37;
          v23 = a3;
        }
        else
        {
          *v56.__end_ = v29;
          v32 = end + 1;
        }
        v56.__end_ = v32;
      }
      v56.__end_cap_.__value_ = value;
      v56.__begin_ = begin;
      uint64_t v24 = [v22 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v24);
  }
  else
  {
    v32 = v56.__end_;
  }

  if (v32 == begin) {
    v39 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>> const&)::t;
  }
  else {
    v39 = begin;
  }
  unsigned int v40 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v39, v32 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v41 = *((_DWORD *)a3 + 8);
  int v42 = *((_DWORD *)a3 + 12);
  int v43 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v48);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v47);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v46);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v40);
  v44.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v41 - v42 + v43);
  if (begin)
  {
    v56.__end_ = begin;
    operator delete(begin);
  }
  return v44;
}

- (NSArray)formatted_words_list
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"formatted_words_list"];
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
            __int16 v12 = [[QSSRecognitionPhraseTokens alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"formatted_words_list"];
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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

- (QSSItnResponse)initWithFlatbuffData:(id)a3 root:(const ItnResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v45.receiver = self;
  v45.super_class = (Class)QSSItnResponse;
  uint64_t v10 = [(QSSItnResponse *)&v45 init];
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
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const ItnResponse *)v13 + *v13;
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
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 6u))
  {
    goto LABEL_54;
  }
  uint64_t v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
    uint64_t v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  }
  else {
    uint64_t v26 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 8u))
  {
    goto LABEL_54;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (uint64_t v28 = v27[4]) != 0) {
    int v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  }
  else {
    int v29 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v29)) {
    goto LABEL_54;
  }
  int v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v31 = *v30;
  if (v31 >= 0xB && v30[5] && (v41 < 5 || v41 - 4 < (unint64_t)root + v30[5] - v40)) {
    goto LABEL_54;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 0xCu)) {
    goto LABEL_54;
  }
  v32 = v31 >= 0xD && v30[6] ? (const unsigned __int8 *)root + v30[6] + *(unsigned int *)((char *)root + v30[6]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v32)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 0xEu))
  {
    goto LABEL_54;
  }
  uint64_t v33 = 0;
  uint64_t v34 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v34) < 0xFu) {
    goto LABEL_51;
  }
  if (*(_WORD *)((char *)root - v34 + 14))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v40, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v34 + 14)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v34 + 14)), 4uLL, 0))
    {
      uint64_t v33 = 0;
      uint64_t v34 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v34) < 0xFu) {
        goto LABEL_51;
      }
      goto LABEL_47;
    }
LABEL_54:
    int v38 = 0;
    goto LABEL_55;
  }
LABEL_47:
  uint64_t v35 = *(unsigned __int16 *)((char *)root - v34 + 14);
  if (v35) {
    uint64_t v33 = (_DWORD *)((char *)root + v35 + *(unsigned int *)((char *)root + v35));
  }
  else {
    uint64_t v33 = 0;
  }
LABEL_51:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionPhraseTokens>((flatbuffers::Verifier *)&v40, v33))goto LABEL_54; {
LABEL_52:
  }
  uint64_t v36 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v40);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v36;

LABEL_53:
  int v38 = v11;
LABEL_55:

  return v38;
}

- (QSSItnResponse)initWithFlatbuffData:(id)a3 root:(const ItnResponse *)a4
{
  return [(QSSItnResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSItnResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSItnResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSItnResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
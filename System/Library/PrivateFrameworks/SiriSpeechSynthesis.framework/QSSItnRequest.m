@interface QSSItnRequest
- (NSArray)words_list;
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::ItnRequest>)addObjectToBuffer:(void *)a3;
- (QSSItnRequest)initWithFlatbuffData:(id)a3;
- (QSSItnRequest)initWithFlatbuffData:(id)a3 root:(const ItnRequest *)a4;
- (QSSItnRequest)initWithFlatbuffData:(id)a3 root:(const ItnRequest *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSItnRequest

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
  v2.var0 = [(QSSItnRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__29__QSSItnRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::ItnRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSItnRequest *)self speech_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(QSSItnRequest *)self session_id];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_26DEBFAF8;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  unsigned int v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v15 = [(QSSItnRequest *)self language];
  v16 = v15;
  if (!v15) {
    v15 = &stru_26DEBFAF8;
  }
  v17 = (const char *)[(__CFString *)v15 UTF8String];
  size_t v18 = strlen(v17);
  LODWORD(v17) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  memset(&v50, 0, sizeof(v50));
  v19 = [(QSSItnRequest *)self words_list];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v50, [v19 count]);

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = [(QSSItnRequest *)self words_list];
  uint64_t v20 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  unsigned int v42 = v17;
  unsigned int v43 = v14;
  unsigned int v44 = String;
  begin = v50.__begin_;
  if (v20)
  {
    uint64_t v22 = *(void *)v47;
    value = v50.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(obj);
        }
        int v25 = [*(id *)(*((void *)&v46 + 1) + 8 * i) addObjectToBuffer:a3];
        int v26 = v25;
        std::vector<int>::pointer end = v50.__end_;
        if (v50.__end_ >= value)
        {
          uint64_t v29 = v50.__end_ - begin;
          unint64_t v30 = v29 + 1;
          if ((unint64_t)(v29 + 1) >> 62)
          {
            v50.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v30) {
            unint64_t v30 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v31 = v30;
          }
          if (v31) {
            unint64_t v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v31);
          }
          else {
            uint64_t v32 = 0;
          }
          v33 = (int *)(v31 + 4 * v29);
          int *v33 = v26;
          v28 = v33 + 1;
          while (end != begin)
          {
            int v34 = *--end;
            *--v33 = v34;
          }
          value = (int *)(v31 + 4 * v32);
          v50.__end_ = v28;
          if (begin) {
            operator delete(begin);
          }
          begin = v33;
        }
        else
        {
          *v50.__end_ = v25;
          v28 = end + 1;
        }
        v50.__end_ = v28;
      }
      v50.__end_cap_.__value_ = value;
      v50.__begin_ = begin;
      uint64_t v20 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v20);
  }
  else
  {
    v28 = v50.__end_;
  }

  if (v28 == begin) {
    v35 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>> const&)::t;
  }
  else {
    v35 = begin;
  }
  unsigned int v36 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v35, v28 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v37 = *((_DWORD *)a3 + 8);
  int v38 = *((_DWORD *)a3 + 12);
  int v39 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v44);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v43);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v42);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v36);
  v40.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v37 - v38 + v39);
  if (begin)
  {
    v50.__end_ = begin;
    operator delete(begin);
  }
  return v40;
}

- (NSArray)words_list
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"words_list"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xBu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[10].var0;
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
            __int16 v12 = [[QSSRecognitionPhraseTokens alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"words_list"];
  }
  return (NSArray *)v3;
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

- (QSSItnRequest)initWithFlatbuffData:(id)a3 root:(const ItnRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v42.receiver = self;
  v42.super_class = (Class)QSSItnRequest;
  uint64_t v10 = [(QSSItnRequest *)&v42 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_43;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_44;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    size_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const ItnRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_42;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_44;
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
  if (!root) {
    goto LABEL_42;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v37, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 4u))
  {
    goto LABEL_44;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 6u))
  {
    goto LABEL_44;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
    int v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  }
  else {
    int v26 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 8u))
  {
    goto LABEL_44;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (uint64_t v28 = v27[4]) != 0) {
    uint64_t v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  }
  else {
    uint64_t v29 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v29)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 0xAu))
  {
    goto LABEL_44;
  }
  unint64_t v30 = 0;
  uint64_t v31 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v31) < 0xBu) {
    goto LABEL_41;
  }
  if (*(_WORD *)((char *)root - v31 + 10))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v37, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v31 + 10)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v31 + 10)), 4uLL, 0))
    {
      unint64_t v30 = 0;
      uint64_t v31 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v31) < 0xBu) {
        goto LABEL_41;
      }
      goto LABEL_37;
    }
LABEL_44:
    v35 = 0;
    goto LABEL_45;
  }
LABEL_37:
  uint64_t v32 = *(unsigned __int16 *)((char *)root - v31 + 10);
  if (v32) {
    unint64_t v30 = (_DWORD *)((char *)root + v32 + *(unsigned int *)((char *)root + v32));
  }
  else {
    unint64_t v30 = 0;
  }
LABEL_41:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionPhraseTokens>((flatbuffers::Verifier *)&v37, v30))goto LABEL_44; {
LABEL_42:
  }
  uint64_t v33 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v37, v38, v39, v40, v41);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v33;

LABEL_43:
  v35 = v11;
LABEL_45:

  return v35;
}

- (QSSItnRequest)initWithFlatbuffData:(id)a3 root:(const ItnRequest *)a4
{
  return [(QSSItnRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSItnRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSItnRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSItnRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
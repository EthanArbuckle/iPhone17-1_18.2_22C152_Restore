@interface QSSPostItnHammerRequest
- (NSArray)tokens;
- (NSString)language;
- (NSString)post_itn_string;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::PostItnHammerRequest>)addObjectToBuffer:(void *)a3;
- (QSSPostItnHammerRequest)initWithFlatbuffData:(id)a3;
- (QSSPostItnHammerRequest)initWithFlatbuffData:(id)a3 root:(const PostItnHammerRequest *)a4;
- (QSSPostItnHammerRequest)initWithFlatbuffData:(id)a3 root:(const PostItnHammerRequest *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSPostItnHammerRequest

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
  v2.var0 = [(QSSPostItnHammerRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__39__QSSPostItnHammerRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::PostItnHammerRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v4 = [(QSSPostItnHammerRequest *)self speech_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v9 = [(QSSPostItnHammerRequest *)self session_id];
  uint64_t v10 = v9;
  if (!v9) {
    long long v9 = &stru_26DEBFAF8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  unsigned int v13 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  v14 = [(QSSPostItnHammerRequest *)self language];
  v15 = v14;
  if (!v14) {
    v14 = &stru_26DEBFAF8;
  }
  v16 = (const char *)[(__CFString *)v14 UTF8String];
  size_t v17 = strlen(v16);
  unsigned int v18 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v16, v17);

  v19 = [(QSSPostItnHammerRequest *)self post_itn_string];
  v20 = v19;
  if (!v19) {
    v19 = &stru_26DEBFAF8;
  }
  v21 = (const char *)[(__CFString *)v19 UTF8String];
  size_t v22 = strlen(v21);
  unsigned int v23 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v21, v22);

  memset(&v58, 0, sizeof(v58));
  v24 = [(QSSPostItnHammerRequest *)self tokens];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v58, [v24 count]);

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v25 = [(QSSPostItnHammerRequest *)self tokens];
  v26 = a3;
  uint64_t v27 = [v25 countByEnumeratingWithState:&v54 objects:v59 count:16];
  unsigned int v49 = v23;
  unsigned int v50 = v18;
  unsigned int v51 = v13;
  unsigned int v52 = String;
  begin = v58.__begin_;
  if (v27)
  {
    uint64_t v29 = *(void *)v55;
    value = v58.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v55 != v29) {
          objc_enumerationMutation(v25);
        }
        int v32 = [*(id *)(*((void *)&v54 + 1) + 8 * i) addObjectToBuffer:v26];
        int v33 = v32;
        std::vector<int>::pointer end = v58.__end_;
        if (v58.__end_ >= value)
        {
          uint64_t v36 = v58.__end_ - begin;
          unint64_t v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62)
          {
            v58.__begin_ = begin;
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
          v58.__end_ = v35;
          if (begin) {
            operator delete(begin);
          }
          begin = v40;
          v26 = a3;
        }
        else
        {
          *v58.__end_ = v32;
          v35 = end + 1;
        }
        v58.__end_ = v35;
      }
      v58.__end_cap_.__value_ = value;
      v58.__begin_ = begin;
      uint64_t v27 = [v25 countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v27);
  }
  else
  {
    v35 = v58.__end_;
  }

  if (v35 == begin) {
    v42 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>> const&)::t;
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
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v52);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v51);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v50);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v43);
  v47.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v44 - v45 + v46);
  if (begin)
  {
    v58.__end_ = begin;
    operator delete(begin);
  }
  return v47;
}

- (NSArray)tokens
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tokens"];
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
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            size_t v12 = [[QSSRecognitionToken alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
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

- (NSString)post_itn_string
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

- (QSSPostItnHammerRequest)initWithFlatbuffData:(id)a3 root:(const PostItnHammerRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v45.receiver = self;
  v45.super_class = (Class)QSSPostItnHammerRequest;
  uint64_t v10 = [(QSSPostItnHammerRequest *)&v45 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_49;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_50;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    unsigned int v13 = (unsigned int *)[*p_data bytes];
    a4 = (const PostItnHammerRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_48;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_50;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v40 = v18;
  unint64_t v41 = v19;
  long long v42 = xmmword_22B64D0E0;
  uint64_t v43 = 0;
  LOBYTE(v44) = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_48;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v40, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 4u))
  {
    goto LABEL_50;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    unsigned int v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    unsigned int v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 6u))
  {
    goto LABEL_50;
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
    goto LABEL_50;
  }
  uint64_t v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (uint64_t v28 = v27[4]) != 0) {
    uint64_t v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  }
  else {
    uint64_t v29 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v29)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 0xAu))
  {
    goto LABEL_50;
  }
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v30 >= 0xBu && (uint64_t v31 = v30[5]) != 0) {
    int v32 = (const unsigned __int8 *)root + v31 + *(unsigned int *)((char *)root + v31);
  }
  else {
    int v32 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v32)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 0xCu))
  {
    goto LABEL_50;
  }
  int v33 = 0;
  uint64_t v34 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v34) < 0xDu) {
    goto LABEL_47;
  }
  if (*(_WORD *)((char *)root - v34 + 12))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v40, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v34 + 12)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v34 + 12)), 4uLL, 0))
    {
      int v33 = 0;
      uint64_t v34 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v34) < 0xDu) {
        goto LABEL_47;
      }
      goto LABEL_43;
    }
LABEL_50:
    unint64_t v38 = 0;
    goto LABEL_51;
  }
LABEL_43:
  uint64_t v35 = *(unsigned __int16 *)((char *)root - v34 + 12);
  if (v35) {
    int v33 = (_DWORD *)((char *)root + v35 + *(unsigned int *)((char *)root + v35));
  }
  else {
    int v33 = 0;
  }
LABEL_47:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionToken>((flatbuffers::Verifier *)&v40, v33))goto LABEL_50; {
LABEL_48:
  }
  uint64_t v36 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v40, v41, v42, v43, v44);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v36;

LABEL_49:
  unint64_t v38 = v11;
LABEL_51:

  return v38;
}

- (QSSPostItnHammerRequest)initWithFlatbuffData:(id)a3 root:(const PostItnHammerRequest *)a4
{
  return [(QSSPostItnHammerRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSPostItnHammerRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSPostItnHammerRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSPostItnHammerRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
@interface QSSServiceDiscoveryResponse
- (NSArray)zk_node;
- (NSString)error_str;
- (NSString)session_id;
- (Offset<siri::speech::schema_fb::ServiceDiscoveryResponse>)addObjectToBuffer:(void *)a3;
- (QSSServiceDiscoveryResponse)initWithFlatbuffData:(id)a3;
- (QSSServiceDiscoveryResponse)initWithFlatbuffData:(id)a3 root:(const ServiceDiscoveryResponse *)a4;
- (QSSServiceDiscoveryResponse)initWithFlatbuffData:(id)a3 root:(const ServiceDiscoveryResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)error_code;
@end

@implementation QSSServiceDiscoveryResponse

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
  v2.var0 = [(QSSServiceDiscoveryResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__43__QSSServiceDiscoveryResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::ServiceDiscoveryResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSServiceDiscoveryResponse *)self session_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  int v41 = [(QSSServiceDiscoveryResponse *)self error_code];
  long long v9 = [(QSSServiceDiscoveryResponse *)self error_str];
  uint64_t v10 = v9;
  if (!v9) {
    long long v9 = &stru_26DEBFAF8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  unsigned int v13 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  memset(&v48, 0, sizeof(v48));
  v14 = [(QSSServiceDiscoveryResponse *)self zk_node];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v48, [v14 count]);

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v15 = [(QSSServiceDiscoveryResponse *)self zk_node];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v49 count:16];
  unsigned int v40 = v13;
  begin = v48.__begin_;
  if (v16)
  {
    uint64_t v18 = *(void *)v45;
    value = v48.__end_cap_.__value_;
    v43 = v15;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        v21 = (const char *)[*(id *)(*((void *)&v44 + 1) + 8 * i) UTF8String];
        size_t v22 = strlen(v21);
        int v23 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v21, v22);
        int v24 = v23;
        std::vector<int>::pointer end = v48.__end_;
        if (v48.__end_ >= value)
        {
          uint64_t v27 = v48.__end_ - begin;
          unint64_t v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 62)
          {
            v48.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v28) {
            unint64_t v28 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v28;
          }
          if (v29) {
            unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v29);
          }
          else {
            uint64_t v30 = 0;
          }
          v31 = (int *)(v29 + 4 * v27);
          int *v31 = v24;
          v26 = v31 + 1;
          while (end != begin)
          {
            int v32 = *--end;
            *--v31 = v32;
          }
          value = (int *)(v29 + 4 * v30);
          v48.__end_ = v26;
          if (begin) {
            operator delete(begin);
          }
          begin = v31;
          v15 = v43;
        }
        else
        {
          *v48.__end_ = v23;
          v26 = end + 1;
        }
        v48.__end_ = v26;
      }
      v48.__end_cap_.__value_ = value;
      v48.__begin_ = begin;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v16);
  }
  else
  {
    v26 = v48.__end_;
  }

  if (v26 == begin) {
    v33 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v33 = begin;
  }
  unsigned int v34 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v33, v26 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v35 = *((_DWORD *)a3 + 8);
  int v36 = *((_DWORD *)a3 + 12);
  int v37 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v41);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v34);
  v38.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v35 - v36 + v37);
  if (begin)
  {
    v48.__end_ = begin;
    operator delete(begin);
  }
  return v38;
}

- (NSArray)zk_node
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"zk_node"];
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
            size_t v12 = (void *)[[NSString alloc] initWithBytes:&v10[*(unsigned int *)v10->var0 + 4] length:*(unsigned int *)v10[*(unsigned int *)v10->var0].var0 encoding:4];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"zk_node"];
  }
  return (NSArray *)v3;
}

- (NSString)error_str
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

- (int)error_code
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
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

- (QSSServiceDiscoveryResponse)initWithFlatbuffData:(id)a3 root:(const ServiceDiscoveryResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v39.receiver = self;
  v39.super_class = (Class)QSSServiceDiscoveryResponse;
  uint64_t v10 = [(QSSServiceDiscoveryResponse *)&v39 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_40;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_41;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    unsigned int v13 = (unsigned int *)[*p_data bytes];
    a4 = (const ServiceDiscoveryResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_39;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_41;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v34 = v18;
  unint64_t v35 = v19;
  long long v36 = xmmword_22B64D0E0;
  uint64_t v37 = 0;
  char v38 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_39;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v34, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v34, 4u))
  {
    goto LABEL_41;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    int v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    int v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v34, v23)) {
    goto LABEL_41;
  }
  int v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v25 = *v24;
  if (v25 >= 7 && v24[3] && (v35 < 5 || v35 - 4 < (unint64_t)root + v24[3] - v34)) {
    goto LABEL_41;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v34, 8u)) {
    goto LABEL_41;
  }
  v26 = v25 >= 9 && v24[4] ? (const unsigned __int8 *)root + v24[4] + *(unsigned int *)((char *)root + v24[4]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v34, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v34, 0xAu))
  {
    goto LABEL_41;
  }
  uint64_t v27 = 0;
  uint64_t v28 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v28) < 0xBu) {
    goto LABEL_38;
  }
  if (*(_WORD *)((char *)root - v28 + 10))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v34, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v28 + 10)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v28 + 10)), 4uLL, 0))
    {
      uint64_t v27 = 0;
      uint64_t v28 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v28) < 0xBu) {
        goto LABEL_38;
      }
      goto LABEL_35;
    }
LABEL_41:
    int v32 = 0;
    goto LABEL_42;
  }
LABEL_35:
  uint64_t v29 = *(unsigned __int16 *)((char *)root - v28 + 10);
  if (v29) {
    uint64_t v27 = (_DWORD *)((char *)root + v29 + *(unsigned int *)((char *)root + v29));
  }
  else {
    uint64_t v27 = 0;
  }
LABEL_38:
  if (!flatbuffers::Verifier::VerifyVectorOfStrings((flatbuffers::Verifier *)&v34, v27)) {
    goto LABEL_41;
  }
LABEL_39:
  uint64_t v30 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v34);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v30;

LABEL_40:
  int v32 = v11;
LABEL_42:

  return v32;
}

- (QSSServiceDiscoveryResponse)initWithFlatbuffData:(id)a3 root:(const ServiceDiscoveryResponse *)a4
{
  return [(QSSServiceDiscoveryResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSServiceDiscoveryResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSServiceDiscoveryResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSServiceDiscoveryResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
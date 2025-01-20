@interface QSSSetSpeechContext
- (NSArray)context_with_pron_hints;
- (NSArray)contextual_text;
- (NSString)left_context;
- (NSString)right_context;
- (Offset<siri::speech::schema_fb::SetSpeechContext>)addObjectToBuffer:(void *)a3;
- (QSSSetSpeechContext)initWithFlatbuffData:(id)a3;
- (QSSSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4;
- (QSSSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSSetSpeechContext

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
  v2.var0 = [(QSSSetSpeechContext *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__35__QSSSetSpeechContext_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::SetSpeechContext>)addObjectToBuffer:(void *)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  memset(&v79, 0, sizeof(v79));
  v3 = [(QSSSetSpeechContext *)self contextual_text];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v79, [v3 count]);

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v4 = [(QSSSetSpeechContext *)self contextual_text];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v75 objects:v81 count:16];
  char v6 = v4;
  begin = v79.__begin_;
  if (v5)
  {
    uint64_t v8 = *(void *)v76;
    value = v79.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v76 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (const char *)[*(id *)(*((void *)&v75 + 1) + 8 * i) UTF8String];
        size_t v12 = strlen(v11);
        int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);
        int v14 = String;
        std::vector<int>::pointer end = v79.__end_;
        if (v79.__end_ >= value)
        {
          uint64_t v17 = v79.__end_ - begin;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
          {
            v79.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v18) {
            unint64_t v18 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v18;
          }
          if (v19) {
            unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v19);
          }
          else {
            uint64_t v20 = 0;
          }
          v21 = (int *)(v19 + 4 * v17);
          int *v21 = v14;
          v16 = v21 + 1;
          while (end != begin)
          {
            int v22 = *--end;
            *--v21 = v22;
          }
          value = (int *)(v19 + 4 * v20);
          v79.__end_ = v16;
          if (begin) {
            operator delete(begin);
          }
          begin = v21;
        }
        else
        {
          *v79.__end_ = String;
          v16 = end + 1;
        }
        v79.__end_ = v16;
      }
      v79.__end_cap_.__value_ = value;
      v79.__begin_ = begin;
      uint64_t v5 = [v6 countByEnumeratingWithState:&v75 objects:v81 count:16];
    }
    while (v5);
  }
  else
  {
    v16 = v79.__end_;
  }

  if (v16 == begin) {
    v23 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v23 = begin;
  }
  unsigned int v24 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v23, v16 - begin);
  v25 = [(QSSSetSpeechContext *)self left_context];
  v26 = v25;
  unsigned int v68 = v24;
  if (!v25) {
    v25 = &stru_26DEBFAF8;
  }
  v27 = (const char *)[(__CFString *)v25 UTF8String];
  size_t v28 = strlen(v27);
  unsigned int v67 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v27, v28);

  v29 = [(QSSSetSpeechContext *)self right_context];
  v30 = v29;
  if (!v29) {
    v29 = &stru_26DEBFAF8;
  }
  v31 = (const char *)[(__CFString *)v29 UTF8String];
  size_t v32 = strlen(v31);
  unsigned int v66 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v31, v32);

  v33 = [(QSSSetSpeechContext *)self context_with_pron_hints];
  unint64_t v34 = [v33 count];
  if (v34)
  {
    if (v34 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v34);
    v37 = &v35[4 * v36];
  }
  else
  {
    v35 = 0;
    v37 = 0;
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v38 = [(QSSSetSpeechContext *)self context_with_pron_hints];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v71 objects:v80 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v72;
    v41 = v35;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v72 != v40) {
          objc_enumerationMutation(v38);
        }
        int v43 = [*(id *)(*((void *)&v71 + 1) + 8 * j) addObjectToBuffer:a3];
        int v44 = v43;
        if (v41 >= v37)
        {
          uint64_t v45 = (v41 - v35) >> 2;
          unint64_t v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v37 - v35) >> 1 > v46) {
            unint64_t v46 = (v37 - v35) >> 1;
          }
          if ((unint64_t)(v37 - v35) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v47 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v47 = v46;
          }
          if (v47) {
            unint64_t v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v47);
          }
          else {
            uint64_t v48 = 0;
          }
          v49 = (char *)(v47 + 4 * v45);
          *(_DWORD *)v49 = v44;
          v50 = v49 + 4;
          while (v41 != v35)
          {
            int v51 = *((_DWORD *)v41 - 1);
            v41 -= 4;
            *((_DWORD *)v49 - 1) = v51;
            v49 -= 4;
          }
          v37 = (char *)(v47 + 4 * v48);
          if (v35) {
            operator delete(v35);
          }
          v35 = v49;
          v41 = v50;
        }
        else
        {
          *(_DWORD *)v41 = v43;
          v41 += 4;
        }
      }
      uint64_t v39 = [v38 countByEnumeratingWithState:&v71 objects:v80 count:16];
    }
    while (v39);
  }
  else
  {
    v41 = v35;
  }

  uint64_t v52 = v41 - v35;
  if (v41 == v35) {
    v53 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::ContextWithPronHints>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::ContextWithPronHints>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::ContextWithPronHints>> const&)::t;
  }
  else {
    v53 = v35;
  }
  uint64_t v54 = v52 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v52 >> 2, 4uLL);
  if (v35 == v41)
  {
    LODWORD(v54) = 0;
    v57 = (flatbuffers::FlatBufferBuilder *)a3;
  }
  else
  {
    v55 = v53 - 4;
    uint64_t v56 = v54;
    v57 = (flatbuffers::FlatBufferBuilder *)a3;
    do
    {
      int v58 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v55[4 * v56]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v58);
      --v56;
    }
    while (v56);
  }
  unsigned int v59 = flatbuffers::FlatBufferBuilder::EndVector(v57, v54);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v57);
  *((unsigned char *)v57 + 70) = 1;
  int v60 = *((_DWORD *)v57 + 8);
  int v61 = *((_DWORD *)v57 + 12);
  int v62 = *((_DWORD *)v57 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v57, 4, v68);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v57, 6, v67);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v57, 8, v66);
  if (v59)
  {
    int v63 = flatbuffers::FlatBufferBuilder::ReferTo(v57, v59);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v57, 10, v63);
  }
  v64.var0 = flatbuffers::FlatBufferBuilder::EndTable(v57, v60 - v61 + v62);
  if (v35) {
    operator delete(v35);
  }
  if (v79.__begin_) {
    operator delete(v79.__begin_);
  }
  return v64;
}

- (NSArray)context_with_pron_hints
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_with_pron_hints"];
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
            size_t v12 = [[QSSContextWithPronHints alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"context_with_pron_hints"];
  }
  return (NSArray *)v3;
}

- (NSString)right_context
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

- (NSString)left_context
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

- (NSArray)contextual_text
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"contextual_text"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[4].var0;
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
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"contextual_text"];
  }
  return (NSArray *)v3;
}

- (QSSSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSSetSpeechContext;
  uint64_t v10 = [(QSSSetSpeechContext *)&v30 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_16;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      uint64_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const SetSpeechContext *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_16;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v25 = v18;
      unint64_t v26 = v19;
      long long v27 = xmmword_22B64D0E0;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (siri::speech::schema_fb::SetSpeechContext *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::SetSpeechContext::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (QSSSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4
{
  return [(QSSSetSpeechContext *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSSetSpeechContext *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSSetSpeechContext)initWithFlatbuffData:(id)a3
{
  return [(QSSSetSpeechContext *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
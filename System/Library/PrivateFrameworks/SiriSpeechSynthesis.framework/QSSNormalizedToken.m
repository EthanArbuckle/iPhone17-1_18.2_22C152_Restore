@interface QSSNormalizedToken
- (NSArray)nbest_variants;
- (NSString)original_token;
- (Offset<siri::speech::schema_fb::NormalizedToken>)addObjectToBuffer:(void *)a3;
- (QSSNormalizedToken)initWithFlatbuffData:(id)a3;
- (QSSNormalizedToken)initWithFlatbuffData:(id)a3 root:(const NormalizedToken *)a4;
- (QSSNormalizedToken)initWithFlatbuffData:(id)a3 root:(const NormalizedToken *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSNormalizedToken

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
  v2.var0 = [(QSSNormalizedToken *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__34__QSSNormalizedToken_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::NormalizedToken>)addObjectToBuffer:(void *)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSNormalizedToken *)self original_token];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  long long v9 = [(QSSNormalizedToken *)self nbest_variants];
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

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v14 = [(QSSNormalizedToken *)self nbest_variants];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v44;
    v17 = v11;
    v42 = v14;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v14);
        }
        int v19 = [*(id *)(*((void *)&v43 + 1) + 8 * i) addObjectToBuffer:a3];
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
          v14 = v42;
        }
        else
        {
          *(_DWORD *)v17 = v19;
          v17 += 4;
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v15);
  }
  else
  {
    v17 = v11;
  }

  uint64_t v28 = v17 - v11;
  if (v17 == v11) {
    v29 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::NormalizedTokenVariant>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::NormalizedTokenVariant>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::NormalizedTokenVariant>> const&)::t;
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
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v35 = *((_DWORD *)a3 + 8);
  int v36 = *((_DWORD *)a3 + 12);
  int v37 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  if (v34)
  {
    int v38 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v34);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v38);
  }
  v39.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v35 - v36 + v37);
  if (v11) {
    operator delete(v11);
  }
  return v39;
}

- (NSArray)nbest_variants
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"nbest_variants"];
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
            uint64_t v12 = [[QSSNormalizedTokenVariant alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"nbest_variants"];
  }
  return (NSArray *)v3;
}

- (NSString)original_token
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

- (QSSNormalizedToken)initWithFlatbuffData:(id)a3 root:(const NormalizedToken *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSNormalizedToken;
  unint64_t v10 = [(QSSNormalizedToken *)&v30 init];
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
      a4 = (const NormalizedToken *)v13 + *v13;
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
      root = (siri::speech::schema_fb::NormalizedToken *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::NormalizedToken::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          unint64_t v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  unint64_t v23 = v11;
LABEL_17:

  return v23;
}

- (QSSNormalizedToken)initWithFlatbuffData:(id)a3 root:(const NormalizedToken *)a4
{
  return [(QSSNormalizedToken *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSNormalizedToken *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSNormalizedToken)initWithFlatbuffData:(id)a3
{
  return [(QSSNormalizedToken *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
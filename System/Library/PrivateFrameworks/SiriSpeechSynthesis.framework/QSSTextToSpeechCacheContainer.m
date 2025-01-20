@interface QSSTextToSpeechCacheContainer
- (NSArray)cache_object;
- (Offset<siri::speech::schema_fb::TextToSpeechCacheContainer>)addObjectToBuffer:(void *)a3;
- (QSSTextToSpeechCacheContainer)initWithFlatbuffData:(id)a3;
- (QSSTextToSpeechCacheContainer)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheContainer *)a4;
- (QSSTextToSpeechCacheContainer)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheContainer *)a4 verify:(BOOL)a5;
- (QSSTextToSpeechCacheMetaInfo)cache_meta_info;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTextToSpeechCacheContainer

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
  v2.var0 = [(QSSTextToSpeechCacheContainer *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__45__QSSTextToSpeechCacheContainer_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechCacheContainer>)addObjectToBuffer:(void *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSTextToSpeechCacheContainer *)self cache_meta_info];
  unsigned int v6 = [v5 addObjectToBuffer:a3];

  long long v7 = [(QSSTextToSpeechCacheContainer *)self cache_object];
  unint64_t v8 = [v7 count];
  if (v8)
  {
    if (v8 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    long long v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v8);
    uint64_t v11 = &v9[4 * v10];
  }
  else
  {
    long long v9 = 0;
    uint64_t v11 = 0;
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  __int16 v12 = [(QSSTextToSpeechCacheContainer *)self cache_object];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
  unsigned int v40 = v6;
  if (v13)
  {
    uint64_t v14 = *(void *)v43;
    v15 = v9;
    v41 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v12);
        }
        int v17 = [*(id *)(*((void *)&v42 + 1) + 8 * i) addObjectToBuffer:a3];
        int v18 = v17;
        if (v15 >= v11)
        {
          uint64_t v19 = (v15 - v9) >> 2;
          unint64_t v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v11 - v9) >> 1 > v20) {
            unint64_t v20 = (v11 - v9) >> 1;
          }
          if ((unint64_t)(v11 - v9) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v20;
          }
          if (v21) {
            unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v21);
          }
          else {
            uint64_t v22 = 0;
          }
          v23 = (char *)(v21 + 4 * v19);
          *(_DWORD *)v23 = v18;
          v24 = v23 + 4;
          while (v15 != v9)
          {
            int v25 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v23 - 1) = v25;
            v23 -= 4;
          }
          uint64_t v11 = (char *)(v21 + 4 * v22);
          if (v9) {
            operator delete(v9);
          }
          long long v9 = v23;
          v15 = v24;
          __int16 v12 = v41;
        }
        else
        {
          *(_DWORD *)v15 = v17;
          v15 += 4;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v13);
  }
  else
  {
    v15 = v9;
  }

  uint64_t v26 = v15 - v9;
  if (v15 == v9) {
    v27 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechCacheObject>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechCacheObject>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechCacheObject>> const&)::t;
  }
  else {
    v27 = v9;
  }
  uint64_t v28 = v26 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v26 >> 2, 4uLL);
  if (v9 == v15)
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
  }
  unsigned int v32 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v28);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v33 = *((_DWORD *)a3 + 8);
  int v34 = *((_DWORD *)a3 + 12);
  int v35 = *((_DWORD *)a3 + 10);
  if (v40)
  {
    int v36 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v40);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v36);
  }
  if (v32)
  {
    int v37 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v32);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v37);
  }
  v38.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v33 - v34 + v35);
  if (v9) {
    operator delete(v9);
  }
  return v38;
}

- (NSArray)cache_object
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"cache_object"];
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
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSTextToSpeechCacheObject alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"cache_object"];
  }
  return (NSArray *)v3;
}

- (QSSTextToSpeechCacheMetaInfo)cache_meta_info
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"cache_meta_info"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechCacheMetaInfo alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    v3 = [(QSSTextToSpeechCacheMetaInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"cache_meta_info"];
  }
  return v3;
}

- (QSSTextToSpeechCacheContainer)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheContainer *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v37.receiver = self;
  v37.super_class = (Class)QSSTextToSpeechCacheContainer;
  uint64_t v10 = [(QSSTextToSpeechCacheContainer *)&v37 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_29;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_30;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechCacheContainer *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_28;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_30;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v32 = v18;
  unint64_t v33 = v19;
  long long v34 = xmmword_22B64D0E0;
  uint64_t v35 = 0;
  LOBYTE(v36) = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_28;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v32, v11->_root->var0)) {
    goto LABEL_30;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v32, 4u)) {
    goto LABEL_30;
  }
  unint64_t v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u)
  {
    uint64_t v22 = v21[2];
    if (v22)
    {
      if (!siri::speech::schema_fb::TextToSpeechCacheMetaInfo::Verify((flatbuffers::Table *)((char *)root + v22 + *(unsigned int *)((char *)root + v22)), (flatbuffers::Verifier *)&v32))goto LABEL_30; {
    }
      }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v32, 6u)) {
    goto LABEL_30;
  }
  uint64_t v23 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v23) < 7u) {
    goto LABEL_28;
  }
  if (!*(_WORD *)((char *)root - v23 + 6))
  {
LABEL_23:
    uint64_t v24 = *(unsigned __int16 *)((char *)root - v23 + 6);
    if (v24)
    {
      int v25 = (_DWORD *)((char *)root + v24 + *(unsigned int *)((char *)root + v24));
      if (*v25)
      {
        unint64_t v26 = 0;
        v27 = v25 + 1;
        while (siri::speech::schema_fb::TextToSpeechCacheObject::Verify((siri::speech::schema_fb::TextToSpeechCacheObject *)((char *)v27 + *v27), (flatbuffers::Verifier *)&v32))
        {
          ++v26;
          ++v27;
          if (v26 >= *v25) {
            goto LABEL_28;
          }
        }
        goto LABEL_30;
      }
    }
    goto LABEL_28;
  }
  if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v32, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v23 + 6)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v23 + 6)), 4uLL, 0))
  {
LABEL_30:
    uint64_t v30 = 0;
    goto LABEL_31;
  }
  uint64_t v23 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v23) >= 7u) {
    goto LABEL_23;
  }
LABEL_28:
  uint64_t v28 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v32, v33, v34, v35, v36);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v28;

LABEL_29:
  uint64_t v30 = v11;
LABEL_31:

  return v30;
}

- (QSSTextToSpeechCacheContainer)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheContainer *)a4
{
  return [(QSSTextToSpeechCacheContainer *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechCacheContainer *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextToSpeechCacheContainer)initWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechCacheContainer *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
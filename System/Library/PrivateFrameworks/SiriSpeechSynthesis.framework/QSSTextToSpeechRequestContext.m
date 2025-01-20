@interface QSSTextToSpeechRequestContext
- (NSArray)context_info;
- (NSString)dialog_identifier;
- (Offset<siri::speech::schema_fb::TextToSpeechRequestContext>)addObjectToBuffer:(void *)a3;
- (QSSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3;
- (QSSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestContext *)a4;
- (QSSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestContext *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTextToSpeechRequestContext

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
  v2.var0 = [(QSSTextToSpeechRequestContext *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__45__QSSTextToSpeechRequestContext_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequestContext>)addObjectToBuffer:(void *)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSTextToSpeechRequestContext *)self context_info];
  unint64_t v6 = [v5 count];
  if (v6)
  {
    if (v6 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    long long v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v6);
    long long v9 = &v7[4 * v8];
  }
  else
  {
    long long v7 = 0;
    long long v9 = 0;
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v10 = [(QSSTextToSpeechRequestContext *)self context_info];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v48 count:16];
  v42 = self;
  if (v11)
  {
    uint64_t v12 = *(void *)v45;
    uint64_t v13 = v7;
    v43 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v10);
        }
        int v15 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "addObjectToBuffer:", a3, v42);
        int v16 = v15;
        if (v13 >= v9)
        {
          uint64_t v17 = (v13 - v7) >> 2;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v9 - v7) >> 1 > v18) {
            unint64_t v18 = (v9 - v7) >> 1;
          }
          if ((unint64_t)(v9 - v7) >= 0x7FFFFFFFFFFFFFFCLL) {
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
          v21 = (char *)(v19 + 4 * v17);
          *(_DWORD *)v21 = v16;
          v22 = v21 + 4;
          while (v13 != v7)
          {
            int v23 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *((_DWORD *)v21 - 1) = v23;
            v21 -= 4;
          }
          long long v9 = (char *)(v19 + 4 * v20);
          if (v7) {
            operator delete(v7);
          }
          long long v7 = v21;
          uint64_t v13 = v22;
          uint64_t v10 = v43;
        }
        else
        {
          *(_DWORD *)uint64_t v13 = v15;
          v13 += 4;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v13 = v7;
  }

  uint64_t v24 = v13 - v7;
  if (v13 == v7) {
    v25 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequestContext_::ContextInfoEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequestContext_::ContextInfoEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequestContext_::ContextInfoEntry>> const&)::t;
  }
  else {
    v25 = v7;
  }
  uint64_t v26 = v24 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v24 >> 2, 4uLL);
  if (v7 == v13)
  {
    LODWORD(v26) = 0;
  }
  else
  {
    v27 = v25 - 4;
    uint64_t v28 = v26;
    do
    {
      int v29 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v27[4 * v28]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v29);
      --v28;
    }
    while (v28);
  }
  unsigned int v30 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v26);
  v31 = [(QSSTextToSpeechRequestContext *)v42 dialog_identifier];
  v32 = v31;
  if (!v31) {
    v31 = &stru_26DEBFAF8;
  }
  v33 = (const char *)[(__CFString *)v31 UTF8String];
  size_t v34 = strlen(v33);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v33, v34);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v36 = *((_DWORD *)a3 + 8);
  int v37 = *((_DWORD *)a3 + 12);
  int v38 = *((_DWORD *)a3 + 10);
  if (v30)
  {
    int v39 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v30);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v39);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, String);
  v40.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v36 - v37 + v38);
  if (v7) {
    operator delete(v7);
  }
  return v40;
}

- (NSString)dialog_identifier
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
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

- (NSArray)context_info
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_info"];
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
            uint64_t v12 = [[QSSTextToSpeechRequestContext_ContextInfoEntry alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"context_info"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__62__QSSTextToSpeechRequestContext_ContextInfoEntry_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (QSSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestContext *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTextToSpeechRequestContext;
  uint64_t v10 = [(QSSTextToSpeechRequestContext *)&v30 init];
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
      a4 = (const TextToSpeechRequestContext *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TextToSpeechRequestContext *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechRequestContext::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          int v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  int v23 = v11;
LABEL_17:

  return v23;
}

- (QSSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestContext *)a4
{
  return [(QSSTextToSpeechRequestContext *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechRequestContext *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechRequestContext *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
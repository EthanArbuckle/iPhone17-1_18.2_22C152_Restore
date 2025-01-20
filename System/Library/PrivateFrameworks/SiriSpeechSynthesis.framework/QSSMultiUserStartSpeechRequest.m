@interface QSSMultiUserStartSpeechRequest
- (NSArray)user_parameters;
- (NSString)primary_speech_id;
- (Offset<siri::speech::schema_fb::MultiUserStartSpeechRequest>)addObjectToBuffer:(void *)a3;
- (QSSMultiUserStartSpeechRequest)initWithFlatbuffData:(id)a3;
- (QSSMultiUserStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const MultiUserStartSpeechRequest *)a4;
- (QSSMultiUserStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const MultiUserStartSpeechRequest *)a4 verify:(BOOL)a5;
- (QSSStartSpeechRequest)start_speech_request;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSMultiUserStartSpeechRequest

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
  v2.var0 = [(QSSMultiUserStartSpeechRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__46__QSSMultiUserStartSpeechRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::MultiUserStartSpeechRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSMultiUserStartSpeechRequest *)self start_speech_request];
  unsigned int v43 = [v5 addObjectToBuffer:a3];

  char v6 = [(QSSMultiUserStartSpeechRequest *)self user_parameters];
  unint64_t v7 = [v6 count];
  if (v7)
  {
    if (v7 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    long long v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v7);
    uint64_t v10 = &v8[4 * v9];
  }
  else
  {
    long long v8 = 0;
    uint64_t v10 = 0;
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v11 = [(QSSMultiUserStartSpeechRequest *)self user_parameters];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v50 count:16];
  v44 = self;
  if (v12)
  {
    uint64_t v13 = *(void *)v47;
    v14 = v8;
    v45 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v11);
        }
        int v16 = [*(id *)(*((void *)&v46 + 1) + 8 * i) addObjectToBuffer:a3];
        int v17 = v16;
        if (v14 >= v10)
        {
          uint64_t v18 = (v14 - v8) >> 2;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v10 - v8) >> 1 > v19) {
            unint64_t v19 = (v10 - v8) >> 1;
          }
          if ((unint64_t)(v10 - v8) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v19;
          }
          if (v20) {
            unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v20);
          }
          else {
            uint64_t v21 = 0;
          }
          v22 = (char *)(v20 + 4 * v18);
          *(_DWORD *)v22 = v17;
          v23 = v22 + 4;
          while (v14 != v8)
          {
            int v24 = *((_DWORD *)v14 - 1);
            v14 -= 4;
            *((_DWORD *)v22 - 1) = v24;
            v22 -= 4;
          }
          uint64_t v10 = (char *)(v20 + 4 * v21);
          if (v8) {
            operator delete(v8);
          }
          long long v8 = v22;
          v14 = v23;
          uint64_t v11 = v45;
        }
        else
        {
          *(_DWORD *)v14 = v16;
          v14 += 4;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v12);
  }
  else
  {
    v14 = v8;
  }

  uint64_t v25 = v14 - v8;
  if (v14 == v8) {
    v26 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::UserParameters>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::UserParameters>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::UserParameters>> const&)::t;
  }
  else {
    v26 = v8;
  }
  uint64_t v27 = v25 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v25 >> 2, 4uLL);
  if (v8 == v14)
  {
    LODWORD(v27) = 0;
  }
  else
  {
    v28 = v26 - 4;
    uint64_t v29 = v27;
    do
    {
      int v30 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v28[4 * v29]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v30);
      --v29;
    }
    while (v29);
  }
  unsigned int v31 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v27);
  v32 = [(QSSMultiUserStartSpeechRequest *)v44 primary_speech_id];
  v33 = v32;
  if (!v32) {
    v32 = &stru_26DEBFAF8;
  }
  v34 = (const char *)[(__CFString *)v32 UTF8String];
  size_t v35 = strlen(v34);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v34, v35);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v37 = *((_DWORD *)a3 + 8);
  int v38 = *((_DWORD *)a3 + 12);
  int v39 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v43);
  if (v31)
  {
    int v40 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v31);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v40);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, String);
  v41.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v37 - v38 + v39);
  if (v8) {
    operator delete(v8);
  }
  return v41;
}

- (NSString)primary_speech_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  unint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)user_parameters
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_parameters"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[6].var0;
      if (v6)
      {
        unint64_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            uint64_t v12 = [[QSSUserParameters alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_parameters"];
  }
  return (NSArray *)v3;
}

- (QSSStartSpeechRequest)start_speech_request
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"start_speech_request"];
  if (!v3)
  {
    uint64_t v4 = [QSSStartSpeechRequest alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(QSSStartSpeechRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"start_speech_request"];
  }
  return v3;
}

- (QSSMultiUserStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const MultiUserStartSpeechRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSMultiUserStartSpeechRequest;
  uint64_t v10 = [(QSSMultiUserStartSpeechRequest *)&v30 init];
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
      a4 = (const MultiUserStartSpeechRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::MultiUserStartSpeechRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::MultiUserStartSpeechRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSMultiUserStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const MultiUserStartSpeechRequest *)a4
{
  return [(QSSMultiUserStartSpeechRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSMultiUserStartSpeechRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSMultiUserStartSpeechRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSMultiUserStartSpeechRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
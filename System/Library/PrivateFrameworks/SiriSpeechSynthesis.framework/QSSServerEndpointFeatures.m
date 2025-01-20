@interface QSSServerEndpointFeatures
- (NSArray)pause_counts;
- (NSString)speech_id;
- (NSString)task_name;
- (Offset<siri::speech::schema_fb::ServerEndpointFeatures>)addObjectToBuffer:(void *)a3;
- (QSSServerEndpointFeatures)initWithFlatbuffData:(id)a3;
- (QSSServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4;
- (QSSServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4 verify:(BOOL)a5;
- (double)eos_likelihood;
- (double)silence_posterior;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)num_of_words;
- (int)processed_audio_duration_ms;
- (int)trailing_silence_duration;
@end

@implementation QSSServerEndpointFeatures

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
  v2.var0 = [(QSSServerEndpointFeatures *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__41__QSSServerEndpointFeatures_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::ServerEndpointFeatures>)addObjectToBuffer:(void *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  int v44 = [(QSSServerEndpointFeatures *)self processed_audio_duration_ms];
  int v43 = [(QSSServerEndpointFeatures *)self num_of_words];
  int v42 = [(QSSServerEndpointFeatures *)self trailing_silence_duration];
  [(QSSServerEndpointFeatures *)self eos_likelihood];
  double v6 = v5;
  memset(&v51, 0, sizeof(v51));
  long long v7 = [(QSSServerEndpointFeatures *)self pause_counts];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v51, [v7 count]);

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v8 = [(QSSServerEndpointFeatures *)self pause_counts];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v52 count:16];
  v45 = self;
  v46 = (flatbuffers::FlatBufferBuilder *)a3;
  begin = v51.__begin_;
  if (v9)
  {
    uint64_t v11 = *(void *)v48;
    value = v51.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(v8);
        }
        int v14 = [*(id *)(*((void *)&v47 + 1) + 8 * i) intValue];
        int v15 = v14;
        std::vector<int>::pointer end = v51.__end_;
        if (v51.__end_ >= value)
        {
          uint64_t v18 = v51.__end_ - begin;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
          {
            v51.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v19) {
            unint64_t v19 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
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
          v22 = (int *)(v20 + 4 * v18);
          int *v22 = v15;
          v17 = v22 + 1;
          while (end != begin)
          {
            int v23 = *--end;
            *--v22 = v23;
          }
          value = (int *)(v20 + 4 * v21);
          v51.__end_ = v17;
          if (begin) {
            operator delete(begin);
          }
          begin = v22;
        }
        else
        {
          *v51.__end_ = v14;
          v17 = end + 1;
        }
        v51.__end_ = v17;
      }
      v51.__end_cap_.__value_ = value;
      v51.__begin_ = begin;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v9);
  }
  else
  {
    v17 = v51.__end_;
  }

  if (v17 == begin) {
    v24 = (int *)&flatbuffers::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  }
  else {
    v24 = begin;
  }
  unsigned int v25 = flatbuffers::FlatBufferBuilder::CreateVector<int>(v46, v24, v17 - begin);
  [(QSSServerEndpointFeatures *)v45 silence_posterior];
  double v27 = v26;
  v28 = [(QSSServerEndpointFeatures *)v45 task_name];
  v29 = v28;
  if (!v28) {
    v28 = &stru_26DEBFAF8;
  }
  v30 = (const char *)[(__CFString *)v28 UTF8String];
  size_t v31 = strlen(v30);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString(v46, v30, v31);

  v33 = [(QSSServerEndpointFeatures *)v45 speech_id];
  v34 = v33;
  if (!v33) {
    v33 = &stru_26DEBFAF8;
  }
  v35 = (const char *)[(__CFString *)v33 UTF8String];
  size_t v36 = strlen(v35);
  LODWORD(v35) = flatbuffers::FlatBufferBuilder::CreateString(v46, v35, v36);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v46);
  *((unsigned char *)v46 + 70) = 1;
  int v37 = *((_DWORD *)v46 + 8);
  int v38 = *((_DWORD *)v46 + 12);
  int v39 = *((_DWORD *)v46 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v46, 4, v44);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v46, 6, v43);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v46, 8, v42);
  flatbuffers::FlatBufferBuilder::AddElement<double>(v46, 10, v6);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v46, 12, v25);
  flatbuffers::FlatBufferBuilder::AddElement<double>(v46, 14, v27);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v46, 16, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v46, 18, v35);
  v40.var0 = flatbuffers::FlatBufferBuilder::EndTable(v46, v37 - v38 + v39);
  if (begin)
  {
    v51.__end_ = begin;
    operator delete(begin);
  }
  return v40;
}

- (NSString)speech_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    double v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    double v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)task_name
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    double v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    double v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (double)silence_posterior
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xFu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[14].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (NSArray)pause_counts
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pause_counts"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xDu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[12].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        var0 = (unsigned int *)v7[v8 + 4].var0;
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [NSNumber numberWithInt:*var0];
            [v3 addObject:v12];

            ++var0;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"pause_counts"];
  }
  return (NSArray *)v3;
}

- (double)eos_likelihood
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xBu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[10].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (int)trailing_silence_duration
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (int)num_of_words
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

- (int)processed_audio_duration_ms
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (QSSServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSServerEndpointFeatures;
  uint64_t v10 = [(QSSServerEndpointFeatures *)&v30 init];
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
      a4 = (const ServerEndpointFeatures *)v13 + *v13;
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
      root = (siri::speech::schema_fb::ServerEndpointFeatures *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::ServerEndpointFeatures::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4
{
  return [(QSSServerEndpointFeatures *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSServerEndpointFeatures *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSServerEndpointFeatures)initWithFlatbuffData:(id)a3
{
  return [(QSSServerEndpointFeatures *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
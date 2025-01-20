@interface QSSFinishAudio
- (NSArray)features_at_endpoint;
- (NSArray)server_feature_latency_distribution;
- (Offset<siri::speech::schema_fb::FinishAudio>)addObjectToBuffer:(void *)a3;
- (QSSFinishAudio)initWithFlatbuffData:(id)a3;
- (QSSFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4;
- (QSSFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4 verify:(BOOL)a5;
- (float)total_audio_recorded_seconds;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)packet_count;
@end

@implementation QSSFinishAudio

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
  v2.var0 = [(QSSFinishAudio *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__30__QSSFinishAudio_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::FinishAudio>)addObjectToBuffer:(void *)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  HIDWORD(v59) = [(QSSFinishAudio *)self packet_count];
  [(QSSFinishAudio *)self total_audio_recorded_seconds];
  float v6 = v5;
  __p = 0;
  v71 = 0;
  unint64_t v72 = 0;
  long long v7 = [(QSSFinishAudio *)self features_at_endpoint];
  std::vector<float>::reserve(&__p, [v7 count]);

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v8 = [(QSSFinishAudio *)self features_at_endpoint];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v66 objects:v74 count:16];
  v60 = self;
  uint64_t v10 = __p;
  if (v9)
  {
    uint64_t v11 = *(void *)v67;
    unint64_t v12 = v72;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v67 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v66 + 1) + 8 * i) floatValue];
        int v15 = v14;
        v16 = v71;
        if ((unint64_t)v71 >= v12)
        {
          uint64_t v18 = (v71 - v10) >> 2;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
          {
            __p = v10;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v12 - (void)v10) >> 1 > v19) {
            unint64_t v19 = (uint64_t)(v12 - (void)v10) >> 1;
          }
          if (v12 - (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
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
          v22 = (_DWORD *)(v20 + 4 * v18);
          _DWORD *v22 = v15;
          v17 = (char *)(v22 + 1);
          while (v16 != v10)
          {
            int v23 = *((_DWORD *)v16 - 1);
            v16 -= 4;
            *--v22 = v23;
          }
          unint64_t v12 = v20 + 4 * v21;
          v71 = v17;
          if (v10) {
            operator delete(v10);
          }
          uint64_t v10 = v22;
        }
        else
        {
          *(_DWORD *)v71 = v14;
          v17 = v16 + 4;
        }
        v71 = v17;
      }
      unint64_t v72 = v12;
      __p = v10;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v66 objects:v74 count:16];
    }
    while (v9);
  }
  else
  {
    v17 = v71;
  }

  if (v17 == v10) {
    v24 = &flatbuffers::data<float,std::allocator<float>>(std::vector<float> const&)::t;
  }
  else {
    v24 = v10;
  }
  int v25 = flatbuffers::FlatBufferBuilder::CreateVector<int>((flatbuffers::FlatBufferBuilder *)a3, v24, (v17 - v10) >> 2);
  v26 = [(QSSFinishAudio *)v60 server_feature_latency_distribution];
  unint64_t v27 = [v26 count];
  LODWORD(v59) = v25;
  if (v27)
  {
    if (v27 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v27);
    v30 = &v28[4 * v29];
  }
  else
  {
    v28 = 0;
    v30 = 0;
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v31 = [(QSSFinishAudio *)v60 server_feature_latency_distribution];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v62 objects:v73 count:16];
  v61 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v32)
  {
    uint64_t v33 = *(void *)v63;
    v34 = v28;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v63 != v33) {
          objc_enumerationMutation(v31);
        }
        int v36 = objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * j), "addObjectToBuffer:", a3, v59);
        int v37 = v36;
        if (v34 >= v30)
        {
          uint64_t v38 = (v34 - v28) >> 2;
          unint64_t v39 = v38 + 1;
          if ((unint64_t)(v38 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v30 - v28) >> 1 > v39) {
            unint64_t v39 = (v30 - v28) >> 1;
          }
          if ((unint64_t)(v30 - v28) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v40 = v39;
          }
          if (v40) {
            unint64_t v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v40);
          }
          else {
            uint64_t v41 = 0;
          }
          v42 = (char *)(v40 + 4 * v38);
          *(_DWORD *)v42 = v37;
          v43 = v42 + 4;
          while (v34 != v28)
          {
            int v44 = *((_DWORD *)v34 - 1);
            v34 -= 4;
            *((_DWORD *)v42 - 1) = v44;
            v42 -= 4;
          }
          v30 = (char *)(v40 + 4 * v41);
          if (v28) {
            operator delete(v28);
          }
          v28 = v42;
          v34 = v43;
          a3 = v61;
        }
        else
        {
          *(_DWORD *)v34 = v36;
          v34 += 4;
        }
      }
      uint64_t v32 = [v31 countByEnumeratingWithState:&v62 objects:v73 count:16];
    }
    while (v32);
  }
  else
  {
    v34 = v28;
  }

  uint64_t v45 = v34 - v28;
  v46 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v34 == v28) {
    v47 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>> const&)::t;
  }
  else {
    v47 = v28;
  }
  uint64_t v48 = v45 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v46, v45 >> 2, 4uLL);
  if (v28 == v34)
  {
    LODWORD(v48) = 0;
  }
  else
  {
    v49 = v47 - 4;
    uint64_t v50 = v48;
    do
    {
      int v51 = flatbuffers::FlatBufferBuilder::ReferTo(v61, *(_DWORD *)&v49[4 * v50]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v61, v51);
      --v50;
    }
    while (v50);
  }
  unsigned int v52 = flatbuffers::FlatBufferBuilder::EndVector(v61, v48);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v61);
  *((unsigned char *)v61 + 70) = 1;
  int v53 = *((_DWORD *)v61 + 8);
  int v54 = *((_DWORD *)v61 + 12);
  int v55 = *((_DWORD *)v61 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v61, 4, SHIDWORD(v59));
  flatbuffers::FlatBufferBuilder::AddElement<float>(v61, 6, v6);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v61, 8, v59);
  if (v52)
  {
    int v56 = flatbuffers::FlatBufferBuilder::ReferTo(v61, v52);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v61, 10, v56);
  }
  v57.var0 = flatbuffers::FlatBufferBuilder::EndTable(v61, v53 - v54 + v55);
  if (v28) {
    operator delete(v28);
  }
  if (__p) {
    operator delete(__p);
  }
  return v57;
}

- (NSArray)server_feature_latency_distribution
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"server_feature_latency_distribution"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    float v5 = &root[-*(int *)root->var0];
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
            unint64_t v12 = [[QSSFinishAudio_ServerFeatureLatencyDistributionEntry alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"server_feature_latency_distribution"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__68__QSSFinishAudio_ServerFeatureLatencyDistributionEntry_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (NSArray)features_at_endpoint
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"features_at_endpoint"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u)
    {
      uint64_t v7 = *(unsigned __int16 *)v6[8].var0;
      if (v7)
      {
        uint64_t v8 = &root[v7];
        uint64_t v9 = *(unsigned int *)v8->var0;
        uint64_t v11 = &v8[v9 + 4];
        uint64_t v10 = *(unsigned int *)v8[v9].var0;
        if (v10)
        {
          uint64_t v12 = 4 * v10;
          do
          {
            LODWORD(v4) = *(_DWORD *)v11->var0;
            uint64_t v13 = [NSNumber numberWithFloat:v4];
            [v3 addObject:v13];

            v11 += 4;
            v12 -= 4;
          }
          while (v12);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"features_at_endpoint"];
  }
  return (NSArray *)v3;
}

- (float)total_audio_recorded_seconds
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 7u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[6].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (int)packet_count
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (QSSFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSFinishAudio;
  uint64_t v10 = [(QSSFinishAudio *)&v30 init];
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
      a4 = (const FinishAudio *)v13 + *v13;
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
      root = (siri::speech::schema_fb::FinishAudio *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::FinishAudio::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4
{
  return [(QSSFinishAudio *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSFinishAudio *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSFinishAudio)initWithFlatbuffData:(id)a3
{
  return [(QSSFinishAudio *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
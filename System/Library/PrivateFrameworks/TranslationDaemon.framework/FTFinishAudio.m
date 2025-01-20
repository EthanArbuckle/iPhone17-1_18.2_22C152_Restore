@interface FTFinishAudio
- (FTFinishAudio)initWithFlatbuffData:(id)a3;
- (FTFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4;
- (FTFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4 verify:(BOOL)a5;
- (NSArray)features_at_endpoint;
- (NSArray)server_feature_latency_distribution;
- (Offset<siri::speech::schema_fb::FinishAudio>)addObjectToBuffer:(void *)a3;
- (float)total_audio_recorded_seconds;
- (id)features_at_endpoint_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)server_feature_latency_distribution_objectAtIndex:(unint64_t)a3;
- (int)packet_count;
- (unint64_t)features_at_endpoint_count;
- (unint64_t)server_feature_latency_distribution_count;
- (void)features_at_endpoint_enumerateObjectsUsingBlock:(id)a3;
- (void)server_feature_latency_distribution_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTFinishAudio

- (FTFinishAudio)initWithFlatbuffData:(id)a3
{
  return [(FTFinishAudio *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTFinishAudio *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4
{
  return [(FTFinishAudio *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTFinishAudio;
  v10 = [(FTFinishAudio *)&v26 init];
  if (!v10) {
    goto LABEL_13;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_14;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)[*p_data bytes];
    a4 = (const FinishAudio *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_13;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_14;
  }
  uint64_t v17 = [*p_data bytes];
  uint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_26027B7E0;
  uint64_t v24 = 0;
  char v25 = 1;
  v19 = (siri::speech::schema_fb::FinishAudio *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::FinishAudio::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
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

- (NSArray)features_at_endpoint
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"features_at_endpoint"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__FTFinishAudio_features_at_endpoint__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTFinishAudio *)self features_at_endpoint_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"features_at_endpoint"];
  }
  return (NSArray *)v3;
}

uint64_t __37__FTFinishAudio_features_at_endpoint__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)features_at_endpoint_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"features_at_endpoint"];
  id v7 = v5;
  if (v5)
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    id v9 = (void *)v8;
    goto LABEL_8;
  }
  root = self->_root;
  v11 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v11->var0 >= 9u)
  {
    uint64_t v12 = *(unsigned __int16 *)v11[8].var0;
    if (v12)
    {
      LODWORD(v6) = *(_DWORD *)root[4 * a3 + 4 + v12 + *(unsigned int *)root[v12].var0].var0;
      uint64_t v8 = [NSNumber numberWithFloat:v6];
      goto LABEL_3;
    }
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

- (unint64_t)features_at_endpoint_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"features_at_endpoint"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 9u && (uint64_t v8 = *(unsigned __int16 *)v7[8].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)features_at_endpoint_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"features_at_endpoint"];
  id v7 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    id v9 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v9->var0 >= 9u)
    {
      uint64_t v10 = *(unsigned __int16 *)v9[8].var0;
      if (v10)
      {
        unsigned __int8 v19 = 0;
        uint64_t v11 = *(unsigned int *)root[v10].var0;
        uint64_t v12 = *(unsigned int *)root[v10 + v11].var0;
        if (v12)
        {
          uint64_t v13 = 0;
          uint64_t v14 = 4 * v12 - 4;
          uint64_t v15 = (uint64_t)&root[v10 + 4 + v11];
          do
          {
            LODWORD(v6) = *(_DWORD *)(v15 + 4 * v13);
            v16 = [NSNumber numberWithFloat:v6];
            v4[2](v4, v16, v13, &v19);
            int v17 = v19;

            ++v13;
            if (v17) {
              BOOL v18 = 1;
            }
            else {
              BOOL v18 = v14 == 0;
            }
            v14 -= 4;
          }
          while (!v18);
        }
      }
    }
  }
}

- (NSArray)server_feature_latency_distribution
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"server_feature_latency_distribution"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__FTFinishAudio_server_feature_latency_distribution__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTFinishAudio *)self server_feature_latency_distribution_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"server_feature_latency_distribution"];
  }
  return (NSArray *)v3;
}

uint64_t __52__FTFinishAudio_server_feature_latency_distribution__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)server_feature_latency_distribution_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"server_feature_latency_distribution"];
  double v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0xBu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[10].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTFinishAudio_ServerFeatureLatencyDistributionEntry alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)server_feature_latency_distribution_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"server_feature_latency_distribution"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (uint64_t v8 = *(unsigned __int16 *)v7[10].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)server_feature_latency_distribution_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTFinishAudio_ServerFeatureLatencyDistributionEntry *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"server_feature_latency_distribution"];
  double v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xBu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[10].var0;
      if (v9)
      {
        unsigned __int8 v20 = 0;
        uint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = (uint64_t)&v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 4 * v12 - 4;
          do
          {
            int v17 = [[FTFinishAudio_ServerFeatureLatencyDistributionEntry alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
            v4[2](v4, v17, v15, &v20);
            int v18 = v20;

            if (v18) {
              break;
            }
            ++v15;
            uint64_t v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }
}

- (Offset<siri::speech::schema_fb::FinishAudio>)addObjectToBuffer:(void *)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  int v51 = [(FTFinishAudio *)self packet_count];
  [(FTFinishAudio *)self total_audio_recorded_seconds];
  float v6 = v5;
  __p = 0;
  v62 = 0;
  v63 = 0;
  id v7 = [(FTFinishAudio *)self features_at_endpoint];
  std::vector<float>::reserve(&__p, [v7 count]);

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v8 = [(FTFinishAudio *)self features_at_endpoint];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v58 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v57 + 1) + 8 * i) floatValue];
        int v13 = v12;
        uint64_t v14 = v62;
        if (v62 >= v63)
        {
          uint64_t v16 = (char *)__p;
          uint64_t v17 = (v62 - (unsigned char *)__p) >> 2;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v19 = v63 - (unsigned char *)__p;
          if ((v63 - (unsigned char *)__p) >> 1 > v18) {
            unint64_t v18 = v19 >> 1;
          }
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v18;
          }
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v63, v20);
            uint64_t v16 = (char *)__p;
            uint64_t v14 = v62;
          }
          else
          {
            v21 = 0;
          }
          v22 = &v21[4 * v17];
          *(_DWORD *)v22 = v13;
          uint64_t v15 = v22 + 4;
          while (v14 != v16)
          {
            int v23 = *((_DWORD *)v14 - 1);
            v14 -= 4;
            *((_DWORD *)v22 - 1) = v23;
            v22 -= 4;
          }
          __p = v22;
          v62 = v15;
          v63 = &v21[4 * v20];
          if (v16) {
            operator delete(v16);
          }
        }
        else
        {
          *(_DWORD *)v62 = v12;
          uint64_t v15 = v14 + 4;
        }
        v62 = v15;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v9);
  }

  if (v62 == __p) {
    uint64_t v24 = (const unsigned __int8 *)&apple::aiml::flatbuffers2::data<float,std::allocator<float>>(std::vector<float> const&)::t;
  }
  else {
    uint64_t v24 = (const unsigned __int8 *)__p;
  }
  int v25 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<int>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v24, (v62 - (unsigned char *)__p) >> 2);
  memset(&v56, 0, sizeof(v56));
  objc_super v26 = [(FTFinishAudio *)self server_feature_latency_distribution];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v56, [v26 count]);

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v27 = [(FTFinishAudio *)self server_feature_latency_distribution];
  int v50 = v25;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v53 != v29) {
          objc_enumerationMutation(v27);
        }
        int v31 = [*(id *)(*((void *)&v52 + 1) + 8 * j) addObjectToBuffer:a3];
        int v32 = v31;
        std::vector<int>::pointer end = v56.__end_;
        if (v56.__end_ >= v56.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v56.__begin_;
          int64_t v36 = v56.__end_ - v56.__begin_;
          unint64_t v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v38 = (char *)v56.__end_cap_.__value_ - (char *)v56.__begin_;
          if (((char *)v56.__end_cap_.__value_ - (char *)v56.__begin_) >> 1 > v37) {
            unint64_t v37 = v38 >> 1;
          }
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v39 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v39 = v37;
          }
          if (v39)
          {
            v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v56.__end_cap_, v39);
            std::vector<int>::pointer begin = v56.__begin_;
            std::vector<int>::pointer end = v56.__end_;
          }
          else
          {
            v40 = 0;
          }
          v41 = (int *)&v40[4 * v36];
          int *v41 = v32;
          v34 = v41 + 1;
          while (end != begin)
          {
            int v42 = *--end;
            *--v41 = v42;
          }
          v56.__begin_ = v41;
          v56.__end_ = v34;
          v56.__end_cap_.__value_ = (int *)&v40[4 * v39];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v56.__end_ = v31;
          v34 = end + 1;
        }
        v56.__end_ = v34;
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v28);
  }

  if (v56.__end_ == v56.__begin_) {
    std::vector<int>::pointer v43 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>> const&)::t;
  }
  else {
    std::vector<int>::pointer v43 = v56.__begin_;
  }
  int v44 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v43, v56.__end_ - v56.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v45 = *((_DWORD *)a3 + 8);
  int v46 = *((_DWORD *)a3 + 12);
  int v47 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 4, v51, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>(a3, 6, v6, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v50);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v44);
  v48.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v45 - (unsigned __int16)v46 + v47);
  if (v56.__begin_)
  {
    v56.__end_ = v56.__begin_;
    operator delete(v56.__begin_);
  }
  if (__p)
  {
    v62 = (char *)__p;
    operator delete(__p);
  }
  return v48;
}

- (id)flatbuffData
{
  uint64_t v3 = 0;
  char v4 = 0;
  long long v5 = xmmword_26027B7F0;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  __int16 v10 = 256;
  uint64_t v11 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTFinishAudio *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__29__FTFinishAudio_flatbuffData__block_invoke(uint64_t a1)
{
  float result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

apple::aiml::flatbuffers2::DetachedBuffer *__67__FTFinishAudio_ServerFeatureLatencyDistributionEntry_flatbuffData__block_invoke(uint64_t a1)
{
  float result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

@end
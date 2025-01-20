@interface FTAudioAnalytics
- (FTAudioAnalytics)initWithFlatbuffData:(id)a3;
- (FTAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4;
- (FTAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4 verify:(BOOL)a5;
- (NSArray)acoustic_features;
- (NSArray)speech_recognition_features;
- (Offset<siri::speech::schema_fb::AudioAnalytics>)addObjectToBuffer:(void *)a3;
- (id)acoustic_features_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)speech_recognition_features_objectAtIndex:(unint64_t)a3;
- (unint64_t)acoustic_features_count;
- (unint64_t)speech_recognition_features_count;
- (void)acoustic_features_enumerateObjectsUsingBlock:(id)a3;
- (void)speech_recognition_features_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTAudioAnalytics

- (FTAudioAnalytics)initWithFlatbuffData:(id)a3
{
  return [(FTAudioAnalytics *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTAudioAnalytics *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4
{
  return [(FTAudioAnalytics *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTAudioAnalytics;
  v10 = [(FTAudioAnalytics *)&v26 init];
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
    a4 = (const AudioAnalytics *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::AudioAnalytics *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::AudioAnalytics::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSArray)speech_recognition_features
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"speech_recognition_features"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__FTAudioAnalytics_speech_recognition_features__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTAudioAnalytics *)self speech_recognition_features_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"speech_recognition_features"];
  }
  return (NSArray *)v3;
}

uint64_t __47__FTAudioAnalytics_speech_recognition_features__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)speech_recognition_features_objectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"speech_recognition_features"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 5u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[4].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTAudioAnalytics_SpeechRecognitionFeaturesEntry alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)speech_recognition_features_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"speech_recognition_features"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)speech_recognition_features_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTAudioAnalytics_SpeechRecognitionFeaturesEntry *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"speech_recognition_features"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 5u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[4].var0;
      if (v9)
      {
        unsigned __int8 v20 = 0;
        v10 = &root[v9];
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
            uint64_t v17 = [[FTAudioAnalytics_SpeechRecognitionFeaturesEntry alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSArray)acoustic_features
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"acoustic_features"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__FTAudioAnalytics_acoustic_features__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTAudioAnalytics *)self acoustic_features_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"acoustic_features"];
  }
  return (NSArray *)v3;
}

uint64_t __37__FTAudioAnalytics_acoustic_features__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)acoustic_features_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"acoustic_features"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTAudioAnalytics_AcousticFeaturesEntry alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)acoustic_features_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"acoustic_features"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 7u && (uint64_t v8 = *(unsigned __int16 *)v7[6].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)acoustic_features_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTAudioAnalytics_AcousticFeaturesEntry *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"acoustic_features"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[6].var0;
      if (v9)
      {
        unsigned __int8 v20 = 0;
        v10 = &root[v9];
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
            uint64_t v17 = [[FTAudioAnalytics_AcousticFeaturesEntry alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::AudioAnalytics>)addObjectToBuffer:(void *)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  memset(&v59, 0, sizeof(v59));
  unint64_t v5 = [(FTAudioAnalytics *)self speech_recognition_features];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v59, [v5 count]);

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v6 = [(FTAudioAnalytics *)self speech_recognition_features];
  v48 = self;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = [*(id *)(*((void *)&v55 + 1) + 8 * i) addObjectToBuffer:a3];
        int v11 = v10;
        std::vector<int>::pointer end = v59.__end_;
        if (v59.__end_ >= v59.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v59.__begin_;
          int64_t v15 = v59.__end_ - v59.__begin_;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v17 = (char *)v59.__end_cap_.__value_ - (char *)v59.__begin_;
          if (((char *)v59.__end_cap_.__value_ - (char *)v59.__begin_) >> 1 > v16) {
            unint64_t v16 = v17 >> 1;
          }
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18)
          {
            uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v59.__end_cap_, v18);
            std::vector<int>::pointer begin = v59.__begin_;
            std::vector<int>::pointer end = v59.__end_;
          }
          else
          {
            uint64_t v19 = 0;
          }
          unsigned __int8 v20 = (int *)&v19[4 * v15];
          int *v20 = v11;
          uint64_t v13 = v20 + 1;
          while (end != begin)
          {
            int v21 = *--end;
            *--unsigned __int8 v20 = v21;
          }
          v59.__begin_ = v20;
          v59.__end_ = v13;
          v59.__end_cap_.__value_ = (int *)&v19[4 * v18];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v59.__end_ = v10;
          uint64_t v13 = end + 1;
        }
        v59.__end_ = v13;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v7);
  }

  if (v59.__end_ == v59.__begin_) {
    std::vector<int>::pointer v22 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>> const&)::t;
  }
  else {
    std::vector<int>::pointer v22 = v59.__begin_;
  }
  int v23 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v22, v59.__end_ - v59.__begin_);
  memset(&v54, 0, sizeof(v54));
  uint64_t v24 = [(FTAudioAnalytics *)v48 acoustic_features];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v54, [v24 count]);

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  char v25 = [(FTAudioAnalytics *)v48 acoustic_features];
  int v49 = v23;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v51 != v27) {
          objc_enumerationMutation(v25);
        }
        int v29 = [*(id *)(*((void *)&v50 + 1) + 8 * j) addObjectToBuffer:a3];
        int v30 = v29;
        std::vector<int>::pointer v31 = v54.__end_;
        if (v54.__end_ >= v54.__end_cap_.__value_)
        {
          std::vector<int>::pointer v33 = v54.__begin_;
          int64_t v34 = v54.__end_ - v54.__begin_;
          unint64_t v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v36 = (char *)v54.__end_cap_.__value_ - (char *)v54.__begin_;
          if (((char *)v54.__end_cap_.__value_ - (char *)v54.__begin_) >> 1 > v35) {
            unint64_t v35 = v36 >> 1;
          }
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v37 = v35;
          }
          if (v37)
          {
            v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v54.__end_cap_, v37);
            std::vector<int>::pointer v33 = v54.__begin_;
            std::vector<int>::pointer v31 = v54.__end_;
          }
          else
          {
            v38 = 0;
          }
          v39 = (int *)&v38[4 * v34];
          int *v39 = v30;
          v32 = v39 + 1;
          while (v31 != v33)
          {
            int v40 = *--v31;
            *--v39 = v40;
          }
          v54.__begin_ = v39;
          v54.__end_ = v32;
          v54.__end_cap_.__value_ = (int *)&v38[4 * v37];
          if (v33) {
            operator delete(v33);
          }
        }
        else
        {
          *v54.__end_ = v29;
          v32 = v31 + 1;
        }
        v54.__end_ = v32;
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v26);
  }

  if (v54.__end_ == v54.__begin_) {
    std::vector<int>::pointer v41 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>> const&)::t;
  }
  else {
    std::vector<int>::pointer v41 = v54.__begin_;
  }
  int v42 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v41, v54.__end_ - v54.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v43 = *((_DWORD *)a3 + 8);
  int v44 = *((_DWORD *)a3 + 12);
  int v45 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v49);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v42);
  v46.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v43 - (unsigned __int16)v44 + v45);
  if (v54.__begin_)
  {
    v54.__end_ = v54.__begin_;
    operator delete(v54.__begin_);
  }
  if (v59.__begin_)
  {
    v59.__end_ = v59.__begin_;
    operator delete(v59.__begin_);
  }
  return v46;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTAudioAnalytics *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__32__FTAudioAnalytics_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
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

apple::aiml::flatbuffers2::DetachedBuffer *__63__FTAudioAnalytics_SpeechRecognitionFeaturesEntry_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

apple::aiml::flatbuffers2::DetachedBuffer *__54__FTAudioAnalytics_AcousticFeaturesEntry_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

@end
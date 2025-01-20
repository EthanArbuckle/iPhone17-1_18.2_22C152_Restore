@interface QSSAudioAnalytics
- (NSArray)acoustic_features;
- (NSArray)speech_recognition_features;
- (Offset<siri::speech::schema_fb::AudioAnalytics>)addObjectToBuffer:(void *)a3;
- (QSSAudioAnalytics)initWithFlatbuffData:(id)a3;
- (QSSAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4;
- (QSSAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSAudioAnalytics

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
  v2.var0 = [(QSSAudioAnalytics *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__33__QSSAudioAnalytics_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::AudioAnalytics>)addObjectToBuffer:(void *)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSAudioAnalytics *)self speech_recognition_features];
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

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v10 = [(QSSAudioAnalytics *)self speech_recognition_features];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v73 objects:v78 count:16];
  obuint64_t j = self;
  v68 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v11)
  {
    uint64_t v12 = *(void *)v74;
    uint64_t v13 = v7;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v74 != v12) {
          objc_enumerationMutation(v10);
        }
        int v15 = [*(id *)(*((void *)&v73 + 1) + 8 * i) addObjectToBuffer:a3];
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
          a3 = v68;
        }
        else
        {
          *(_DWORD *)uint64_t v13 = v15;
          v13 += 4;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v73 objects:v78 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v13 = v7;
  }

  uint64_t v24 = v13 - v7;
  v25 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v13 == v7) {
    v26 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>> const&)::t;
  }
  else {
    v26 = v7;
  }
  uint64_t v27 = v24 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v25, v24 >> 2, 4uLL);
  if (v7 == v13)
  {
    LODWORD(v27) = 0;
  }
  else
  {
    v28 = v26 - 4;
    uint64_t v29 = v27;
    do
    {
      int v30 = flatbuffers::FlatBufferBuilder::ReferTo(v68, *(_DWORD *)&v28[4 * v29]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v68, v30);
      --v29;
    }
    while (v29);
  }
  unsigned int v65 = flatbuffers::FlatBufferBuilder::EndVector(v68, v27);
  v31 = [(QSSAudioAnalytics *)obj acoustic_features];
  unint64_t v32 = [v31 count];
  v33 = v68;
  if (v32)
  {
    if (v32 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v32);
    v36 = &v34[4 * v35];
  }
  else
  {
    v34 = 0;
    v36 = 0;
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obja = [(QSSAudioAnalytics *)obj acoustic_features];
  uint64_t v37 = [obja countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v70;
    v39 = v34;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v70 != v38) {
          objc_enumerationMutation(obja);
        }
        int v41 = [*(id *)(*((void *)&v69 + 1) + 8 * j) addObjectToBuffer:v33];
        int v42 = v41;
        if (v39 >= v36)
        {
          uint64_t v43 = (v39 - v34) >> 2;
          unint64_t v44 = v43 + 1;
          if ((unint64_t)(v43 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v36 - v34) >> 1 > v44) {
            unint64_t v44 = (v36 - v34) >> 1;
          }
          if ((unint64_t)(v36 - v34) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v45 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v45 = v44;
          }
          if (v45) {
            unint64_t v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v45);
          }
          else {
            uint64_t v46 = 0;
          }
          v47 = (char *)(v45 + 4 * v43);
          *(_DWORD *)v47 = v42;
          v48 = v47 + 4;
          while (v39 != v34)
          {
            int v49 = *((_DWORD *)v39 - 1);
            v39 -= 4;
            *((_DWORD *)v47 - 1) = v49;
            v47 -= 4;
          }
          v36 = (char *)(v45 + 4 * v46);
          if (v34) {
            operator delete(v34);
          }
          v34 = v47;
          v39 = v48;
          v33 = v68;
        }
        else
        {
          *(_DWORD *)v39 = v41;
          v39 += 4;
        }
      }
      uint64_t v37 = [obja countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v37);
  }
  else
  {
    v39 = v34;
  }

  uint64_t v50 = v39 - v34;
  v51 = v33;
  if (v39 == v34) {
    v52 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>> const&)::t;
  }
  else {
    v52 = v34;
  }
  uint64_t v53 = v50 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v51, v50 >> 2, 4uLL);
  if (v34 == v39)
  {
    LODWORD(v53) = 0;
  }
  else
  {
    v54 = v52 - 4;
    uint64_t v55 = v53;
    do
    {
      int v56 = flatbuffers::FlatBufferBuilder::ReferTo(v68, *(_DWORD *)&v54[4 * v55]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v68, v56);
      --v55;
    }
    while (v55);
  }
  unsigned int v57 = flatbuffers::FlatBufferBuilder::EndVector(v68, v53);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v68);
  *((unsigned char *)v68 + 70) = 1;
  int v58 = *((_DWORD *)v68 + 8);
  int v59 = *((_DWORD *)v68 + 12);
  int v60 = *((_DWORD *)v68 + 10);
  if (v65)
  {
    int v61 = flatbuffers::FlatBufferBuilder::ReferTo(v68, v65);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v68, 4, v61);
  }
  if (v57)
  {
    int v62 = flatbuffers::FlatBufferBuilder::ReferTo(v68, v57);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v68, 6, v62);
  }
  v63.var0 = flatbuffers::FlatBufferBuilder::EndTable(v68, v58 - v59 + v60);
  if (v34) {
    operator delete(v34);
  }
  if (v7) {
    operator delete(v7);
  }
  return v63;
}

- (NSArray)acoustic_features
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"acoustic_features"];
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
            uint64_t v12 = [[QSSAudioAnalytics_AcousticFeaturesEntry alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"acoustic_features"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__55__QSSAudioAnalytics_AcousticFeaturesEntry_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (NSArray)speech_recognition_features
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"speech_recognition_features"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
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
            uint64_t v12 = [[QSSAudioAnalytics_SpeechRecognitionFeaturesEntry alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"speech_recognition_features"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__64__QSSAudioAnalytics_SpeechRecognitionFeaturesEntry_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (QSSAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSAudioAnalytics;
  uint64_t v10 = [(QSSAudioAnalytics *)&v30 init];
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
      a4 = (const AudioAnalytics *)v13 + *v13;
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
      root = (siri::speech::schema_fb::AudioAnalytics *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::AudioAnalytics::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4
{
  return [(QSSAudioAnalytics *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSAudioAnalytics *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSAudioAnalytics)initWithFlatbuffData:(id)a3
{
  return [(QSSAudioAnalytics *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
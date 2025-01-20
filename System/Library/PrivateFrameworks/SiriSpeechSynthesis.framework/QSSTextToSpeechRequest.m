@interface QSSTextToSpeechRequest
- (BOOL)enable_word_timing_info;
- (NSArray)context_info;
- (NSString)gender;
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)text;
- (NSString)voice_name;
- (Offset<siri::speech::schema_fb::TextToSpeechRequest>)addObjectToBuffer:(void *)a3;
- (QSSTTSRequestFeatureFlags)feature_flags;
- (QSSTextToSpeechRequest)initWithFlatbuffData:(id)a3;
- (QSSTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4;
- (QSSTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4 verify:(BOOL)a5;
- (QSSTextToSpeechRequestContext)context;
- (QSSTextToSpeechRequestDebug)debug;
- (QSSTextToSpeechRequestDevConfig)dev_config;
- (QSSTextToSpeechRequestExperiment)experiment;
- (QSSTextToSpeechRequestMeta)meta_info;
- (QSSTextToSpeechRequestProsodyControlConfig)prosody_control_config;
- (QSSTextToSpeechRequestProsodyTransferConfig)prosody_config;
- (QSSTextToSpeechUserProfile)profile;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)audio_type;
- (int64_t)preferred_voice_type;
@end

@implementation QSSTextToSpeechRequest

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
  v2.var0 = [(QSSTextToSpeechRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__38__QSSTextToSpeechRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  v4 = [(QSSTextToSpeechRequest *)self speech_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v8 = [(QSSTextToSpeechRequest *)self session_id];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DEBFAF8;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  unsigned int v86 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  __int16 v12 = [(QSSTextToSpeechRequest *)self language];
  uint64_t v13 = v12;
  if (!v12) {
    __int16 v12 = &stru_26DEBFAF8;
  }
  v14 = (const char *)[(__CFString *)v12 UTF8String];
  size_t v15 = strlen(v14);
  unsigned int v85 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  v16 = [(QSSTextToSpeechRequest *)self gender];
  v17 = v16;
  if (!v16) {
    v16 = &stru_26DEBFAF8;
  }
  v18 = (const char *)[(__CFString *)v16 UTF8String];
  size_t v19 = strlen(v18);
  unsigned int v84 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  v20 = [(QSSTextToSpeechRequest *)self text];
  v21 = v20;
  if (!v20) {
    v20 = &stru_26DEBFAF8;
  }
  v22 = (const char *)[(__CFString *)v20 UTF8String];
  size_t v23 = strlen(v22);
  unsigned int v83 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v22, v23);

  int v82 = [(QSSTextToSpeechRequest *)self audio_type];
  int v81 = [(QSSTextToSpeechRequest *)self enable_word_timing_info];
  v24 = [(QSSTextToSpeechRequest *)self voice_name];
  v25 = v24;
  if (!v24) {
    v24 = &stru_26DEBFAF8;
  }
  v26 = (const char *)[(__CFString *)v24 UTF8String];
  size_t v27 = strlen(v26);
  unsigned int v80 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v26, v27);

  v28 = [(QSSTextToSpeechRequest *)self context_info];
  unint64_t v29 = [v28 count];
  v30 = a3;
  if (v29)
  {
    if (v29 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v29);
    v33 = &v31[4 * v32];
  }
  else
  {
    v31 = 0;
    v33 = 0;
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v34 = [(QSSTextToSpeechRequest *)self context_info];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v91 objects:v95 count:16];
  v88 = self;
  if (v35)
  {
    uint64_t v36 = *(void *)v92;
    v37 = v31;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v92 != v36) {
          objc_enumerationMutation(v34);
        }
        int v39 = [*(id *)(*((void *)&v91 + 1) + 8 * i) addObjectToBuffer:v30];
        int v40 = v39;
        if (v37 >= v33)
        {
          uint64_t v41 = (v37 - v31) >> 2;
          unint64_t v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v33 - v31) >> 1 > v42) {
            unint64_t v42 = (v33 - v31) >> 1;
          }
          if ((unint64_t)(v33 - v31) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v43 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v43 = v42;
          }
          if (v43) {
            unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v43);
          }
          else {
            uint64_t v44 = 0;
          }
          v45 = (char *)(v43 + 4 * v41);
          *(_DWORD *)v45 = v40;
          v46 = v45 + 4;
          while (v37 != v31)
          {
            int v47 = *((_DWORD *)v37 - 1);
            v37 -= 4;
            *((_DWORD *)v45 - 1) = v47;
            v45 -= 4;
          }
          v33 = (char *)(v43 + 4 * v44);
          if (v31) {
            operator delete(v31);
          }
          v31 = v45;
          v37 = v46;
          v30 = a3;
        }
        else
        {
          *(_DWORD *)v37 = v39;
          v37 += 4;
        }
      }
      uint64_t v35 = [v34 countByEnumeratingWithState:&v91 objects:v95 count:16];
    }
    while (v35);
  }
  else
  {
    v37 = v31;
  }

  uint64_t v48 = v37 - v31;
  if (v37 == v31) {
    v49 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>> const&)::t;
  }
  else {
    v49 = v31;
  }
  uint64_t v50 = v48 >> 2;
  v51 = (flatbuffers::FlatBufferBuilder *)a3;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v48 >> 2, 4uLL);
  if (v31 == v37)
  {
    LODWORD(v50) = 0;
  }
  else
  {
    v52 = v49 - 4;
    uint64_t v53 = v50;
    do
    {
      int v54 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v52[4 * v53]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v54);
      --v53;
    }
    while (v53);
    v51 = (flatbuffers::FlatBufferBuilder *)a3;
  }
  unsigned int v89 = flatbuffers::FlatBufferBuilder::EndVector(v51, v50);
  int v79 = [(QSSTextToSpeechRequest *)v88 preferred_voice_type];
  v55 = [(QSSTextToSpeechRequest *)v88 meta_info];
  unsigned int v78 = [v55 addObjectToBuffer:v51];

  v56 = [(QSSTextToSpeechRequest *)v88 context];
  unsigned int v77 = [v56 addObjectToBuffer:a3];

  v57 = [(QSSTextToSpeechRequest *)v88 experiment];
  unsigned int v76 = [v57 addObjectToBuffer:a3];

  v58 = [(QSSTextToSpeechRequest *)v88 feature_flags];
  unsigned int v75 = [v58 addObjectToBuffer:a3];

  v59 = [(QSSTextToSpeechRequest *)v88 debug];
  unsigned int v60 = [v59 addObjectToBuffer:a3];

  v61 = [(QSSTextToSpeechRequest *)v88 profile];
  unsigned int v62 = [v61 addObjectToBuffer:a3];

  v63 = [(QSSTextToSpeechRequest *)v88 dev_config];
  unsigned int v64 = [v63 addObjectToBuffer:a3];

  v65 = [(QSSTextToSpeechRequest *)v88 prosody_config];
  unsigned int v66 = [v65 addObjectToBuffer:a3];

  v67 = [(QSSTextToSpeechRequest *)v88 prosody_control_config];
  unsigned int v68 = [v67 addObjectToBuffer:a3];

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v69 = *((_DWORD *)a3 + 8);
  int v70 = *((_DWORD *)a3 + 12);
  int v71 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v86);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v85);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v84);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v83);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v82);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 16, v81);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v80);
  if (v89)
  {
    int v72 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v89);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v72);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 22, v79);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 24, v78);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 26, v77);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 28, v76);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 30, v75);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 32, v60);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 34, v62);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 36, v64);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 38, v66);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 40, v68);
  v73.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v69 - v70 + v71);
  if (v31) {
    operator delete(v31);
  }
  return v73;
}

- (QSSTextToSpeechRequestProsodyControlConfig)prosody_control_config
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prosody_control_config"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestProsodyControlConfig alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x29u && (uint64_t v7 = *(unsigned __int16 *)v6[40].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    v3 = [(QSSTextToSpeechRequestProsodyControlConfig *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"prosody_control_config"];
  }
  return v3;
}

- (QSSTextToSpeechRequestProsodyTransferConfig)prosody_config
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prosody_config"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestProsodyTransferConfig alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x27u && (uint64_t v7 = *(unsigned __int16 *)v6[38].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    v3 = [(QSSTextToSpeechRequestProsodyTransferConfig *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"prosody_config"];
  }
  return v3;
}

- (QSSTextToSpeechRequestDevConfig)dev_config
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"dev_config"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestDevConfig alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x25u && (uint64_t v7 = *(unsigned __int16 *)v6[36].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    v3 = [(QSSTextToSpeechRequestDevConfig *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"dev_config"];
  }
  return v3;
}

- (QSSTextToSpeechUserProfile)profile
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"profile"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechUserProfile alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x23u && (uint64_t v7 = *(unsigned __int16 *)v6[34].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    v3 = [(QSSTextToSpeechUserProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"profile"];
  }
  return v3;
}

- (QSSTextToSpeechRequestDebug)debug
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"debug"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestDebug alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x21u && (uint64_t v7 = *(unsigned __int16 *)v6[32].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    v3 = [(QSSTextToSpeechRequestDebug *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"debug"];
  }
  return v3;
}

- (QSSTTSRequestFeatureFlags)feature_flags
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"feature_flags"];
  if (!v3)
  {
    v4 = [QSSTTSRequestFeatureFlags alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Fu && (uint64_t v7 = *(unsigned __int16 *)v6[30].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    v3 = [(QSSTTSRequestFeatureFlags *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"feature_flags"];
  }
  return v3;
}

- (QSSTextToSpeechRequestExperiment)experiment
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"experiment"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestExperiment alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Du && (uint64_t v7 = *(unsigned __int16 *)v6[28].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    v3 = [(QSSTextToSpeechRequestExperiment *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"experiment"];
  }
  return v3;
}

- (QSSTextToSpeechRequestContext)context
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestContext alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Bu && (uint64_t v7 = *(unsigned __int16 *)v6[26].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    v3 = [(QSSTextToSpeechRequestContext *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"context"];
  }
  return v3;
}

- (QSSTextToSpeechRequestMeta)meta_info
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"meta_info"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestMeta alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (uint64_t v7 = *(unsigned __int16 *)v6[24].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    v3 = [(QSSTextToSpeechRequestMeta *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"meta_info"];
  }
  return v3;
}

- (int64_t)preferred_voice_type
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x17u && (uint64_t v4 = *(unsigned __int16 *)v3[22].var0) != 0) {
    return *(unsigned int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSArray)context_info
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_info"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x15u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[20].var0;
      if (v6)
      {
        uint64_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSTextToSpeechRequest_ContextInfoEntry alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
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

flatbuffers::DetachedBuffer *__55__QSSTextToSpeechRequest_ContextInfoEntry_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (NSString)voice_name
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (BOOL)enable_word_timing_info
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (int64_t)audio_type
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0) {
    return *(unsigned int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)text
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)gender
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)language
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)session_id
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)speech_id
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTextToSpeechRequest;
  uint64_t v10 = [(QSSTextToSpeechRequest *)&v30 init];
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
      a4 = (const TextToSpeechRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TextToSpeechRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechRequest::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          size_t v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  size_t v23 = v11;
LABEL_17:

  return v23;
}

- (QSSTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4
{
  return [(QSSTextToSpeechRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextToSpeechRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
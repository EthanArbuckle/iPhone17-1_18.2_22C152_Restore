@interface QSSStartTextToSpeechStreamingRequest
- (BOOL)enable_word_timing_info;
- (NSArray)context_info;
- (NSString)gender;
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)stream_id;
- (NSString)text;
- (NSString)voice_name;
- (Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest>)addObjectToBuffer:(void *)a3;
- (QSSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3;
- (QSSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3 root:(const StartTextToSpeechStreamingRequest *)a4;
- (QSSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3 root:(const StartTextToSpeechStreamingRequest *)a4 verify:(BOOL)a5;
- (QSSTTSRequestFeatureFlags)feature_flags;
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

@implementation QSSStartTextToSpeechStreamingRequest

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
  v2.var0 = [(QSSStartTextToSpeechStreamingRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__52__QSSStartTextToSpeechStreamingRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  v4 = [(QSSStartTextToSpeechStreamingRequest *)self speech_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v8 = [(QSSStartTextToSpeechStreamingRequest *)self session_id];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DEBFAF8;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  unsigned int v89 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  __int16 v12 = [(QSSStartTextToSpeechStreamingRequest *)self stream_id];
  uint64_t v13 = v12;
  if (!v12) {
    __int16 v12 = &stru_26DEBFAF8;
  }
  v14 = (const char *)[(__CFString *)v12 UTF8String];
  size_t v15 = strlen(v14);
  unsigned int v88 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  v16 = [(QSSStartTextToSpeechStreamingRequest *)self language];
  v17 = v16;
  if (!v16) {
    v16 = &stru_26DEBFAF8;
  }
  v18 = (const char *)[(__CFString *)v16 UTF8String];
  size_t v19 = strlen(v18);
  unsigned int v87 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  v20 = [(QSSStartTextToSpeechStreamingRequest *)self gender];
  v21 = v20;
  if (!v20) {
    v20 = &stru_26DEBFAF8;
  }
  v22 = (const char *)[(__CFString *)v20 UTF8String];
  size_t v23 = strlen(v22);
  unsigned int v86 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v22, v23);

  v24 = [(QSSStartTextToSpeechStreamingRequest *)self text];
  v25 = v24;
  if (!v24) {
    v24 = &stru_26DEBFAF8;
  }
  v26 = (const char *)[(__CFString *)v24 UTF8String];
  size_t v27 = strlen(v26);
  unsigned int v85 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v26, v27);

  int v84 = [(QSSStartTextToSpeechStreamingRequest *)self audio_type];
  int v83 = [(QSSStartTextToSpeechStreamingRequest *)self enable_word_timing_info];
  v28 = [(QSSStartTextToSpeechStreamingRequest *)self voice_name];
  v29 = v28;
  if (!v28) {
    v28 = &stru_26DEBFAF8;
  }
  v30 = (const char *)[(__CFString *)v28 UTF8String];
  size_t v31 = strlen(v30);
  unsigned int v82 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v30, v31);

  v32 = [(QSSStartTextToSpeechStreamingRequest *)self context_info];
  unint64_t v33 = [v32 count];
  v34 = a3;
  if (v33)
  {
    if (v33 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v33);
    v37 = &v35[4 * v36];
  }
  else
  {
    v35 = 0;
    v37 = 0;
  }

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v38 = [(QSSStartTextToSpeechStreamingRequest *)self context_info];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v95 objects:v99 count:16];
  v91 = self;
  if (v39)
  {
    uint64_t v40 = *(void *)v96;
    v41 = v35;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v96 != v40) {
          objc_enumerationMutation(v38);
        }
        int v43 = [*(id *)(*((void *)&v95 + 1) + 8 * i) addObjectToBuffer:v34];
        int v44 = v43;
        if (v41 >= v37)
        {
          uint64_t v45 = (v41 - v35) >> 2;
          unint64_t v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v37 - v35) >> 1 > v46) {
            unint64_t v46 = (v37 - v35) >> 1;
          }
          if ((unint64_t)(v37 - v35) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v47 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v47 = v46;
          }
          if (v47) {
            unint64_t v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v47);
          }
          else {
            uint64_t v48 = 0;
          }
          v49 = (char *)(v47 + 4 * v45);
          *(_DWORD *)v49 = v44;
          v50 = v49 + 4;
          if (v41 == v35)
          {
            v34 = a3;
          }
          else
          {
            v34 = a3;
            do
            {
              int v51 = *((_DWORD *)v41 - 1);
              v41 -= 4;
              *((_DWORD *)v49 - 1) = v51;
              v49 -= 4;
            }
            while (v41 != v35);
          }
          v37 = (char *)(v47 + 4 * v48);
          if (v35) {
            operator delete(v35);
          }
          v35 = v49;
          v41 = v50;
        }
        else
        {
          *(_DWORD *)v41 = v43;
          v41 += 4;
          v34 = a3;
        }
      }
      uint64_t v39 = [v38 countByEnumeratingWithState:&v95 objects:v99 count:16];
    }
    while (v39);
  }
  else
  {
    v41 = v35;
  }

  uint64_t v52 = v41 - v35;
  if (v41 == v35) {
    v53 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest_::ContextInfoEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest_::ContextInfoEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest_::ContextInfoEntry>> const&)::t;
  }
  else {
    v53 = v35;
  }
  uint64_t v54 = v52 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v52 >> 2, 4uLL);
  if (v35 == v41)
  {
    LODWORD(v54) = 0;
  }
  else
  {
    v55 = v53 - 4;
    uint64_t v56 = v54;
    do
    {
      int v57 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v55[4 * v56]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v57);
      --v56;
    }
    while (v56);
  }
  unsigned int v93 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v54);
  int v81 = [(QSSStartTextToSpeechStreamingRequest *)v91 preferred_voice_type];
  v58 = [(QSSStartTextToSpeechStreamingRequest *)v91 meta_info];
  unsigned int v80 = [v58 addObjectToBuffer:a3];

  v59 = [(QSSStartTextToSpeechStreamingRequest *)v91 context];
  unsigned int v79 = [v59 addObjectToBuffer:a3];

  v60 = [(QSSStartTextToSpeechStreamingRequest *)v91 experiment];
  unsigned int v78 = [v60 addObjectToBuffer:a3];

  v61 = [(QSSStartTextToSpeechStreamingRequest *)v91 feature_flags];
  unsigned int v62 = [v61 addObjectToBuffer:a3];

  v63 = [(QSSStartTextToSpeechStreamingRequest *)v91 debug];
  unsigned int v64 = [v63 addObjectToBuffer:a3];

  v65 = [(QSSStartTextToSpeechStreamingRequest *)v91 profile];
  unsigned int v66 = [v65 addObjectToBuffer:a3];

  v67 = [(QSSStartTextToSpeechStreamingRequest *)v91 dev_config];
  unsigned int v68 = [v67 addObjectToBuffer:a3];

  v69 = [(QSSStartTextToSpeechStreamingRequest *)v91 prosody_config];
  unsigned int v70 = [v69 addObjectToBuffer:a3];

  v71 = [(QSSStartTextToSpeechStreamingRequest *)v91 prosody_control_config];
  unsigned int v92 = [v71 addObjectToBuffer:a3];

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v72 = *((_DWORD *)a3 + 8);
  int v73 = *((_DWORD *)a3 + 12);
  int v74 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v89);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v88);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v87);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v86);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v85);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v84);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 18, v83);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 20, v82);
  if (v93)
  {
    int v75 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v93);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 22, v75);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 24, v81);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 26, v80);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 28, v79);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 30, v78);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 32, v62);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 34, v64);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 36, v66);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 38, v68);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 40, v70);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 42, v92);
  v76.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v72 - v73 + v74);
  if (v35) {
    operator delete(v35);
  }
  return v76;
}

- (QSSTextToSpeechRequestProsodyControlConfig)prosody_control_config
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prosody_control_config"];
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestProsodyControlConfig alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x2Bu && (uint64_t v7 = *(unsigned __int16 *)v6[42].var0) != 0) {
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
    if (*(unsigned __int16 *)v6->var0 >= 0x29u && (uint64_t v7 = *(unsigned __int16 *)v6[40].var0) != 0) {
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
    if (*(unsigned __int16 *)v6->var0 >= 0x27u && (uint64_t v7 = *(unsigned __int16 *)v6[38].var0) != 0) {
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
    if (*(unsigned __int16 *)v6->var0 >= 0x25u && (uint64_t v7 = *(unsigned __int16 *)v6[36].var0) != 0) {
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
    if (*(unsigned __int16 *)v6->var0 >= 0x23u && (uint64_t v7 = *(unsigned __int16 *)v6[34].var0) != 0) {
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
    if (*(unsigned __int16 *)v6->var0 >= 0x21u && (uint64_t v7 = *(unsigned __int16 *)v6[32].var0) != 0) {
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
    if (*(unsigned __int16 *)v6->var0 >= 0x1Fu && (uint64_t v7 = *(unsigned __int16 *)v6[30].var0) != 0) {
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
    if (*(unsigned __int16 *)v6->var0 >= 0x1Du && (uint64_t v7 = *(unsigned __int16 *)v6[28].var0) != 0) {
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
    if (*(unsigned __int16 *)v6->var0 >= 0x1Bu && (uint64_t v7 = *(unsigned __int16 *)v6[26].var0) != 0) {
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
  if (*(unsigned __int16 *)v3->var0 >= 0x19u && (uint64_t v4 = *(unsigned __int16 *)v3[24].var0) != 0) {
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
    if (*(unsigned __int16 *)v5->var0 >= 0x17u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[22].var0;
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
            __int16 v12 = [[QSSStartTextToSpeechStreamingRequest_ContextInfoEntry alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
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

flatbuffers::DetachedBuffer *__69__QSSStartTextToSpeechStreamingRequest_ContextInfoEntry_flatbuffData__block_invoke(uint64_t a1)
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
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 20].var0;
  if (*(_WORD *)root[-v3 + 20].var0)
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
  return *(unsigned __int16 *)v3->var0 >= 0x13u && (uint64_t v4 = *(unsigned __int16 *)v3[18].var0) != 0 && root[v4].var0[0] != 0;
}

- (int64_t)audio_type
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0) {
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
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
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

- (NSString)language
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

- (NSString)stream_id
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

- (QSSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3 root:(const StartTextToSpeechStreamingRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSStartTextToSpeechStreamingRequest;
  uint64_t v10 = [(QSSStartTextToSpeechStreamingRequest *)&v30 init];
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
      a4 = (const StartTextToSpeechStreamingRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::StartTextToSpeechStreamingRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3 root:(const StartTextToSpeechStreamingRequest *)a4
{
  return [(QSSStartTextToSpeechStreamingRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSStartTextToSpeechStreamingRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSStartTextToSpeechStreamingRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
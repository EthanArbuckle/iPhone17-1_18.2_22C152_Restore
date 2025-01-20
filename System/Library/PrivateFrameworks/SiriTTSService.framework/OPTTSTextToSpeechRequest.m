@interface OPTTSTextToSpeechRequest
- (BOOL)enable_word_timing_info;
- (NSArray)context_info;
- (NSString)gender;
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)text;
- (NSString)voice_name;
- (OPTTSTTSRequestFeatureFlags)feature_flags;
- (OPTTSTextToSpeechRequest)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4;
- (OPTTSTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4 verify:(BOOL)a5;
- (OPTTSTextToSpeechRequestContext)context;
- (OPTTSTextToSpeechRequestDebug)debug;
- (OPTTSTextToSpeechRequestDevConfig)dev_config;
- (OPTTSTextToSpeechRequestExperiment)experiment;
- (OPTTSTextToSpeechRequestMeta)meta_info;
- (OPTTSTextToSpeechRequestProsodyControlConfig)prosody_control_config;
- (OPTTSTextToSpeechRequestProsodyTransferConfig)prosody_config;
- (OPTTSTextToSpeechUserProfile)profile;
- (Offset<siri::speech::schema_fb::TextToSpeechRequest>)addObjectToBuffer:(void *)a3;
- (id)context_info_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)audio_type;
- (int64_t)preferred_voice_type;
- (unint64_t)context_info_count;
- (void)context_info_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation OPTTSTextToSpeechRequest

apple::aiml::flatbuffers2::DetachedBuffer *__57__OPTTSTextToSpeechRequest_ContextInfoEntry_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_19CEE1A10;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(OPTTSTextToSpeechRequest *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__40__OPTTSTextToSpeechRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(OPTTSTextToSpeechRequest *)self speech_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_1EEE20510;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  long long v9 = [(OPTTSTextToSpeechRequest *)self session_id];
  uint64_t v10 = v9;
  if (!v9) {
    long long v9 = &stru_1EEE20510;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  unsigned int v75 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  uint64_t v13 = [(OPTTSTextToSpeechRequest *)self language];
  v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_1EEE20510;
  }
  v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  unsigned int v74 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  v17 = [(OPTTSTextToSpeechRequest *)self gender];
  v18 = v17;
  if (!v17) {
    v17 = &stru_1EEE20510;
  }
  v19 = (const char *)[(__CFString *)v17 UTF8String];
  size_t v20 = strlen(v19);
  unsigned int v73 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  v21 = [(OPTTSTextToSpeechRequest *)self text];
  v22 = v21;
  if (!v21) {
    v21 = &stru_1EEE20510;
  }
  v23 = (const char *)[(__CFString *)v21 UTF8String];
  size_t v24 = strlen(v23);
  unsigned int v72 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v23, v24);

  int v71 = [(OPTTSTextToSpeechRequest *)self audio_type];
  int v70 = [(OPTTSTextToSpeechRequest *)self enable_word_timing_info];
  v25 = [(OPTTSTextToSpeechRequest *)self voice_name];
  v26 = v25;
  if (!v25) {
    v25 = &stru_1EEE20510;
  }
  v27 = (const char *)[(__CFString *)v25 UTF8String];
  size_t v28 = strlen(v27);
  unsigned int v29 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27, v28);

  v85 = 0;
  v86 = 0;
  unint64_t v87 = 0;
  v30 = [(OPTTSTextToSpeechRequest *)self context_info];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v85, [v30 count]);

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = [(OPTTSTextToSpeechRequest *)self context_info];
  uint64_t v31 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
  unsigned int v69 = v29;
  v77 = self;
  v32 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  v33 = v85;
  if (v31)
  {
    uint64_t v34 = *(void *)v82;
    unint64_t v35 = v87;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v82 != v34) {
          objc_enumerationMutation(obj);
        }
        int v37 = [*(id *)(*((void *)&v81 + 1) + 8 * i) addObjectToBuffer:v32];
        int v38 = v37;
        v39 = v86;
        if ((unint64_t)v86 >= v35)
        {
          uint64_t v41 = (v86 - v33) >> 2;
          unint64_t v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 62)
          {
            v85 = v33;
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v35 - (void)v33) >> 1 > v42) {
            unint64_t v42 = (uint64_t)(v35 - (void)v33) >> 1;
          }
          if (v35 - (unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v43 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v43 = v42;
          }
          if (v43) {
            unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v43);
          }
          else {
            uint64_t v44 = 0;
          }
          v45 = (_DWORD *)(v43 + 4 * v41);
          _DWORD *v45 = v38;
          v40 = (char *)(v45 + 1);
          while (v39 != v33)
          {
            int v46 = *((_DWORD *)v39 - 1);
            v39 -= 4;
            *--v45 = v46;
          }
          unint64_t v35 = v43 + 4 * v44;
          v86 = v40;
          if (v33) {
            operator delete(v33);
          }
          v33 = v45;
        }
        else
        {
          *(_DWORD *)v86 = v37;
          v40 = v39 + 4;
        }
        v86 = v40;
      }
      unint64_t v87 = v35;
      v85 = v33;
      uint64_t v31 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
    }
    while (v31);
  }
  else
  {
    v40 = v86;
  }

  uint64_t v47 = (uint64_t)v32;
  if (v40 == v33) {
    v48 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>> const&)::t;
  }
  else {
    v48 = v33;
  }
  unsigned int v49 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>(v32, (uint64_t)v48, (v40 - v33) >> 2);
  int v50 = [(OPTTSTextToSpeechRequest *)v77 preferred_voice_type];
  v51 = [(OPTTSTextToSpeechRequest *)v77 meta_info];
  unsigned int obja = [v51 addObjectToBuffer:v47];

  v52 = [(OPTTSTextToSpeechRequest *)v77 context];
  unsigned int v68 = [v52 addObjectToBuffer:v47];

  v53 = [(OPTTSTextToSpeechRequest *)v77 experiment];
  unsigned int v67 = [v53 addObjectToBuffer:v47];

  v54 = [(OPTTSTextToSpeechRequest *)v77 feature_flags];
  unsigned int v66 = [v54 addObjectToBuffer:v47];

  v55 = [(OPTTSTextToSpeechRequest *)v77 debug];
  unsigned int v65 = [v55 addObjectToBuffer:v47];

  v56 = [(OPTTSTextToSpeechRequest *)v77 profile];
  LODWORD(v54) = [v56 addObjectToBuffer:v47];

  v57 = [(OPTTSTextToSpeechRequest *)v77 dev_config];
  LODWORD(v55) = [v57 addObjectToBuffer:v47];

  v58 = [(OPTTSTextToSpeechRequest *)v77 prosody_config];
  LODWORD(v56) = [v58 addObjectToBuffer:v47];

  v59 = [(OPTTSTextToSpeechRequest *)v77 prosody_control_config];
  unsigned int v78 = [v59 addObjectToBuffer:v47];

  unsigned int v60 = v56;
  LODWORD(v56) = v54;
  LODWORD(v54) = v50;
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested(v47);
  v61 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)v47;
  *(unsigned char *)(v47 + 70) = 1;
  LODWORD(v59) = *(_DWORD *)(v47 + 32);
  int v62 = *(_DWORD *)(v47 + 48);
  LODWORD(v57) = *((_DWORD *)v61 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 6, v75);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 8, v74);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 10, v73);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 12, v72);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v61, 14, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(v61, 16, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 18, v69);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 20, v49);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v61, 22, (int)v54);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 24, obja);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 26, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 28, v67);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 30, v66);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 32, v65);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 34, v56);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 36, v55);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 38, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 40, v78);
  v63.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v61, (int)v59 - v62 + (int)v57);
  if (v33)
  {
    v86 = v33;
    operator delete(v33);
  }
  return v63;
}

- (OPTTSTextToSpeechRequestProsodyControlConfig)prosody_control_config
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prosody_control_config"];
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestProsodyControlConfig alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x29u && (uint64_t v7 = *(unsigned __int16 *)v6[40].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(OPTTSTextToSpeechRequestProsodyControlConfig *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"prosody_control_config"];
  }
  return v3;
}

- (OPTTSTextToSpeechRequestProsodyTransferConfig)prosody_config
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prosody_config"];
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestProsodyTransferConfig alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x27u && (uint64_t v7 = *(unsigned __int16 *)v6[38].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(OPTTSTextToSpeechRequestProsodyTransferConfig *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"prosody_config"];
  }
  return v3;
}

- (OPTTSTextToSpeechRequestDevConfig)dev_config
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"dev_config"];
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestDevConfig alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x25u && (uint64_t v7 = *(unsigned __int16 *)v6[36].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(OPTTSTextToSpeechRequestDevConfig *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"dev_config"];
  }
  return v3;
}

- (OPTTSTextToSpeechUserProfile)profile
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"profile"];
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechUserProfile alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x23u && (uint64_t v7 = *(unsigned __int16 *)v6[34].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(OPTTSTextToSpeechUserProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"profile"];
  }
  return v3;
}

- (OPTTSTextToSpeechRequestDebug)debug
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"debug"];
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestDebug alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x21u && (uint64_t v7 = *(unsigned __int16 *)v6[32].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(OPTTSTextToSpeechRequestDebug *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"debug"];
  }
  return v3;
}

- (OPTTSTTSRequestFeatureFlags)feature_flags
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"feature_flags"];
  if (!v3)
  {
    v4 = [OPTTSTTSRequestFeatureFlags alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Fu && (uint64_t v7 = *(unsigned __int16 *)v6[30].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(OPTTSTTSRequestFeatureFlags *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"feature_flags"];
  }
  return v3;
}

- (OPTTSTextToSpeechRequestExperiment)experiment
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"experiment"];
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestExperiment alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Du && (uint64_t v7 = *(unsigned __int16 *)v6[28].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(OPTTSTextToSpeechRequestExperiment *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"experiment"];
  }
  return v3;
}

- (OPTTSTextToSpeechRequestContext)context
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context"];
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestContext alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Bu && (uint64_t v7 = *(unsigned __int16 *)v6[26].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(OPTTSTextToSpeechRequestContext *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"context"];
  }
  return v3;
}

- (OPTTSTextToSpeechRequestMeta)meta_info
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"meta_info"];
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestMeta alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (uint64_t v7 = *(unsigned __int16 *)v6[24].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(OPTTSTextToSpeechRequestMeta *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"meta_info"];
  }
  return v3;
}

- (int64_t)preferred_voice_type
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x17u && (uint64_t v4 = *(unsigned __int16 *)v3[22].var0) != 0) {
    return *(int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (void)context_info_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, OPTTSTextToSpeechRequest_ContextInfoEntry *, uint64_t, unsigned __int8 *))a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_info"];
  char v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    size_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0x15u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[20].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        uint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            size_t v16 = [[OPTTSTextToSpeechRequest_ContextInfoEntry alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
            v4[2](v4, v16, v14, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            ++v14;
            v13 += 4;
            uint64_t v18 = v15;
            v15 -= 4;
          }
          while (v18);
        }
      }
    }
  }
}

- (unint64_t)context_info_count
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_info"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0x15u && (uint64_t v8 = *(unsigned __int16 *)v7[20].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)context_info_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_info"];
  char v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0x15u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[20].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      uint64_t v7 = [[OPTTSTextToSpeechRequest_ContextInfoEntry alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)context_info
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"context_info"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__OPTTSTextToSpeechRequest_context_info__block_invoke;
    v6[3] = &unk_1E5920290;
    id v3 = v4;
    id v7 = v3;
    [(OPTTSTextToSpeechRequest *)self context_info_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"context_info"];
  }
  return (NSArray *)v3;
}

uint64_t __40__OPTTSTextToSpeechRequest_context_info__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSString)voice_name
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    return *(int *)root[v4].var0;
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
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (OPTTSTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v66.receiver = self;
  v66.super_class = (Class)OPTTSTextToSpeechRequest;
  uint64_t v10 = [(OPTTSTextToSpeechRequest *)&v66 init];
  if (v10)
  {
    if (v9 && [v9 length])
    {
      p_data = (id *)&v10->_data;
      objc_storeStrong((id *)&v10->_data, a3);
      if (!a4)
      {
        uint64_t v12 = (unsigned int *)[*p_data bytes];
        a4 = (const TextToSpeechRequest *)v12 + *v12;
      }
      v10->_root = a4;
      if (!v5) {
        goto LABEL_108;
      }
      unint64_t v13 = [*p_data bytes];
      uint64_t v14 = [*p_data length];
      root = v10->_root;
      if ((unint64_t)root >= v13 && (unint64_t)root <= v13 + v14)
      {
        uint64_t v17 = [*p_data bytes];
        unint64_t v18 = [*p_data length];
        uint64_t v61 = v17;
        unint64_t v62 = v18;
        long long v63 = xmmword_19CEE1A20;
        uint64_t v64 = 0;
        char v65 = 1;
        if (v18 >= 0x7FFFFFFF) {
          __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
        }
        unsigned __int8 v19 = (apple::aiml::flatbuffers2::Table *)v10->_root;
        if (!v19) {
          goto LABEL_108;
        }
        if (apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)&v61, v10->_root->var0)&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 4u))
        {
          size_t v20 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
          if (*v20 >= 5u && (uint64_t v21 = v20[2]) != 0) {
            v22 = (const unsigned __int8 *)v19 + v21 + *(unsigned int *)((char *)v19 + v21);
          }
          else {
            v22 = 0;
          }
          if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v22)
            && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 6u))
          {
            v23 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
            if (*v23 >= 7u && (uint64_t v24 = v23[3]) != 0) {
              v25 = (const unsigned __int8 *)v19 + v24 + *(unsigned int *)((char *)v19 + v24);
            }
            else {
              v25 = 0;
            }
            if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v25)
              && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 8u))
            {
              v26 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
              if (*v26 >= 9u && (uint64_t v27 = v26[4]) != 0) {
                size_t v28 = (const unsigned __int8 *)v19 + v27 + *(unsigned int *)((char *)v19 + v27);
              }
              else {
                size_t v28 = 0;
              }
              if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v28)
                && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0xAu))
              {
                unsigned int v29 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                if (*v29 >= 0xBu && (uint64_t v30 = v29[5]) != 0) {
                  uint64_t v31 = (const unsigned __int8 *)v19 + v30 + *(unsigned int *)((char *)v19 + v30);
                }
                else {
                  uint64_t v31 = 0;
                }
                if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v31)
                  && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0xCu))
                {
                  v32 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                  if (*v32 >= 0xDu && (uint64_t v33 = v32[6]) != 0) {
                    uint64_t v34 = (const unsigned __int8 *)v19 + v33 + *(unsigned int *)((char *)v19 + v33);
                  }
                  else {
                    uint64_t v34 = 0;
                  }
                  if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v34))
                  {
                    unint64_t v35 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                    unsigned int v36 = *v35;
                    if ((v36 < 0xF
                       || (!v35[7] || v62 >= 5 && v62 - 4 >= (unint64_t)v19 + v35[7] - v61)
                       && (v36 < 0x11 || !v35[8] || v62 >= 2 && v62 - 1 >= (unint64_t)v19 + v35[8] - v61))
                      && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x12u))
                    {
                      int v37 = v36 >= 0x13 && v35[9]
                          ? (const unsigned __int8 *)v19 + v35[9] + *(unsigned int *)((char *)v19 + v35[9])
                          : 0;
                      if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v37)&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x14u))
                      {
                        int v38 = 0;
                        uint64_t v39 = *(int *)v19;
                        if (*(unsigned __int16 *)((char *)v19 - v39) >= 0x15u)
                        {
                          if (!*(_WORD *)((char *)v19 - v39 + 20)) {
                            goto LABEL_64;
                          }
                          if (!apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString((apple::aiml::flatbuffers2::Verifier *)&v61, (const unsigned __int8 *)v19+ *(unsigned __int16 *)((char *)v19 - v39 + 20)+ *(unsigned int *)((char *)v19 + *(unsigned __int16 *)((char *)v19 - v39 + 20)), 4uLL, 0))goto LABEL_109; {
                          int v38 = 0;
                          }
                          uint64_t v39 = *(int *)v19;
                          if (*(unsigned __int16 *)((char *)v19 - v39) >= 0x15u)
                          {
LABEL_64:
                            uint64_t v40 = *(unsigned __int16 *)((char *)v19 - v39 + 20);
                            if (v40) {
                              int v38 = (_DWORD *)((char *)v19 + v40 + *(unsigned int *)((char *)v19 + v40));
                            }
                            else {
                              int v38 = 0;
                            }
                          }
                        }
                        if (apple::aiml::flatbuffers2::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((apple::aiml::flatbuffers2::Verifier *)&v61, v38))
                        {
                          uint64_t v41 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                          unsigned int v42 = *v41;
                          if ((v42 < 0x17 || !v41[11] || v62 >= 5 && v62 - 4 >= (unint64_t)v19 + v41[11] - v61)
                            && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x18u)&& (v42 < 0x19|| !v41[12]|| siri::speech::schema_fb::TextToSpeechRequestMeta::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v41[12]+ *(unsigned int *)((char *)v19 + v41[12])), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x1Au))
                          {
                            unint64_t v43 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                            if ((*v43 < 0x1Bu
                               || (uint64_t v44 = v43[13]) == 0
                               || siri::speech::schema_fb::TextToSpeechRequestContext::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v44+ *(unsigned int *)((char *)v19 + v44)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x1Cu))
                            {
                              v45 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                              if ((*v45 < 0x1Du
                                 || (uint64_t v46 = v45[14]) == 0
                                 || siri::speech::schema_fb::TextToSpeechRequestExperiment::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v46+ *(unsigned int *)((char *)v19 + v46)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x1Eu))
                              {
                                uint64_t v47 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                if ((*v47 < 0x1Fu
                                   || (uint64_t v48 = v47[15]) == 0
                                   || siri::speech::schema_fb::TTSRequestFeatureFlags::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v48+ *(unsigned int *)((char *)v19 + v48)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x20u))
                                {
                                  unsigned int v49 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                  if ((*v49 < 0x21u
                                     || (uint64_t v50 = v49[16]) == 0
                                     || siri::speech::schema_fb::TTSRequestFeatureFlags::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v50+ *(unsigned int *)((char *)v19 + v50)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x22u))
                                  {
                                    v51 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                    if ((*v51 < 0x23u
                                       || (uint64_t v52 = v51[17]) == 0
                                       || siri::speech::schema_fb::TextToSpeechUserProfile::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v52+ *(unsigned int *)((char *)v19 + v52)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x24u))
                                    {
                                      v53 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                      if ((*v53 < 0x25u
                                         || (uint64_t v54 = v53[18]) == 0
                                         || siri::speech::schema_fb::TextToSpeechRequestDevConfig::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v54+ *(unsigned int *)((char *)v19 + v54)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x26u))
                                      {
                                        v55 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                        if ((*v55 < 0x27u
                                           || (uint64_t v56 = v55[19]) == 0
                                           || siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v56+ *(unsigned int *)((char *)v19 + v56)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x28u))
                                        {
                                          v57 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                          if (*v57 < 0x29u) {
                                            goto LABEL_108;
                                          }
                                          uint64_t v58 = v57[20];
                                          if (!v58
                                            || siri::speech::schema_fb::TextToSpeechRequestProsodyControlConfig::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v58+ *(unsigned int *)((char *)v19 + v58)), (apple::aiml::flatbuffers2::Verifier *)&v61))
                                          {
                                            goto LABEL_108;
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_109:
    v59 = 0;
    goto LABEL_110;
  }
LABEL_108:
  v59 = v10;
LABEL_110:

  return v59;
}

- (OPTTSTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4
{
  return [(OPTTSTextToSpeechRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechRequest)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
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
- (OPTTSTextToSpeechRequestExperiment)experiment;
- (OPTTSTextToSpeechRequestMeta)meta_info;
- (Offset<siri::speech::schema_fb::TextToSpeechRequest>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)audio_type;
- (int64_t)preferred_voice_type;
@end

@implementation OPTTSTextToSpeechRequest

flatbuffers::DetachedBuffer *__57__OPTTSTextToSpeechRequest_ContextInfoEntry_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x22A667720);
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
  long long v7 = xmmword_226CFFD00;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(OPTTSTextToSpeechRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__40__OPTTSTextToSpeechRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x22A667720);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  v4 = [(OPTTSTextToSpeechRequest *)self speech_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DAD0E18;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v8 = [(OPTTSTextToSpeechRequest *)self session_id];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DAD0E18;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  unsigned int v67 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  __int16 v12 = [(OPTTSTextToSpeechRequest *)self language];
  uint64_t v13 = v12;
  if (!v12) {
    __int16 v12 = &stru_26DAD0E18;
  }
  v14 = (const char *)[(__CFString *)v12 UTF8String];
  size_t v15 = strlen(v14);
  unsigned int v64 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  v16 = [(OPTTSTextToSpeechRequest *)self gender];
  v17 = v16;
  if (!v16) {
    v16 = &stru_26DAD0E18;
  }
  v18 = (const char *)[(__CFString *)v16 UTF8String];
  size_t v19 = strlen(v18);
  unsigned int v63 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  v20 = [(OPTTSTextToSpeechRequest *)self text];
  v21 = v20;
  if (!v20) {
    v20 = &stru_26DAD0E18;
  }
  v22 = (const char *)[(__CFString *)v20 UTF8String];
  size_t v23 = strlen(v22);
  unsigned int v62 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v22, v23);

  int v61 = [(OPTTSTextToSpeechRequest *)self audio_type];
  int v60 = [(OPTTSTextToSpeechRequest *)self enable_word_timing_info];
  v24 = [(OPTTSTextToSpeechRequest *)self voice_name];
  v25 = v24;
  if (!v24) {
    v24 = &stru_26DAD0E18;
  }
  v26 = a3;
  v27 = (const char *)[(__CFString *)v24 UTF8String];
  size_t v28 = strlen(v27);
  unsigned int v29 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v27, v28);

  v74 = 0;
  v75 = 0;
  unint64_t v76 = 0;
  v30 = [(OPTTSTextToSpeechRequest *)self context_info];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v74, [v30 count]);

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v31 = [(OPTTSTextToSpeechRequest *)self context_info];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v70 objects:v77 count:16];
  unsigned int v59 = v29;
  v65 = self;
  v33 = v74;
  if (v32)
  {
    uint64_t v34 = *(void *)v71;
    unint64_t v35 = v76;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v71 != v34) {
          objc_enumerationMutation(v31);
        }
        int v37 = [*(id *)(*((void *)&v70 + 1) + 8 * i) addObjectToBuffer:v26];
        int v38 = v37;
        v39 = v75;
        if ((unint64_t)v75 >= v35)
        {
          uint64_t v41 = (v75 - v33) >> 2;
          unint64_t v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 62)
          {
            v74 = v33;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::__throw_length_error[abi:ne180100]();
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
            unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v43);
          }
          else {
            uint64_t v44 = 0;
          }
          v45 = (_DWORD *)(v43 + 4 * v41);
          _DWORD *v45 = v38;
          v40 = (char *)(v45 + 1);
          if (v39 == v33)
          {
            v26 = a3;
          }
          else
          {
            v26 = a3;
            do
            {
              int v46 = *((_DWORD *)v39 - 1);
              v39 -= 4;
              *--v45 = v46;
            }
            while (v39 != v33);
          }
          unint64_t v35 = v43 + 4 * v44;
          v75 = v40;
          if (v33) {
            operator delete(v33);
          }
          v33 = v45;
        }
        else
        {
          *(_DWORD *)v75 = v37;
          v40 = v39 + 4;
          v26 = a3;
        }
        v75 = v40;
      }
      unint64_t v76 = v35;
      v74 = v33;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v70 objects:v77 count:16];
    }
    while (v32);
  }
  else
  {
    v40 = v75;
  }

  if (v40 == v33) {
    v47 = &flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>> const&)::t;
  }
  else {
    v47 = v33;
  }
  unsigned int v48 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v47, (v40 - v33) >> 2);
  int v49 = [(OPTTSTextToSpeechRequest *)v65 preferred_voice_type];
  v50 = [(OPTTSTextToSpeechRequest *)v65 meta_info];
  unsigned int v51 = [v50 addObjectToBuffer:a3];

  v52 = [(OPTTSTextToSpeechRequest *)v65 context];
  unsigned int v53 = [v52 addObjectToBuffer:a3];

  v54 = [(OPTTSTextToSpeechRequest *)v65 experiment];
  unsigned int v55 = [v54 addObjectToBuffer:a3];

  v56 = [(OPTTSTextToSpeechRequest *)v65 feature_flags];
  unsigned int v66 = [v56 addObjectToBuffer:a3];

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  LODWORD(v56) = *((_DWORD *)a3 + 8);
  LODWORD(v50) = *((_DWORD *)a3 + 12);
  LODWORD(v52) = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 6, v67);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 8, v64);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 10, v63);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 12, v62);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v61);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 16, v60);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 18, v59);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 20, v48);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 22, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 24, v51);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 26, v53);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 28, v55);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 30, v66);
  v57.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v56 - (int)v50 + (int)v52);
  if (v33)
  {
    v75 = v33;
    operator delete(v33);
  }
  return v57;
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
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
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
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
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
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
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
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
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
            __int16 v12 = [[OPTTSTextToSpeechRequest_ContextInfoEntry alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
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

- (OPTTSTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v59.receiver = self;
  v59.super_class = (Class)OPTTSTextToSpeechRequest;
  uint64_t v10 = [(OPTTSTextToSpeechRequest *)&v59 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_89;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_90;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_88;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_90;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v54 = v18;
  unint64_t v55 = v19;
  long long v56 = xmmword_226CFFD10;
  uint64_t v57 = 0;
  char v58 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_88;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v54, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 4u))
  {
    goto LABEL_90;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    size_t v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    size_t v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 6u))
  {
    goto LABEL_90;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  }
  else {
    v26 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 8u))
  {
    goto LABEL_90;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (uint64_t v28 = v27[4]) != 0) {
    unsigned int v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  }
  else {
    unsigned int v29 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v29)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0xAu))
  {
    goto LABEL_90;
  }
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v30 >= 0xBu && (uint64_t v31 = v30[5]) != 0) {
    uint64_t v32 = (const unsigned __int8 *)root + v31 + *(unsigned int *)((char *)root + v31);
  }
  else {
    uint64_t v32 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v32)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0xCu))
  {
    goto LABEL_90;
  }
  v33 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v33 >= 0xDu && (uint64_t v34 = v33[6]) != 0) {
    unint64_t v35 = (const unsigned __int8 *)root + v34 + *(unsigned int *)((char *)root + v34);
  }
  else {
    unint64_t v35 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v35)) {
    goto LABEL_90;
  }
  v36 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v37 = *v36;
  if (v37 >= 0xF
    && (v36[7] && (v55 < 5 || v55 - 4 < (unint64_t)root + v36[7] - v54)
     || v37 >= 0x11 && v36[8] && (v55 < 2 || v55 - 1 < (unint64_t)root + v36[8] - v54)))
  {
    goto LABEL_90;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x12u)) {
    goto LABEL_90;
  }
  int v38 = v37 >= 0x13 && v36[9] ? (const unsigned __int8 *)root + v36[9] + *(unsigned int *)((char *)root + v36[9]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v38)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x14u))
  {
    goto LABEL_90;
  }
  v39 = 0;
  uint64_t v40 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v40) < 0x15u) {
    goto LABEL_67;
  }
  if (!*(_WORD *)((char *)root - v40 + 20)) {
    goto LABEL_64;
  }
  if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v54, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v40 + 20)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v40 + 20)), 4uLL, 0))
  {
LABEL_90:
    v52 = 0;
    goto LABEL_91;
  }
  v39 = 0;
  uint64_t v40 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v40) >= 0x15u)
  {
LABEL_64:
    uint64_t v41 = *(unsigned __int16 *)((char *)root - v40 + 20);
    if (v41) {
      v39 = (_DWORD *)((char *)root + v41 + *(unsigned int *)((char *)root + v41));
    }
    else {
      v39 = 0;
    }
  }
LABEL_67:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((flatbuffers::Verifier *)&v54, v39))goto LABEL_90; {
  unint64_t v42 = (unsigned __int16 *)((char *)root - *(int *)root);
  }
  unsigned int v43 = *v42;
  if (v43 >= 0x17 && v42[11] && (v55 < 5 || v55 - 4 < (unint64_t)root + v42[11] - v54)) {
    goto LABEL_90;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x18u)
    || v43 >= 0x19
    && v42[12]
    && !siri::speech::schema_fb::TextToSpeechRequestMeta::Verify((flatbuffers::Table *)((char *)root + v42[12] + *(unsigned int *)((char *)root + v42[12])), (flatbuffers::Verifier *)&v54))
  {
    goto LABEL_90;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x1Au)) {
    goto LABEL_90;
  }
  uint64_t v44 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v44 >= 0x1Bu)
  {
    uint64_t v45 = v44[13];
    if (v45)
    {
      if (!siri::speech::schema_fb::TextToSpeechRequestContext::Verify((flatbuffers::Table *)((char *)root + v45 + *(unsigned int *)((char *)root + v45)), (flatbuffers::Verifier *)&v54))goto LABEL_90; {
    }
      }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x1Cu)) {
    goto LABEL_90;
  }
  int v46 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v46 >= 0x1Du)
  {
    uint64_t v47 = v46[14];
    if (v47)
    {
      if (!siri::speech::schema_fb::TextToSpeechRequestExperiment::Verify((flatbuffers::Table *)((char *)root + v47 + *(unsigned int *)((char *)root + v47)), (flatbuffers::Verifier *)&v54))goto LABEL_90; {
    }
      }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x1Eu)) {
    goto LABEL_90;
  }
  unsigned int v48 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v48 >= 0x1Fu)
  {
    uint64_t v49 = v48[15];
    if (v49)
    {
      if (!siri::speech::schema_fb::TTSRequestFeatureFlags::Verify((flatbuffers::Table *)((char *)root + v49 + *(unsigned int *)((char *)root + v49)), (flatbuffers::Verifier *)&v54))goto LABEL_90; {
    }
      }
  }
LABEL_88:
  uint64_t v50 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v54);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v50;

LABEL_89:
  v52 = v11;
LABEL_91:

  return v52;
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
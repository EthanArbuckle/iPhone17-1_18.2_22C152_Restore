@interface OPTTSPartialTextToSpeechStreamingResponse
- (NSArray)word_timing_info;
- (NSData)audio;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)stream_id;
- (OPTTSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3;
- (OPTTSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3 root:(const PartialTextToSpeechStreamingResponse *)a4;
- (OPTTSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3 root:(const PartialTextToSpeechStreamingResponse *)a4 verify:(BOOL)a5;
- (OPTTSTextToSpeechFeature)feature;
- (Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)word_timing_info_objectAtIndex:(unint64_t)a3;
- (int)current_pkt_number;
- (int)error_code;
- (unint64_t)word_timing_info_count;
- (void)audio:(id)a3;
- (void)word_timing_info_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation OPTTSPartialTextToSpeechStreamingResponse

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
  v2.var0 = [(OPTTSPartialTextToSpeechStreamingResponse *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__57__OPTTSPartialTextToSpeechStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(OPTTSPartialTextToSpeechStreamingResponse *)self speech_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_1EEE20510;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  long long v9 = [(OPTTSPartialTextToSpeechStreamingResponse *)self session_id];
  uint64_t v10 = v9;
  if (!v9) {
    long long v9 = &stru_1EEE20510;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  unsigned int v62 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  int v61 = [(OPTTSPartialTextToSpeechStreamingResponse *)self error_code];
  uint64_t v13 = [(OPTTSPartialTextToSpeechStreamingResponse *)self error_str];
  v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_1EEE20510;
  }
  v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  unsigned int v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  v17 = [(OPTTSPartialTextToSpeechStreamingResponse *)self stream_id];
  v18 = v17;
  if (!v17) {
    v17 = &stru_1EEE20510;
  }
  v19 = (const char *)[(__CFString *)v17 UTF8String];
  size_t v20 = strlen(v19);
  unsigned int v21 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  int v22 = [(OPTTSPartialTextToSpeechStreamingResponse *)self current_pkt_number];
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3812000000;
  v74 = __Block_byref_object_copy_;
  v75 = __Block_byref_object_dispose_;
  v76 = &unk_19CF11BD2;
  int v77 = 0;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __63__OPTTSPartialTextToSpeechStreamingResponse_addObjectToBuffer___block_invoke;
  v70[3] = &unk_1E59202B8;
  v70[4] = &v71;
  v70[5] = a3;
  [(OPTTSPartialTextToSpeechStreamingResponse *)self audio:v70];
  v23 = [(OPTTSPartialTextToSpeechStreamingResponse *)self word_timing_info];
  unint64_t v24 = [v23 count];
  int v58 = v22;
  unsigned int v59 = v21;
  if (v24)
  {
    if (v24 >> 62) {
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    }
    v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v24);
    v27 = &v25[4 * v26];
  }
  else
  {
    v25 = 0;
    v27 = 0;
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = [(OPTTSPartialTextToSpeechStreamingResponse *)self word_timing_info];
  uint64_t v28 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
  v64 = self;
  if (v28)
  {
    uint64_t v29 = *(void *)v67;
    v30 = v25;
    v31 = a3;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v67 != v29) {
          objc_enumerationMutation(obj);
        }
        int v33 = [*(id *)(*((void *)&v66 + 1) + 8 * i) addObjectToBuffer:a3];
        int v34 = v33;
        if (v30 >= v27)
        {
          uint64_t v35 = (v30 - v25) >> 2;
          unint64_t v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62) {
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((v27 - v25) >> 1 > v36) {
            unint64_t v36 = (v27 - v25) >> 1;
          }
          if ((unint64_t)(v27 - v25) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v37 = v36;
          }
          if (v37) {
            unint64_t v37 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v37);
          }
          else {
            uint64_t v38 = 0;
          }
          v39 = (char *)(v37 + 4 * v35);
          *(_DWORD *)v39 = v34;
          v40 = v39 + 4;
          while (v30 != v25)
          {
            int v41 = *((_DWORD *)v30 - 1);
            v30 -= 4;
            *((_DWORD *)v39 - 1) = v41;
            v39 -= 4;
          }
          v27 = (char *)(v37 + 4 * v38);
          if (v25) {
            operator delete(v25);
          }
          v25 = v39;
          v30 = v40;
          a3 = v31;
        }
        else
        {
          *(_DWORD *)v30 = v33;
          v30 += 4;
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
    }
    while (v28);
  }
  else
  {
    v30 = v25;
  }

  uint64_t v42 = v30 - v25;
  if (v30 == v25) {
    v43 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::WordTimingInfo>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::WordTimingInfo>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::WordTimingInfo>> const&)::t;
  }
  else {
    v43 = v25;
  }
  uint64_t v44 = v42 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v42 >> 2, 4uLL);
  if (v25 == v30)
  {
    LODWORD(v44) = 0;
  }
  else
  {
    v45 = v43 - 4;
    uint64_t v46 = v44;
    do
    {
      int v47 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v45[4 * v46]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v47);
      --v46;
    }
    while (v46);
  }
  unsigned int v48 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v44);
  v49 = [(OPTTSPartialTextToSpeechStreamingResponse *)v64 feature];
  unsigned int v50 = [v49 addObjectToBuffer:a3];

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v51 = *((_DWORD *)a3 + 8);
  int v52 = *((_DWORD *)a3 + 12);
  int v53 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v62);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v61);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v59);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v58);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, *((_DWORD *)v72 + 12));
  if (v48)
  {
    int v54 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v48);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v54);
  }
  if (v50)
  {
    int v55 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v50);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v55);
  }
  v56.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v51 - v52 + v53);
  if (v25) {
    operator delete(v25);
  }
  _Block_object_dispose(&v71, 8);
  return v56;
}

uint64_t __63__OPTTSPartialTextToSpeechStreamingResponse_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<unsigned char>(*(apple::aiml::flatbuffers2::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = result;
  return result;
}

- (OPTTSTextToSpeechFeature)feature
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"feature"];
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechFeature alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (uint64_t v7 = *(unsigned __int16 *)v6[20].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(OPTTSTextToSpeechFeature *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"feature"];
  }
  return v3;
}

- (void)word_timing_info_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, OPTTSWordTimingInfo *, uint64_t, unsigned __int8 *))a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"word_timing_info"];
  char v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    size_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0x13u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[18].var0;
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
            size_t v16 = [[OPTTSWordTimingInfo alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
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

- (unint64_t)word_timing_info_count
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"word_timing_info"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0x13u && (uint64_t v8 = *(unsigned __int16 *)v7[18].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)word_timing_info_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"word_timing_info"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0x13u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[18].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      uint64_t v7 = [[OPTTSWordTimingInfo alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)word_timing_info
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"word_timing_info"];
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__OPTTSPartialTextToSpeechStreamingResponse_word_timing_info__block_invoke;
    v6[3] = &unk_1E5920290;
    id v3 = v4;
    id v7 = v3;
    [(OPTTSPartialTextToSpeechStreamingResponse *)self word_timing_info_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"word_timing_info"];
  }
  return (NSArray *)v3;
}

uint64_t __61__OPTTSPartialTextToSpeechStreamingResponse_word_timing_info__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)audio:(id)a3
{
  id v4 = a3;
  root = self->_root;
  uint64_t v6 = *(int *)root->var0;
  uint64_t v7 = *(unsigned __int16 *)root[-v6 + 16].var0;
  if (*(_WORD *)root[-v6 + 16].var0)
  {
    uint64_t v8 = *(unsigned int *)root[v7].var0;
    uint64_t v9 = &root[v7 + v8];
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    uint64_t v8 = *(unsigned int *)root->var0;
  }
  id v10 = v4;
  (*((void (**)(id, const PartialTextToSpeechStreamingResponse *, void))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);
}

- (NSData)audio
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
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
  return (NSData *)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0];
}

- (int)current_pkt_number
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)stream_id
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

- (NSString)error_str
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

- (int)error_code
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

- (OPTTSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3 root:(const PartialTextToSpeechStreamingResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSPartialTextToSpeechStreamingResponse;
  id v10 = [(OPTTSPartialTextToSpeechStreamingResponse *)&v26 init];
  if (!v10) {
    goto LABEL_14;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_15;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    uint64_t v12 = (unsigned int *)[*p_data bytes];
    a4 = (const PartialTextToSpeechStreamingResponse *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_14;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_15;
  }
  uint64_t v17 = [*p_data bytes];
  unint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_19CEE1A20;
  uint64_t v24 = 0;
  char v25 = 1;
  if (v18 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  unsigned __int8 v19 = (siri::speech::schema_fb::PartialTextToSpeechStreamingResponse *)v10->_root;
  if (v19
    && !siri::speech::schema_fb::PartialTextToSpeechStreamingResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
  {
LABEL_15:
    size_t v20 = 0;
  }
  else
  {
LABEL_14:
    size_t v20 = v10;
  }

  return v20;
}

- (OPTTSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3 root:(const PartialTextToSpeechStreamingResponse *)a4
{
  return [(OPTTSPartialTextToSpeechStreamingResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSPartialTextToSpeechStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3
{
  return [(OPTTSPartialTextToSpeechStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
@interface OPTTSTextToSpeechResponse
- (NSArray)word_timing_info;
- (NSData)audio;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (OPTTSAudioDescription)decoder_description;
- (OPTTSAudioDescription)playback_description;
- (OPTTSTextToSpeechMeta)meta_info;
- (OPTTSTextToSpeechResponse)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechResponse *)a4;
- (OPTTSTextToSpeechResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechResponse *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TextToSpeechResponse>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)error_code;
- (int)sample_rate;
- (int64_t)audio_type;
- (void)audio:(id)a3;
@end

@implementation OPTTSTextToSpeechResponse

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
  v2.var0 = [(OPTTSTextToSpeechResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__41__OPTTSTextToSpeechResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x22A667720);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(OPTTSTextToSpeechResponse *)self speech_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DAD0E18;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(OPTTSTextToSpeechResponse *)self session_id];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_26DAD0E18;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  unsigned int v56 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  int v14 = [(OPTTSTextToSpeechResponse *)self error_code];
  v15 = [(OPTTSTextToSpeechResponse *)self error_str];
  v16 = v15;
  if (!v15) {
    v15 = &stru_26DAD0E18;
  }
  v17 = (const char *)[(__CFString *)v15 UTF8String];
  size_t v18 = strlen(v17);
  unsigned int v55 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  int v54 = [(OPTTSTextToSpeechResponse *)self audio_type];
  int v53 = [(OPTTSTextToSpeechResponse *)self sample_rate];
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3812000000;
  v69 = __Block_byref_object_copy__1272;
  v70 = __Block_byref_object_dispose__1273;
  v71 = &unk_226D09AC3;
  int v72 = 0;
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __47__OPTTSTextToSpeechResponse_addObjectToBuffer___block_invoke;
  v65[3] = &unk_2647DCA00;
  v65[4] = &v66;
  v65[5] = a3;
  [(OPTTSTextToSpeechResponse *)self audio:v65];
  v19 = [(OPTTSTextToSpeechResponse *)self decoder_description];
  unsigned int v49 = [v19 addObjectToBuffer:a3];

  v20 = [(OPTTSTextToSpeechResponse *)self playback_description];
  unsigned int v48 = [v20 addObjectToBuffer:a3];

  v62 = 0;
  v63 = 0;
  unint64_t v64 = 0;
  v21 = [(OPTTSTextToSpeechResponse *)self word_timing_info];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v62, [v21 count]);

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = [(OPTTSTextToSpeechResponse *)self word_timing_info];
  uint64_t v22 = [obj countByEnumeratingWithState:&v58 objects:v73 count:16];
  int v50 = v14;
  unsigned int v51 = String;
  v52 = self;
  v23 = (flatbuffers::FlatBufferBuilder *)a3;
  v24 = v62;
  if (v22)
  {
    uint64_t v25 = *(void *)v59;
    unint64_t v26 = v64;
    v27 = obj;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v59 != v25) {
          objc_enumerationMutation(v27);
        }
        int v29 = [*(id *)(*((void *)&v58 + 1) + 8 * i) addObjectToBuffer:v23];
        int v30 = v29;
        v31 = v63;
        if ((unint64_t)v63 >= v26)
        {
          uint64_t v33 = (v63 - v24) >> 2;
          unint64_t v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62)
          {
            v62 = v24;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v26 - (void)v24) >> 1 > v34) {
            unint64_t v34 = (uint64_t)(v26 - (void)v24) >> 1;
          }
          if (v26 - (unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v35 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v35 = v34;
          }
          if (v35) {
            unint64_t v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v35);
          }
          else {
            uint64_t v36 = 0;
          }
          v37 = (_DWORD *)(v35 + 4 * v33);
          _DWORD *v37 = v30;
          v32 = (char *)(v37 + 1);
          if (v31 == v24)
          {
            v27 = obj;
          }
          else
          {
            v27 = obj;
            do
            {
              int v38 = *((_DWORD *)v31 - 1);
              v31 -= 4;
              *--v37 = v38;
            }
            while (v31 != v24);
          }
          unint64_t v26 = v35 + 4 * v36;
          v63 = v32;
          if (v24) {
            operator delete(v24);
          }
          v24 = v37;
        }
        else
        {
          *(_DWORD *)v63 = v29;
          v32 = v31 + 4;
          v27 = obj;
        }
        v63 = v32;
      }
      unint64_t v64 = v26;
      v62 = v24;
      uint64_t v22 = [v27 countByEnumeratingWithState:&v58 objects:v73 count:16];
    }
    while (v22);
  }
  else
  {
    v32 = v63;
    v27 = obj;
  }

  unint64_t v39 = (unint64_t)v23;
  if (v32 == v24) {
    v40 = &flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>> const&)::t;
  }
  else {
    v40 = v24;
  }
  unsigned int v41 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>(v23, (uint64_t)v40, (v32 - v24) >> 2);
  v42 = [(OPTTSTextToSpeechResponse *)v52 meta_info];
  unsigned int v43 = [v42 addObjectToBuffer:v39];

  flatbuffers::FlatBufferBuilder::NotNested(v39);
  *(unsigned char *)(v39 + 70) = 1;
  LODWORD(v42) = *(_DWORD *)(v39 + 32);
  int v44 = *(_DWORD *)(v39 + 48);
  int v45 = *(_DWORD *)(v39 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 4, v51);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 6, v56);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v39, 8, v50);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 10, v55);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v39, 12, v54);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v39, 14, v53);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v39, *((_DWORD *)v67 + 12));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 18, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 20, v48);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 22, v41);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 24, v43);
  v46.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v39, (int)v42 - v44 + v45);
  if (v24)
  {
    v63 = v24;
    operator delete(v24);
  }
  _Block_object_dispose(&v66, 8);
  return v46;
}

uint64_t __47__OPTTSTextToSpeechResponse_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result = flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>(*(flatbuffers::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = result;
  return result;
}

- (OPTTSTextToSpeechMeta)meta_info
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"meta_info"];
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechMeta alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (uint64_t v7 = *(unsigned __int16 *)v6[24].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(OPTTSTextToSpeechMeta *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"meta_info"];
  }
  return v3;
}

- (NSArray)word_timing_info
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"word_timing_info"];
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
            __int16 v12 = [[OPTTSWordTimingInfo alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"word_timing_info"];
  }
  return (NSArray *)v3;
}

- (OPTTSAudioDescription)playback_description
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"playback_description"];
  if (!v3)
  {
    v4 = [OPTTSAudioDescription alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (uint64_t v7 = *(unsigned __int16 *)v6[20].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    v3 = [(OPTTSAudioDescription *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"playback_description"];
  }
  return v3;
}

- (OPTTSAudioDescription)decoder_description
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"decoder_description"];
  if (!v3)
  {
    v4 = [OPTTSAudioDescription alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x13u && (uint64_t v7 = *(unsigned __int16 *)v6[18].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    v3 = [(OPTTSAudioDescription *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"decoder_description"];
  }
  return v3;
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
  (*((void (**)(id, const TextToSpeechResponse *, void))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);
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
  return (NSData *)[MEMORY[0x263EFF8F8] dataWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0];
}

- (int)sample_rate
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

- (int64_t)audio_type
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0) {
    return *(unsigned int *)root[v4].var0;
  }
  else {
    return 0;
  }
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

- (OPTTSTextToSpeechResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v50.receiver = self;
  v50.super_class = (Class)OPTTSTextToSpeechResponse;
  id v10 = [(OPTTSTextToSpeechResponse *)&v50 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_71;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_72;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    size_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_70;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_72;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v45 = v18;
  unint64_t v46 = v19;
  long long v47 = xmmword_226CFFD10;
  uint64_t v48 = 0;
  char v49 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_70;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v45, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 4u))
  {
    goto LABEL_72;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v45, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 6u))
  {
    goto LABEL_72;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
    unint64_t v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  }
  else {
    unint64_t v26 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v45, v26)) {
    goto LABEL_72;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v28 = *v27;
  if (v28 >= 9 && v27[4] && (v46 < 5 || v46 - 4 < (unint64_t)root + v27[4] - v45)) {
    goto LABEL_72;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0xAu)) {
    goto LABEL_72;
  }
  int v29 = v28 >= 0xB && v27[5] ? (const unsigned __int8 *)root + v27[5] + *(unsigned int *)((char *)root + v27[5]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v45, v29)) {
    goto LABEL_72;
  }
  int v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v31 = *v30;
  if (v31 >= 0xD
    && (v30[6] && (v46 < 5 || v46 - 4 < (unint64_t)root + v30[6] - v45)
     || v31 >= 0xF && v30[7] && (v46 < 5 || v46 - 4 < (unint64_t)root + v30[7] - v45)))
  {
    goto LABEL_72;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0x10u)
    || v31 >= 0x11
    && v30[8]
    && !flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v45, (const unsigned __int8 *)root + v30[8] + *(unsigned int *)((char *)root + v30[8]), 1uLL, 0))
  {
    goto LABEL_72;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0x12u)) {
    goto LABEL_72;
  }
  v32 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v32 >= 0x13u)
  {
    uint64_t v33 = v32[9];
    if (v33)
    {
      if (!siri::speech::schema_fb::AudioDescription::Verify((flatbuffers::Table *)((char *)root + v33 + *(unsigned int *)((char *)root + v33)), (flatbuffers::Verifier *)&v45))goto LABEL_72; {
    }
      }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0x14u)) {
    goto LABEL_72;
  }
  unint64_t v34 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v34 >= 0x15u)
  {
    uint64_t v35 = v34[10];
    if (v35)
    {
      if (!siri::speech::schema_fb::AudioDescription::Verify((flatbuffers::Table *)((char *)root + v35 + *(unsigned int *)((char *)root + v35)), (flatbuffers::Verifier *)&v45))goto LABEL_72; {
    }
      }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0x16u)) {
    goto LABEL_72;
  }
  uint64_t v36 = 0;
  uint64_t v37 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v37) < 0x17u) {
    goto LABEL_65;
  }
  if (*(_WORD *)((char *)root - v37 + 22))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v45, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v37 + 22)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v37 + 22)), 4uLL, 0))
    {
      uint64_t v36 = 0;
      uint64_t v37 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v37) < 0x17u) {
        goto LABEL_65;
      }
      goto LABEL_61;
    }
LABEL_72:
    unsigned int v43 = 0;
    goto LABEL_73;
  }
LABEL_61:
  uint64_t v38 = *(unsigned __int16 *)((char *)root - v37 + 22);
  if (v38) {
    uint64_t v36 = (_DWORD *)((char *)root + v38 + *(unsigned int *)((char *)root + v38));
  }
  else {
    uint64_t v36 = 0;
  }
LABEL_65:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::WordTimingInfo>((flatbuffers::Verifier *)&v45, v36))goto LABEL_72; {
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0x18u))
  }
    goto LABEL_72;
  unint64_t v39 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v39 >= 0x19u)
  {
    uint64_t v40 = v39[12];
    if (v40)
    {
      if (!siri::speech::schema_fb::TextToSpeechMeta::Verify((flatbuffers::Table *)((char *)root + v40 + *(unsigned int *)((char *)root + v40)), (flatbuffers::Verifier *)&v45))goto LABEL_72; {
    }
      }
  }
LABEL_70:
  uint64_t v41 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v45);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v41;

LABEL_71:
  unsigned int v43 = v11;
LABEL_73:

  return v43;
}

- (OPTTSTextToSpeechResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechResponse *)a4
{
  return [(OPTTSTextToSpeechResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechResponse)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
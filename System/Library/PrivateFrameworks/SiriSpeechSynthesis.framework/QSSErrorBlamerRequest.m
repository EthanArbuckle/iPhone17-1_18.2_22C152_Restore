@interface QSSErrorBlamerRequest
- (NSArray)audio_packets;
- (NSArray)contextual_text;
- (NSString)left_context;
- (NSString)ref_transcript;
- (NSString)right_context;
- (Offset<siri::speech::schema_fb::ErrorBlamerRequest>)addObjectToBuffer:(void *)a3;
- (QSSErrorBlamerRequest)initWithFlatbuffData:(id)a3;
- (QSSErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4;
- (QSSErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4 verify:(BOOL)a5;
- (QSSStartSpeechRequest)start_speech_request;
- (QSSUserAcousticProfile)user_acoustic_profile;
- (QSSUserLanguageProfile)user_language_profile;
- (double)latitude;
- (double)longitude;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSErrorBlamerRequest

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
  v2.var0 = [(QSSErrorBlamerRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__37__QSSErrorBlamerRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::ErrorBlamerRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  v3 = [(QSSErrorBlamerRequest *)self start_speech_request];
  unsigned int v4 = [v3 addObjectToBuffer:a3];

  memset(&v93, 0, sizeof(v93));
  uint64_t v5 = [(QSSErrorBlamerRequest *)self contextual_text];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v93, [v5 count]);

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  char v6 = [(QSSErrorBlamerRequest *)self contextual_text];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v89 objects:v95 count:16];
  long long v8 = v6;
  unsigned int v82 = v4;
  begin = v93.__begin_;
  if (v7)
  {
    uint64_t v10 = *(void *)v90;
    value = v93.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v90 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (const char *)[*(id *)(*((void *)&v89 + 1) + 8 * i) UTF8String];
        size_t v14 = strlen(v13);
        int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v13, v14);
        int v16 = String;
        std::vector<int>::pointer end = v93.__end_;
        if (v93.__end_ >= value)
        {
          uint64_t v19 = v93.__end_ - begin;
          unint64_t v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62)
          {
            v93.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v20) {
            unint64_t v20 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v20;
          }
          if (v21) {
            unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v21);
          }
          else {
            uint64_t v22 = 0;
          }
          v23 = (int *)(v21 + 4 * v19);
          int *v23 = v16;
          v18 = v23 + 1;
          while (end != begin)
          {
            int v24 = *--end;
            *--v23 = v24;
          }
          value = (int *)(v21 + 4 * v22);
          v93.__end_ = v18;
          if (begin) {
            operator delete(begin);
          }
          begin = v23;
        }
        else
        {
          *v93.__end_ = String;
          v18 = end + 1;
        }
        v93.__end_ = v18;
      }
      v93.__end_cap_.__value_ = value;
      v93.__begin_ = begin;
      uint64_t v7 = [v8 countByEnumeratingWithState:&v89 objects:v95 count:16];
    }
    while (v7);
  }
  else
  {
    v18 = v93.__end_;
  }

  if (v18 == begin) {
    v25 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v25 = begin;
  }
  unsigned int v81 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v25, v18 - begin);
  v26 = [(QSSErrorBlamerRequest *)self left_context];
  v27 = v26;
  if (!v26) {
    v26 = &stru_26DEBFAF8;
  }
  v28 = (const char *)[(__CFString *)v26 UTF8String];
  size_t v29 = strlen(v28);
  unsigned int v80 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v28, v29);

  v30 = [(QSSErrorBlamerRequest *)self right_context];
  v31 = v30;
  if (!v30) {
    v30 = &stru_26DEBFAF8;
  }
  v32 = (const char *)[(__CFString *)v30 UTF8String];
  size_t v33 = strlen(v32);
  unsigned int v79 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v32, v33);

  v34 = [(QSSErrorBlamerRequest *)self user_language_profile];
  unsigned int v78 = [v34 addObjectToBuffer:a3];

  v35 = [(QSSErrorBlamerRequest *)self user_acoustic_profile];
  unsigned int v77 = [v35 addObjectToBuffer:a3];

  [(QSSErrorBlamerRequest *)self latitude];
  double v37 = v36;
  [(QSSErrorBlamerRequest *)self longitude];
  double v39 = v38;
  v40 = [(QSSErrorBlamerRequest *)self audio_packets];
  unint64_t v41 = [v40 count];
  if (v41)
  {
    if (v41 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v41);
    v44 = &v42[4 * v43];
  }
  else
  {
    v42 = 0;
    v44 = 0;
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v45 = [(QSSErrorBlamerRequest *)self audio_packets];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v85 objects:v94 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v86;
    v48 = v42;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v86 != v47) {
          objc_enumerationMutation(v45);
        }
        int v50 = [*(id *)(*((void *)&v85 + 1) + 8 * j) addObjectToBuffer:a3];
        int v51 = v50;
        if (v48 >= v44)
        {
          uint64_t v52 = (v48 - v42) >> 2;
          unint64_t v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v44 - v42) >> 1 > v53) {
            unint64_t v53 = (v44 - v42) >> 1;
          }
          if ((unint64_t)(v44 - v42) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v54 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v54 = v53;
          }
          if (v54) {
            unint64_t v54 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v54);
          }
          else {
            uint64_t v55 = 0;
          }
          v56 = (char *)(v54 + 4 * v52);
          *(_DWORD *)v56 = v51;
          v57 = v56 + 4;
          while (v48 != v42)
          {
            int v58 = *((_DWORD *)v48 - 1);
            v48 -= 4;
            *((_DWORD *)v56 - 1) = v58;
            v56 -= 4;
          }
          v44 = (char *)(v54 + 4 * v55);
          if (v42) {
            operator delete(v42);
          }
          v42 = v56;
          v48 = v57;
        }
        else
        {
          *(_DWORD *)v48 = v50;
          v48 += 4;
        }
      }
      uint64_t v46 = [v45 countByEnumeratingWithState:&v85 objects:v94 count:16];
    }
    while (v46);
  }
  else
  {
    v48 = v42;
  }

  uint64_t v59 = v48 - v42;
  if (v48 == v42) {
    v60 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::AudioPacket>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::AudioPacket>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::AudioPacket>> const&)::t;
  }
  else {
    v60 = v42;
  }
  uint64_t v61 = v59 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v59 >> 2, 4uLL);
  if (v42 == v48)
  {
    LODWORD(v61) = 0;
  }
  else
  {
    v62 = v60 - 4;
    uint64_t v63 = v61;
    do
    {
      int v64 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v62[4 * v63]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v64);
      --v63;
    }
    while (v63);
  }
  unsigned int v65 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v61);
  v66 = [(QSSErrorBlamerRequest *)self ref_transcript];
  v67 = v66;
  if (!v66) {
    v66 = &stru_26DEBFAF8;
  }
  v68 = (const char *)[(__CFString *)v66 UTF8String];
  size_t v69 = strlen(v68);
  unsigned int v70 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v68, v69);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v71 = *((_DWORD *)a3 + 8);
  int v72 = *((_DWORD *)a3 + 12);
  int v73 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v82);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v81);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v80);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v79);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v78);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v77);
  flatbuffers::FlatBufferBuilder::AddElement<double>((flatbuffers::vector_downward *)a3, 16, v37);
  flatbuffers::FlatBufferBuilder::AddElement<double>((flatbuffers::vector_downward *)a3, 18, v39);
  if (v65)
  {
    int v74 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v65);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v74);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 22, v70);
  v75.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v71 - v72 + v73);
  if (v42) {
    operator delete(v42);
  }
  if (v93.__begin_) {
    operator delete(v93.__begin_);
  }
  return v75;
}

- (NSString)ref_transcript
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 22].var0;
  if (*(_WORD *)root[-v3 + 22].var0)
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)audio_packets
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"audio_packets"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
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
            __int16 v12 = [[QSSAudioPacket alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"audio_packets"];
  }
  return (NSArray *)v3;
}

- (double)longitude
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x13u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[18].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (double)latitude
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x11u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[16].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (QSSUserAcousticProfile)user_acoustic_profile
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_acoustic_profile"];
  if (!v3)
  {
    uint64_t v4 = [QSSUserAcousticProfile alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (uint64_t v7 = *(unsigned __int16 *)v6[14].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(QSSUserAcousticProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_acoustic_profile"];
  }
  return v3;
}

- (QSSUserLanguageProfile)user_language_profile
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_language_profile"];
  if (!v3)
  {
    uint64_t v4 = [QSSUserLanguageProfile alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(QSSUserLanguageProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_language_profile"];
  }
  return v3;
}

- (NSString)right_context
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

- (NSString)left_context
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

- (NSArray)contextual_text
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"contextual_text"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[6].var0;
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
            __int16 v12 = (void *)[[NSString alloc] initWithBytes:&v10[*(unsigned int *)v10->var0 + 4] length:*(unsigned int *)v10[*(unsigned int *)v10->var0].var0 encoding:4];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"contextual_text"];
  }
  return (NSArray *)v3;
}

- (QSSStartSpeechRequest)start_speech_request
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"start_speech_request"];
  if (!v3)
  {
    uint64_t v4 = [QSSStartSpeechRequest alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(QSSStartSpeechRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"start_speech_request"];
  }
  return v3;
}

- (QSSErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v56.receiver = self;
  v56.super_class = (Class)QSSErrorBlamerRequest;
  uint64_t v10 = [(QSSErrorBlamerRequest *)&v56 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_76;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_77;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const ErrorBlamerRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_75;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_77;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v51 = v18;
  unint64_t v52 = v19;
  long long v53 = xmmword_22B64D0E0;
  uint64_t v54 = 0;
  char v55 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_75;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v51, v11->_root->var0)) {
    goto LABEL_77;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 4u)) {
    goto LABEL_77;
  }
  unint64_t v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u)
  {
    uint64_t v22 = v21[2];
    if (v22)
    {
      if (!siri::speech::schema_fb::StartSpeechRequest::Verify((flatbuffers::Table *)((char *)root + v22 + *(unsigned int *)((char *)root + v22)), (flatbuffers::Verifier *)&v51))goto LABEL_77; {
    }
      }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 6u)) {
    goto LABEL_77;
  }
  v23 = 0;
  uint64_t v24 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v24) >= 7u)
  {
    if (!*(_WORD *)((char *)root - v24 + 6)) {
      goto LABEL_23;
    }
    if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v51, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v24 + 6)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v24 + 6)), 4uLL, 0))goto LABEL_77; {
    v23 = 0;
    }
    uint64_t v24 = *(int *)root;
    if (*(unsigned __int16 *)((char *)root - v24) >= 7u)
    {
LABEL_23:
      uint64_t v25 = *(unsigned __int16 *)((char *)root - v24 + 6);
      if (v25) {
        v23 = (_DWORD *)((char *)root + v25 + *(unsigned int *)((char *)root + v25));
      }
      else {
        v23 = 0;
      }
    }
  }
  if (!flatbuffers::Verifier::VerifyVectorOfStrings((flatbuffers::Verifier *)&v51, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 8u))
  {
    goto LABEL_77;
  }
  v26 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v26 >= 9u && (uint64_t v27 = v26[4]) != 0) {
    v28 = (const unsigned __int8 *)root + v27 + *(unsigned int *)((char *)root + v27);
  }
  else {
    v28 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v51, v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 0xAu))
  {
    goto LABEL_77;
  }
  size_t v29 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v29 >= 0xBu && (uint64_t v30 = v29[5]) != 0) {
    v31 = (const unsigned __int8 *)root + v30 + *(unsigned int *)((char *)root + v30);
  }
  else {
    v31 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v51, v31)) {
    goto LABEL_77;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 0xCu)) {
    goto LABEL_77;
  }
  v32 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v32 >= 0xDu)
  {
    uint64_t v33 = v32[6];
    if (v33)
    {
      if (!siri::speech::schema_fb::UserLanguageProfile::Verify((flatbuffers::Table *)((char *)root + v33 + *(unsigned int *)((char *)root + v33)), (flatbuffers::Verifier *)&v51))goto LABEL_77; {
    }
      }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 0xEu)) {
    goto LABEL_77;
  }
  uint64_t v34 = *(int *)root;
  unsigned int v35 = *(unsigned __int16 *)((char *)root - v34);
  if (v35 >= 0xF)
  {
    if (*(_WORD *)((char *)root - v34 + 14))
    {
      if (!siri::speech::schema_fb::UserAcousticProfile::Verify((flatbuffers::Table *)((char *)root+ *(unsigned __int16 *)((char *)root - v34 + 14)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v34 + 14))), (flatbuffers::Verifier *)&v51))goto LABEL_77; {
      uint64_t v34 = *(int *)root;
      }
      uint64_t v36 = -v34;
      unsigned int v35 = *(unsigned __int16 *)((char *)root - v34);
    }
    else
    {
      uint64_t v36 = -v34;
    }
    if (v35 >= 0x11)
    {
      double v37 = (char *)root + v36;
      if (*((_WORD *)v37 + 8))
      {
        if (v52 < 9 || v52 - 8 < (unint64_t)root + *((unsigned __int16 *)v37 + 8) - v51) {
          goto LABEL_77;
        }
      }
      if (v35 >= 0x13
        && *((_WORD *)v37 + 9)
        && (v52 < 9 || v52 - 8 < (unint64_t)root + *((unsigned __int16 *)v37 + 9) - v51))
      {
        goto LABEL_77;
      }
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 0x14u)) {
    goto LABEL_77;
  }
  double v38 = 0;
  double v39 = (unsigned __int16 *)((char *)root - (int)v34);
  if (*v39 < 0x15u) {
    goto LABEL_68;
  }
  uint64_t v40 = v39[10];
  if (!v40)
  {
    uint64_t v42 = -(uint64_t)(int)v34;
LABEL_65:
    uint64_t v43 = *(unsigned __int16 *)((char *)root + v42 + 20);
    if (v43) {
      double v38 = (_DWORD *)((char *)root + v43 + *(unsigned int *)((char *)root + v43));
    }
    else {
      double v38 = 0;
    }
    goto LABEL_68;
  }
  if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v51, (const unsigned __int8 *)root + v40 + *(unsigned int *)((char *)root + v40), 4uLL, 0))
  {
LABEL_77:
    v49 = 0;
    goto LABEL_78;
  }
  double v38 = 0;
  uint64_t v41 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v41) >= 0x15u)
  {
    uint64_t v42 = -v41;
    goto LABEL_65;
  }
LABEL_68:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::AudioPacket>((flatbuffers::Verifier *)&v51, v38)|| !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 0x16u))
  {
    goto LABEL_77;
  }
  v44 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v44 >= 0x17u && (uint64_t v45 = v44[11]) != 0) {
    uint64_t v46 = (const unsigned __int8 *)root + v45 + *(unsigned int *)((char *)root + v45);
  }
  else {
    uint64_t v46 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v51, v46)) {
    goto LABEL_77;
  }
LABEL_75:
  uint64_t v47 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v51);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v47;

LABEL_76:
  v49 = v11;
LABEL_78:

  return v49;
}

- (QSSErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4
{
  return [(QSSErrorBlamerRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSErrorBlamerRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSErrorBlamerRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSErrorBlamerRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
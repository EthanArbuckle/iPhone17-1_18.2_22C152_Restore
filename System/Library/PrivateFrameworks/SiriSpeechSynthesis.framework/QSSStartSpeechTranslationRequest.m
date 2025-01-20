@interface QSSStartSpeechTranslationRequest
- (BOOL)restricted_mode;
- (BOOL)streaming_mode;
- (NSArray)text_to_speech_requests;
- (NSArray)translation_locale_pairs;
- (NSString)app_id;
- (NSString)conversation_id;
- (NSString)request_id;
- (Offset<siri::speech::schema_fb::StartSpeechTranslationRequest>)addObjectToBuffer:(void *)a3;
- (QSSStartSpeechRequest)start_speech_request;
- (QSSStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3;
- (QSSStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4;
- (QSSStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4 verify:(BOOL)a5;
- (QSSTranslationRequest)translation_request;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)opt_in_status;
@end

@implementation QSSStartSpeechTranslationRequest

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
  v2.var0 = [(QSSStartSpeechTranslationRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__48__QSSStartSpeechTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::StartSpeechTranslationRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  v4 = [(QSSStartSpeechTranslationRequest *)self conversation_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v8 = [(QSSStartSpeechTranslationRequest *)self request_id];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DEBFAF8;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  unsigned int v84 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  __int16 v12 = [(QSSStartSpeechTranslationRequest *)self translation_locale_pairs];
  unint64_t v13 = [v12 count];
  v14 = a3;
  v88 = self;
  if (v13)
  {
    if (v13 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v13);
    v17 = &v15[4 * v16];
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v18 = [(QSSStartSpeechTranslationRequest *)v88 translation_locale_pairs];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v96 objects:v101 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v97;
    v21 = v15;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v97 != v20) {
          objc_enumerationMutation(v18);
        }
        int v23 = [*(id *)(*((void *)&v96 + 1) + 8 * i) addObjectToBuffer:v14];
        int v24 = v23;
        if (v21 >= v17)
        {
          uint64_t v25 = (v21 - v15) >> 2;
          unint64_t v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v17 - v15) >> 1 > v26) {
            unint64_t v26 = (v17 - v15) >> 1;
          }
          if ((unint64_t)(v17 - v15) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v26;
          }
          if (v27) {
            unint64_t v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v27);
          }
          else {
            uint64_t v28 = 0;
          }
          v29 = (char *)(v27 + 4 * v25);
          *(_DWORD *)v29 = v24;
          v30 = v29 + 4;
          while (v21 != v15)
          {
            int v31 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v29 - 1) = v31;
            v29 -= 4;
          }
          v17 = (char *)(v27 + 4 * v28);
          if (v15) {
            operator delete(v15);
          }
          v15 = v29;
          v21 = v30;
          v14 = a3;
        }
        else
        {
          *(_DWORD *)v21 = v23;
          v21 += 4;
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v96 objects:v101 count:16];
    }
    while (v19);
  }
  else
  {
    v21 = v15;
  }

  v32 = v88;
  uint64_t v33 = v21 - v15;
  if (v21 == v15) {
    v34 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TranslationLocalePair>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TranslationLocalePair>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TranslationLocalePair>> const&)::t;
  }
  else {
    v34 = v15;
  }
  uint64_t v35 = v33 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v33 >> 2, 4uLL);
  if (v15 == v21)
  {
    LODWORD(v35) = 0;
  }
  else
  {
    v36 = v34 - 4;
    uint64_t v37 = v35;
    do
    {
      int v38 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v36[4 * v37]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v38);
      --v37;
    }
    while (v37);
    v32 = v88;
  }
  unsigned int v87 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v35);
  v39 = [(QSSStartSpeechTranslationRequest *)v32 start_speech_request];
  unsigned int v83 = [v39 addObjectToBuffer:a3];

  v40 = [(QSSStartSpeechTranslationRequest *)v32 translation_request];
  unsigned int v86 = [v40 addObjectToBuffer:a3];

  v41 = [(QSSStartSpeechTranslationRequest *)v32 text_to_speech_requests];
  unint64_t v42 = [v41 count];
  if (v42)
  {
    if (v42 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v42);
    v45 = &v43[4 * v44];
  }
  else
  {
    v43 = 0;
    v45 = 0;
  }

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  obuint64_t j = [(QSSStartSpeechTranslationRequest *)v32 text_to_speech_requests];
  v46 = a3;
  uint64_t v47 = [obj countByEnumeratingWithState:&v92 objects:v100 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v93;
    v49 = v43;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v93 != v48) {
          objc_enumerationMutation(obj);
        }
        int v51 = [*(id *)(*((void *)&v92 + 1) + 8 * j) addObjectToBuffer:v46];
        int v52 = v51;
        if (v49 >= v45)
        {
          uint64_t v53 = (v49 - v43) >> 2;
          unint64_t v54 = v53 + 1;
          if ((unint64_t)(v53 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v45 - v43) >> 1 > v54) {
            unint64_t v54 = (v45 - v43) >> 1;
          }
          if ((unint64_t)(v45 - v43) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v55 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v55 = v54;
          }
          if (v55) {
            unint64_t v55 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v55);
          }
          else {
            uint64_t v56 = 0;
          }
          v57 = (char *)(v55 + 4 * v53);
          *(_DWORD *)v57 = v52;
          v58 = v57 + 4;
          while (v49 != v43)
          {
            int v59 = *((_DWORD *)v49 - 1);
            v49 -= 4;
            *((_DWORD *)v57 - 1) = v59;
            v57 -= 4;
          }
          v45 = (char *)(v55 + 4 * v56);
          if (v43) {
            operator delete(v43);
          }
          v43 = v57;
          v49 = v58;
          v46 = a3;
        }
        else
        {
          *(_DWORD *)v49 = v51;
          v49 += 4;
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v92 objects:v100 count:16];
    }
    while (v47);
  }
  else
  {
    v49 = v43;
  }

  v60 = v88;
  uint64_t v61 = v49 - v43;
  if (v49 == v43) {
    v62 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest>> const&)::t;
  }
  else {
    v62 = v43;
  }
  uint64_t v63 = v61 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v61 >> 2, 4uLL);
  if (v43 == v49)
  {
    LODWORD(v63) = 0;
  }
  else
  {
    v64 = v62 - 4;
    uint64_t v65 = v63;
    do
    {
      int v66 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v64[4 * v65]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v66);
      --v65;
    }
    while (v65);
    v60 = v88;
  }
  unsigned int v67 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v63);
  int v68 = [(QSSStartSpeechTranslationRequest *)v60 restricted_mode];
  v69 = [(QSSStartSpeechTranslationRequest *)v60 app_id];
  v70 = v69;
  if (!v69) {
    v69 = &stru_26DEBFAF8;
  }
  v71 = (const char *)[(__CFString *)v69 UTF8String];
  size_t v72 = strlen(v71);
  unsigned int v73 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v71, v72);

  int v74 = [(QSSStartSpeechTranslationRequest *)v60 opt_in_status];
  int obja = [(QSSStartSpeechTranslationRequest *)v60 streaming_mode];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v75 = *((_DWORD *)a3 + 8);
  int v76 = *((_DWORD *)a3 + 12);
  int v77 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v84);
  if (v87)
  {
    int v78 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v87);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v78);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v83);
  if (v86)
  {
    int v79 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v86);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v79);
  }
  if (v67)
  {
    int v80 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v67);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v80);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 16, v68);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v73);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v74);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 22, obja);
  v81.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v75 - v76 + v77);
  if (v43) {
    operator delete(v43);
  }
  if (v15) {
    operator delete(v15);
  }
  return v81;
}

- (BOOL)streaming_mode
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x17u && (uint64_t v4 = *(unsigned __int16 *)v3[22].var0) != 0 && root[v4].var0[0] != 0;
}

- (int64_t)opt_in_status
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0) {
    return *(unsigned int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)app_id
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (BOOL)restricted_mode
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSArray)text_to_speech_requests
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"text_to_speech_requests"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xFu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[14].var0;
      if (v6)
      {
        size_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSTextToSpeechRequest alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"text_to_speech_requests"];
  }
  return (NSArray *)v3;
}

- (QSSTranslationRequest)translation_request
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_request"];
  if (!v3)
  {
    uint64_t v4 = [QSSTranslationRequest alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(QSSTranslationRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translation_request"];
  }
  return v3;
}

- (QSSStartSpeechRequest)start_speech_request
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"start_speech_request"];
  if (!v3)
  {
    uint64_t v4 = [QSSStartSpeechRequest alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
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

- (NSArray)translation_locale_pairs
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_locale_pairs"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 9u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[8].var0;
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
            __int16 v12 = [[QSSTranslationLocalePair alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translation_locale_pairs"];
  }
  return (NSArray *)v3;
}

- (NSString)request_id
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

- (NSString)conversation_id
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

- (QSSStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSStartSpeechTranslationRequest;
  uint64_t v10 = [(QSSStartSpeechTranslationRequest *)&v30 init];
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
      unint64_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const StartSpeechTranslationRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::StartSpeechTranslationRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::StartSpeechTranslationRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4
{
  return [(QSSStartSpeechTranslationRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSStartSpeechTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSStartSpeechTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
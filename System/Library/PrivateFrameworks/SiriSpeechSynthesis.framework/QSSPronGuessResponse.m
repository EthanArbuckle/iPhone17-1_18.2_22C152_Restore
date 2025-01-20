@interface QSSPronGuessResponse
- (NSArray)human_readable_prons;
- (NSArray)tts_pronunciations;
- (NSString)apg_id;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::PronGuessResponse>)addObjectToBuffer:(void *)a3;
- (QSSPronGuessResponse)initWithFlatbuffData:(id)a3;
- (QSSPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4;
- (QSSPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4 verify:(BOOL)a5;
- (QSSVocToken)voc_token;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)error_code;
@end

@implementation QSSPronGuessResponse

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
  v2.var0 = [(QSSPronGuessResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__36__QSSPronGuessResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::PronGuessResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSPronGuessResponse *)self speech_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  long long v9 = [(QSSPronGuessResponse *)self session_id];
  uint64_t v10 = v9;
  if (!v9) {
    long long v9 = &stru_26DEBFAF8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  unsigned int v78 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  int v77 = [(QSSPronGuessResponse *)self error_code];
  uint64_t v13 = [(QSSPronGuessResponse *)self error_str];
  v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_26DEBFAF8;
  }
  v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  unsigned int v76 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v15, v16);

  v17 = [(QSSPronGuessResponse *)self apg_id];
  v18 = v17;
  if (!v17) {
    v17 = &stru_26DEBFAF8;
  }
  v19 = (const char *)[(__CFString *)v17 UTF8String];
  size_t v20 = strlen(v19);
  unsigned int v75 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v19, v20);

  v21 = [(QSSPronGuessResponse *)self voc_token];
  unsigned int v81 = [v21 addObjectToBuffer:a3];

  v22 = [(QSSPronGuessResponse *)self tts_pronunciations];
  unint64_t v23 = [v22 count];
  v84 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v23)
  {
    if (v23 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v23);
    v26 = &v24[4 * v25];
  }
  else
  {
    v24 = 0;
    v26 = 0;
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v27 = [(QSSPronGuessResponse *)self tts_pronunciations];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v90 objects:v95 count:16];
  obuint64_t j = self;
  if (v28)
  {
    uint64_t v29 = *(void *)v91;
    v30 = v24;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v91 != v29) {
          objc_enumerationMutation(v27);
        }
        int v32 = [*(id *)(*((void *)&v90 + 1) + 8 * i) addObjectToBuffer:v84];
        int v33 = v32;
        if (v30 >= v26)
        {
          uint64_t v34 = (v30 - v24) >> 2;
          unint64_t v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v26 - v24) >> 1 > v35) {
            unint64_t v35 = (v26 - v24) >> 1;
          }
          if ((unint64_t)(v26 - v24) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v36 = v35;
          }
          if (v36) {
            unint64_t v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v36);
          }
          else {
            uint64_t v37 = 0;
          }
          v38 = (char *)(v36 + 4 * v34);
          *(_DWORD *)v38 = v33;
          v39 = v38 + 4;
          while (v30 != v24)
          {
            int v40 = *((_DWORD *)v30 - 1);
            v30 -= 4;
            *((_DWORD *)v38 - 1) = v40;
            v38 -= 4;
          }
          v26 = (char *)(v36 + 4 * v37);
          if (v24) {
            operator delete(v24);
          }
          v24 = v38;
          v30 = v39;
        }
        else
        {
          *(_DWORD *)v30 = v32;
          v30 += 4;
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v90 objects:v95 count:16];
    }
    while (v28);
  }
  else
  {
    v30 = v24;
  }

  unint64_t v41 = (unint64_t)v84;
  uint64_t v42 = v30 - v24;
  if (v30 == v24) {
    v43 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::Pronunciation>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::Pronunciation>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::Pronunciation>> const&)::t;
  }
  else {
    v43 = v24;
  }
  uint64_t v44 = v42 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v84, v42 >> 2, 4uLL);
  if (v24 == v30)
  {
    LODWORD(v44) = 0;
  }
  else
  {
    v45 = v43 - 4;
    uint64_t v46 = v44;
    do
    {
      int v47 = flatbuffers::FlatBufferBuilder::ReferTo(v84, *(_DWORD *)&v45[4 * v46]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v84, v47);
      --v46;
    }
    while (v46);
  }
  unsigned int v80 = flatbuffers::FlatBufferBuilder::EndVector(v84, v44);
  memset(&v89, 0, sizeof(v89));
  v48 = [(QSSPronGuessResponse *)obj human_readable_prons];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v89, [v48 count]);

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obja = [(QSSPronGuessResponse *)obj human_readable_prons];
  uint64_t v49 = [obja countByEnumeratingWithState:&v85 objects:v94 count:16];
  begin = v89.__begin_;
  if (v49)
  {
    uint64_t v51 = *(void *)v86;
    value = v89.__end_cap_.__value_;
    do
    {
      for (uint64_t j = 0; j != v49; ++j)
      {
        if (*(void *)v86 != v51) {
          objc_enumerationMutation(obja);
        }
        v54 = (const char *)[*(id *)(*((void *)&v85 + 1) + 8 * j) UTF8String];
        size_t v55 = strlen(v54);
        int v56 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)v41, v54, v55);
        int v57 = v56;
        std::vector<int>::pointer end = v89.__end_;
        if (v89.__end_ >= value)
        {
          uint64_t v60 = v89.__end_ - begin;
          unint64_t v61 = v60 + 1;
          if ((unint64_t)(v60 + 1) >> 62)
          {
            v89.__end_cap_.__value_ = value;
            v89.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v61) {
            unint64_t v61 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v62 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v62 = v61;
          }
          if (v62) {
            unint64_t v62 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v62);
          }
          else {
            uint64_t v63 = 0;
          }
          v64 = (int *)(v62 + 4 * v60);
          int *v64 = v57;
          v59 = v64 + 1;
          while (end != begin)
          {
            int v65 = *--end;
            *--v64 = v65;
          }
          value = (int *)(v62 + 4 * v63);
          v89.__end_ = v59;
          if (begin) {
            operator delete(begin);
          }
          begin = v64;
          unint64_t v41 = (unint64_t)v84;
        }
        else
        {
          *v89.__end_ = v56;
          v59 = end + 1;
        }
        v89.__end_ = v59;
      }
      v89.__end_cap_.__value_ = value;
      v89.__begin_ = begin;
      uint64_t v49 = [obja countByEnumeratingWithState:&v85 objects:v94 count:16];
    }
    while (v49);
  }
  else
  {
    v59 = v89.__end_;
  }

  if (v59 == begin) {
    v66 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v66 = begin;
  }
  unsigned int v67 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)v41, (uint64_t)v66, v59 - begin);
  flatbuffers::FlatBufferBuilder::NotNested(v41);
  *(unsigned char *)(v41 + 70) = 1;
  int v68 = *(_DWORD *)(v41 + 32);
  int v69 = *(_DWORD *)(v41 + 48);
  int v70 = *(_DWORD *)(v41 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v41, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v41, 6, v78);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v41, 8, v77);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v41, 10, v76);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v41, 12, v75);
  if (v81)
  {
    int v71 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v41, v81);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v41, 14, v71);
  }
  if (v80)
  {
    int v72 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v41, v80);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v41, 16, v72);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v41, 18, v67);
  v73.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v41, v68 - v69 + v70);
  if (begin)
  {
    v89.__end_ = begin;
    operator delete(begin);
  }
  if (v24) {
    operator delete(v24);
  }
  return v73;
}

- (NSArray)human_readable_prons
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"human_readable_prons"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x13u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[18].var0;
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
            size_t v12 = (void *)[[NSString alloc] initWithBytes:&v10[*(unsigned int *)v10->var0 + 4] length:*(unsigned int *)v10[*(unsigned int *)v10->var0].var0 encoding:4];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"human_readable_prons"];
  }
  return (NSArray *)v3;
}

- (NSArray)tts_pronunciations
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tts_pronunciations"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x11u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[16].var0;
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
            size_t v12 = [[QSSPronunciation alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"tts_pronunciations"];
  }
  return (NSArray *)v3;
}

- (QSSVocToken)voc_token
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"voc_token"];
  if (!v3)
  {
    v4 = [QSSVocToken alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (uint64_t v7 = *(unsigned __int16 *)v6[14].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    v3 = [(QSSVocToken *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"voc_token"];
  }
  return v3;
}

- (NSString)apg_id
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

- (QSSPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSPronGuessResponse;
  uint64_t v10 = [(QSSPronGuessResponse *)&v30 init];
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
      a4 = (const PronGuessResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::PronGuessResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::PronGuessResponse::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          unint64_t v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  unint64_t v23 = v11;
LABEL_17:

  return v23;
}

- (QSSPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4
{
  return [(QSSPronGuessResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSPronGuessResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSPronGuessResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSPronGuessResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
@interface QSSTranslationRequest
- (BOOL)disable_log;
- (NSArray)translation_phrase;
- (NSString)app_id;
- (NSString)request_id;
- (NSString)sequence_id;
- (NSString)source_language;
- (NSString)speech_id;
- (NSString)target_language;
- (NSString)task;
- (NSString)use_case;
- (Offset<siri::speech::schema_fb::TranslationRequest>)addObjectToBuffer:(void *)a3;
- (QSSSiriPayloadTranslationInfo)siri_payload_translation_info;
- (QSSSiriTranslationInfo)siri_translation_info;
- (QSSSpeechTranslationInfo)speech_translation_info;
- (QSSTranslationRequest)initWithFlatbuffData:(id)a3;
- (QSSTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4;
- (QSSTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4 verify:(BOOL)a5;
- (QSSWebTranslationInfo)web_translation_info;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)opt_in_status;
@end

@implementation QSSTranslationRequest

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
  v2.var0 = [(QSSTranslationRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__37__QSSTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TranslationRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  v3 = [(QSSTranslationRequest *)self speech_id];
  v4 = v3;
  if (!v3) {
    v3 = &stru_26DEBFAF8;
  }
  uint64_t v5 = (const char *)[(__CFString *)v3 UTF8String];
  size_t v6 = strlen(v5);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v5, v6);

  long long v7 = [(QSSTranslationRequest *)self request_id];
  long long v8 = v7;
  if (!v7) {
    long long v7 = &stru_26DEBFAF8;
  }
  long long v9 = (const char *)[(__CFString *)v7 UTF8String];
  size_t v10 = strlen(v9);
  unsigned int v78 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v9, v10);

  uint64_t v11 = [(QSSTranslationRequest *)self task];
  __int16 v12 = v11;
  if (!v11) {
    uint64_t v11 = &stru_26DEBFAF8;
  }
  uint64_t v13 = (const char *)[(__CFString *)v11 UTF8String];
  size_t v14 = strlen(v13);
  unsigned int v77 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v13, v14);

  v15 = [(QSSTranslationRequest *)self source_language];
  v16 = v15;
  if (!v15) {
    v15 = &stru_26DEBFAF8;
  }
  v17 = (const char *)[(__CFString *)v15 UTF8String];
  size_t v18 = strlen(v17);
  unsigned int v76 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  v19 = [(QSSTranslationRequest *)self target_language];
  v20 = v19;
  if (!v19) {
    v19 = &stru_26DEBFAF8;
  }
  v21 = (const char *)[(__CFString *)v19 UTF8String];
  size_t v22 = strlen(v21);
  unsigned int v23 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v21, v22);

  memset(&v90, 0, sizeof(v90));
  v24 = [(QSSTranslationRequest *)self translation_phrase];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v90, [v24 count]);

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v25 = [(QSSTranslationRequest *)self translation_phrase];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v86 objects:v91 count:16];
  unsigned int v75 = v23;
  begin = v90.__begin_;
  if (v26)
  {
    uint64_t v28 = *(void *)v87;
    value = v90.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v87 != v28) {
          objc_enumerationMutation(v25);
        }
        v31 = (const char *)[*(id *)(*((void *)&v86 + 1) + 8 * i) UTF8String];
        size_t v32 = strlen(v31);
        int v33 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v31, v32);
        int v34 = v33;
        std::vector<int>::pointer end = v90.__end_;
        if (v90.__end_ >= value)
        {
          uint64_t v37 = v90.__end_ - begin;
          unint64_t v38 = v37 + 1;
          if ((unint64_t)(v37 + 1) >> 62)
          {
            v90.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v38) {
            unint64_t v38 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v39 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v39 = v38;
          }
          if (v39) {
            unint64_t v39 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v39);
          }
          else {
            uint64_t v40 = 0;
          }
          v41 = (int *)(v39 + 4 * v37);
          int *v41 = v34;
          v36 = v41 + 1;
          while (end != begin)
          {
            int v42 = *--end;
            *--v41 = v42;
          }
          value = (int *)(v39 + 4 * v40);
          v90.__end_ = v36;
          if (begin) {
            operator delete(begin);
          }
          begin = v41;
        }
        else
        {
          *v90.__end_ = v33;
          v36 = end + 1;
        }
        v90.__end_ = v36;
      }
      v90.__end_cap_.__value_ = value;
      v90.__begin_ = begin;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v86 objects:v91 count:16];
    }
    while (v26);
  }
  else
  {
    v36 = v90.__end_;
  }

  if (v36 == begin) {
    v43 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v43 = begin;
  }
  unsigned int v44 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v43, v36 - begin);
  v45 = [(QSSTranslationRequest *)self siri_translation_info];
  unsigned int v82 = [v45 addObjectToBuffer:a3];

  v46 = [(QSSTranslationRequest *)self speech_translation_info];
  unsigned int v81 = [v46 addObjectToBuffer:a3];

  v47 = [(QSSTranslationRequest *)self siri_payload_translation_info];
  unsigned int v80 = [v47 addObjectToBuffer:a3];

  v48 = [(QSSTranslationRequest *)self sequence_id];
  v49 = v48;
  if (!v48) {
    v48 = &stru_26DEBFAF8;
  }
  v50 = (const char *)[(__CFString *)v48 UTF8String];
  size_t v51 = strlen(v50);
  unsigned int v52 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v50, v51);

  v53 = [(QSSTranslationRequest *)self web_translation_info];
  unsigned int v54 = [v53 addObjectToBuffer:a3];

  int v55 = [(QSSTranslationRequest *)self disable_log];
  int v56 = [(QSSTranslationRequest *)self opt_in_status];
  v57 = [(QSSTranslationRequest *)self app_id];
  v58 = v57;
  if (!v57) {
    v57 = &stru_26DEBFAF8;
  }
  v59 = (const char *)[(__CFString *)v57 UTF8String];
  size_t v60 = strlen(v59);
  unsigned int v61 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v59, v60);

  v62 = [(QSSTranslationRequest *)self use_case];
  v63 = v62;
  if (!v62) {
    v62 = &stru_26DEBFAF8;
  }
  v64 = (const char *)[(__CFString *)v62 UTF8String];
  size_t v65 = strlen(v64);
  unsigned int v84 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v64, v65);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v74 = *((_DWORD *)a3 + 8);
  int v66 = *((_DWORD *)a3 + 12);
  int v67 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v78);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v77);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v76);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v75);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v44);
  if (v82)
  {
    int v68 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v82);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v68);
  }
  if (v81)
  {
    int v69 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v81);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v69);
  }
  if (v80)
  {
    int v70 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v80);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v70);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 22, v52);
  if (v54)
  {
    int v71 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v54);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 24, v71);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 26, v55);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 28, v56);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 30, v61);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 32, v84);
  v72.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v74 - v66 + v67);
  if (begin)
  {
    v90.__end_ = begin;
    operator delete(begin);
  }
  return v72;
}

- (NSString)use_case
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 32].var0;
  if (*(_WORD *)root[-v3 + 32].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    size_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    size_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)app_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 30].var0;
  if (*(_WORD *)root[-v3 + 30].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    size_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    size_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (int64_t)opt_in_status
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x1Du && (uint64_t v4 = *(unsigned __int16 *)v3[28].var0) != 0) {
    return *(unsigned int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (BOOL)disable_log
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x1Bu && (uint64_t v4 = *(unsigned __int16 *)v3[26].var0) != 0 && root[v4].var0[0] != 0;
}

- (QSSWebTranslationInfo)web_translation_info
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"web_translation_info"];
  if (!v3)
  {
    uint64_t v4 = [QSSWebTranslationInfo alloc];
    root = self->_root;
    size_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (uint64_t v7 = *(unsigned __int16 *)v6[24].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    uint64_t v3 = [(QSSWebTranslationInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"web_translation_info"];
  }
  return v3;
}

- (NSString)sequence_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 22].var0;
  if (*(_WORD *)root[-v3 + 22].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    size_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    size_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSSiriPayloadTranslationInfo)siri_payload_translation_info
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"siri_payload_translation_info"];
  if (!v3)
  {
    uint64_t v4 = [QSSSiriPayloadTranslationInfo alloc];
    root = self->_root;
    size_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (uint64_t v7 = *(unsigned __int16 *)v6[20].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    uint64_t v3 = [(QSSSiriPayloadTranslationInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"siri_payload_translation_info"];
  }
  return v3;
}

- (QSSSpeechTranslationInfo)speech_translation_info
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"speech_translation_info"];
  if (!v3)
  {
    uint64_t v4 = [QSSSpeechTranslationInfo alloc];
    root = self->_root;
    size_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x13u && (uint64_t v7 = *(unsigned __int16 *)v6[18].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    uint64_t v3 = [(QSSSpeechTranslationInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"speech_translation_info"];
  }
  return v3;
}

- (QSSSiriTranslationInfo)siri_translation_info
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"siri_translation_info"];
  if (!v3)
  {
    uint64_t v4 = [QSSSiriTranslationInfo alloc];
    root = self->_root;
    size_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x11u && (uint64_t v7 = *(unsigned __int16 *)v6[16].var0) != 0) {
      long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      long long v8 = 0;
    }
    uint64_t v3 = [(QSSSiriTranslationInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"siri_translation_info"];
  }
  return v3;
}

- (NSArray)translation_phrase
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_phrase"];
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
        uint64_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        size_t v10 = &v7[v8 + 4];
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
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translation_phrase"];
  }
  return (NSArray *)v3;
}

- (NSString)target_language
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

- (NSString)source_language
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

- (NSString)task
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

- (QSSTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTranslationRequest;
  size_t v10 = [(QSSTranslationRequest *)&v30 init];
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
      a4 = (const TranslationRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TranslationRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TranslationRequest::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          unsigned int v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  unsigned int v23 = v11;
LABEL_17:

  return v23;
}

- (QSSTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4
{
  return [(QSSTranslationRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTranslationRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSTranslationRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
@interface QSSStartSpeechTranslationLoggingRequest
- (NSArray)senses;
- (NSArray)user_interacted_senses;
- (NSString)conversation_id;
- (NSString)request_id;
- (NSString)user_selected_locale;
- (NSString)user_selected_sense;
- (Offset<siri::speech::schema_fb::StartSpeechTranslationLoggingRequest>)addObjectToBuffer:(void *)a3;
- (QSSLanguageDetected)detected_locale;
- (QSSStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3;
- (QSSStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationLoggingRequest *)a4;
- (QSSStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationLoggingRequest *)a4 verify:(BOOL)a5;
- (QSSTranslationLocalePair)translation_locale_pair;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSStartSpeechTranslationLoggingRequest

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
  v2.var0 = [(QSSStartSpeechTranslationLoggingRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__55__QSSStartSpeechTranslationLoggingRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::StartSpeechTranslationLoggingRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  v4 = [(QSSStartSpeechTranslationLoggingRequest *)self conversation_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v8 = [(QSSStartSpeechTranslationLoggingRequest *)self request_id];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DEBFAF8;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  unsigned int v73 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  __int16 v12 = [(QSSStartSpeechTranslationLoggingRequest *)self translation_locale_pair];
  unsigned int v72 = [v12 addObjectToBuffer:a3];

  uint64_t v13 = [(QSSStartSpeechTranslationLoggingRequest *)self detected_locale];
  unsigned int v75 = [v13 addObjectToBuffer:a3];

  v14 = [(QSSStartSpeechTranslationLoggingRequest *)self user_selected_locale];
  v15 = v14;
  if (!v14) {
    v14 = &stru_26DEBFAF8;
  }
  v16 = (const char *)[(__CFString *)v14 UTF8String];
  size_t v17 = strlen(v16);
  LODWORD(v16) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v16, v17);

  memset(&v88, 0, sizeof(v88));
  v18 = [(QSSStartSpeechTranslationLoggingRequest *)self senses];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v88, [v18 count]);

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v19 = [(QSSStartSpeechTranslationLoggingRequest *)self senses];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v84 objects:v90 count:16];
  unsigned int v71 = v16;
  begin = v88.__begin_;
  if (v20)
  {
    uint64_t v22 = *(void *)v85;
    value = v88.__end_cap_.__value_;
    v77 = v19;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v85 != v22) {
          objc_enumerationMutation(v19);
        }
        v25 = (const char *)[*(id *)(*((void *)&v84 + 1) + 8 * i) UTF8String];
        size_t v26 = strlen(v25);
        int v27 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v25, v26);
        int v28 = v27;
        std::vector<int>::pointer end = v88.__end_;
        if (v88.__end_ >= value)
        {
          uint64_t v31 = v88.__end_ - begin;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 62)
          {
            v88.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v32) {
            unint64_t v32 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v33 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v33 = v32;
          }
          if (v33) {
            unint64_t v33 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v33);
          }
          else {
            uint64_t v34 = 0;
          }
          v35 = (int *)(v33 + 4 * v31);
          int *v35 = v28;
          v30 = v35 + 1;
          while (end != begin)
          {
            int v36 = *--end;
            *--v35 = v36;
          }
          value = (int *)(v33 + 4 * v34);
          v88.__end_ = v30;
          if (begin) {
            operator delete(begin);
          }
          begin = v35;
          v19 = v77;
        }
        else
        {
          *v88.__end_ = v27;
          v30 = end + 1;
        }
        v88.__end_ = v30;
      }
      v88.__end_cap_.__value_ = value;
      v88.__begin_ = begin;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v84 objects:v90 count:16];
    }
    while (v20);
  }
  else
  {
    v30 = v88.__end_;
  }

  if (v30 == begin) {
    v37 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v37 = begin;
  }
  unsigned int v70 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v37, v30 - begin);
  v38 = [(QSSStartSpeechTranslationLoggingRequest *)self user_selected_sense];
  v39 = v38;
  if (!v38) {
    v38 = &stru_26DEBFAF8;
  }
  v40 = (const char *)[(__CFString *)v38 UTF8String];
  size_t v41 = strlen(v40);
  unsigned int v69 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v40, v41);

  memset(&v83, 0, sizeof(v83));
  v42 = [(QSSStartSpeechTranslationLoggingRequest *)self user_interacted_senses];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v83, [v42 count]);

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v43 = [(QSSStartSpeechTranslationLoggingRequest *)self user_interacted_senses];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v79 objects:v89 count:16];
  v45 = v83.__begin_;
  if (v44)
  {
    uint64_t v46 = *(void *)v80;
    v47 = v83.__end_cap_.__value_;
    v78 = v43;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v80 != v46) {
          objc_enumerationMutation(v43);
        }
        v49 = (const char *)[*(id *)(*((void *)&v79 + 1) + 8 * j) UTF8String];
        size_t v50 = strlen(v49);
        int v51 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v49, v50);
        int v52 = v51;
        std::vector<int>::pointer v53 = v83.__end_;
        if (v83.__end_ >= v47)
        {
          uint64_t v55 = v83.__end_ - v45;
          unint64_t v56 = v55 + 1;
          if ((unint64_t)(v55 + 1) >> 62)
          {
            v83.__begin_ = v45;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v47 - (char *)v45) >> 1 > v56) {
            unint64_t v56 = ((char *)v47 - (char *)v45) >> 1;
          }
          if ((unint64_t)((char *)v47 - (char *)v45) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v57 = v56;
          }
          if (v57) {
            unint64_t v57 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v57);
          }
          else {
            uint64_t v58 = 0;
          }
          v59 = (int *)(v57 + 4 * v55);
          int *v59 = v52;
          v54 = v59 + 1;
          while (v53 != v45)
          {
            int v60 = *--v53;
            *--v59 = v60;
          }
          v47 = (int *)(v57 + 4 * v58);
          v83.__end_ = v54;
          if (v45) {
            operator delete(v45);
          }
          v45 = v59;
          v43 = v78;
        }
        else
        {
          *v83.__end_ = v51;
          v54 = v53 + 1;
        }
        v83.__end_ = v54;
      }
      v83.__end_cap_.__value_ = v47;
      v83.__begin_ = v45;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v79 objects:v89 count:16];
    }
    while (v44);
  }
  else
  {
    v54 = v83.__end_;
  }

  if (v54 == v45) {
    v61 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v61 = v45;
  }
  unsigned int v62 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v61, v54 - v45);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v63 = *((_DWORD *)a3 + 8);
  int v64 = *((_DWORD *)a3 + 12);
  int v65 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v73);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v72);
  if (v75)
  {
    int v66 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v75);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v66);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v71);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v70);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v69);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v62);
  v67.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v63 - v64 + v65);
  if (v45)
  {
    v83.__end_ = v45;
    operator delete(v45);
  }
  if (v88.__begin_) {
    operator delete(v88.__begin_);
  }
  return v67;
}

- (NSArray)user_interacted_senses
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_interacted_senses"];
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
        size_t v7 = &root[v6];
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
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_interacted_senses"];
  }
  return (NSArray *)v3;
}

- (NSString)user_selected_sense
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)senses
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"senses"];
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
            __int16 v12 = (void *)[[NSString alloc] initWithBytes:&v10[*(unsigned int *)v10->var0 + 4] length:*(unsigned int *)v10[*(unsigned int *)v10->var0].var0 encoding:4];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"senses"];
  }
  return (NSArray *)v3;
}

- (NSString)user_selected_locale
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSLanguageDetected)detected_locale
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"detected_locale"];
  if (!v3)
  {
    uint64_t v4 = [QSSLanguageDetected alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(QSSLanguageDetected *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"detected_locale"];
  }
  return v3;
}

- (QSSTranslationLocalePair)translation_locale_pair
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_locale_pair"];
  if (!v3)
  {
    uint64_t v4 = [QSSTranslationLocalePair alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (uint64_t v7 = *(unsigned __int16 *)v6[8].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(QSSTranslationLocalePair *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translation_locale_pair"];
  }
  return v3;
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

- (QSSStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationLoggingRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSStartSpeechTranslationLoggingRequest;
  uint64_t v10 = [(QSSStartSpeechTranslationLoggingRequest *)&v30 init];
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
      a4 = (const StartSpeechTranslationLoggingRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::StartSpeechTranslationLoggingRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::StartSpeechTranslationLoggingRequest::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (QSSStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationLoggingRequest *)a4
{
  return [(QSSStartSpeechTranslationLoggingRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSStartSpeechTranslationLoggingRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSStartSpeechTranslationLoggingRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
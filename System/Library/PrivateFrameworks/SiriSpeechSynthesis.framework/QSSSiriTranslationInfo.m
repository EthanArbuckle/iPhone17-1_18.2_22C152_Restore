@interface QSSSiriTranslationInfo
- (NSArray)itn_alignments;
- (NSArray)post_itn_tokens;
- (NSArray)raw_nbest_choices;
- (NSArray)translation_phrase;
- (NSString)post_itn_recognition;
- (Offset<siri::speech::schema_fb::SiriTranslationInfo>)addObjectToBuffer:(void *)a3;
- (QSSRecognitionSausage)raw_sausage;
- (QSSSiriTranslationInfo)initWithFlatbuffData:(id)a3;
- (QSSSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4;
- (QSSSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSSiriTranslationInfo

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
  v2.var0 = [(QSSSiriTranslationInfo *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__38__QSSSiriTranslationInfo_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::SiriTranslationInfo>)addObjectToBuffer:(void *)a3
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  v4 = [(QSSSiriTranslationInfo *)self raw_sausage];
  unsigned int v5 = [v4 addObjectToBuffer:a3];

  memset(&v119, 0, sizeof(v119));
  char v6 = [(QSSSiriTranslationInfo *)self raw_nbest_choices];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v119, [v6 count]);

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v7 = [(QSSSiriTranslationInfo *)self raw_nbest_choices];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v115 objects:v123 count:16];
  obuint64_t j = v7;
  unsigned int v93 = v5;
  begin = v119.__begin_;
  if (v8)
  {
    uint64_t v10 = *(void *)v116;
    value = v119.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v116 != v10) {
          objc_enumerationMutation(obj);
        }
        int v13 = [*(id *)(*((void *)&v115 + 1) + 8 * i) addObjectToBuffer:a3];
        int v14 = v13;
        std::vector<int>::pointer end = v119.__end_;
        if (v119.__end_ >= value)
        {
          uint64_t v17 = v119.__end_ - begin;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
          {
            v119.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v18) {
            unint64_t v18 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v18;
          }
          if (v19) {
            unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v19);
          }
          else {
            uint64_t v20 = 0;
          }
          v21 = (int *)(v19 + 4 * v17);
          int *v21 = v14;
          v16 = v21 + 1;
          while (end != begin)
          {
            int v22 = *--end;
            *--v21 = v22;
          }
          value = (int *)(v19 + 4 * v20);
          v119.__end_ = v16;
          if (begin) {
            operator delete(begin);
          }
          begin = v21;
        }
        else
        {
          *v119.__end_ = v13;
          v16 = end + 1;
        }
        v119.__end_ = v16;
      }
      v119.__end_cap_.__value_ = value;
      v119.__begin_ = begin;
      uint64_t v8 = [obj countByEnumeratingWithState:&v115 objects:v123 count:16];
    }
    while (v8);
  }
  else
  {
    v16 = v119.__end_;
  }

  if (v16 == begin) {
    v23 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  }
  else {
    v23 = begin;
  }
  unsigned int v92 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v23, v16 - begin);
  memset(&v114, 0, sizeof(v114));
  v24 = [(QSSSiriTranslationInfo *)self post_itn_tokens];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v114, [v24 count]);

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v25 = [(QSSSiriTranslationInfo *)self post_itn_tokens];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v110 objects:v122 count:16];
  v27 = v114.__begin_;
  if (v26)
  {
    uint64_t v28 = *(void *)v111;
    v29 = v114.__end_cap_.__value_;
    id obja = v25;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v111 != v28) {
          objc_enumerationMutation(v25);
        }
        v31 = (const char *)[*(id *)(*((void *)&v110 + 1) + 8 * j) UTF8String];
        size_t v32 = strlen(v31);
        int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v31, v32);
        int v34 = String;
        std::vector<int>::pointer v35 = v114.__end_;
        if (v114.__end_ >= v29)
        {
          uint64_t v37 = v114.__end_ - v27;
          unint64_t v38 = v37 + 1;
          if ((unint64_t)(v37 + 1) >> 62)
          {
            v114.__begin_ = v27;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v29 - (char *)v27) >> 1 > v38) {
            unint64_t v38 = ((char *)v29 - (char *)v27) >> 1;
          }
          if ((unint64_t)((char *)v29 - (char *)v27) >= 0x7FFFFFFFFFFFFFFCLL) {
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
          while (v35 != v27)
          {
            int v42 = *--v35;
            *--v41 = v42;
          }
          v29 = (int *)(v39 + 4 * v40);
          v114.__end_ = v36;
          if (v27) {
            operator delete(v27);
          }
          v27 = v41;
          v25 = obja;
        }
        else
        {
          *v114.__end_ = String;
          v36 = v35 + 1;
        }
        v114.__end_ = v36;
      }
      v114.__end_cap_.__value_ = v29;
      v114.__begin_ = v27;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v110 objects:v122 count:16];
    }
    while (v26);
  }
  else
  {
    v36 = v114.__end_;
  }

  if (v36 == v27) {
    v43 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v43 = v27;
  }
  HIDWORD(v91) = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v43, v36 - v27);
  v44 = [(QSSSiriTranslationInfo *)self post_itn_recognition];
  v45 = v44;
  if (!v44) {
    v44 = &stru_26DEBFAF8;
  }
  v46 = (const char *)[(__CFString *)v44 UTF8String];
  size_t v47 = strlen(v46);
  LODWORD(v91) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v46, v47);

  memset(&v109, 0, sizeof(v109));
  v48 = [(QSSSiriTranslationInfo *)self itn_alignments];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v109, [v48 count]);

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v49 = [(QSSSiriTranslationInfo *)self itn_alignments];
  uint64_t v50 = [v49 countByEnumeratingWithState:&v105 objects:v121 count:16];
  v51 = v109.__begin_;
  if (v50)
  {
    uint64_t v52 = *(void *)v106;
    v53 = v109.__end_cap_.__value_;
    id objb = v49;
    do
    {
      for (uint64_t k = 0; k != v50; ++k)
      {
        if (*(void *)v106 != v52) {
          objc_enumerationMutation(v49);
        }
        int v55 = objc_msgSend(*(id *)(*((void *)&v105 + 1) + 8 * k), "addObjectToBuffer:", a3, v91);
        int v56 = v55;
        std::vector<int>::pointer v57 = v109.__end_;
        if (v109.__end_ >= v53)
        {
          uint64_t v59 = v109.__end_ - v51;
          unint64_t v60 = v59 + 1;
          if ((unint64_t)(v59 + 1) >> 62)
          {
            v109.__begin_ = v51;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v53 - (char *)v51) >> 1 > v60) {
            unint64_t v60 = ((char *)v53 - (char *)v51) >> 1;
          }
          if ((unint64_t)((char *)v53 - (char *)v51) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v61 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v61 = v60;
          }
          if (v61) {
            unint64_t v61 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v61);
          }
          else {
            uint64_t v62 = 0;
          }
          v63 = (int *)(v61 + 4 * v59);
          int *v63 = v56;
          v58 = v63 + 1;
          while (v57 != v51)
          {
            int v64 = *--v57;
            *--v63 = v64;
          }
          v53 = (int *)(v61 + 4 * v62);
          v109.__end_ = v58;
          if (v51) {
            operator delete(v51);
          }
          v51 = v63;
          v49 = objb;
        }
        else
        {
          *v109.__end_ = v55;
          v58 = v57 + 1;
        }
        v109.__end_ = v58;
      }
      v109.__end_cap_.__value_ = v53;
      v109.__begin_ = v51;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v105 objects:v121 count:16];
    }
    while (v50);
  }
  else
  {
    v58 = v109.__end_;
  }

  if (v58 == v51) {
    v65 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>> const&)::t;
  }
  else {
    v65 = v51;
  }
  unsigned int v66 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v65, v58 - v51);
  memset(&v104, 0, sizeof(v104));
  v67 = [(QSSSiriTranslationInfo *)self translation_phrase];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v104, [v67 count]);

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  v68 = [(QSSSiriTranslationInfo *)self translation_phrase];
  uint64_t v69 = [v68 countByEnumeratingWithState:&v100 objects:v120 count:16];
  id objc = v68;
  unsigned int v95 = v66;
  v70 = v104.__begin_;
  if (v69)
  {
    uint64_t v71 = *(void *)v101;
    v72 = v104.__end_cap_.__value_;
    do
    {
      for (uint64_t m = 0; m != v69; ++m)
      {
        if (*(void *)v101 != v71) {
          objc_enumerationMutation(objc);
        }
        int v74 = objc_msgSend(*(id *)(*((void *)&v100 + 1) + 8 * m), "addObjectToBuffer:", a3, v91);
        int v75 = v74;
        std::vector<int>::pointer v76 = v104.__end_;
        if (v104.__end_ >= v72)
        {
          uint64_t v78 = v104.__end_ - v70;
          unint64_t v79 = v78 + 1;
          if ((unint64_t)(v78 + 1) >> 62)
          {
            v104.__begin_ = v70;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v72 - (char *)v70) >> 1 > v79) {
            unint64_t v79 = ((char *)v72 - (char *)v70) >> 1;
          }
          if ((unint64_t)((char *)v72 - (char *)v70) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v80 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v80 = v79;
          }
          if (v80) {
            unint64_t v80 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v80);
          }
          else {
            uint64_t v81 = 0;
          }
          v82 = (int *)(v80 + 4 * v78);
          int *v82 = v75;
          v77 = v82 + 1;
          while (v76 != v70)
          {
            int v83 = *--v76;
            *--v82 = v83;
          }
          v72 = (int *)(v80 + 4 * v81);
          v104.__end_ = v77;
          if (v70) {
            operator delete(v70);
          }
          v70 = v82;
        }
        else
        {
          *v104.__end_ = v74;
          v77 = v76 + 1;
        }
        v104.__end_ = v77;
      }
      v104.__end_cap_.__value_ = v72;
      v104.__begin_ = v70;
      uint64_t v69 = [objc countByEnumeratingWithState:&v100 objects:v120 count:16];
    }
    while (v69);
  }
  else
  {
    v77 = v104.__end_;
  }

  if (v77 == v70) {
    v84 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::Span>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::Span>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::Span>> const&)::t;
  }
  else {
    v84 = v70;
  }
  unsigned int v85 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v84, v77 - v70);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v86 = *((_DWORD *)a3 + 8);
  int v87 = *((_DWORD *)a3 + 12);
  int v88 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v93);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v92);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, HIDWORD(v91));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v91);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v95);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v85);
  v89.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v86 - v87 + v88);
  if (v70)
  {
    v104.__end_ = v70;
    operator delete(v70);
  }
  if (v109.__begin_) {
    operator delete(v109.__begin_);
  }
  if (v114.__begin_) {
    operator delete(v114.__begin_);
  }
  if (v119.__begin_) {
    operator delete(v119.__begin_);
  }
  return v89;
}

- (NSArray)translation_phrase
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_phrase"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    unsigned int v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xFu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[14].var0;
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
            __int16 v12 = [[QSSSpan alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
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

- (NSArray)itn_alignments
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"itn_alignments"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    unsigned int v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xDu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[12].var0;
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
            __int16 v12 = [[QSSItnAlignment alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"itn_alignments"];
  }
  return (NSArray *)v3;
}

- (NSString)post_itn_recognition
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
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)post_itn_tokens
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn_tokens"];
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
        long long v7 = &root[v6];
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
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"post_itn_tokens"];
  }
  return (NSArray *)v3;
}

- (NSArray)raw_nbest_choices
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"raw_nbest_choices"];
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
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSRecognitionChoice alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"raw_nbest_choices"];
  }
  return (NSArray *)v3;
}

- (QSSRecognitionSausage)raw_sausage
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"raw_sausage"];
  if (!v3)
  {
    uint64_t v4 = [QSSRecognitionSausage alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(QSSRecognitionSausage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"raw_sausage"];
  }
  return v3;
}

- (QSSSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSSiriTranslationInfo;
  uint64_t v10 = [(QSSSiriTranslationInfo *)&v30 init];
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
      int v13 = (unsigned int *)[*p_data bytes];
      a4 = (const SiriTranslationInfo *)v13 + *v13;
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
      root = (siri::speech::schema_fb::SiriTranslationInfo *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::SiriTranslationInfo::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4
{
  return [(QSSSiriTranslationInfo *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSSiriTranslationInfo *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSSiriTranslationInfo)initWithFlatbuffData:(id)a3
{
  return [(QSSSiriTranslationInfo *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
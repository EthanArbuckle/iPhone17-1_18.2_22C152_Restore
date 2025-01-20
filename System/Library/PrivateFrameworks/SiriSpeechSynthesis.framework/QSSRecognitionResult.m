@interface QSSRecognitionResult
- (NSArray)choice_alignments;
- (NSArray)post_itn_nbest_choices;
- (NSArray)pre_itn_nbest_choices;
- (NSArray)pre_itn_token_to_post_itn_char_alignment;
- (Offset<siri::speech::schema_fb::RecognitionResult>)addObjectToBuffer:(void *)a3;
- (QSSRecognitionResult)initWithFlatbuffData:(id)a3;
- (QSSRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4;
- (QSSRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4 verify:(BOOL)a5;
- (QSSRecognitionSausage)post_itn;
- (QSSRecognitionSausage)pre_itn;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSRecognitionResult

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
  v2.var0 = [(QSSRecognitionResult *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__36__QSSRecognitionResult_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::RecognitionResult>)addObjectToBuffer:(void *)a3
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  v4 = [(QSSRecognitionResult *)self pre_itn];
  unsigned int v97 = [v4 addObjectToBuffer:a3];

  uint64_t v5 = [(QSSRecognitionResult *)self post_itn];
  unsigned int v6 = [v5 addObjectToBuffer:a3];

  memset(&v121, 0, sizeof(v121));
  long long v7 = [(QSSRecognitionResult *)self pre_itn_nbest_choices];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v121, [v7 count]);

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v8 = [(QSSRecognitionResult *)self pre_itn_nbest_choices];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v117 objects:v125 count:16];
  obuint64_t j = v8;
  unsigned int v96 = v6;
  begin = v121.__begin_;
  if (v9)
  {
    uint64_t v11 = *(void *)v118;
    value = v121.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v118 != v11) {
          objc_enumerationMutation(obj);
        }
        int v14 = [*(id *)(*((void *)&v117 + 1) + 8 * i) addObjectToBuffer:a3];
        int v15 = v14;
        std::vector<int>::pointer end = v121.__end_;
        if (v121.__end_ >= value)
        {
          uint64_t v18 = v121.__end_ - begin;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
          {
            v121.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v19) {
            unint64_t v19 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v19;
          }
          if (v20) {
            unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v20);
          }
          else {
            uint64_t v21 = 0;
          }
          v22 = (int *)(v20 + 4 * v18);
          int *v22 = v15;
          v17 = v22 + 1;
          while (end != begin)
          {
            int v23 = *--end;
            *--v22 = v23;
          }
          value = (int *)(v20 + 4 * v21);
          v121.__end_ = v17;
          if (begin) {
            operator delete(begin);
          }
          begin = v22;
        }
        else
        {
          *v121.__end_ = v14;
          v17 = end + 1;
        }
        v121.__end_ = v17;
      }
      v121.__end_cap_.__value_ = value;
      v121.__begin_ = begin;
      uint64_t v9 = [obj countByEnumeratingWithState:&v117 objects:v125 count:16];
    }
    while (v9);
  }
  else
  {
    v17 = v121.__end_;
  }

  if (v17 == begin) {
    v24 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  }
  else {
    v24 = begin;
  }
  unsigned int v95 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v24, v17 - begin);
  memset(&v116, 0, sizeof(v116));
  v25 = [(QSSRecognitionResult *)self post_itn_nbest_choices];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v116, [v25 count]);

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  v26 = [(QSSRecognitionResult *)self post_itn_nbest_choices];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v112 objects:v124 count:16];
  v28 = v116.__begin_;
  if (v27)
  {
    uint64_t v29 = *(void *)v113;
    v30 = v116.__end_cap_.__value_;
    id obja = v26;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v113 != v29) {
          objc_enumerationMutation(v26);
        }
        int v32 = [*(id *)(*((void *)&v112 + 1) + 8 * j) addObjectToBuffer:a3];
        int v33 = v32;
        std::vector<int>::pointer v34 = v116.__end_;
        if (v116.__end_ >= v30)
        {
          uint64_t v36 = v116.__end_ - v28;
          unint64_t v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62)
          {
            v116.__begin_ = v28;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v30 - (char *)v28) >> 1 > v37) {
            unint64_t v37 = ((char *)v30 - (char *)v28) >> 1;
          }
          if ((unint64_t)((char *)v30 - (char *)v28) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v38 = v37;
          }
          if (v38) {
            unint64_t v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v38);
          }
          else {
            uint64_t v39 = 0;
          }
          v40 = (int *)(v38 + 4 * v36);
          int *v40 = v33;
          v35 = v40 + 1;
          while (v34 != v28)
          {
            int v41 = *--v34;
            *--v40 = v41;
          }
          v30 = (int *)(v38 + 4 * v39);
          v116.__end_ = v35;
          if (v28) {
            operator delete(v28);
          }
          v28 = v40;
          v26 = obja;
        }
        else
        {
          *v116.__end_ = v32;
          v35 = v34 + 1;
        }
        v116.__end_ = v35;
      }
      v116.__end_cap_.__value_ = v30;
      v116.__begin_ = v28;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v112 objects:v124 count:16];
    }
    while (v27);
  }
  else
  {
    v35 = v116.__end_;
  }

  if (v35 == v28) {
    v42 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  }
  else {
    v42 = v28;
  }
  unsigned int v94 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v42, v35 - v28);
  memset(&v111, 0, sizeof(v111));
  v43 = [(QSSRecognitionResult *)self pre_itn_token_to_post_itn_char_alignment];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v111, [v43 count]);

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v44 = [(QSSRecognitionResult *)self pre_itn_token_to_post_itn_char_alignment];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v107 objects:v123 count:16];
  v46 = v111.__begin_;
  if (v45)
  {
    uint64_t v47 = *(void *)v108;
    v48 = v111.__end_cap_.__value_;
    id objb = v44;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v108 != v47) {
          objc_enumerationMutation(v44);
        }
        int v50 = [*(id *)(*((void *)&v107 + 1) + 8 * k) addObjectToBuffer:a3];
        int v51 = v50;
        std::vector<int>::pointer v52 = v111.__end_;
        if (v111.__end_ >= v48)
        {
          uint64_t v54 = v111.__end_ - v46;
          unint64_t v55 = v54 + 1;
          if ((unint64_t)(v54 + 1) >> 62)
          {
            v111.__begin_ = v46;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v48 - (char *)v46) >> 1 > v55) {
            unint64_t v55 = ((char *)v48 - (char *)v46) >> 1;
          }
          if ((unint64_t)((char *)v48 - (char *)v46) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v56 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v56 = v55;
          }
          if (v56) {
            unint64_t v56 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v56);
          }
          else {
            uint64_t v57 = 0;
          }
          v58 = (int *)(v56 + 4 * v54);
          int *v58 = v51;
          v53 = v58 + 1;
          while (v52 != v46)
          {
            int v59 = *--v52;
            *--v58 = v59;
          }
          v48 = (int *)(v56 + 4 * v57);
          v111.__end_ = v53;
          if (v46) {
            operator delete(v46);
          }
          v46 = v58;
          v44 = objb;
        }
        else
        {
          *v111.__end_ = v50;
          v53 = v52 + 1;
        }
        v111.__end_ = v53;
      }
      v111.__end_cap_.__value_ = v48;
      v111.__begin_ = v46;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v107 objects:v123 count:16];
    }
    while (v45);
  }
  else
  {
    v53 = v111.__end_;
  }

  if (v53 == v46) {
    v60 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>> const&)::t;
  }
  else {
    v60 = v46;
  }
  unsigned int v93 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v60, v53 - v46);
  v61 = [(QSSRecognitionResult *)self choice_alignments];
  unint64_t v62 = [v61 count];
  if (v62)
  {
    if (v62 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v62);
    v65 = &v63[4 * v64];
  }
  else
  {
    v63 = 0;
    v65 = 0;
  }

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v66 = [(QSSRecognitionResult *)self choice_alignments];
  uint64_t v67 = [v66 countByEnumeratingWithState:&v103 objects:v122 count:16];
  if (v67)
  {
    uint64_t v68 = *(void *)v104;
    v69 = v63;
    id objc = v66;
    do
    {
      for (uint64_t m = 0; m != v67; ++m)
      {
        if (*(void *)v104 != v68) {
          objc_enumerationMutation(v66);
        }
        int v71 = [*(id *)(*((void *)&v103 + 1) + 8 * m) addObjectToBuffer:a3];
        int v72 = v71;
        if (v69 >= v65)
        {
          uint64_t v73 = (v69 - v63) >> 2;
          unint64_t v74 = v73 + 1;
          if ((unint64_t)(v73 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v65 - v63) >> 1 > v74) {
            unint64_t v74 = (v65 - v63) >> 1;
          }
          if ((unint64_t)(v65 - v63) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v75 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v75 = v74;
          }
          if (v75) {
            unint64_t v75 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v75);
          }
          else {
            uint64_t v76 = 0;
          }
          v77 = (char *)(v75 + 4 * v73);
          *(_DWORD *)v77 = v72;
          v78 = v77 + 4;
          while (v69 != v63)
          {
            int v79 = *((_DWORD *)v69 - 1);
            v69 -= 4;
            *((_DWORD *)v77 - 1) = v79;
            v77 -= 4;
          }
          v65 = (char *)(v75 + 4 * v76);
          if (v63) {
            operator delete(v63);
          }
          v63 = v77;
          v69 = v78;
          v66 = objc;
        }
        else
        {
          *(_DWORD *)v69 = v71;
          v69 += 4;
        }
      }
      uint64_t v67 = [v66 countByEnumeratingWithState:&v103 objects:v122 count:16];
    }
    while (v67);
  }
  else
  {
    v69 = v63;
  }

  uint64_t v80 = v69 - v63;
  if (v69 == v63) {
    v81 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::ChoiceAlignment>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::ChoiceAlignment>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::ChoiceAlignment>> const&)::t;
  }
  else {
    v81 = v63;
  }
  uint64_t v82 = v80 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v80 >> 2, 4uLL);
  if (v63 == v69)
  {
    LODWORD(v82) = 0;
  }
  else
  {
    v83 = v81 - 4;
    uint64_t v84 = v82;
    do
    {
      int v85 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v83[4 * v84]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v85);
      --v84;
    }
    while (v84);
  }
  unsigned int v86 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v82);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v87 = *((_DWORD *)a3 + 8);
  int v88 = *((_DWORD *)a3 + 12);
  int v89 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v97);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v96);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v95);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v94);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v93);
  if (v86)
  {
    int v90 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v86);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v90);
  }
  v91.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v87 - v88 + v89);
  if (v63) {
    operator delete(v63);
  }
  if (v111.__begin_) {
    operator delete(v111.__begin_);
  }
  if (v116.__begin_) {
    operator delete(v116.__begin_);
  }
  if (v121.__begin_) {
    operator delete(v121.__begin_);
  }
  return v91;
}

- (NSArray)choice_alignments
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"choice_alignments"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
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
            __int16 v12 = [[QSSChoiceAlignment alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"choice_alignments"];
  }
  return (NSArray *)v3;
}

- (NSArray)pre_itn_token_to_post_itn_char_alignment
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignment"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
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
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignment"];
  }
  return (NSArray *)v3;
}

- (NSArray)post_itn_nbest_choices
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn_nbest_choices"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xBu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[10].var0;
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
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"post_itn_nbest_choices"];
  }
  return (NSArray *)v3;
}

- (NSArray)pre_itn_nbest_choices
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn_nbest_choices"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
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
            __int16 v12 = [[QSSRecognitionChoice alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"pre_itn_nbest_choices"];
  }
  return (NSArray *)v3;
}

- (QSSRecognitionSausage)post_itn
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn"];
  if (!v3)
  {
    v4 = [QSSRecognitionSausage alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    v3 = [(QSSRecognitionSausage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"post_itn"];
  }
  return v3;
}

- (QSSRecognitionSausage)pre_itn
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn"];
  if (!v3)
  {
    v4 = [QSSRecognitionSausage alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    v3 = [(QSSRecognitionSausage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"pre_itn"];
  }
  return v3;
}

- (QSSRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRecognitionResult;
  uint64_t v10 = [(QSSRecognitionResult *)&v30 init];
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
      a4 = (const RecognitionResult *)v13 + *v13;
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
      root = (siri::speech::schema_fb::RecognitionResult *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RecognitionResult::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4
{
  return [(QSSRecognitionResult *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionResult *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSRecognitionResult)initWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionResult *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
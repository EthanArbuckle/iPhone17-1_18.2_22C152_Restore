@interface QSSRequestStatsResponse
- (NSArray)BOOL_stats;
- (NSArray)double_stats;
- (NSArray)int32_stats;
- (NSString)language;
- (NSString)request_locale;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::RequestStatsResponse>)addObjectToBuffer:(void *)a3;
- (QSSRequestStatsResponse)initWithFlatbuffData:(id)a3;
- (QSSRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4;
- (QSSRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSRequestStatsResponse

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
  v2.var0 = [(QSSRequestStatsResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__39__QSSRequestStatsResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::RequestStatsResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  v3 = [(QSSRequestStatsResponse *)self BOOL_stats];
  unint64_t v4 = [v3 count];
  uint64_t v5 = a3;
  if (v4)
  {
    if (v4 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    char v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v4);
    long long v8 = &v6[4 * v7];
  }
  else
  {
    char v6 = 0;
    long long v8 = 0;
  }

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v9 = [(QSSRequestStatsResponse *)self BOOL_stats];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v121 objects:v127 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v122;
    __int16 v12 = v6;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v122 != v11) {
          objc_enumerationMutation(v9);
        }
        int v14 = [*(id *)(*((void *)&v121 + 1) + 8 * i) addObjectToBuffer:v5];
        int v15 = v14;
        if (v12 >= v8)
        {
          uint64_t v16 = (v12 - v6) >> 2;
          unint64_t v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v8 - v6) >> 1 > v17) {
            unint64_t v17 = (v8 - v6) >> 1;
          }
          if ((unint64_t)(v8 - v6) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v17;
          }
          if (v18) {
            unint64_t v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v18);
          }
          else {
            uint64_t v19 = 0;
          }
          v20 = (char *)(v18 + 4 * v16);
          *(_DWORD *)v20 = v15;
          v21 = v20 + 4;
          while (v12 != v6)
          {
            int v22 = *((_DWORD *)v12 - 1);
            v12 -= 4;
            *((_DWORD *)v20 - 1) = v22;
            v20 -= 4;
          }
          long long v8 = (char *)(v18 + 4 * v19);
          if (v6) {
            operator delete(v6);
          }
          char v6 = v20;
          __int16 v12 = v21;
          uint64_t v5 = a3;
        }
        else
        {
          *(_DWORD *)__int16 v12 = v14;
          v12 += 4;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v121 objects:v127 count:16];
    }
    while (v10);
  }
  else
  {
    __int16 v12 = v6;
  }

  uint64_t v23 = v12 - v6;
  if (v12 == v6) {
    v24 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>> const&)::t;
  }
  else {
    v24 = v6;
  }
  uint64_t v25 = v23 >> 2;
  v26 = (flatbuffers::FlatBufferBuilder *)a3;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v23 >> 2, 4uLL);
  if (v6 == v12)
  {
    LODWORD(v25) = 0;
  }
  else
  {
    v27 = v24 - 4;
    uint64_t v28 = v25;
    do
    {
      int v29 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v27[4 * v28]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v29);
      --v28;
    }
    while (v28);
    v26 = (flatbuffers::FlatBufferBuilder *)a3;
  }
  unsigned int v30 = flatbuffers::FlatBufferBuilder::EndVector(v26, v25);
  v31 = [(QSSRequestStatsResponse *)self int32_stats];
  unint64_t v32 = [v31 count];
  unsigned int v105 = v30;
  if (v32)
  {
    if (v32 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v32);
    v35 = &v33[4 * v34];
  }
  else
  {
    v33 = 0;
    v35 = 0;
  }

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  v36 = [(QSSRequestStatsResponse *)self int32_stats];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v117 objects:v126 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v118;
    v39 = v33;
    *(void *)v109 = v36;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v118 != v38) {
          objc_enumerationMutation(v36);
        }
        int v41 = [*(id *)(*((void *)&v117 + 1) + 8 * j) addObjectToBuffer:a3];
        int v42 = v41;
        if (v39 >= v35)
        {
          uint64_t v43 = (v39 - v33) >> 2;
          unint64_t v44 = v43 + 1;
          if ((unint64_t)(v43 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v35 - v33) >> 1 > v44) {
            unint64_t v44 = (v35 - v33) >> 1;
          }
          if ((unint64_t)(v35 - v33) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v45 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v45 = v44;
          }
          if (v45) {
            unint64_t v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v45);
          }
          else {
            uint64_t v46 = 0;
          }
          v47 = (char *)(v45 + 4 * v43);
          *(_DWORD *)v47 = v42;
          v48 = v47 + 4;
          while (v39 != v33)
          {
            int v49 = *((_DWORD *)v39 - 1);
            v39 -= 4;
            *((_DWORD *)v47 - 1) = v49;
            v47 -= 4;
          }
          v35 = (char *)(v45 + 4 * v46);
          if (v33) {
            operator delete(v33);
          }
          v33 = v47;
          v39 = v48;
          v36 = *(void **)v109;
        }
        else
        {
          *(_DWORD *)v39 = v41;
          v39 += 4;
        }
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v117 objects:v126 count:16];
    }
    while (v37);
  }
  else
  {
    v39 = v33;
  }

  uint64_t v50 = v39 - v33;
  if (v39 == v33) {
    v51 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>> const&)::t;
  }
  else {
    v51 = v33;
  }
  uint64_t v52 = v50 >> 2;
  v53 = (flatbuffers::FlatBufferBuilder *)a3;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v50 >> 2, 4uLL);
  if (v33 == v39)
  {
    LODWORD(v52) = 0;
  }
  else
  {
    v54 = v51 - 4;
    uint64_t v55 = v52;
    do
    {
      int v56 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v54[4 * v55]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v56);
      --v55;
    }
    while (v55);
    v53 = (flatbuffers::FlatBufferBuilder *)a3;
  }
  unsigned int v106 = flatbuffers::FlatBufferBuilder::EndVector(v53, v52);
  v57 = [(QSSRequestStatsResponse *)self double_stats];
  unint64_t v58 = [v57 count];
  if (v58)
  {
    if (v58 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v58);
    v61 = &v59[4 * v60];
  }
  else
  {
    v59 = 0;
    v61 = 0;
  }

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v62 = [(QSSRequestStatsResponse *)self double_stats];
  uint64_t v63 = [v62 countByEnumeratingWithState:&v113 objects:v125 count:16];
  if (v63)
  {
    v108 = v62;
    *(void *)v110 = *(void *)v114;
    v64 = v59;
    do
    {
      for (uint64_t k = 0; k != v63; ++k)
      {
        if (*(void *)v114 != *(void *)v110) {
          objc_enumerationMutation(v62);
        }
        int v66 = [*(id *)(*((void *)&v113 + 1) + 8 * k) addObjectToBuffer:a3];
        int v67 = v66;
        if (v64 >= v61)
        {
          uint64_t v68 = (v64 - v59) >> 2;
          unint64_t v69 = v68 + 1;
          if ((unint64_t)(v68 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v61 - v59) >> 1 > v69) {
            unint64_t v69 = (v61 - v59) >> 1;
          }
          if ((unint64_t)(v61 - v59) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v70 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v70 = v69;
          }
          if (v70) {
            unint64_t v70 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v70);
          }
          else {
            uint64_t v71 = 0;
          }
          v72 = (char *)(v70 + 4 * v68);
          *(_DWORD *)v72 = v67;
          v73 = v72 + 4;
          while (v64 != v59)
          {
            int v74 = *((_DWORD *)v64 - 1);
            v64 -= 4;
            *((_DWORD *)v72 - 1) = v74;
            v72 -= 4;
          }
          v61 = (char *)(v70 + 4 * v71);
          if (v59) {
            operator delete(v59);
          }
          v59 = v72;
          v64 = v73;
          v62 = v108;
        }
        else
        {
          *(_DWORD *)v64 = v66;
          v64 += 4;
        }
      }
      uint64_t v63 = [v62 countByEnumeratingWithState:&v113 objects:v125 count:16];
    }
    while (v63);
  }
  else
  {
    v64 = v59;
  }

  uint64_t v75 = v64 - v59;
  if (v64 == v59) {
    v76 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>> const&)::t;
  }
  else {
    v76 = v59;
  }
  uint64_t v77 = v75 >> 2;
  v78 = (flatbuffers::FlatBufferBuilder *)a3;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v75 >> 2, 4uLL);
  if (v59 == v64)
  {
    LODWORD(v77) = 0;
  }
  else
  {
    v79 = v76 - 4;
    uint64_t v80 = v77;
    do
    {
      int v81 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v79[4 * v80]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v81);
      --v80;
    }
    while (v80);
    v78 = (flatbuffers::FlatBufferBuilder *)a3;
  }
  unsigned int v111 = flatbuffers::FlatBufferBuilder::EndVector(v78, v77);
  v82 = [(QSSRequestStatsResponse *)self language];
  v83 = v82;
  if (!v82) {
    v82 = &stru_26DEBFAF8;
  }
  v84 = (const char *)[(__CFString *)v82 UTF8String];
  size_t v85 = strlen(v84);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v84, v85);

  v87 = [(QSSRequestStatsResponse *)self speech_id];
  v88 = v87;
  if (!v87) {
    v87 = &stru_26DEBFAF8;
  }
  v89 = (const char *)[(__CFString *)v87 UTF8String];
  size_t v90 = strlen(v89);
  unsigned int v91 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v89, v90);

  v92 = [(QSSRequestStatsResponse *)self request_locale];
  v93 = v92;
  if (!v92) {
    v92 = &stru_26DEBFAF8;
  }
  v94 = (const char *)[(__CFString *)v92 UTF8String];
  size_t v95 = strlen(v94);
  unsigned int v96 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v94, v95);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v97 = *((_DWORD *)a3 + 8);
  int v98 = *((_DWORD *)a3 + 12);
  int v99 = *((_DWORD *)a3 + 10);
  if (v105)
  {
    int v100 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v105);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v100);
  }
  if (v106)
  {
    int v101 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v106);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v101);
  }
  if (v111)
  {
    int v102 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v111);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v102);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v91);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v96);
  v103.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v97 - v98 + v99);
  if (v59) {
    operator delete(v59);
  }
  if (v33) {
    operator delete(v33);
  }
  if (v6) {
    operator delete(v6);
  }
  return v103;
}

- (NSString)request_locale
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
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

- (NSString)speech_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
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

- (NSString)language
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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

- (NSArray)double_stats
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"double_stats"];
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
            __int16 v12 = [[QSSRequestStatsResponse_DoubleStat alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"double_stats"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__50__QSSRequestStatsResponse_DoubleStat_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (NSArray)int32_stats
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"int32_stats"];
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
            __int16 v12 = [[QSSRequestStatsResponse_Int32Stat alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"int32_stats"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__49__QSSRequestStatsResponse_Int32Stat_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (NSArray)BOOL_stats
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"BOOL_stats"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[4].var0;
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
            __int16 v12 = [[QSSRequestStatsResponse_BoolStat alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"BOOL_stats"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__48__QSSRequestStatsResponse_BoolStat_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (QSSRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRequestStatsResponse;
  uint64_t v10 = [(QSSRequestStatsResponse *)&v30 init];
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
      a4 = (const RequestStatsResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::RequestStatsResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RequestStatsResponse::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          uint64_t v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  uint64_t v23 = v11;
LABEL_17:

  return v23;
}

- (QSSRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4
{
  return [(QSSRequestStatsResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSRequestStatsResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSRequestStatsResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSRequestStatsResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
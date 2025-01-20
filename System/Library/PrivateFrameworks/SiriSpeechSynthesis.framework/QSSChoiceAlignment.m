@interface QSSChoiceAlignment
- (NSArray)post_itn_choice_indices;
- (NSArray)pre_itn_token_to_post_itn_char_alignments;
- (Offset<siri::speech::schema_fb::ChoiceAlignment>)addObjectToBuffer:(void *)a3;
- (QSSChoiceAlignment)initWithFlatbuffData:(id)a3;
- (QSSChoiceAlignment)initWithFlatbuffData:(id)a3 root:(const ChoiceAlignment *)a4;
- (QSSChoiceAlignment)initWithFlatbuffData:(id)a3 root:(const ChoiceAlignment *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSChoiceAlignment

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
  v2.var0 = [(QSSChoiceAlignment *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__34__QSSChoiceAlignment_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::ChoiceAlignment>)addObjectToBuffer:(void *)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  memset(&v68, 0, sizeof(v68));
  uint64_t v5 = [(QSSChoiceAlignment *)self post_itn_choice_indices];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v68, [v5 count]);

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  char v6 = [(QSSChoiceAlignment *)self post_itn_choice_indices];
  v59 = (flatbuffers::FlatBufferBuilder *)a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v64 objects:v70 count:16];
  v58 = self;
  begin = v68.__begin_;
  if (v7)
  {
    uint64_t v9 = *(void *)v65;
    value = v68.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v65 != v9) {
          objc_enumerationMutation(v6);
        }
        int v12 = [*(id *)(*((void *)&v64 + 1) + 8 * i) intValue];
        int v13 = v12;
        std::vector<int>::pointer end = v68.__end_;
        if (v68.__end_ >= value)
        {
          uint64_t v16 = v68.__end_ - begin;
          unint64_t v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
          {
            v68.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v17) {
            unint64_t v17 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
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
          v20 = (int *)(v18 + 4 * v16);
          int *v20 = v13;
          v15 = v20 + 1;
          while (end != begin)
          {
            int v21 = *--end;
            *--v20 = v21;
          }
          value = (int *)(v18 + 4 * v19);
          v68.__end_ = v15;
          if (begin) {
            operator delete(begin);
          }
          begin = v20;
        }
        else
        {
          *v68.__end_ = v12;
          v15 = end + 1;
        }
        v68.__end_ = v15;
      }
      v68.__end_cap_.__value_ = value;
      v68.__begin_ = begin;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v7);
  }
  else
  {
    v15 = v68.__end_;
  }

  unint64_t v22 = (unint64_t)v59;
  if (v15 == begin) {
    v23 = (int *)&flatbuffers::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  }
  else {
    v23 = begin;
  }
  unsigned int v24 = flatbuffers::FlatBufferBuilder::CreateVector<int>(v59, v23, v15 - begin);
  v25 = [(QSSChoiceAlignment *)v58 pre_itn_token_to_post_itn_char_alignments];
  unint64_t v26 = [v25 count];
  unsigned int v57 = v24;
  if (v26)
  {
    if (v26 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v26);
    v29 = &v27[4 * v28];
  }
  else
  {
    v27 = 0;
    v29 = 0;
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v30 = [(QSSChoiceAlignment *)v58 pre_itn_token_to_post_itn_char_alignments];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v61;
    v33 = v27;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v61 != v32) {
          objc_enumerationMutation(v30);
        }
        int v35 = [*(id *)(*((void *)&v60 + 1) + 8 * j) addObjectToBuffer:v22];
        int v36 = v35;
        if (v33 >= v29)
        {
          uint64_t v37 = (v33 - v27) >> 2;
          unint64_t v38 = v37 + 1;
          if ((unint64_t)(v37 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v29 - v27) >> 1 > v38) {
            unint64_t v38 = (v29 - v27) >> 1;
          }
          if ((unint64_t)(v29 - v27) >= 0x7FFFFFFFFFFFFFFCLL) {
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
          v41 = (char *)(v39 + 4 * v37);
          *(_DWORD *)v41 = v36;
          v42 = v41 + 4;
          while (v33 != v27)
          {
            int v43 = *((_DWORD *)v33 - 1);
            v33 -= 4;
            *((_DWORD *)v41 - 1) = v43;
            v41 -= 4;
          }
          v29 = (char *)(v39 + 4 * v40);
          if (v27) {
            operator delete(v27);
          }
          v27 = v41;
          v33 = v42;
          unint64_t v22 = (unint64_t)v59;
        }
        else
        {
          *(_DWORD *)v33 = v35;
          v33 += 4;
        }
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v31);
  }
  else
  {
    v33 = v27;
  }

  uint64_t v44 = v33 - v27;
  if (v33 == v27) {
    v45 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RepeatedItnAlignment>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RepeatedItnAlignment>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RepeatedItnAlignment>> const&)::t;
  }
  else {
    v45 = v27;
  }
  uint64_t v46 = v44 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)v22, v44 >> 2, 4uLL);
  if (v27 == v33)
  {
    LODWORD(v46) = 0;
  }
  else
  {
    v47 = v45 - 4;
    uint64_t v48 = v46;
    do
    {
      int v49 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v22, *(_DWORD *)&v47[4 * v48]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>(v22, v49);
      --v48;
    }
    while (v48);
  }
  unsigned int v50 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)v22, v46);
  flatbuffers::FlatBufferBuilder::NotNested(v22);
  *(unsigned char *)(v22 + 70) = 1;
  int v51 = *(_DWORD *)(v22 + 32);
  int v52 = *(_DWORD *)(v22 + 48);
  int v53 = *(_DWORD *)(v22 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v22, 4, v57);
  if (v50)
  {
    int v54 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v22, v50);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v22, 6, v54);
  }
  v55.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v22, v51 - v52 + v53);
  if (v27) {
    operator delete(v27);
  }
  if (v68.__begin_) {
    operator delete(v68.__begin_);
  }
  return v55;
}

- (NSArray)pre_itn_token_to_post_itn_char_alignments
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignments"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
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
            int v12 = [[QSSRepeatedItnAlignment alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignments"];
  }
  return (NSArray *)v3;
}

- (NSArray)post_itn_choice_indices
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"post_itn_choice_indices"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[4].var0;
      if (v6)
      {
        uint64_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        var0 = (unsigned int *)v7[v8 + 4].var0;
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            int v12 = [NSNumber numberWithInt:*var0];
            [v3 addObject:v12];

            ++var0;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"post_itn_choice_indices"];
  }
  return (NSArray *)v3;
}

- (QSSChoiceAlignment)initWithFlatbuffData:(id)a3 root:(const ChoiceAlignment *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSChoiceAlignment;
  uint64_t v10 = [(QSSChoiceAlignment *)&v30 init];
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
      a4 = (const ChoiceAlignment *)v13 + *v13;
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
      root = (siri::speech::schema_fb::ChoiceAlignment *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::ChoiceAlignment::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSChoiceAlignment)initWithFlatbuffData:(id)a3 root:(const ChoiceAlignment *)a4
{
  return [(QSSChoiceAlignment *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSChoiceAlignment *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSChoiceAlignment)initWithFlatbuffData:(id)a3
{
  return [(QSSChoiceAlignment *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
@interface FTTranslationPhraseMetaInfo_AlternativeSelectedSpan
- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan)initWithFlatbuffData:(id)a3;
- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan)initWithFlatbuffData:(id)a3 root:(const AlternativeSelectedSpan *)a4;
- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan)initWithFlatbuffData:(id)a3 root:(const AlternativeSelectedSpan *)a4 verify:(BOOL)a5;
- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range)source_range;
- (NSArray)alternatives;
- (NSArray)projection_ranges;
- (Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan>)addObjectToBuffer:(void *)a3;
- (id)alternatives_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)projection_ranges_objectAtIndex:(unint64_t)a3;
- (unint64_t)alternatives_count;
- (unint64_t)projection_ranges_count;
- (void)alternatives_enumerateObjectsUsingBlock:(id)a3;
- (void)projection_ranges_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTTranslationPhraseMetaInfo_AlternativeSelectedSpan

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan)initWithFlatbuffData:(id)a3
{
  return [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan)initWithFlatbuffData:(id)a3 root:(const AlternativeSelectedSpan *)a4
{
  return [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan)initWithFlatbuffData:(id)a3 root:(const AlternativeSelectedSpan *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTranslationPhraseMetaInfo_AlternativeSelectedSpan;
  v10 = [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)&v26 init];
  if (!v10) {
    goto LABEL_13;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_14;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)[*p_data bytes];
    a4 = (const AlternativeSelectedSpan *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_13;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_14;
  }
  uint64_t v17 = [*p_data bytes];
  uint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_26027B7E0;
  uint64_t v24 = 0;
  char v25 = 1;
  v19 = (siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0; {
  else
  }
LABEL_13:
    v20 = v10;

  return v20;
}

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range)source_range
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"source_range"];
  if (!v3)
  {
    v4 = [FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"source_range"];
  }
  return v3;
}

- (NSArray)projection_ranges
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"projection_ranges"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __72__FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_projection_ranges__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)self projection_ranges_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"projection_ranges"];
  }
  return (NSArray *)v3;
}

- (id)projection_ranges_objectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"projection_ranges"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)projection_ranges_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"projection_ranges"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 7u && (uint64_t v8 = *(unsigned __int16 *)v7[6].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)projection_ranges_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"projection_ranges"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[6].var0;
      if (v9)
      {
        unsigned __int8 v20 = 0;
        v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = (uint64_t)&v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 4 * v12 - 4;
          do
          {
            uint64_t v17 = [[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
            v4[2](v4, v17, v15, &v20);
            int v18 = v20;

            if (v18) {
              break;
            }
            ++v15;
            uint64_t v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }
}

- (NSArray)alternatives
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternatives"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __67__FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_alternatives__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)self alternatives_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"alternatives"];
  }
  return (NSArray *)v3;
}

- (id)alternatives_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternatives"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 9u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[8].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)alternatives_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternatives"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 9u && (uint64_t v8 = *(unsigned __int16 *)v7[8].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)alternatives_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternatives"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 9u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[8].var0;
      if (v9)
      {
        unsigned __int8 v20 = 0;
        v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = (uint64_t)&v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 4 * v12 - 4;
          do
          {
            uint64_t v17 = [[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
            v4[2](v4, v17, v15, &v20);
            int v18 = v20;

            if (v18) {
              break;
            }
            ++v15;
            uint64_t v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }
}

- (Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan>)addObjectToBuffer:(void *)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)self source_range];
  int v49 = [v5 addObjectToBuffer:a3];

  memset(&v61, 0, sizeof(v61));
  v6 = [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)self projection_ranges];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v61, [v6 count]);

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v7 = [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)self projection_ranges];
  v50 = self;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = [*(id *)(*((void *)&v57 + 1) + 8 * i) addObjectToBuffer:a3];
        int v12 = v11;
        std::vector<int>::pointer end = v61.__end_;
        if (v61.__end_ >= v61.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v61.__begin_;
          int64_t v16 = v61.__end_ - v61.__begin_;
          unint64_t v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v18 = (char *)v61.__end_cap_.__value_ - (char *)v61.__begin_;
          if (((char *)v61.__end_cap_.__value_ - (char *)v61.__begin_) >> 1 > v17) {
            unint64_t v17 = v18 >> 1;
          }
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v17;
          }
          if (v19)
          {
            unsigned __int8 v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v61.__end_cap_, v19);
            std::vector<int>::pointer begin = v61.__begin_;
            std::vector<int>::pointer end = v61.__end_;
          }
          else
          {
            unsigned __int8 v20 = 0;
          }
          v21 = (int *)&v20[4 * v16];
          int *v21 = v12;
          uint64_t v14 = v21 + 1;
          while (end != begin)
          {
            int v22 = *--end;
            *--v21 = v22;
          }
          v61.__begin_ = v21;
          v61.__end_ = v14;
          v61.__end_cap_.__value_ = (int *)&v20[4 * v19];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v61.__end_ = v11;
          uint64_t v14 = end + 1;
        }
        v61.__end_ = v14;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v8);
  }

  if (v61.__end_ == v61.__begin_) {
    std::vector<int>::pointer v23 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Range>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Range>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Range>> const&)::t;
  }
  else {
    std::vector<int>::pointer v23 = v61.__begin_;
  }
  int v24 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v23, v61.__end_ - v61.__begin_);
  memset(&v56, 0, sizeof(v56));
  char v25 = [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)v50 alternatives];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v56, [v25 count]);

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  objc_super v26 = [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)v50 alternatives];
  int v51 = v24;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v53 != v28) {
          objc_enumerationMutation(v26);
        }
        int v30 = [*(id *)(*((void *)&v52 + 1) + 8 * j) addObjectToBuffer:a3];
        int v31 = v30;
        std::vector<int>::pointer v32 = v56.__end_;
        if (v56.__end_ >= v56.__end_cap_.__value_)
        {
          std::vector<int>::pointer v34 = v56.__begin_;
          int64_t v35 = v56.__end_ - v56.__begin_;
          unint64_t v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v37 = (char *)v56.__end_cap_.__value_ - (char *)v56.__begin_;
          if (((char *)v56.__end_cap_.__value_ - (char *)v56.__begin_) >> 1 > v36) {
            unint64_t v36 = v37 >> 1;
          }
          if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v38 = v36;
          }
          if (v38)
          {
            v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v56.__end_cap_, v38);
            std::vector<int>::pointer v34 = v56.__begin_;
            std::vector<int>::pointer v32 = v56.__end_;
          }
          else
          {
            v39 = 0;
          }
          v40 = (int *)&v39[4 * v35];
          int *v40 = v31;
          v33 = v40 + 1;
          while (v32 != v34)
          {
            int v41 = *--v32;
            *--v40 = v41;
          }
          v56.__begin_ = v40;
          v56.__end_ = v33;
          v56.__end_cap_.__value_ = (int *)&v39[4 * v38];
          if (v34) {
            operator delete(v34);
          }
        }
        else
        {
          *v56.__end_ = v30;
          v33 = v32 + 1;
        }
        v56.__end_ = v33;
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v27);
  }

  if (v56.__end_ == v56.__begin_) {
    std::vector<int>::pointer v42 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Alternative>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Alternative>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Alternative>> const&)::t;
  }
  else {
    std::vector<int>::pointer v42 = v56.__begin_;
  }
  int v43 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v42, v56.__end_ - v56.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v44 = *((_DWORD *)a3 + 8);
  int v45 = *((_DWORD *)a3 + 12);
  int v46 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v49);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v51);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v43);
  v47.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v44 - (unsigned __int16)v45 + v46);
  if (v56.__begin_)
  {
    v56.__end_ = v56.__begin_;
    operator delete(v56.__begin_);
  }
  if (v61.__begin_)
  {
    v61.__end_ = v61.__begin_;
    operator delete(v61.__begin_);
  }
  return v47;
}

- (id)flatbuffData
{
  uint64_t v3 = 0;
  char v4 = 0;
  long long v5 = xmmword_26027B7F0;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  __int16 v10 = 256;
  uint64_t v11 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
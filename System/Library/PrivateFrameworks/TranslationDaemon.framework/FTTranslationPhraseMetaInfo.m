@interface FTTranslationPhraseMetaInfo
- (FTTranslationPhraseMetaInfo)initWithFlatbuffData:(id)a3;
- (FTTranslationPhraseMetaInfo)initWithFlatbuffData:(id)a3 root:(const TranslationPhraseMetaInfo *)a4;
- (FTTranslationPhraseMetaInfo)initWithFlatbuffData:(id)a3 root:(const TranslationPhraseMetaInfo *)a4 verify:(BOOL)a5;
- (NSArray)selection_spans;
- (NSString)romanization;
- (Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)selection_spans_objectAtIndex:(unint64_t)a3;
- (unint64_t)selection_spans_count;
- (void)selection_spans_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTTranslationPhraseMetaInfo

- (FTTranslationPhraseMetaInfo)initWithFlatbuffData:(id)a3
{
  return [(FTTranslationPhraseMetaInfo *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTranslationPhraseMetaInfo *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTranslationPhraseMetaInfo)initWithFlatbuffData:(id)a3 root:(const TranslationPhraseMetaInfo *)a4
{
  return [(FTTranslationPhraseMetaInfo *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTranslationPhraseMetaInfo)initWithFlatbuffData:(id)a3 root:(const TranslationPhraseMetaInfo *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTranslationPhraseMetaInfo;
  v10 = [(FTTranslationPhraseMetaInfo *)&v26 init];
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
    a4 = (const TranslationPhraseMetaInfo *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TranslationPhraseMetaInfo *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TranslationPhraseMetaInfo::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)romanization
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)selection_spans
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"selection_spans"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __46__FTTranslationPhraseMetaInfo_selection_spans__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTranslationPhraseMetaInfo *)self selection_spans_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"selection_spans"];
  }
  return (NSArray *)v3;
}

uint64_t __46__FTTranslationPhraseMetaInfo_selection_spans__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)selection_spans_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"selection_spans"];
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
      id v7 = [[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)selection_spans_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"selection_spans"];
  uint64_t v4 = v3;
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

- (void)selection_spans_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"selection_spans"];
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
            uint64_t v17 = [[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo>)addObjectToBuffer:(void *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTTranslationPhraseMetaInfo *)self romanization];
  v6 = v5;
  if (!v5) {
    unint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  LODWORD(v7) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  memset(&v38, 0, sizeof(v38));
  uint64_t v9 = [(FTTranslationPhraseMetaInfo *)self selection_spans];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v38, [v9 count]);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v10 = [(FTTranslationPhraseMetaInfo *)self selection_spans];
  int v33 = (int)v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v10);
        }
        int v14 = [*(id *)(*((void *)&v34 + 1) + 8 * i) addObjectToBuffer:a3];
        int v15 = v14;
        std::vector<int>::pointer end = v38.__end_;
        if (v38.__end_ >= v38.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v38.__begin_;
          int64_t v19 = v38.__end_ - v38.__begin_;
          unint64_t v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v21 = (char *)v38.__end_cap_.__value_ - (char *)v38.__begin_;
          if (((char *)v38.__end_cap_.__value_ - (char *)v38.__begin_) >> 1 > v20) {
            unint64_t v20 = v21 >> 1;
          }
          if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v20;
          }
          if (v22)
          {
            long long v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v38.__end_cap_, v22);
            std::vector<int>::pointer begin = v38.__begin_;
            std::vector<int>::pointer end = v38.__end_;
          }
          else
          {
            long long v23 = 0;
          }
          uint64_t v24 = (int *)&v23[4 * v19];
          *uint64_t v24 = v15;
          uint64_t v17 = v24 + 1;
          while (end != begin)
          {
            int v25 = *--end;
            *--uint64_t v24 = v25;
          }
          v38.__begin_ = v24;
          v38.__end_ = v17;
          v38.__end_cap_.__value_ = (int *)&v23[4 * v22];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v38.__end_ = v14;
          uint64_t v17 = end + 1;
        }
        v38.__end_ = v17;
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v11);
  }

  if (v38.__end_ == v38.__begin_) {
    std::vector<int>::pointer v26 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan>> const&)::t;
  }
  else {
    std::vector<int>::pointer v26 = v38.__begin_;
  }
  int v27 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v26, v38.__end_ - v38.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v28 = *((_DWORD *)a3 + 8);
  int v29 = *((_DWORD *)a3 + 12);
  int v30 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v33);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v27);
  v31.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v28 - (unsigned __int16)v29 + v30);
  if (v38.__begin_)
  {
    v38.__end_ = v38.__begin_;
    operator delete(v38.__begin_);
  }
  return v31;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTranslationPhraseMetaInfo *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__43__FTTranslationPhraseMetaInfo_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

uint64_t __72__FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_projection_ranges__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __67__FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_alternatives__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

apple::aiml::flatbuffers2::DetachedBuffer *__67__FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

apple::aiml::flatbuffers2::DetachedBuffer *__73__FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

apple::aiml::flatbuffers2::DetachedBuffer *__79__FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

@end
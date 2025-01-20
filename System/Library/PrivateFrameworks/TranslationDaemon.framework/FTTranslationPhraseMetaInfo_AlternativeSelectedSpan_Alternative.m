@interface FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative
- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative)initWithFlatbuffData:(id)a3;
- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative)initWithFlatbuffData:(id)a3 root:(const Alternative *)a4;
- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative)initWithFlatbuffData:(id)a3 root:(const Alternative *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Alternative>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)alternative_description_index;
- (int)selection_span_index;
- (int)translation_phrase_index;
@end

@implementation FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative)initWithFlatbuffData:(id)a3
{
  return [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative)initWithFlatbuffData:(id)a3 root:(const Alternative *)a4
{
  return [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative)initWithFlatbuffData:(id)a3 root:(const Alternative *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative;
  v10 = [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *)&v26 init];
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
    a4 = (const Alternative *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Alternative *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Alternative::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0; {
  else
  }
LABEL_13:
    v20 = v10;

  return v20;
}

- (int)alternative_description_index
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (int)translation_phrase_index
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (int)selection_span_index
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Alternative>)addObjectToBuffer:(void *)a3
{
  uint64_t v4 = self;
  int v5 = [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *)self alternative_description_index];
  int v6 = [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *)v4 translation_phrase_index];
  LODWORD(v4) = [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *)v4 selection_span_index];
  *((unsigned char *)a3 + 70) = 1;
  int v7 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 4, v5, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 6, v6, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 8, (int)v4, 0);
  return (Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Alternative>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
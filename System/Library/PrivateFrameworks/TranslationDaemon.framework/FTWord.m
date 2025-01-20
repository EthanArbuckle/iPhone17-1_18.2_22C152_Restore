@interface FTWord
- (FTWord)initWithFlatbuffData:(id)a3;
- (FTWord)initWithFlatbuffData:(id)a3 root:(const Word *)a4;
- (FTWord)initWithFlatbuffData:(id)a3 root:(const Word *)a4 verify:(BOOL)a5;
- (NSData)pronunciations;
- (NSString)orthography;
- (NSString)tag;
- (Offset<siri::speech::schema_fb::Word>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)frequency;
- (void)pronunciations:(id)a3;
@end

@implementation FTWord

- (FTWord)initWithFlatbuffData:(id)a3
{
  return [(FTWord *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTWord *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTWord)initWithFlatbuffData:(id)a3 root:(const Word *)a4
{
  return [(FTWord *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTWord)initWithFlatbuffData:(id)a3 root:(const Word *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTWord;
  v10 = [(FTWord *)&v26 init];
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
    a4 = (const Word *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::Word *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::Word::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)orthography
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

- (NSData)pronunciations
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
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
  return (NSData *)[MEMORY[0x263EFF8F8] dataWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0];
}

- (void)pronunciations:(id)a3
{
  id v4 = a3;
  root = self->_root;
  uint64_t v6 = *(int *)root->var0;
  uint64_t v7 = *(unsigned __int16 *)root[-v6 + 6].var0;
  if (*(_WORD *)root[-v6 + 6].var0)
  {
    uint64_t v8 = *(unsigned int *)root[v7].var0;
    id v9 = &root[v7 + v8];
  }
  else
  {
    uint64_t v7 = 0;
    id v9 = 0;
    uint64_t v8 = *(unsigned int *)root->var0;
  }
  id v10 = v4;
  (*((void (**)(id, const Word *, void))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);
}

- (int)frequency
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

- (NSString)tag
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

- (Offset<siri::speech::schema_fb::Word>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(FTWord *)self orthography];
  uint64_t v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_270C008E8;
  }
  uint64_t v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3812000000;
  uint64_t v24 = __Block_byref_object_copy__12;
  char v25 = __Block_byref_object_dispose__12;
  objc_super v26 = &unk_2602B4E3D;
  int v27 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __28__FTWord_addObjectToBuffer___block_invoke;
  v20[3] = &unk_265548F40;
  v20[4] = &v21;
  v20[5] = a3;
  [(FTWord *)self pronunciations:v20];
  int v10 = [(FTWord *)self frequency];
  v11 = [(FTWord *)self tag];
  v12 = v11;
  if (!v11) {
    v11 = &stru_270C008E8;
  }
  unint64_t v13 = (const char *)[(__CFString *)v11 UTF8String];
  size_t v14 = strlen(v13);
  LODWORD(v13) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v13, v14);

  *((unsigned char *)a3 + 70) = 1;
  int v15 = *((_DWORD *)a3 + 8);
  int v16 = *((_DWORD *)a3 + 12);
  int v17 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, *((_DWORD *)v22 + 12));
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 8, v10, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, (int)v13);
  v18.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v15 - (unsigned __int16)v16 + v17);
  _Block_object_dispose(&v21, 8);
  return v18;
}

uint64_t __28__FTWord_addObjectToBuffer___block_invoke(uint64_t a1, const unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<unsigned char>(*(apple::aiml::flatbuffers2::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = result;
  return result;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTWord *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__22__FTWord_flatbuffData__block_invoke(uint64_t a1)
{
  uint64_t result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
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

@end
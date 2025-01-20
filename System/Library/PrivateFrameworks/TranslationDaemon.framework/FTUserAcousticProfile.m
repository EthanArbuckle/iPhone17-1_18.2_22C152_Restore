@interface FTUserAcousticProfile
- (FTUserAcousticProfile)initWithFlatbuffData:(id)a3;
- (FTUserAcousticProfile)initWithFlatbuffData:(id)a3 root:(const UserAcousticProfile *)a4;
- (FTUserAcousticProfile)initWithFlatbuffData:(id)a3 root:(const UserAcousticProfile *)a4 verify:(BOOL)a5;
- (NSData)acoustic_profile_blob;
- (NSString)acoustic_profile_version;
- (NSString)profile_checksum;
- (Offset<siri::speech::schema_fb::UserAcousticProfile>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (void)acoustic_profile_blob:(id)a3;
@end

@implementation FTUserAcousticProfile

- (FTUserAcousticProfile)initWithFlatbuffData:(id)a3
{
  return [(FTUserAcousticProfile *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTUserAcousticProfile *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTUserAcousticProfile)initWithFlatbuffData:(id)a3 root:(const UserAcousticProfile *)a4
{
  return [(FTUserAcousticProfile *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTUserAcousticProfile)initWithFlatbuffData:(id)a3 root:(const UserAcousticProfile *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTUserAcousticProfile;
  v10 = [(FTUserAcousticProfile *)&v26 init];
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
    a4 = (const UserAcousticProfile *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::UserAcousticProfile *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::UserAcousticProfile::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)acoustic_profile_version
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

- (NSData)acoustic_profile_blob
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

- (void)acoustic_profile_blob:(id)a3
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
  (*((void (**)(id, const UserAcousticProfile *, void))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);
}

- (NSString)profile_checksum
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

- (Offset<siri::speech::schema_fb::UserAcousticProfile>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(FTUserAcousticProfile *)self acoustic_profile_version];
  uint64_t v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_270C008E8;
  }
  uint64_t v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3812000000;
  long long v23 = __Block_byref_object_copy__12;
  uint64_t v24 = __Block_byref_object_dispose__12;
  char v25 = &unk_2602B4E3D;
  int v26 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __43__FTUserAcousticProfile_addObjectToBuffer___block_invoke;
  v19[3] = &unk_265548F40;
  v19[4] = &v20;
  v19[5] = a3;
  [(FTUserAcousticProfile *)self acoustic_profile_blob:v19];
  id v10 = [(FTUserAcousticProfile *)self profile_checksum];
  v11 = v10;
  if (!v10) {
    id v10 = &stru_270C008E8;
  }
  v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  LODWORD(v12) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);

  *((unsigned char *)a3 + 70) = 1;
  int v14 = *((_DWORD *)a3 + 8);
  int v15 = *((_DWORD *)a3 + 12);
  int v16 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, *((_DWORD *)v21 + 12));
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, (int)v12);
  v17.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v14 - (unsigned __int16)v15 + v16);
  _Block_object_dispose(&v20, 8);
  return v17;
}

uint64_t __43__FTUserAcousticProfile_addObjectToBuffer___block_invoke(uint64_t a1, const unsigned __int8 *a2, unsigned int a3)
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTUserAcousticProfile *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__37__FTUserAcousticProfile_flatbuffData__block_invoke(uint64_t a1)
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
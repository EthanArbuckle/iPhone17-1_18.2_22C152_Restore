@interface QSSCreateLanguageProfileResponse
- (BOOL)incomplete_profile;
- (BOOL)recreate_apg_prons;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::CreateLanguageProfileResponse>)addObjectToBuffer:(void *)a3;
- (QSSCreateLanguageProfileResponse)initWithFlatbuffData:(id)a3;
- (QSSCreateLanguageProfileResponse)initWithFlatbuffData:(id)a3 root:(const CreateLanguageProfileResponse *)a4;
- (QSSCreateLanguageProfileResponse)initWithFlatbuffData:(id)a3 root:(const CreateLanguageProfileResponse *)a4 verify:(BOOL)a5;
- (QSSUserLanguageProfile)user_language_profile;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)error_code;
@end

@implementation QSSCreateLanguageProfileResponse

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
  v2.var0 = [(QSSCreateLanguageProfileResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__48__QSSCreateLanguageProfileResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::CreateLanguageProfileResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSCreateLanguageProfileResponse *)self speech_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(QSSCreateLanguageProfileResponse *)self session_id];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_26DEBFAF8;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  unsigned int v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  int v15 = [(QSSCreateLanguageProfileResponse *)self error_code];
  v16 = [(QSSCreateLanguageProfileResponse *)self error_str];
  v17 = v16;
  if (!v16) {
    v16 = &stru_26DEBFAF8;
  }
  v18 = (const char *)[(__CFString *)v16 UTF8String];
  size_t v19 = strlen(v18);
  LODWORD(v18) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  v20 = [(QSSCreateLanguageProfileResponse *)self user_language_profile];
  unsigned int v21 = [v20 addObjectToBuffer:a3];

  LODWORD(v20) = [(QSSCreateLanguageProfileResponse *)self incomplete_profile];
  int v22 = [(QSSCreateLanguageProfileResponse *)self recreate_apg_prons];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v23 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v14);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v15);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v18);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v21);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 14, (int)v20);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 16, v22);
  return (Offset<siri::speech::schema_fb::CreateLanguageProfileResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v23);
}

- (BOOL)recreate_apg_prons
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)incomplete_profile
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0 && root[v4].var0[0] != 0;
}

- (QSSUserLanguageProfile)user_language_profile
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_language_profile"];
  if (!v3)
  {
    uint64_t v4 = [QSSUserLanguageProfile alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    v3 = [(QSSUserLanguageProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_language_profile"];
  }
  return v3;
}

- (NSString)error_str
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

- (int)error_code
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

- (NSString)session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
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
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
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

- (QSSCreateLanguageProfileResponse)initWithFlatbuffData:(id)a3 root:(const CreateLanguageProfileResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v44.receiver = self;
  v44.super_class = (Class)QSSCreateLanguageProfileResponse;
  uint64_t v10 = [(QSSCreateLanguageProfileResponse *)&v44 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_52;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_53;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    size_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const CreateLanguageProfileResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_51;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_53;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v39 = v18;
  unint64_t v40 = v19;
  long long v41 = xmmword_22B64D0E0;
  uint64_t v42 = 0;
  char v43 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_51;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v39, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 4u))
  {
    goto LABEL_53;
  }
  unsigned int v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    int v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    int v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 6u))
  {
    goto LABEL_53;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  }
  else {
    v26 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v26)) {
    goto LABEL_53;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  unsigned int v28 = *v27;
  if (v28 >= 9 && v27[4] && (v40 < 5 || v40 - 4 < (unint64_t)root + v27[4] - v39)) {
    goto LABEL_53;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xAu)) {
    goto LABEL_53;
  }
  v29 = v28 >= 0xB && v27[5] ? (const unsigned __int8 *)root + v27[5] + *(unsigned int *)((char *)root + v27[5]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v29)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xCu))
  {
    goto LABEL_53;
  }
  uint64_t v30 = *(int *)root;
  unsigned int v31 = *(unsigned __int16 *)((char *)root - v30);
  if (v31 >= 0xD)
  {
    if (*(_WORD *)((char *)root - v30 + 12))
    {
      if (!siri::speech::schema_fb::UserLanguageProfile::Verify((flatbuffers::Table *)((char *)root+ *(unsigned __int16 *)((char *)root - v30 + 12)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v30 + 12))), (flatbuffers::Verifier *)&v39))goto LABEL_53; {
      uint64_t v32 = *(int *)root;
      }
      uint64_t v33 = -v32;
      unsigned int v31 = *(unsigned __int16 *)((char *)root - v32);
    }
    else
    {
      uint64_t v33 = -v30;
    }
    if (v31 < 0xF) {
      goto LABEL_51;
    }
    v34 = (char *)root + v33;
    if ((!*((_WORD *)v34 + 7) || v40 >= 2 && v40 - 1 >= (unint64_t)root + *((unsigned __int16 *)v34 + 7) - v39)
      && (v31 < 0x11
       || !*((_WORD *)v34 + 8)
       || v40 >= 2 && v40 - 1 >= (unint64_t)root + *((unsigned __int16 *)v34 + 8) - v39))
    {
      goto LABEL_51;
    }
LABEL_53:
    v37 = 0;
    goto LABEL_54;
  }
LABEL_51:
  uint64_t v35 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v39);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v35;

LABEL_52:
  v37 = v11;
LABEL_54:

  return v37;
}

- (QSSCreateLanguageProfileResponse)initWithFlatbuffData:(id)a3 root:(const CreateLanguageProfileResponse *)a4
{
  return [(QSSCreateLanguageProfileResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSCreateLanguageProfileResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSCreateLanguageProfileResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSCreateLanguageProfileResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
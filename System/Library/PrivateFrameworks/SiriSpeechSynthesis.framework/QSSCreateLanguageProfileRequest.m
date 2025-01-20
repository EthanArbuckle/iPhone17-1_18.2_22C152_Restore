@interface QSSCreateLanguageProfileRequest
- (NSArray)user_data;
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::CreateLanguageProfileRequest>)addObjectToBuffer:(void *)a3;
- (QSSCreateLanguageProfileRequest)initWithFlatbuffData:(id)a3;
- (QSSCreateLanguageProfileRequest)initWithFlatbuffData:(id)a3 root:(const CreateLanguageProfileRequest *)a4;
- (QSSCreateLanguageProfileRequest)initWithFlatbuffData:(id)a3 root:(const CreateLanguageProfileRequest *)a4 verify:(BOOL)a5;
- (QSSUserLanguageProfile)user_language_profile;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSCreateLanguageProfileRequest

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
  v2.var0 = [(QSSCreateLanguageProfileRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__47__QSSCreateLanguageProfileRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::CreateLanguageProfileRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSCreateLanguageProfileRequest *)self speech_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  long long v9 = [(QSSCreateLanguageProfileRequest *)self session_id];
  uint64_t v10 = v9;
  v55 = self;
  if (!v9) {
    long long v9 = &stru_26DEBFAF8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  unsigned int v53 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  uint64_t v13 = [(QSSCreateLanguageProfileRequest *)v55 language];
  v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_26DEBFAF8;
  }
  v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  unsigned int v52 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v15, v16);

  v17 = [(QSSCreateLanguageProfileRequest *)v55 user_data];
  unint64_t v18 = [v17 count];
  if (v18)
  {
    if (v18 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v18);
    v21 = &v19[4 * v20];
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v22 = [(QSSCreateLanguageProfileRequest *)v55 user_data];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v57 objects:v61 count:16];
  v56 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v23)
  {
    uint64_t v24 = *(void *)v58;
    v25 = v19;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v58 != v24) {
          objc_enumerationMutation(v22);
        }
        int v27 = [*(id *)(*((void *)&v57 + 1) + 8 * i) addObjectToBuffer:a3];
        int v28 = v27;
        if (v25 >= v21)
        {
          uint64_t v29 = (v25 - v19) >> 2;
          unint64_t v30 = v29 + 1;
          if ((unint64_t)(v29 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v21 - v19) >> 1 > v30) {
            unint64_t v30 = (v21 - v19) >> 1;
          }
          if ((unint64_t)(v21 - v19) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v31 = v30;
          }
          if (v31) {
            unint64_t v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v31);
          }
          else {
            uint64_t v32 = 0;
          }
          v33 = (char *)(v31 + 4 * v29);
          *(_DWORD *)v33 = v28;
          v34 = v33 + 4;
          while (v25 != v19)
          {
            int v35 = *((_DWORD *)v25 - 1);
            v25 -= 4;
            *((_DWORD *)v33 - 1) = v35;
            v33 -= 4;
          }
          v21 = (char *)(v31 + 4 * v32);
          if (v19) {
            operator delete(v19);
          }
          v19 = v33;
          v25 = v34;
          a3 = v56;
        }
        else
        {
          *(_DWORD *)v25 = v27;
          v25 += 4;
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v23);
  }
  else
  {
    v25 = v19;
  }

  uint64_t v36 = v25 - v19;
  v37 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v25 == v19) {
    v38 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::CategoryData>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::CategoryData>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::CategoryData>> const&)::t;
  }
  else {
    v38 = v19;
  }
  uint64_t v39 = v36 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v37, v36 >> 2, 4uLL);
  if (v19 == v25)
  {
    LODWORD(v39) = 0;
  }
  else
  {
    v40 = v38 - 4;
    uint64_t v41 = v39;
    do
    {
      int v42 = flatbuffers::FlatBufferBuilder::ReferTo(v56, *(_DWORD *)&v40[4 * v41]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v56, v42);
      --v41;
    }
    while (v41);
  }
  unsigned int v43 = flatbuffers::FlatBufferBuilder::EndVector(v56, v39);
  v44 = [(QSSCreateLanguageProfileRequest *)v55 user_language_profile];
  unsigned int v45 = [v44 addObjectToBuffer:v56];

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v56);
  *((unsigned char *)v56 + 70) = 1;
  int v46 = *((_DWORD *)v56 + 8);
  int v47 = *((_DWORD *)v56 + 12);
  int v48 = *((_DWORD *)v56 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v56, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v56, 6, v53);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v56, 8, v52);
  if (v43)
  {
    int v49 = flatbuffers::FlatBufferBuilder::ReferTo(v56, v43);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v56, 10, v49);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v56, 12, v45);
  v50.var0 = flatbuffers::FlatBufferBuilder::EndTable(v56, v46 - v47 + v48);
  if (v19) {
    operator delete(v19);
  }
  return v50;
}

- (QSSUserLanguageProfile)user_language_profile
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_language_profile"];
  if (!v3)
  {
    v4 = [QSSUserLanguageProfile alloc];
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

- (NSArray)user_data
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_data"];
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
        uint64_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            size_t v12 = [[QSSCategoryData alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_data"];
  }
  return (NSArray *)v3;
}

- (NSString)language
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

- (NSString)session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
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

- (NSString)speech_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
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

- (QSSCreateLanguageProfileRequest)initWithFlatbuffData:(id)a3 root:(const CreateLanguageProfileRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v44.receiver = self;
  v44.super_class = (Class)QSSCreateLanguageProfileRequest;
  uint64_t v10 = [(QSSCreateLanguageProfileRequest *)&v44 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_47;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_48;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const CreateLanguageProfileRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_46;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_48;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v39 = v18;
  unint64_t v40 = v19;
  long long v41 = xmmword_22B64D0E0;
  uint64_t v42 = 0;
  LOBYTE(v43) = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_46;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v39, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 4u))
  {
    goto LABEL_48;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (uint64_t v22 = v21[2]) != 0) {
    uint64_t v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  }
  else {
    uint64_t v23 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 6u))
  {
    goto LABEL_48;
  }
  uint64_t v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  }
  else {
    v26 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 8u))
  {
    goto LABEL_48;
  }
  int v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (uint64_t v28 = v27[4]) != 0) {
    uint64_t v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  }
  else {
    uint64_t v29 = 0;
  }
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v29)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xAu))
  {
    goto LABEL_48;
  }
  unint64_t v30 = 0;
  uint64_t v31 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v31) < 0xBu) {
    goto LABEL_41;
  }
  if (*(_WORD *)((char *)root - v31 + 10))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v39, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v31 + 10)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v31 + 10)), 4uLL, 0))
    {
      unint64_t v30 = 0;
      uint64_t v31 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v31) < 0xBu) {
        goto LABEL_41;
      }
      goto LABEL_37;
    }
LABEL_48:
    v37 = 0;
    goto LABEL_49;
  }
LABEL_37:
  uint64_t v32 = *(unsigned __int16 *)((char *)root - v31 + 10);
  if (v32) {
    unint64_t v30 = (_DWORD *)((char *)root + v32 + *(unsigned int *)((char *)root + v32));
  }
  else {
    unint64_t v30 = 0;
  }
LABEL_41:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::CategoryData>((flatbuffers::Verifier *)&v39, v30))goto LABEL_48; {
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xCu))
  }
    goto LABEL_48;
  v33 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v33 >= 0xDu)
  {
    uint64_t v34 = v33[6];
    if (v34)
    {
      if (!siri::speech::schema_fb::UserLanguageProfile::Verify((flatbuffers::Table *)((char *)root + v34 + *(unsigned int *)((char *)root + v34)), (flatbuffers::Verifier *)&v39))goto LABEL_48; {
    }
      }
  }
LABEL_46:
  uint64_t v35 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v39, v40, v41, v42, v43);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v35;

LABEL_47:
  v37 = v11;
LABEL_49:

  return v37;
}

- (QSSCreateLanguageProfileRequest)initWithFlatbuffData:(id)a3 root:(const CreateLanguageProfileRequest *)a4
{
  return [(QSSCreateLanguageProfileRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSCreateLanguageProfileRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSCreateLanguageProfileRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSCreateLanguageProfileRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
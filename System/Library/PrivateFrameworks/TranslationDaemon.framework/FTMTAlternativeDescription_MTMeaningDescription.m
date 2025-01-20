@interface FTMTAlternativeDescription_MTMeaningDescription
- (FTMTAlternativeDescription_MTMeaningDescription)initWithFlatbuffData:(id)a3;
- (FTMTAlternativeDescription_MTMeaningDescription)initWithFlatbuffData:(id)a3 root:(const MTMeaningDescription *)a4;
- (FTMTAlternativeDescription_MTMeaningDescription)initWithFlatbuffData:(id)a3 root:(const MTMeaningDescription *)a4 verify:(BOOL)a5;
- (NSString)definition;
- (Offset<siri::speech::schema_fb::MTAlternativeDescription_::MTMeaningDescription>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation FTMTAlternativeDescription_MTMeaningDescription

- (FTMTAlternativeDescription_MTMeaningDescription)initWithFlatbuffData:(id)a3
{
  return [(FTMTAlternativeDescription_MTMeaningDescription *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTMTAlternativeDescription_MTMeaningDescription *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTMTAlternativeDescription_MTMeaningDescription)initWithFlatbuffData:(id)a3 root:(const MTMeaningDescription *)a4
{
  return [(FTMTAlternativeDescription_MTMeaningDescription *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTMTAlternativeDescription_MTMeaningDescription)initWithFlatbuffData:(id)a3 root:(const MTMeaningDescription *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTMTAlternativeDescription_MTMeaningDescription;
  v10 = [(FTMTAlternativeDescription_MTMeaningDescription *)&v26 init];
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
    a4 = (const MTMeaningDescription *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::Pronunciation *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::Pronunciation::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)definition
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

- (Offset<siri::speech::schema_fb::MTAlternativeDescription_::MTMeaningDescription>)addObjectToBuffer:(void *)a3
{
  uint64_t v4 = [(FTMTAlternativeDescription_MTMeaningDescription *)self definition];
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v4 = &stru_270C008E8;
  }
  v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  LODWORD(v6) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v6, v7);

  *((unsigned char *)a3 + 70) = 1;
  int v8 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, (int)v6);
  return (Offset<siri::speech::schema_fb::MTAlternativeDescription_::MTMeaningDescription>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTMTAlternativeDescription_MTMeaningDescription *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
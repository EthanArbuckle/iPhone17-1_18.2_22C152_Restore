@interface FTSetRequestOrigin
- (BOOL)enable_geo_location_features;
- (FTSetRequestOrigin)initWithFlatbuffData:(id)a3;
- (FTSetRequestOrigin)initWithFlatbuffData:(id)a3 root:(const SetRequestOrigin *)a4;
- (FTSetRequestOrigin)initWithFlatbuffData:(id)a3 root:(const SetRequestOrigin *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::SetRequestOrigin>)addObjectToBuffer:(void *)a3;
- (double)latitude;
- (double)longitude;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation FTSetRequestOrigin

- (FTSetRequestOrigin)initWithFlatbuffData:(id)a3
{
  return [(FTSetRequestOrigin *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTSetRequestOrigin *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTSetRequestOrigin)initWithFlatbuffData:(id)a3 root:(const SetRequestOrigin *)a4
{
  return [(FTSetRequestOrigin *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTSetRequestOrigin)initWithFlatbuffData:(id)a3 root:(const SetRequestOrigin *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTSetRequestOrigin;
  v10 = [(FTSetRequestOrigin *)&v26 init];
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
    a4 = (const SetRequestOrigin *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::SetRequestOrigin *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::SetRequestOrigin::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (double)latitude
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 5u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[4].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (double)longitude
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 7u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[6].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (BOOL)enable_geo_location_features
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::SetRequestOrigin>)addObjectToBuffer:(void *)a3
{
  uint64_t v4 = self;
  [(FTSetRequestOrigin *)self latitude];
  double v6 = v5;
  [(FTSetRequestOrigin *)v4 longitude];
  double v8 = v7;
  LODWORD(v4) = [(FTSetRequestOrigin *)v4 enable_geo_location_features];
  *((unsigned char *)a3 + 70) = 1;
  int v9 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>(a3, 4, v6, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>(a3, 6, v8, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 8, (int)v4, 0);
  return (Offset<siri::speech::schema_fb::SetRequestOrigin>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v9);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTSetRequestOrigin *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__34__FTSetRequestOrigin_flatbuffData__block_invoke(uint64_t a1)
{
  double result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
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
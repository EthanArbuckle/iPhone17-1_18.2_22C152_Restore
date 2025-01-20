@interface FTAcousticFeature
- (FTAcousticFeature)initWithFlatbuffData:(id)a3;
- (FTAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4;
- (FTAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4 verify:(BOOL)a5;
- (NSArray)acoustic_feature_per_frame;
- (Offset<siri::speech::schema_fb::AcousticFeature>)addObjectToBuffer:(void *)a3;
- (float)frame_duration;
- (id)acoustic_feature_per_frame_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (unint64_t)acoustic_feature_per_frame_count;
- (void)acoustic_feature_per_frame_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTAcousticFeature

- (FTAcousticFeature)initWithFlatbuffData:(id)a3
{
  return [(FTAcousticFeature *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTAcousticFeature *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4
{
  return [(FTAcousticFeature *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTAcousticFeature;
  v10 = [(FTAcousticFeature *)&v26 init];
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
    a4 = (const AcousticFeature *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::RecognitionChoice *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::RecognitionChoice::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSArray)acoustic_feature_per_frame
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"acoustic_feature_per_frame"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__FTAcousticFeature_acoustic_feature_per_frame__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTAcousticFeature *)self acoustic_feature_per_frame_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"acoustic_feature_per_frame"];
  }
  return (NSArray *)v3;
}

uint64_t __47__FTAcousticFeature_acoustic_feature_per_frame__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)acoustic_feature_per_frame_objectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"acoustic_feature_per_frame"];
  id v7 = v5;
  if (v5)
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    id v9 = (void *)v8;
    goto LABEL_8;
  }
  root = self->_root;
  v11 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v11->var0 >= 5u)
  {
    uint64_t v12 = *(unsigned __int16 *)v11[4].var0;
    if (v12)
    {
      LODWORD(v6) = *(_DWORD *)root[4 * a3 + 4 + v12 + *(unsigned int *)root[v12].var0].var0;
      uint64_t v8 = [NSNumber numberWithFloat:v6];
      goto LABEL_3;
    }
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

- (unint64_t)acoustic_feature_per_frame_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"acoustic_feature_per_frame"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)acoustic_feature_per_frame_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"acoustic_feature_per_frame"];
  id v7 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    id v9 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v9->var0 >= 5u)
    {
      uint64_t v10 = *(unsigned __int16 *)v9[4].var0;
      if (v10)
      {
        unsigned __int8 v19 = 0;
        uint64_t v11 = *(unsigned int *)root[v10].var0;
        uint64_t v12 = *(unsigned int *)root[v10 + v11].var0;
        if (v12)
        {
          uint64_t v13 = 0;
          uint64_t v14 = 4 * v12 - 4;
          uint64_t v15 = (uint64_t)&root[v10 + 4 + v11];
          do
          {
            LODWORD(v6) = *(_DWORD *)(v15 + 4 * v13);
            v16 = [NSNumber numberWithFloat:v6];
            v4[2](v4, v16, v13, &v19);
            int v17 = v19;

            ++v13;
            if (v17) {
              BOOL v18 = 1;
            }
            else {
              BOOL v18 = v14 == 0;
            }
            v14 -= 4;
          }
          while (!v18);
        }
      }
    }
  }
}

- (float)frame_duration
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 7u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[6].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (Offset<siri::speech::schema_fb::AcousticFeature>)addObjectToBuffer:(void *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  __p = 0;
  v36 = 0;
  v37 = 0;
  uint64_t v5 = [(FTAcousticFeature *)self acoustic_feature_per_frame];
  std::vector<float>::reserve(&__p, [v5 count]);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v6 = [(FTAcousticFeature *)self acoustic_feature_per_frame];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) floatValue];
        int v11 = v10;
        uint64_t v12 = v36;
        if (v36 >= v37)
        {
          uint64_t v14 = (char *)__p;
          uint64_t v15 = (v36 - (unsigned char *)__p) >> 2;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v17 = v37 - (unsigned char *)__p;
          if ((v37 - (unsigned char *)__p) >> 1 > v16) {
            unint64_t v16 = v17 >> 1;
          }
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18)
          {
            unsigned __int8 v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v37, v18);
            uint64_t v14 = (char *)__p;
            uint64_t v12 = v36;
          }
          else
          {
            unsigned __int8 v19 = 0;
          }
          v20 = &v19[4 * v15];
          *(_DWORD *)v20 = v11;
          uint64_t v13 = v20 + 4;
          while (v12 != v14)
          {
            int v21 = *((_DWORD *)v12 - 1);
            v12 -= 4;
            *((_DWORD *)v20 - 1) = v21;
            v20 -= 4;
          }
          __p = v20;
          v36 = v13;
          v37 = &v19[4 * v18];
          if (v14) {
            operator delete(v14);
          }
        }
        else
        {
          *(_DWORD *)v36 = v10;
          uint64_t v13 = v12 + 4;
        }
        v36 = v13;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v7);
  }

  if (v36 == __p) {
    v22 = (const unsigned __int8 *)&apple::aiml::flatbuffers2::data<float,std::allocator<float>>(std::vector<float> const&)::t;
  }
  else {
    v22 = (const unsigned __int8 *)__p;
  }
  int v23 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<int>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v22, (v36 - (unsigned char *)__p) >> 2);
  [(FTAcousticFeature *)self frame_duration];
  float v25 = v24;
  *((unsigned char *)a3 + 70) = 1;
  int v26 = *((_DWORD *)a3 + 8);
  int v27 = *((_DWORD *)a3 + 12);
  int v28 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v23);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>(a3, 6, v25, 0.0);
  v29.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v26 - (unsigned __int16)v27 + v28);
  if (__p)
  {
    v36 = (char *)__p;
    operator delete(__p);
  }
  return v29;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTAcousticFeature *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__33__FTAcousticFeature_flatbuffData__block_invoke(uint64_t a1)
{
  float result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
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
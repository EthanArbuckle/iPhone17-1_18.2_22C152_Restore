@interface QSSAcousticFeature
- (NSArray)acoustic_feature_per_frame;
- (Offset<siri::speech::schema_fb::AcousticFeature>)addObjectToBuffer:(void *)a3;
- (QSSAcousticFeature)initWithFlatbuffData:(id)a3;
- (QSSAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4;
- (QSSAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4 verify:(BOOL)a5;
- (float)frame_duration;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSAcousticFeature

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
  v2.var0 = [(QSSAcousticFeature *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__34__QSSAcousticFeature_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::AcousticFeature>)addObjectToBuffer:(void *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v37 = 0;
  v38 = 0;
  unint64_t v39 = 0;
  uint64_t v5 = [(QSSAcousticFeature *)self acoustic_feature_per_frame];
  std::vector<float>::reserve((void **)&v37, [v5 count]);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  char v6 = [(QSSAcousticFeature *)self acoustic_feature_per_frame];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
  v31 = self;
  v32 = (flatbuffers::FlatBufferBuilder *)a3;
  long long v8 = v37;
  if (v7)
  {
    uint64_t v9 = *(void *)v34;
    unint64_t v10 = v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "floatValue", v31);
        int v13 = v12;
        v14 = v38;
        if ((unint64_t)v38 >= v10)
        {
          uint64_t v16 = (v38 - v8) >> 2;
          unint64_t v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
          {
            v37 = v8;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v10 - (void)v8) >> 1 > v17) {
            unint64_t v17 = (uint64_t)(v10 - (void)v8) >> 1;
          }
          if (v10 - (unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v17;
          }
          if (v18) {
            unint64_t v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v18);
          }
          else {
            uint64_t v19 = 0;
          }
          v20 = (_DWORD *)(v18 + 4 * v16);
          _DWORD *v20 = v13;
          v15 = (char *)(v20 + 1);
          while (v14 != v8)
          {
            int v21 = *((_DWORD *)v14 - 1);
            v14 -= 4;
            *--v20 = v21;
          }
          unint64_t v10 = v18 + 4 * v19;
          v38 = v15;
          if (v8) {
            operator delete(v8);
          }
          long long v8 = v20;
        }
        else
        {
          *(_DWORD *)v38 = v12;
          v15 = v14 + 4;
        }
        v38 = v15;
      }
      unint64_t v39 = v10;
      v37 = v8;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v7);
  }
  else
  {
    v15 = v38;
  }

  if (v15 == v8) {
    v22 = &flatbuffers::data<float,std::allocator<float>>(std::vector<float> const&)::t;
  }
  else {
    v22 = v8;
  }
  unsigned int v23 = flatbuffers::FlatBufferBuilder::CreateVector<int>(v32, v22, (v15 - v8) >> 2);
  [(QSSAcousticFeature *)v31 frame_duration];
  float v25 = v24;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v32);
  *((unsigned char *)v32 + 70) = 1;
  int v26 = *((_DWORD *)v32 + 8);
  int v27 = *((_DWORD *)v32 + 12);
  int v28 = *((_DWORD *)v32 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v32, 4, v23);
  flatbuffers::FlatBufferBuilder::AddElement<float>(v32, 6, v25);
  v29.var0 = flatbuffers::FlatBufferBuilder::EndTable(v32, v26 - v27 + v28);
  if (v8)
  {
    v38 = v8;
    operator delete(v8);
  }
  return v29;
}

- (float)frame_duration
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
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

- (NSArray)acoustic_feature_per_frame
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"acoustic_feature_per_frame"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u)
    {
      uint64_t v7 = *(unsigned __int16 *)v6[4].var0;
      if (v7)
      {
        long long v8 = &root[v7];
        uint64_t v9 = *(unsigned int *)v8->var0;
        uint64_t v11 = &v8[v9 + 4];
        uint64_t v10 = *(unsigned int *)v8[v9].var0;
        if (v10)
        {
          uint64_t v12 = 4 * v10;
          do
          {
            LODWORD(v4) = *(_DWORD *)v11->var0;
            int v13 = [NSNumber numberWithFloat:v4];
            [v3 addObject:v13];

            v11 += 4;
            v12 -= 4;
          }
          while (v12);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"acoustic_feature_per_frame"];
  }
  return (NSArray *)v3;
}

- (QSSAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSAcousticFeature;
  uint64_t v10 = [(QSSAcousticFeature *)&v30 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_16;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      int v13 = (unsigned int *)[*p_data bytes];
      a4 = (const AcousticFeature *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_16;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v25 = v18;
      unint64_t v26 = v19;
      long long v27 = xmmword_22B64D0E0;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (siri::speech::schema_fb::RecognitionChoice *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RecognitionChoice::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          unsigned int v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  unsigned int v23 = v11;
LABEL_17:

  return v23;
}

- (QSSAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4
{
  return [(QSSAcousticFeature *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSAcousticFeature *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSAcousticFeature)initWithFlatbuffData:(id)a3
{
  return [(QSSAcousticFeature *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
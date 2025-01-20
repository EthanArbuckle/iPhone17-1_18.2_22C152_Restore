@interface QSSRecognitionChoice
- (NSArray)alternative_index;
- (Offset<siri::speech::schema_fb::RecognitionChoice>)addObjectToBuffer:(void *)a3;
- (QSSRecognitionChoice)initWithFlatbuffData:(id)a3;
- (QSSRecognitionChoice)initWithFlatbuffData:(id)a3 root:(const RecognitionChoice *)a4;
- (QSSRecognitionChoice)initWithFlatbuffData:(id)a3 root:(const RecognitionChoice *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)confidence;
@end

@implementation QSSRecognitionChoice

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
  v2.var0 = [(QSSRecognitionChoice *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__36__QSSRecognitionChoice_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::RecognitionChoice>)addObjectToBuffer:(void *)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  memset(&v36, 0, sizeof(v36));
  uint64_t v5 = [(QSSRecognitionChoice *)self alternative_index];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v36, [v5 count]);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  char v6 = [(QSSRecognitionChoice *)self alternative_index];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  v30 = self;
  v31 = (flatbuffers::FlatBufferBuilder *)a3;
  begin = v36.__begin_;
  if (v7)
  {
    uint64_t v9 = *(void *)v33;
    value = v36.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        int v12 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "intValue", v30);
        int v13 = v12;
        std::vector<int>::pointer end = v36.__end_;
        if (v36.__end_ >= value)
        {
          uint64_t v16 = v36.__end_ - begin;
          unint64_t v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
          {
            v36.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v17) {
            unint64_t v17 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
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
          v20 = (int *)(v18 + 4 * v16);
          int *v20 = v13;
          v15 = v20 + 1;
          while (end != begin)
          {
            int v21 = *--end;
            *--v20 = v21;
          }
          value = (int *)(v18 + 4 * v19);
          v36.__end_ = v15;
          if (begin) {
            operator delete(begin);
          }
          begin = v20;
        }
        else
        {
          *v36.__end_ = v12;
          v15 = end + 1;
        }
        v36.__end_ = v15;
      }
      v36.__end_cap_.__value_ = value;
      v36.__begin_ = begin;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }
  else
  {
    v15 = v36.__end_;
  }

  if (v15 == begin) {
    v22 = (int *)&flatbuffers::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  }
  else {
    v22 = begin;
  }
  unsigned int v23 = flatbuffers::FlatBufferBuilder::CreateVector<int>(v31, v22, v15 - begin);
  int v24 = [(QSSRecognitionChoice *)v30 confidence];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v31);
  *((unsigned char *)v31 + 70) = 1;
  int v25 = *((_DWORD *)v31 + 8);
  int v26 = *((_DWORD *)v31 + 12);
  int v27 = *((_DWORD *)v31 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v31, 4, v23);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v31, 6, v24);
  v28.var0 = flatbuffers::FlatBufferBuilder::EndTable(v31, v25 - v26 + v27);
  if (begin)
  {
    v36.__end_ = begin;
    operator delete(begin);
  }
  return v28;
}

- (int)confidence
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

- (NSArray)alternative_index
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternative_index"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[4].var0;
      if (v6)
      {
        uint64_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        var0 = (unsigned int *)v7[v8 + 4].var0;
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            int v12 = [NSNumber numberWithInt:*var0];
            [v3 addObject:v12];

            ++var0;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"alternative_index"];
  }
  return (NSArray *)v3;
}

- (QSSRecognitionChoice)initWithFlatbuffData:(id)a3 root:(const RecognitionChoice *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRecognitionChoice;
  uint64_t v10 = [(QSSRecognitionChoice *)&v30 init];
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
      a4 = (const RecognitionChoice *)v13 + *v13;
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

- (QSSRecognitionChoice)initWithFlatbuffData:(id)a3 root:(const RecognitionChoice *)a4
{
  return [(QSSRecognitionChoice *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionChoice *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSRecognitionChoice)initWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionChoice *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
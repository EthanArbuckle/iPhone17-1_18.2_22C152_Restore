@interface QSSTTSPrompts
- (NSArray)prompts;
- (NSData)prompts_v2;
- (Offset<siri::speech::schema_fb::TTSPrompts>)addObjectToBuffer:(void *)a3;
- (QSSTTSPrompts)initWithFlatbuffData:(id)a3;
- (QSSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4;
- (QSSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (void)prompts_v2:(id)a3;
@end

@implementation QSSTTSPrompts

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
  v2.var0 = [(QSSTTSPrompts *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__29__QSSTTSPrompts_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TTSPrompts>)addObjectToBuffer:(void *)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  memset(&v44, 0, sizeof(v44));
  v3 = [(QSSTTSPrompts *)self prompts];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v44, [v3 count]);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v4 = [(QSSTTSPrompts *)self prompts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v40 objects:v45 count:16];
  char v6 = v4;
  begin = v44.__begin_;
  if (v5)
  {
    uint64_t v8 = *(void *)v41;
    value = v44.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (const char *)[*(id *)(*((void *)&v40 + 1) + 8 * i) UTF8String];
        size_t v12 = strlen(v11);
        int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);
        int v14 = String;
        std::vector<int>::pointer end = v44.__end_;
        if (v44.__end_ >= value)
        {
          uint64_t v17 = v44.__end_ - begin;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
          {
            v44.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v18) {
            unint64_t v18 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v18;
          }
          if (v19) {
            unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v19);
          }
          else {
            uint64_t v20 = 0;
          }
          v21 = (int *)(v19 + 4 * v17);
          int *v21 = v14;
          v16 = v21 + 1;
          while (end != begin)
          {
            int v22 = *--end;
            *--v21 = v22;
          }
          value = (int *)(v19 + 4 * v20);
          v44.__end_ = v16;
          if (begin) {
            operator delete(begin);
          }
          begin = v21;
        }
        else
        {
          *v44.__end_ = String;
          v16 = end + 1;
        }
        v44.__end_ = v16;
      }
      v44.__end_cap_.__value_ = value;
      v44.__begin_ = begin;
      uint64_t v5 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v5);
  }
  else
  {
    v16 = v44.__end_;
  }

  if (v16 == begin) {
    v23 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v23 = begin;
  }
  unsigned int v24 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v23, v16 - begin);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3812000000;
  v36 = __Block_byref_object_copy__645;
  v37 = __Block_byref_object_dispose__646;
  v38 = &unk_22B66C18D;
  int v39 = 0;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __35__QSSTTSPrompts_addObjectToBuffer___block_invoke;
  v32[3] = &unk_26489E988;
  v32[4] = &v33;
  v32[5] = a3;
  [(QSSTTSPrompts *)self prompts_v2:v32];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v25 = *((_DWORD *)a3 + 8);
  int v26 = *((_DWORD *)a3 + 12);
  int v27 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v24);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, *((_DWORD *)v34 + 12));
  v28.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v25 - v26 + v27);
  _Block_object_dispose(&v33, 8);
  if (begin)
  {
    v44.__end_ = begin;
    operator delete(begin);
  }
  return v28;
}

uint64_t __35__QSSTTSPrompts_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result = flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>(*(flatbuffers::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = result;
  return result;
}

- (void)prompts_v2:(id)a3
{
  id v4 = a3;
  root = self->_root;
  uint64_t v6 = *(int *)root->var0;
  uint64_t v7 = *(unsigned __int16 *)root[-v6 + 6].var0;
  if (*(_WORD *)root[-v6 + 6].var0)
  {
    uint64_t v8 = *(unsigned int *)root[v7].var0;
    long long v9 = &root[v7 + v8];
  }
  else
  {
    uint64_t v7 = 0;
    long long v9 = 0;
    uint64_t v8 = *(unsigned int *)root->var0;
  }
  id v10 = v4;
  (*((void (**)(id, const TTSPrompts *, void))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);
}

- (NSData)prompts_v2
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
  return (NSData *)[MEMORY[0x263EFF8F8] dataWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0];
}

- (NSArray)prompts
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[4].var0;
      if (v6)
      {
        uint64_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        id v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            size_t v12 = (void *)[[NSString alloc] initWithBytes:&v10[*(unsigned int *)v10->var0 + 4] length:*(unsigned int *)v10[*(unsigned int *)v10->var0].var0 encoding:4];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"prompts"];
  }
  return (NSArray *)v3;
}

- (QSSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTTSPrompts;
  id v10 = [(QSSTTSPrompts *)&v30 init];
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
      uint64_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const TTSPrompts *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TTSPrompts *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TTSPrompts::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (QSSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4
{
  return [(QSSTTSPrompts *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTTSPrompts *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTTSPrompts)initWithFlatbuffData:(id)a3
{
  return [(QSSTTSPrompts *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
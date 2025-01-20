@interface OPTTSWordTimingInfo
+ (id)vs_wordTimingInfos:(id)a3 withText:(id)a4;
- (NSString)word;
- (OPTTSWordTimingInfo)initWithFlatbuffData:(id)a3;
- (OPTTSWordTimingInfo)initWithFlatbuffData:(id)a3 root:(const WordTimingInfo *)a4;
- (OPTTSWordTimingInfo)initWithFlatbuffData:(id)a3 root:(const WordTimingInfo *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::WordTimingInfo>)addObjectToBuffer:(void *)a3;
- (float)timestamp;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (unsigned)length;
- (unsigned)offset;
- (unsigned)sample_idx;
@end

@implementation OPTTSWordTimingInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_226CFFD00;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(OPTTSWordTimingInfo *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__35__OPTTSWordTimingInfo_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x22A667720);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::WordTimingInfo>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(OPTTSWordTimingInfo *)self word];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DAD0E18;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  LODWORD(v7) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  int v9 = [(OPTTSWordTimingInfo *)self sample_idx];
  int v10 = [(OPTTSWordTimingInfo *)self offset];
  int v11 = [(OPTTSWordTimingInfo *)self length];
  [(OPTTSWordTimingInfo *)self timestamp];
  float v13 = v12;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v14 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 4, v7);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v9);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v11);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)a3, 12, v13);
  return (Offset<siri::speech::schema_fb::WordTimingInfo>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v14);
}

- (float)timestamp
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xDu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[12].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (unsigned)length
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)offset
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)sample_idx
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

- (NSString)word
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
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (OPTTSWordTimingInfo)initWithFlatbuffData:(id)a3 root:(const WordTimingInfo *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OPTTSWordTimingInfo;
  int v10 = [(OPTTSWordTimingInfo *)&v30 init];
  int v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_16;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      float v13 = (unsigned int *)[*p_data bytes];
      a4 = (const WordTimingInfo *)v13 + *v13;
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
      long long v27 = xmmword_226CFFD10;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (siri::speech::schema_fb::WordTimingInfo *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::WordTimingInfo::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (OPTTSWordTimingInfo)initWithFlatbuffData:(id)a3 root:(const WordTimingInfo *)a4
{
  return [(OPTTSWordTimingInfo *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSWordTimingInfo *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSWordTimingInfo)initWithFlatbuffData:(id)a3
{
  return [(OPTTSWordTimingInfo *)self initWithFlatbuffData:a3 root:0 verify:0];
}

+ (id)vs_wordTimingInfos:(id)a3 withText:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v24 = a4;
  char v6 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
  unint64_t v9 = 0x263F84000uLL;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v7);
        }
        float v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
        unint64_t v14 = VSGetLogDefault();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v26 = [v13 offset];
          uint64_t v25 = [v13 length];
          v17 = [v13 word];
          unint64_t v18 = v9;
          id v19 = v7;
          int v20 = objc_msgSend(v13, "sample_idx");
          [v13 timestamp];
          *(_DWORD *)buf = 134219010;
          uint64_t v32 = v26;
          __int16 v33 = 2048;
          uint64_t v34 = v25;
          __int16 v35 = 2112;
          v36 = v17;
          __int16 v37 = 1024;
          int v38 = v20;
          id v7 = v19;
          unint64_t v9 = v18;
          __int16 v39 = 2048;
          double v40 = (float)(v21 / 1000.0);
          _os_log_debug_impl(&dword_226CB1000, v14, OS_LOG_TYPE_DEBUG, "OPTTSTextToSpeechResponse word timing info, offset: %ld, length: %ld, word: %@, sampleIndex: %d, timestamp: %.2f", buf, 0x30u);
        }
        id v15 = objc_alloc_init(*(Class *)(v9 + 3760));
        objc_msgSend(v15, "setTextRange:", objc_msgSend(v13, "offset"), objc_msgSend(v13, "length"));
        [v13 timestamp];
        [v15 setStartTime:(float)(v16 / 1000.0)];
        [v6 addObject:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }
    while (v10);
  }

  v22 = [*(id *)(v9 + 3760) utf16TimingInfoWithUTF8Range:v6 withText:v24];

  return v22;
}

@end
@interface QSSBatchRecoverStreamingResponse
- (Offset<siri::speech::qss_fb::BatchRecoverStreamingResponse>)addObjectToBuffer:(void *)a3;
- (QSSBatchRecoverFinalResponse)contentAsQSSBatchRecoverFinalResponse;
- (QSSBatchRecoverStreamingResponse)initWithFlatbuffData:(id)a3;
- (QSSBatchRecoverStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BatchRecoverStreamingResponse *)a4;
- (QSSBatchRecoverStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BatchRecoverStreamingResponse *)a4 verify:(BOOL)a5;
- (QSSPronGuessResponse)contentAsQSSPronGuessResponse;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation QSSBatchRecoverStreamingResponse

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
  v2.var0 = [(QSSBatchRecoverStreamingResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__48__QSSBatchRecoverStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::qss_fb::BatchRecoverStreamingResponse>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(QSSBatchRecoverStreamingResponse *)self content_type];
  if ([(QSSBatchRecoverStreamingResponse *)self content_type] == 1)
  {
    char v6 = [(QSSBatchRecoverStreamingResponse *)self contentAsQSSPronGuessResponse];
    unsigned int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([(QSSBatchRecoverStreamingResponse *)self content_type] == 2)
  {
    long long v8 = [(QSSBatchRecoverStreamingResponse *)self contentAsQSSBatchRecoverFinalResponse];
    unsigned int v9 = [v8 addObjectToBuffer:a3];

    unsigned int v10 = v9;
  }
  else
  {
    unsigned int v10 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v11 = *((void *)a3 + 5);
  uint64_t v12 = *((void *)a3 + 6);
  uint64_t v13 = *((void *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v5);
  if ([(QSSBatchRecoverStreamingResponse *)self content_type] == 1) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  }
  if ([(QSSBatchRecoverStreamingResponse *)self content_type] == 2) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v10);
  }
  return (Offset<siri::speech::qss_fb::BatchRecoverStreamingResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v13 - (int)v12 + (int)v11);
}

- (QSSBatchRecoverFinalResponse)contentAsQSSBatchRecoverFinalResponse
{
  if ([(QSSBatchRecoverStreamingResponse *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSBatchRecoverFinalResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSBatchRecoverFinalResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSPronGuessResponse)contentAsQSSPronGuessResponse
{
  if ([(QSSBatchRecoverStreamingResponse *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSPronGuessResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSPronGuessResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)content_type
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return root[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (QSSBatchRecoverStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BatchRecoverStreamingResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v34.receiver = self;
  v34.super_class = (Class)QSSBatchRecoverStreamingResponse;
  unsigned int v10 = [(QSSBatchRecoverStreamingResponse *)&v34 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_34;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_35;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    uint64_t v13 = (unsigned int *)[*p_data bytes];
    a4 = (const BatchRecoverStreamingResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (v5)
  {
    unint64_t v14 = [*p_data bytes];
    uint64_t v15 = [*p_data length];
    unint64_t var0 = (unint64_t)v11->_root->var0;
    if (var0 < v14 || var0 > v14 + v15) {
      goto LABEL_35;
    }
    uint64_t v18 = [*p_data bytes];
    unint64_t v19 = [*p_data length];
    uint64_t v29 = v18;
    unint64_t v30 = v19;
    long long v31 = xmmword_22B64D0E0;
    uint64_t v32 = 0;
    char v33 = 1;
    if (v19 >= 0x7FFFFFFF) {
      __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
    }
    root = (flatbuffers::Table *)v11->_root;
    if (root)
    {
      if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v29, v11->_root->var0)) {
        goto LABEL_35;
      }
      v21 = (unsigned __int16 *)((char *)root - *(int *)root);
      unsigned int v22 = *v21;
      if (v22 >= 5 && v21[2] && (v30 < 2 || v30 - 1 < (unint64_t)root + v21[2] - v29)) {
        goto LABEL_35;
      }
      if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v29, 6u)) {
        goto LABEL_35;
      }
      if (v22 >= 7)
      {
        if (v21[3])
        {
          v23 = (flatbuffers::Table *)((char *)root + v21[3] + *(unsigned int *)((char *)root + v21[3]));
LABEL_24:
          if (v21[2])
          {
            int v24 = *((unsigned __int8 *)root + v21[2]);
            if (*((unsigned char *)root + v21[2]))
            {
              if (v24 == 2)
              {
                if (v23
                  && !siri::speech::schema_fb::BatchRecoverFinalResponse::Verify(v23, (flatbuffers::Verifier *)&v29))
                {
                  goto LABEL_35;
                }
              }
              else if (v24 != 1 {
                     || v23 && !siri::speech::schema_fb::PronGuessResponse::Verify(v23, (flatbuffers::Verifier *)&v29))
              }
              {
LABEL_35:
                v27 = 0;
                goto LABEL_36;
              }
            }
          }
          goto LABEL_33;
        }
LABEL_23:
        v23 = 0;
        goto LABEL_24;
      }
      if (v22 >= 5) {
        goto LABEL_23;
      }
    }
  }
LABEL_33:
  uint64_t v25 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v29);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v25;

LABEL_34:
  v27 = v11;
LABEL_36:

  return v27;
}

- (QSSBatchRecoverStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BatchRecoverStreamingResponse *)a4
{
  return [(QSSBatchRecoverStreamingResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSBatchRecoverStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSBatchRecoverStreamingResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSBatchRecoverStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
@interface FLTCDMCATISwiftBitVector
- (FLTCDMCATISwiftBitVector)initWithFlatbuffData:(id)a3;
- (FLTCDMCATISwiftBitVector)initWithFlatbuffData:(id)a3 root:(const CDMCATISwiftBitVector *)a4;
- (FLTCDMCATISwiftBitVector)initWithFlatbuffData:(id)a3 root:(const CDMCATISwiftBitVector *)a4 verify:(BOOL)a5;
- (NSData)data;
- (Offset<CDMCATISwiftBitVector>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (unint64_t)bit_shift;
- (unint64_t)bits_per_block;
- (unint64_t)number_of_bits;
- (unint64_t)number_of_bytes;
- (void)data:(id)a3;
@end

@implementation FLTCDMCATISwiftBitVector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_1C8C3EB40;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(FLTCDMCATISwiftBitVector *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__40__FLTCDMCATISwiftBitVector_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1CB772580);
  }
  return result;
}

- (Offset<CDMCATISwiftBitVector>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(FLTCDMCATISwiftBitVector *)self number_of_bits];
  uint64_t v6 = [(FLTCDMCATISwiftBitVector *)self number_of_bytes];
  uint64_t v7 = [(FLTCDMCATISwiftBitVector *)self bits_per_block];
  uint64_t v8 = [(FLTCDMCATISwiftBitVector *)self bit_shift];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3812000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = &unk_1C8C8403B;
  int v23 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__FLTCDMCATISwiftBitVector_addObjectToBuffer___block_invoke;
  v16[3] = &unk_1E6578F90;
  v16[4] = &v17;
  v16[5] = a3;
  [(FLTCDMCATISwiftBitVector *)self data:v16];
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v9 = *((_DWORD *)a3 + 8);
  int v10 = *((_DWORD *)a3 + 12);
  int v11 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((apple::aiml::flatbuffers2::vector_downward *)a3, 4, v5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((apple::aiml::flatbuffers2::vector_downward *)a3, 6, v6);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((apple::aiml::flatbuffers2::vector_downward *)a3, 8, v7);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((apple::aiml::flatbuffers2::vector_downward *)a3, 10, v8);
  unsigned int v12 = *((_DWORD *)v18 + 12);
  if (v12)
  {
    int v13 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v13, 0);
  }
  v14.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v9 - v10 + v11);
  _Block_object_dispose(&v17, 8);
  return v14;
}

uint64_t __46__FLTCDMCATISwiftBitVector_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v6 = *(apple::aiml::flatbuffers2::FlatBufferBuilder **)(a1 + 40);
  unint64_t v7 = a3;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(v6, a3, 1uLL);
  if (a3)
  {
    apple::aiml::flatbuffers2::vector_downward::ensure_space(v6, v7);
    uint64_t v8 = (void *)(*((void *)v6 + 6) - v7);
    *((void *)v6 + 6) = v8;
    memcpy(v8, a2, v7);
  }
  else
  {
    LODWORD(v7) = 0;
  }
  uint64_t result = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(v6, v7);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = result;
  return result;
}

- (void)data:(id)a3
{
  id v4 = a3;
  root = self->_root;
  uint64_t v6 = *(int *)root->var0;
  uint64_t v7 = *(unsigned __int16 *)root[-v6 + 12].var0;
  if (*(_WORD *)root[-v6 + 12].var0)
  {
    uint64_t v8 = *(unsigned int *)root[v7].var0;
    int v9 = &root[v7 + v8];
  }
  else
  {
    uint64_t v7 = 0;
    int v9 = 0;
    uint64_t v8 = *(unsigned int *)root->var0;
  }
  id v10 = v4;
  (*((void (**)(id, const CDMCATISwiftBitVector *, void))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);
}

- (NSData)data
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
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
  return (NSData *)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0];
}

- (unint64_t)bit_shift
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0) {
    return *(void *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unint64_t)bits_per_block
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(void *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unint64_t)number_of_bytes
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return *(void *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unint64_t)number_of_bits
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(void *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (FLTCDMCATISwiftBitVector)initWithFlatbuffData:(id)a3 root:(const CDMCATISwiftBitVector *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTCDMCATISwiftBitVector;
  id v10 = [(FLTCDMCATISwiftBitVector *)&v26 init];
  if (!v10) {
    goto LABEL_14;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_15;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    unsigned int v12 = (unsigned int *)[*p_data bytes];
    a4 = (const CDMCATISwiftBitVector *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_14;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_15;
  }
  uint64_t v17 = [*p_data bytes];
  unint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_1C8C3EB50;
  uint64_t v24 = 0;
  char v25 = 1;
  if (v18 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  uint64_t v19 = (CDMCATISwiftBitVector *)v10->_root;
  if (v19 && !CDMCATISwiftBitVector::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    v20 = 0;
  else {
LABEL_14:
  }
    v20 = v10;

  return v20;
}

- (FLTCDMCATISwiftBitVector)initWithFlatbuffData:(id)a3 root:(const CDMCATISwiftBitVector *)a4
{
  return [(FLTCDMCATISwiftBitVector *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FLTCDMCATISwiftBitVector *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FLTCDMCATISwiftBitVector)initWithFlatbuffData:(id)a3
{
  return [(FLTCDMCATISwiftBitVector *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
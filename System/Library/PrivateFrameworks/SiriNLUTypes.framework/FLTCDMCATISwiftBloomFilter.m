@interface FLTCDMCATISwiftBloomFilter
- (FLTCDMCATISwiftBitVector)bit_vector;
- (FLTCDMCATISwiftBloomFilter)initWithFlatbuffData:(id)a3;
- (FLTCDMCATISwiftBloomFilter)initWithFlatbuffData:(id)a3 root:(const CDMCATISwiftBloomFilter *)a4;
- (FLTCDMCATISwiftBloomFilter)initWithFlatbuffData:(id)a3 root:(const CDMCATISwiftBloomFilter *)a4 verify:(BOOL)a5;
- (NSString)name;
- (Offset<CDMCATISwiftBloomFilter>)addObjectToBuffer:(void *)a3;
- (double)false_positive_rate;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (unint64_t)number_of_bits;
- (unint64_t)number_of_hashes;
- (unint64_t)seed;
- (unsigned)expected_items_buffer;
- (unsigned)expected_number_of_items;
- (unsigned)number_of_items;
@end

@implementation FLTCDMCATISwiftBloomFilter

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
  v2.var0 = [(FLTCDMCATISwiftBloomFilter *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__42__FLTCDMCATISwiftBloomFilter_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1CB772580);
  }
  return result;
}

- (Offset<CDMCATISwiftBloomFilter>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(FLTCDMCATISwiftBloomFilter *)self bit_vector];
  unsigned int v6 = [v5 addObjectToBuffer:a3];

  uint64_t v7 = [(FLTCDMCATISwiftBloomFilter *)self number_of_bits];
  uint64_t v8 = [(FLTCDMCATISwiftBloomFilter *)self number_of_hashes];
  uint64_t v9 = [(FLTCDMCATISwiftBloomFilter *)self seed];
  int v10 = [(FLTCDMCATISwiftBloomFilter *)self expected_number_of_items];
  [(FLTCDMCATISwiftBloomFilter *)self false_positive_rate];
  double v12 = v11;
  uint64_t v13 = [(FLTCDMCATISwiftBloomFilter *)self name];
  v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_1F23304F0;
  }
  v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  unsigned int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  int v17 = [(FLTCDMCATISwiftBloomFilter *)self number_of_items];
  int v26 = [(FLTCDMCATISwiftBloomFilter *)self expected_items_buffer];
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v19 = *((void *)a3 + 5);
  uint64_t v18 = *((void *)a3 + 6);
  uint64_t v20 = *((void *)a3 + 4);
  if (v6)
  {
    int v21 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v6);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v21, 0);
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((apple::aiml::flatbuffers2::vector_downward *)a3, 6, v7);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((apple::aiml::flatbuffers2::vector_downward *)a3, 8, v8);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((apple::aiml::flatbuffers2::vector_downward *)a3, 10, v9);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v10, 0);
  if (v12 != 0.0 || *((unsigned char *)a3 + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    uint64_t v22 = *((void *)a3 + 6);
    *(double *)(v22 - 8) = v12;
    v22 -= 8;
    *((void *)a3 + 6) = v22;
    uint64_t v23 = (*((_DWORD *)a3 + 8) - v22 + *((_DWORD *)a3 + 10));
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    **((void **)a3 + 7) = v23 | 0xE00000000;
    *((void *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    unsigned int v24 = *((unsigned __int16 *)a3 + 34);
    if (v24 <= 0xE) {
      LOWORD(v24) = 14;
    }
    *((_WORD *)a3 + 34) = v24;
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v17, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v26, 1234);
  return (Offset<CDMCATISwiftBloomFilter>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v20 - (int)v18 + (int)v19);
}

- (unsigned)expected_items_buffer
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 1234;
  }
}

- (unsigned)number_of_items
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (uint64_t v4 = *(unsigned __int16 *)v3[18].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)name
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    unsigned int v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    unsigned int v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (double)false_positive_rate
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xFu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[14].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (unsigned)expected_number_of_items
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unint64_t)seed
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

- (unint64_t)number_of_hashes
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

- (unint64_t)number_of_bits
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

- (FLTCDMCATISwiftBitVector)bit_vector
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"bit_vector"];
  if (!v3)
  {
    uint64_t v4 = [FLTCDMCATISwiftBitVector alloc];
    root = self->_root;
    unsigned int v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(FLTCDMCATISwiftBitVector *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"bit_vector"];
  }
  return v3;
}

- (FLTCDMCATISwiftBloomFilter)initWithFlatbuffData:(id)a3 root:(const CDMCATISwiftBloomFilter *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTCDMCATISwiftBloomFilter;
  int v10 = [(FLTCDMCATISwiftBloomFilter *)&v26 init];
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
    double v12 = (unsigned int *)[*p_data bytes];
    a4 = (const CDMCATISwiftBloomFilter *)v12 + *v12;
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
  uint64_t v19 = (CDMCATISwiftBloomFilter *)v10->_root;
  if (v19 && !CDMCATISwiftBloomFilter::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    uint64_t v20 = 0;
  else {
LABEL_14:
  }
    uint64_t v20 = v10;

  return v20;
}

- (FLTCDMCATISwiftBloomFilter)initWithFlatbuffData:(id)a3 root:(const CDMCATISwiftBloomFilter *)a4
{
  return [(FLTCDMCATISwiftBloomFilter *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FLTCDMCATISwiftBloomFilter *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FLTCDMCATISwiftBloomFilter)initWithFlatbuffData:(id)a3
{
  return [(FLTCDMCATISwiftBloomFilter *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
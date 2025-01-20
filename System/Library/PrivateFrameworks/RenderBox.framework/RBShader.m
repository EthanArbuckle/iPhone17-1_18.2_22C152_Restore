@interface RBShader
+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5;
- ($B8E3DD8A8954C8C133399D0883B251E3)argumentAtIndex:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)function;
- (RBShader)initWithLibrary:(id)a3 function:(id)a4;
- (RBShaderLibrary)library;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodedDataForDelegate:(id)a3 error:(id *)a4;
- (int)type;
- (unint64_t)hash;
- (unint64_t)numberOfArguments;
- (void)removeAllArguments;
- (void)setArgumentBytes:(const void *)a3 atIndex:(unint64_t)a4 type:(unsigned int)a5 count:(unint64_t)a6 flags:(unsigned int)a7;
- (void)setArgumentColorSpace:(int)a3 atIndex:(unint64_t)a4;
- (void)setArgumentData:(id)a3 atIndex:(unint64_t)a4 type:(unsigned int)a5 flags:(unsigned int)a6;
- (void)setType:(int)a3;
@end

@implementation RBShader

- (RBShader)initWithLibrary:(id)a3 function:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)RBShader;
  v6 = [(RBShader *)&v13 init];
  v7 = v6;
  if (v6)
  {
    p = v6->_library._p;
    if (p != a3)
    {

      v7->_library._p = (RBShaderLibrary *)a3;
    }
    if (a3) {
      v9 = (os_unfair_lock_s *)*((void *)a3 + 1);
    }
    else {
      v9 = 0;
    }
    RB::CustomShader::Library::intern_function(v9, (NSString *)a4, (uint64_t **)&v12);
    v10 = v7->_fn_args.function._p;
    v7->_fn_args.function._p = v12;
    v12 = v10;
    if (v10 && atomic_fetch_add_explicit((atomic_uint *volatile)v10 + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(Function *))(*(void *)v10 + 8))(v10);
    }
    v7->_type = -1;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  p = self->_library._p;
  v6 = *(RBShaderLibrary **)(v4 + 8);
  if (v6 != p)
  {

    *(void *)(v4 + 8) = p;
  }
  RB::CustomShader::Closure::operator=(v4 + 16, (atomic_uint **)&self->_fn_args);
  *(_DWORD *)(v4 + 144) = self->_type;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_type != *((_DWORD *)a3 + 36)
    || self->_library._p != (RBShaderLibrary *)*((void *)a3 + 1))
  {
    return 0;
  }
  return RB::CustomShader::Closure::operator==((uint64_t *)&self->_fn_args, (uint64_t *)a3 + 2);
}

- (unint64_t)hash
{
  return *((unsigned int *)self->_fn_args.function._p + 8);
}

- (RBShaderLibrary)library
{
  return self->_library._p;
}

- (NSString)function
{
  return (NSString *)*((void *)self->_fn_args.function._p + 3);
}

- (unint64_t)numberOfArguments
{
  return self->_fn_args.args._size;
}

- (void)removeAllArguments
{
  unint64_t size = self->_fn_args.args._size;
  if (self->_fn_args.args._p_2) {
    p_2 = (const void **)self->_fn_args.args._p_2;
  }
  else {
    p_2 = (const void **)&self->_fn_args.args;
  }
  if (size)
  {
    uint64_t v5 = 24 * size;
    do
    {
      RB::CustomShader::Value::reset_data(p_2);
      p_2 += 3;
      v5 -= 24;
    }
    while (v5);
  }
  self->_fn_args.args._unint64_t size = 0;
}

- (void)setArgumentBytes:(const void *)a3 atIndex:(unint64_t)a4 type:(unsigned int)a5 count:(unint64_t)a6 flags:(unsigned int)a7
{
  char v7 = a7;
  unsigned __int8 v9 = a5;
  RB::CustomShader::Closure::ensure_arg((RB::CustomShader::Closure *)&self->_fn_args, a4);
  p_2 = self->_fn_args.args._p_2;
  if (!p_2) {
    p_2 = &self->_fn_args.args;
  }
  unint64_t v14 = 3 * a4;
  RB::CustomShader::Value::set_bytes((uint64_t)p_2 + 8 * v14, v9, a6, (const UInt8 *)a3);
  p = self->_fn_args.args._p_2;
  if (!p) {
    p = self->_fn_args.args._p;
  }
  p[8 * v14 + 7] = p[8 * v14 + 7] & 0xFE | v7 & 1;
  v16 = self->_fn_args.args._p_2;
  if (!v16) {
    v16 = self->_fn_args.args._p;
  }
  v16[8 * v14 + 7] = v16[8 * v14 + 7] & 0xFD | v7 & 2;
}

- (void)setArgumentData:(id)a3 atIndex:(unint64_t)a4 type:(unsigned int)a5 flags:(unsigned int)a6
{
  char v6 = a6;
  unsigned __int8 v7 = a5;
  RB::CustomShader::Closure::ensure_arg((RB::CustomShader::Closure *)&self->_fn_args, a4);
  p_2 = self->_fn_args.args._p_2;
  if (!p_2) {
    p_2 = &self->_fn_args.args;
  }
  unint64_t v12 = 3 * a4;
  RB::CustomShader::Value::set_data((uint64_t)p_2 + 8 * v12, v7, (const __CFData *)a3);
  p = self->_fn_args.args._p_2;
  if (!p) {
    p = self->_fn_args.args._p;
  }
  p[8 * v12 + 7] = p[8 * v12 + 7] & 0xFE | v6 & 1;
  unint64_t v14 = self->_fn_args.args._p_2;
  if (!v14) {
    unint64_t v14 = self->_fn_args.args._p;
  }
  v14[8 * v12 + 7] = v14[8 * v12 + 7] & 0xFD | v6 & 2;
}

- (void)setArgumentColorSpace:(int)a3 atIndex:(unint64_t)a4
{
  RB::CustomShader::Closure::ensure_arg((RB::CustomShader::Closure *)&self->_fn_args, a4);
  __int16 v7 = rb_color_space(a3);
  p_args = (char *)&self->_fn_args.args;
  if (self->_fn_args.args._p_2) {
    p_args = (char *)self->_fn_args.args._p_2;
  }
  *(_WORD *)&p_args[24 * a4 + 5] = v7;
}

- ($B8E3DD8A8954C8C133399D0883B251E3)argumentAtIndex:(SEL)a3
{
  if (self->_fn_args.args._size <= a4) {
    RB::precondition_failure((RB *)"invalid argument index: %ld", a3, a4);
  }
  p_args = (char *)&self->_fn_args.args;
  if (self->_fn_args.args._p_2) {
    p_args = (char *)self->_fn_args.args._p_2;
  }
  char v6 = &p_args[24 * a4];
  int v7 = v6[7];
  int v8 = v7 << 31 >> 31;
  if ((v7 & 2) != 0) {
    int v9 = 3;
  }
  else {
    int v9 = 1;
  }
  retstr->var0 = v6[4];
  retstr->var1 = v8 & v9;
  retstr->var2 = *(unsigned int *)v6;
  retstr->var3 = RB::CustomShader::Value::data_ptr((RB::CustomShader::Value *)v6);
  result = ($B8E3DD8A8954C8C133399D0883B251E3 *)rb_color_space(*(_WORD *)(v6 + 5));
  retstr->var4 = (int)result;
  return result;
}

- (id)encodedDataForDelegate:(id)a3 error:(id *)a4
{
  v8[0] = &unk_26C4ED1F0;
  v8[1] = a3;
  RB::ObjcEncoderDelegate::font_set(v8, &v17);
  uint64_t v5 = v17;
  *(_OWORD *)int v9 = 0u;
  *(_OWORD *)v10 = 0u;
  long long v11 = 0u;
  char v12 = 0;
  objc_super v13 = v8;
  if (v17) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v17 + 8), 1u, memory_order_relaxed);
  }
  uint64_t v14 = v5;
  uint64_t v15 = 0;
  RB::UntypedTable::UntypedTable((uint64_t)v16, 0, 0, 0, 0, 0);
  p_fn_args = &self->_fn_args;
  v16[20] = atomic_fetch_add_explicit(RB::Encoder::_last_encoder_id, 1u, memory_order_relaxed) + 1;
  v16[21] = 0;
  RB::CustomShader::Closure::prepare_encode((RB::CustomShader::Closure *)p_fn_args, (RB::Encoder *)v9);
  RB::Encoder::prepare_fonts((RB::Encoder *)v9);
  RB::ProtobufEncoder::encode_varint(v9, 0xAuLL);
  RB::ProtobufEncoder::begin_length_delimited(v9);
  RB::CustomShader::Closure::encode((RB::CustomShader::Function **)p_fn_args, (RB::Encoder *)v9);
  RB::ProtobufEncoder::end_length_delimited(v9);
  operator new();
}

+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5
{
  MEMORY[0x270FA5388](a1, a2);
  char v6 = v5;
  int v8 = v7;
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v22 = v9;
  v10 = objc_opt_new();
  RB::Heap::Heap((RB::Heap *)v23, v24, 4096, 0);
  long long v11 = v10;
  uint64_t v12 = objc_msgSend(v8, "bytes", &unk_26C4ED1B8, v22, 0);
  uint64_t v13 = [v8 length];
  uint64_t v25 = v12;
  uint64_t v26 = v12 + v13;
  uint64_t v27 = 0;
  v28 = 0;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  v32 = v23;
  v33 = &v21;
  unsigned __int8 v31 = 0;
  RB::UntypedTable::UntypedTable((uint64_t)v34, 0, 0, 0, 0, 0);
  memset(v36, 0, sizeof(v36));
  *(_OWORD *)v35 = 0u;
  uuid_clear(v37);
  int v38 = 0;
  char v39 = 1;
  for (unint64_t i = RB::ProtobufDecoder::next_field((RB::ProtobufDecoder *)&v25);
        i;
        unint64_t i = RB::ProtobufDecoder::next_field((RB::ProtobufDecoder *)&v25))
  {
    if ((i >> 3) == 15)
    {
      RB::Decoder::push_shared((char *)&v25, i);
    }
    else if ((i >> 3) == 1)
    {
      RB::CustomShader::Closure::decode((RB::CustomShader::Closure *)(v11 + 16), (RB::Decoder *)&v25);
    }
    else
    {
      RB::ProtobufDecoder::skip_field((RB::ProtobufDecoder *)&v25, i);
    }
  }
  int v15 = v31;
  unint64_t v16 = v25;
  unint64_t v17 = v26;
  RB::ObjectTable::~ObjectTable((RB::ObjectTable *)((char *)v36 + 8));
  if (v35[0]) {
    free(v35[0]);
  }
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)v34);
  if (v28) {
    free(v28);
  }

  if (v15 || v16 > v17)
  {
    if (v6 && !*v6)
    {
      id v19 = 0;
      void *v6 = [MEMORY[0x263F087E8] errorWithDomain:@"RBCodableError" code:-1 userInfo:0];
    }
    else
    {
      id v19 = 0;
    }
    v18 = v10;
  }
  else
  {
    v18 = 0;
    id v19 = v10;
  }
  RB::Heap::~Heap((RB::Heap *)v23);

  return v19;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  p_args = &self->_fn_args.args;
  p_2 = self->_fn_args.args._p_2;
  if (p_2) {
    uint64_t v5 = (const void **)p_2;
  }
  else {
    uint64_t v5 = (const void **)p_args;
  }
  if (self->_fn_args.args._size)
  {
    unint64_t v6 = 0;
    do
    {
      RB::CustomShader::Value::reset_data(v5);
      ++v6;
      v5 += 3;
    }
    while (v6 < self->_fn_args.args._size);
    p_2 = self->_fn_args.args._p_2;
  }
  if (p_2) {
    free(p_2);
  }
  p = (atomic_uint *)self->_fn_args.function._p;
  if (p && atomic_fetch_add_explicit(p + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    (*(void (**)(atomic_uint *, SEL))(*(void *)p + 8))(p, a2);
  }
  int v8 = self->_library._p;
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 17) = 4;
  return self;
}

@end
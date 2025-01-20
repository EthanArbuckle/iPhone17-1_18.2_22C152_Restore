@interface RBEncoderSet
- (RBEncoderSet)init;
- (id).cxx_construct;
- (void)addDisplayList:(id)a3;
- (void)commit;
@end

@implementation RBEncoderSet

- (RBEncoderSet)init
{
  v3.receiver = self;
  v3.super_class = (Class)RBEncoderSet;
  if ([(RBEncoderSet *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)addDisplayList:(id)a3
{
  if (self->_final) {
    RB::precondition_failure((RB *)"can't add to committed RBEncoderSet", a2, a3);
  }
  uint64_t v4 = objc_msgSend(a3, "_rb_contents");
  if (v4)
  {
    v5 = (RB::DisplayList::Contents *)v4;
    p = self->_font_set._p;
    *(_OWORD *)v8 = 0u;
    *(_OWORD *)v9 = 0u;
    long long v10 = 0u;
    char v11 = 0;
    uint64_t v12 = 0;
    if (p) {
      atomic_fetch_add_explicit((atomic_uint *volatile)p + 2, 1u, memory_order_relaxed);
    }
    v13 = p;
    uint64_t v14 = 0;
    RB::UntypedTable::UntypedTable((uint64_t)v15, 0, 0, 0, 0, 0);
    v15[20] = atomic_fetch_add_explicit(RB::Encoder::_last_encoder_id, 1u, memory_order_relaxed) + 1;
    v15[21] = 1;
    RB::DisplayList::Contents::prepare_encode(v5, (RB::Encoder *)v8);
    RB::UntypedTable::~UntypedTable((RB::UntypedTable *)v15);
    v7 = v13;
    if (v13 && atomic_fetch_add_explicit((atomic_uint *volatile)v13 + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(FontSet *))(*(void *)v7 + 8))(v7);
    }
    if (v9[1]) {
      free(v9[1]);
    }
    if (v8[0]) {
      free(v8[0]);
    }
  }
}

- (void)commit
{
  self->_final = 1;
}

- (void).cxx_destruct
{
  p = self->_font_set._p;
  if (p)
  {
    if (atomic_fetch_add_explicit((atomic_uint *volatile)p + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(void))(*(void *)p + 8))();
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (atomic_uint)addDisplayList:(atomic_uint *)result .cold.1(atomic_uint *result)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    return (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)result + 8))(result);
  }
  return result;
}

@end
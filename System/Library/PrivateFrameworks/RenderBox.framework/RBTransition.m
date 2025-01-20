@interface RBTransition
+ (RBTransition)defaultTransition;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReplaceable;
- (NSArray)effects;
- (RBAnimation)animation;
- (RBTransition)init;
- (float)addRemoveDuration;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)_copyOnWrite;
- (uint64_t)setTransition:(uint64_t)result;
- (unint64_t)hash;
- (unsigned)maxChanges;
- (unsigned)method;
- (void)addEffect:(id)a3;
- (void)setAddRemoveDuration:(float)a3;
- (void)setAnimation:(id)a3;
- (void)setMaxChanges:(unsigned int)a3;
- (void)setMethod:(unsigned int)a3;
- (void)setReplaceable:(BOOL)a3;
@end

@implementation RBTransition

+ (RBTransition)defaultTransition
{
  {
    uint64_t v3 = objc_opt_new();
    *(unsigned char *)(v3 + 16) = 1;
    +[RBTransition defaultTransition]::default_transition = v3;
  }
  return (RBTransition *)+[RBTransition defaultTransition]::default_transition;
}

- (RBTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)RBTransition;
  if ([(RBTransition *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = (atomic_uint *)v4[1];
  p = self->_transition._p;
  if (v5 != (atomic_uint *)p)
  {
    if (v5)
    {
      if (atomic_fetch_add_explicit(v5 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *))(*(void *)v5 + 8))(v5);
      }
      p = self->_transition._p;
    }
    if (p) {
      atomic_fetch_add_explicit((atomic_uint *volatile)p + 2, 1u, memory_order_relaxed);
    }
    v4[1] = p;
  }
  return v4;
}

- (uint64_t)_copyOnWrite
{
  if (result)
  {
    if (*(_DWORD *)(*(void *)(result + 8) + 8) != 1) {
      operator new();
    }
    __dmb(9u);
  }
  return result;
}

- (unsigned)method
{
  return rb_transition_method((Method)*((unsigned __int8 *)self->_transition._p + 12));
}

- (void)setMethod:(unsigned int)a3
{
  int v4 = rb_transition_method(a3);
  if (*((unsigned __int8 *)self->_transition._p + 12) != v4)
  {
    if (self->_is_default) {
      RB::precondition_failure((RB *)"modifying default transition", v5);
    }
    char v6 = v4;
    -[RBTransition _copyOnWrite]((uint64_t)self);
    *((unsigned char *)self->_transition._p + 12) = v6;
  }
}

- (RBAnimation)animation
{
  if (!*((_DWORD *)self->_transition._p + 22)) {
    return 0;
  }
  objc_super v3 = (_DWORD *)objc_opt_new();
  -[RBAnimation setRBAnimation:](v3, (uint64_t)self->_transition._p + 56);
  return (RBAnimation *)v3;
}

- (void)setAnimation:(id)a3
{
  if (self->_is_default) {
    RB::precondition_failure((RB *)"modifying default transition", a2, a3);
  }
  -[RBTransition _copyOnWrite]((uint64_t)self);
  uint64_t v5 = -[RBAnimation rb_animation]((uint64_t)a3);
  p = self->_transition._p;
  *((_DWORD *)p + 22) = 0;
  if (*(void *)(v5 + 24)) {
    v7 = *(int **)(v5 + 24);
  }
  else {
    v7 = (int *)v5;
  }
  unsigned int v8 = *(_DWORD *)(v5 + 32);
  if (*((_DWORD *)p + 23) < v8)
  {
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow((char *)p + 56, v8);
    uint64_t v9 = *((unsigned int *)p + 22);
  }
  else
  {
    if (!v8)
    {
      int v14 = 0;
      goto LABEL_14;
    }
    uint64_t v9 = 0;
  }
  v10 = (char *)*((void *)p + 10);
  if (!v10) {
    v10 = (char *)p + 56;
  }
  v11 = &v10[4 * v9];
  unsigned int v12 = v8;
  do
  {
    int v13 = *v7++;
    *(_DWORD *)v11 = v13;
    v11 += 4;
    --v12;
  }
  while (v12);
  int v14 = *((_DWORD *)p + 22);
LABEL_14:
  *((_DWORD *)p + 22) = v14 + v8;
}

- (unsigned)maxChanges
{
  return *((_DWORD *)self->_transition._p + 4);
}

- (void)setMaxChanges:(unsigned int)a3
{
  if (*((_DWORD *)self->_transition._p + 4) != a3)
  {
    -[RBTransition _copyOnWrite]((uint64_t)self);
    *((_DWORD *)self->_transition._p + 4) = a3;
  }
}

- (BOOL)isReplaceable
{
  return *((unsigned char *)self->_transition._p + 13);
}

- (void)setReplaceable:(BOOL)a3
{
  if (*((unsigned char *)self->_transition._p + 13) != a3)
  {
    -[RBTransition _copyOnWrite]((uint64_t)self);
    *((unsigned char *)self->_transition._p + 13) = a3;
  }
}

- (void)addEffect:(id)a3
{
  if (self->_is_default) {
    RB::precondition_failure((RB *)"modifying default transition", a2, a3);
  }
  if (a3)
  {
    -[RBTransition _copyOnWrite]((uint64_t)self);
    int v5 = *((_DWORD *)a3 + 2);
    p = self->_transition._p;
    int v7 = *((_DWORD *)p + 12);
    if (*((_DWORD *)p + 13) < (v7 + 1))
    {
      RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow((char *)p + 24, v7 + 1);
      int v7 = *((_DWORD *)p + 12);
    }
    unsigned int v8 = (char *)*((void *)p + 5);
    if (!v8) {
      unsigned int v8 = (char *)p + 24;
    }
    *(_DWORD *)&v8[4 * v7] = v5;
    ++*((_DWORD *)p + 12);
    if (((0x187FA3uLL >> v5) & 1) == 0)
    {
      uint64_t v9 = (int *)((char *)a3 + 12);
      if (RB::Transition::_effect_args[v5 & 0x7F] <= 1u) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = RB::Transition::_effect_args[v5 & 0x7F];
      }
      do
      {
        v11 = self->_transition._p;
        int v12 = *((_DWORD *)v11 + 12);
        if (*((_DWORD *)v11 + 13) < (v12 + 1))
        {
          RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow((char *)v11 + 24, v12 + 1);
          int v12 = *((_DWORD *)v11 + 12);
        }
        int v13 = (char *)*((void *)v11 + 5);
        if (!v13) {
          int v13 = (char *)v11 + 24;
        }
        int v14 = *v9++;
        *(_DWORD *)&v13[4 * v12] = v14;
        ++*((_DWORD *)v11 + 12);
        --v10;
      }
      while (v10);
    }
  }
}

- (NSArray)effects
{
  if (!*((_DWORD *)self->_transition._p + 12)) {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
  objc_super v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  p = self->_transition._p;
  if (*((_DWORD *)p + 12))
  {
    unsigned int v5 = 0;
    do
    {
      char v6 = (char *)p + 24;
      int v7 = (char *)*((void *)p + 5);
      if (!v7) {
        int v7 = v6;
      }
      unsigned int v8 = &v7[4 * v5];
      uint64_t v9 = objc_opt_new();
      uint64_t v10 = (void *)v9;
      if (v9)
      {
        *(_DWORD *)(v9 + 8) = *(_DWORD *)v8;
        if (((0x187FA3uLL >> *(_WORD *)v8) & 1) == 0)
        {
          v11 = (int *)(v8 + 4);
          int v12 = (_DWORD *)(v9 + 12);
          uint64_t v13 = 4 * RB::Transition::_effect_args[*(_WORD *)v8 & 0x7FLL];
          do
          {
            int v14 = *v11++;
            *v12++ = v14;
            v13 -= 4;
          }
          while (v13);
        }
      }
      [(NSArray *)v3 addObject:v9];
      int v15 = RB::Transition::_effect_args[*(_WORD *)v8 & 0x7F];

      v5 += v15 + 1;
      p = self->_transition._p;
    }
    while (v5 < *((_DWORD *)p + 12));
  }
  return v3;
}

- (float)addRemoveDuration
{
  LOBYTE(v2) = *((unsigned char *)self->_transition._p + 14);
  return (float)v2 * 0.0039216;
}

- (void)setAddRemoveDuration:(float)a3
{
  -[RBTransition _copyOnWrite]((uint64_t)self);
  p = self->_transition._p;
  RB::Transition::set_add_remove_duration((uint64_t)p, a3);
}

- (uint64_t)setTransition:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 16)) {
      RB::precondition_failure((RB *)"modifying default transition", (const char *)a2);
    }
    result = *(void *)(result + 8);
    if (result != a2)
    {
      if (result)
      {
        if (atomic_fetch_add_explicit((atomic_uint *volatile)(result + 8), 0xFFFFFFFF, memory_order_release) == 1)
        {
          __dmb(9u);
          result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
        }
      }
      atomic_fetch_add_explicit((atomic_uint *volatile)(a2 + 8), 1u, memory_order_relaxed);
      *(void *)(v2 + 8) = a2;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  p = self->_transition._p;
  uint64_t v6 = *((void *)a3 + 1);
  return RB::Transition::operator==((uint64_t)p, v6);
}

- (unint64_t)hash
{
  p = self->_transition._p;
  uint64_t v4 = 33 * (-(uint64_t)*((char *)p + 13) ^ *((unsigned __int8 *)p + 12));
  unint64_t result = v4 ^ RB::Animation::hash((RB::Animation *)((char *)p + 56));
  uint64_t v6 = self->_transition._p;
  if (*((_DWORD *)v6 + 12))
  {
    unsigned int v7 = 0;
    do
    {
      unsigned int v8 = (char *)v6 + 24;
      uint64_t v9 = (char *)*((void *)v6 + 5);
      uint64_t v10 = v7;
      if (!v9) {
        uint64_t v9 = v8;
      }
      v11 = (RB::Transition::Effect *)&v9[4 * v7];
      unint64_t result = RB::Transition::Effect::hash(v11) ^ (33 * result);
      char v12 = *(_WORD *)v11;
      unsigned int v13 = RB::Transition::_effect_args[v12 & 0x7F];
      if (((0x187FA3uLL >> v12) & 1) == 0)
      {
        if (v13 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = RB::Transition::_effect_args[v12 & 0x7F];
        }
        do
        {
          unint64_t result = (33 * result) ^ *((unsigned int *)v11 + v10 + 1);
          --v14;
        }
        while (v14);
      }
      unsigned int v7 = v10 + v13 + 1;
      uint64_t v6 = self->_transition._p;
    }
    while (v7 < *((_DWORD *)v6 + 12));
  }
  return result;
}

- (void).cxx_destruct
{
  p = self->_transition._p;
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

@end
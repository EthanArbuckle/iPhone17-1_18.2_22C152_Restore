@interface RBDisplayListTransform
+ (id)transform;
- (id).cxx_construct;
- (id)applyingToDisplayList:(id)a3;
- (id)copyApplyingToDisplayList:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addColorReplacementFrom:(id)a3 to:(id)a4 colorSpace:(int)a5;
- (void)addColorReplacementTo:(id)a3 colorSpace:(int)a4;
- (void)addFontInterpolationTo:(CGFont *)a3 by:(float)a4 flags:(unsigned int)a5;
- (void)applyToDisplayList:(id)a3;
- (void)removeAll;
@end

@implementation RBDisplayListTransform

- (void)removeAll
{
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0x100000000;
  return self;
}

- (id)copyApplyingToDisplayList:(id)a3
{
  v18[37] = *(RB::DisplayList::Layer ***)MEMORY[0x263EF8340];
  v16 = 0;
  v17 = 0;
  v5 = (const RB::DisplayList::Contents *)objc_msgSend(a3, "_rb_contents");
  if (v5)
  {
    RB::DisplayList::Builder::Builder((RB::DisplayList::Builder *)v18);
    RB::DisplayList::Builder::draw(v18, v5, (RB::DisplayList::State *)v18[33], 1.0, 0, 0);
    RB::DisplayList::Builder::move_contents((RB::DisplayList::Builder *)v18, v6, &v15);
    v17 = v15;
    RB::DisplayList::Contents::apply_transform(v15, &self->_transform);
    RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)v18);
  }
  if (objc_msgSend(a3, "_rb_xml_document")) {
    operator new();
  }
  v7 = [RBMovedDisplayListContents alloc];
  v8 = v16;
  v16 = 0;
  v14 = v8;
  v9 = -[RBMovedDisplayListContents initWithContents:xmlDocument:](v7, &v17, (uint64_t *)&v14);
  uint64_t v10 = (uint64_t)v14;
  v14 = 0;
  if (v10) {
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v14, v10);
  }
  v11 = v16;
  v16 = 0;
  if (v11) {
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v16, (uint64_t)v11);
  }
  v12 = v17;
  if (v17 && atomic_fetch_add_explicit((atomic_uint *volatile)v17 + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    (*(void (**)(RB::DisplayList::Contents *))(*(void *)v12 + 8))(v12);
  }
  return v9;
}

- (void).cxx_destruct
{
  p_2 = self->_transform._terms._p_2;
  if (p_2) {
    p_transform = (RB::DisplayList::Transform::Term *)self->_transform._terms._p_2;
  }
  else {
    p_transform = (RB::DisplayList::Transform::Term *)&self->_transform;
  }
  if (self->_transform._terms._size)
  {
    unint64_t v5 = 0;
    do
    {
      RB::DisplayList::Transform::Term::~Term(p_transform);
      ++v5;
      p_transform = (RB::DisplayList::Transform::Term *)(v6 + 32);
    }
    while (v5 < self->_transform._terms._size);
    p_2 = self->_transform._terms._p_2;
  }
  if (p_2)
  {
    free(p_2);
  }
}

- (void)addColorReplacementFrom:(id)a3 to:(id)a4 colorSpace:(int)a5
{
  _S8 = a4.var3;
  _S9 = a4.var2;
  _S10 = a4.var1;
  _S11 = a4.var0;
  _S12 = a3.var3;
  _S13 = a3.var2;
  _S14 = a3.var1;
  _S15 = a3.var0;
  __int16 v14 = rb_color_space(a5);
  __asm
  {
    FCVT            H0, S15
    FCVT            H1, S14
    FCVT            H2, S13
    FCVT            H3, S12
  }
  v28[0] = _H0;
  v28[1] = _H1;
  v28[2] = _H2;
  v28[3] = _H3;
  v28[4] = v14;
  __asm
  {
    FCVT            H0, S11
    FCVT            H1, S10
    FCVT            H2, S9
    FCVT            H3, S8
  }
  v27[0] = _H0;
  v27[1] = _H1;
  v27[2] = _H2;
  v27[3] = _H3;
  v27[4] = v14;
  RB::DisplayList::Transform::add_color_from_to(self->_transform._terms._p, (const RB::Fill::Color *)v28, (const RB::Fill::Color *)v27);
}

+ (id)transform
{
  v2 = objc_opt_new();
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = v4;
  p_transform = (const RB::DisplayList::Transform::Term *)&self->_transform;
  v7 = (char *)(v4 + 8);
  if (*(void *)(v4 + 40)) {
    v8 = *(RB::DisplayList::Transform::Term **)(v4 + 40);
  }
  else {
    v8 = (RB::DisplayList::Transform::Term *)(v4 + 8);
  }
  uint64_t v9 = *(unsigned int *)(v5 + 48);
  if (v9)
  {
    uint64_t v10 = 32 * v9;
    do
    {
      RB::DisplayList::Transform::Term::~Term(v8);
      v8 = (RB::DisplayList::Transform::Term *)(v11 + 32);
      v10 -= 32;
    }
    while (v10);
  }
  *(_DWORD *)(v5 + 48) = 0;
  if (self->_transform._terms._p_2) {
    p_transform = (const RB::DisplayList::Transform::Term *)self->_transform._terms._p_2;
  }
  unsigned int size = self->_transform._terms._size;
  if (*(_DWORD *)(v5 + 52) < size)
  {
    RB::vector<RB::DisplayList::Transform::Term,1ul,unsigned int>::reserve_slow(v7, size);
    uint64_t v13 = *(unsigned int *)(v5 + 48);
  }
  else
  {
    if (!size)
    {
      int v18 = 0;
      goto LABEL_18;
    }
    uint64_t v13 = 0;
  }
  __int16 v14 = *(char **)(v5 + 40);
  if (!v14) {
    __int16 v14 = v7;
  }
  v15 = (RB::DisplayList::Transform::Term *)&v14[32 * v13];
  unsigned int v16 = size;
  do
  {
    uint64_t v17 = RB::DisplayList::Transform::Term::Term(v15, p_transform);
    p_transform = (const RB::DisplayList::Transform::Term *)((char *)p_transform + 32);
    v15 = (RB::DisplayList::Transform::Term *)(v17 + 32);
    --v16;
  }
  while (v16);
  int v18 = *(_DWORD *)(v5 + 48);
LABEL_18:
  *(_DWORD *)(v5 + 48) = v18 + size;
  return (id)v5;
}

- (void)addColorReplacementTo:(id)a3 colorSpace:(int)a4
{
  _S8 = a3.var3;
  _S9 = a3.var2;
  _S10 = a3.var1;
  _S11 = a3.var0;
  __int16 v9 = rb_color_space(a4);
  __asm
  {
    FCVT            H0, S11
    FCVT            H1, S10
    FCVT            H2, S9
  }
  v18[0] = _H0;
  v18[1] = _H1;
  __asm { FCVT            H0, S8 }
  v18[2] = _H2;
  v18[3] = _H0;
  v18[4] = v9;
  RB::DisplayList::Transform::add_color_to(self->_transform._terms._p, (const RB::Fill::Color *)v18);
}

- (void)addFontInterpolationTo:(CGFont *)a3 by:(float)a4 flags:(unsigned int)a5
{
}

- (void)applyToDisplayList:(id)a3
{
  uint64_t v4 = (RB::DisplayList::Contents *)objc_msgSend(a3, "_rb_contents");
  if (v4)
  {
    RB::DisplayList::Contents::apply_transform(v4, &self->_transform);
  }
}

- (id)applyingToDisplayList:(id)a3
{
  id v3 = [(RBDisplayListTransform *)self copyApplyingToDisplayList:a3];
  return v3;
}

@end
@interface RBDisplayListPredicate
+ (id)predicate;
- (BOOL)invertsResult;
- (id).cxx_construct;
- (id)copyFilteredDisplayList:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filteringDisplayList:(id)a3;
- (void)addCondition:(int)a3;
- (void)addConditionWithFillColor:(id)a3 colorSpace:(int)a4;
- (void)addPredicate:(id)a3;
- (void)removeAll;
- (void)setInvertsResult:(BOOL)a3;
@end

@implementation RBDisplayListPredicate

- (void)removeAll
{
}

- (void)setInvertsResult:(BOOL)a3
{
  self->_predicate.inverts_result = a3;
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0x100000000;
  *((unsigned char *)self + 48) = 0;
  return self;
}

- (id)copyFilteredDisplayList:(id)a3
{
  v19[37] = *(RB::DisplayList::Layer ***)MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(a3, "_rb_contents");
  if (v5)
  {
    v6 = (const RB::DisplayList::Contents *)v5;
    RB::DisplayList::Builder::Builder((RB::DisplayList::Builder *)v19);
    RB::DisplayList::Builder::draw(v19, v6, (RB::DisplayList::State *)v19[33], 1.0, (const RB::DisplayList::InvertiblePredicate *)&self->_predicate, 0);
    if (v19[1][40])
    {
      v18 = 0;
      if (objc_msgSend(a3, "_rb_xml_document")) {
        operator new();
      }
      v7 = [RBMovedDisplayListContents alloc];
      RB::DisplayList::Builder::move_contents((RB::DisplayList::Builder *)v19, v8, &v17);
      v9 = v18;
      v18 = 0;
      v16 = v9;
      v10 = -[RBMovedDisplayListContents initWithContents:xmlDocument:](v7, &v17, (uint64_t *)&v16);
      uint64_t v11 = (uint64_t)v16;
      v16 = 0;
      if (v11) {
        std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v16, v11);
      }
      uint64_t v12 = v17;
      if (v17 && atomic_fetch_add_explicit((atomic_uint *volatile)(v17 + 8), 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
      }
      v13 = v18;
      v18 = 0;
      if (v13) {
        std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v18, (uint64_t)v13);
      }
    }
    else
    {
      v10 = (id)+[RBEmptyDisplayListContents shared]();
    }
    RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)v19);
    return v10;
  }
  else
  {
    v14 = (void *)+[RBEmptyDisplayListContents shared]();
    return v14;
  }
}

- (void)addConditionWithFillColor:(id)a3 colorSpace:(int)a4
{
  p_predicate = &self->_predicate;
  __asm
  {
    FCVT            H8, S0
    FCVT            H9, S1
    FCVT            H10, S2
    FCVT            H11, S3
  }
  v13[0] = _H8;
  v13[1] = _H9;
  v13[2] = _H10;
  v13[3] = _H11;
  v13[4] = rb_color_space(a4);
  RB::DisplayList::Predicate::add_color(p_predicate, (const RB::Fill::Color *)v13);
}

- (void).cxx_destruct
{
  p_2 = self->_predicate.predicate._terms._p_2;
  if (p_2) {
    p_predicate = (RB::DisplayList::Predicate::Term *)self->_predicate.predicate._terms._p_2;
  }
  else {
    p_predicate = (RB::DisplayList::Predicate::Term *)&self->_predicate;
  }
  if (self->_predicate.predicate._terms._size)
  {
    unint64_t v5 = 0;
    do
    {
      RB::DisplayList::Predicate::Term::~Term(p_predicate);
      ++v5;
      p_predicate = (RB::DisplayList::Predicate::Term *)(v6 + 24);
    }
    while (v5 < self->_predicate.predicate._terms._size);
    p_2 = self->_predicate.predicate._terms._p_2;
  }
  if (p_2)
  {
    free(p_2);
  }
}

+ (id)predicate
{
  v2 = objc_opt_new();
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  RB::DisplayList::Predicate::add_predicate((RB::DisplayList::Predicate *)(v4 + 8), (const RB::DisplayList::Predicate *)&self->_predicate);
}

- (void)addCondition:(int)a3
{
}

- (void)addPredicate:(id)a3
{
}

- (BOOL)invertsResult
{
  return self->_predicate.inverts_result;
}

- (id)filteringDisplayList:(id)a3
{
  id v3 = [(RBDisplayListPredicate *)self copyFilteredDisplayList:a3];
  return v3;
}

@end
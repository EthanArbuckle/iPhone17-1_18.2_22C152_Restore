@interface PFAIGlossaryDefinitions
+ (void)delegateMap;
+ (void)initialize;
- (BOOL)mapStartElementWithState:(id)a3;
- (id)delegate;
- (void)dealloc;
@end

@implementation PFAIGlossaryDefinitions

+ (void)delegateMap
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_573768, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_573768))
  {
    qword_573760 = 0;
    qword_573758 = 0;
    qword_573750 = (uint64_t)&qword_573758;
    __cxa_guard_release(&qword_573768);
  }
  return &qword_573750;
}

+ (void)initialize
{
  v2 = objc_opt_class();
  if (v2)
  {
    v3 = (uint64_t **)[v2 delegateMap];
    uint64_t v4 = objc_opt_class();
    v8 = PFXCommonApubGlossaryTerm;
    sub_1EB8AC(v3, (const xmlChar **)PFXCommonApubGlossaryTerm, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = v4;
    uint64_t v5 = objc_opt_class();
    v8 = PFXCommonApubGlossaryDefinition;
    sub_1EB8AC(v3, (const xmlChar **)PFXCommonApubGlossaryDefinition, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = v5;
    uint64_t v6 = objc_opt_class();
    v8 = PFXCommonApubGlossaryRelated;
    sub_1EB8AC(v3, (const xmlChar **)PFXCommonApubGlossaryRelated, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = v6;
    uint64_t v7 = objc_opt_class();
    v8 = &PFXCommonApubGlossaryIndex;
    sub_1EB8AC(v3, (const xmlChar **)&PFXCommonApubGlossaryIndex, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = v7;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIGlossaryDefinitions;
  [(PFAIGlossaryDefinitions *)&v3 dealloc];
}

- (id)delegate
{
  return self->mDelegate;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentXmlStackEntry];
  v10 = (const xmlChar *)[v5 xmlValueForAttribute:glossaryAttribute];
  if (v10)
  {
    uint64_t v6 = (char *)[(id)objc_opt_class() delegateMap];
    uint64_t v7 = sub_1EE660((uint64_t)v6, &v10);
    if (v6 + 8 != (char *)v7) {
      self->mDelegate = (PFXElementReader *)objc_alloc_init(*(Class *)(v7 + 40));
    }
  }
  mDelegate = (PFXStopReadingReader *)self->mDelegate;
  if (!mDelegate)
  {
    mDelegate = objc_alloc_init(PFXStopReadingReader);
    self->mDelegate = (PFXElementReader *)mDelegate;
  }
  return [(PFXStopReadingReader *)mDelegate mapStartElementWithState:a3];
}

@end
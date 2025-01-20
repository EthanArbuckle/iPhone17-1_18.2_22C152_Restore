@interface RETaggedFeatureValueCountedSet
- (BOOL)containsFeatureValue:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (RETaggedFeatureValueCountedSet)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)countForFeatureValue:(unint64_t)a3;
- (unint64_t)hash;
- (void)addFeatureValue:(unint64_t)a3;
- (void)dealloc;
- (void)enumerateFeatureValuesUsingBlock:(id)a3;
- (void)removeFeatureValue:(unint64_t)a3;
@end

@implementation RETaggedFeatureValueCountedSet

- (RETaggedFeatureValueCountedSet)init
{
  v4.receiver = self;
  v4.super_class = (Class)RETaggedFeatureValueCountedSet;
  v2 = [(RETaggedFeatureValueCountedSet *)&v4 init];
  if (v2) {
    v2->_bag = CFBagCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &kTaggedFeatureValueCallbacks_0);
  }
  return v2;
}

- (void)dealloc
{
  CFRelease(self->_bag);
  v3.receiver = self;
  v3.super_class = (Class)RETaggedFeatureValueCountedSet;
  [(RETaggedFeatureValueCountedSet *)&v3 dealloc];
}

- (unint64_t)hash
{
  return CFHash(self->_bag);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (RETaggedFeatureValueCountedSet *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && CFEqual(self->_bag, v4->_bag) != 0;
  }

  return v5;
}

- (unint64_t)count
{
}

- (unint64_t)countForFeatureValue:(unint64_t)a3
{
}

- (BOOL)containsFeatureValue:(unint64_t)a3
{
  return CFBagContainsValue(self->_bag, (const void *)a3) != 0;
}

- (void)addFeatureValue:(unint64_t)a3
{
}

- (void)removeFeatureValue:(unint64_t)a3
{
}

- (void)enumerateFeatureValuesUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = objc_alloc_init(RETaggedFeatureValueCountedSet);
    uint64_t v11 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__RETaggedFeatureValueCountedSet_enumerateFeatureValuesUsingBlock___block_invoke;
    v7[3] = &unk_2644BED88;
    v6 = v5;
    v8 = v6;
    id v9 = v4;
    id context = (id)MEMORY[0x223C31700](v7);
    LOBYTE(v11) = 0;
    CFBagApplyFunction(self->_bag, (CFBagApplierFunction)kTaggedFeatureCFApplier, &context);
  }
}

uint64_t __67__RETaggedFeatureValueCountedSet_enumerateFeatureValuesUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsFeatureValue:a2];
  if ((result & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    BOOL v5 = *(void **)(a1 + 32);
    return [v5 addFeatureValue:a2];
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (CFTypeRef *)objc_opt_new();
  CFRelease(v4[1]);
  v4[1] = CFBagCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, self->_bag);
  return v4;
}

@end
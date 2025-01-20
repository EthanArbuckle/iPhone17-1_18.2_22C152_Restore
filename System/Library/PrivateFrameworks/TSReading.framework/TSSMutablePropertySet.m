@interface TSSMutablePropertySet
- (TSSMutablePropertySet)init;
- (TSSMutablePropertySet)initWithFirstProperty:(int)a3 argumentList:(char *)a4;
- (TSSMutablePropertySet)initWithPropertySet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addProperties:(id)a3;
- (void)addProperty:(int)a3;
- (void)intersectPropertySet:(id)a3;
- (void)removeProperties:(id)a3;
- (void)removeProperty:(int)a3;
@end

@implementation TSSMutablePropertySet

- (void)addProperty:(int)a3
{
}

- (TSSMutablePropertySet)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSSMutablePropertySet;
  return -[TSSPropertySet initWithIndexSet:](&v3, sel_initWithIndexSet_, [MEMORY[0x263F089C8] indexSet]);
}

- (TSSMutablePropertySet)initWithFirstProperty:(int)a3 argumentList:(char *)a4
{
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "p_mutableIndexSetWithFirstProperty:argumentList:", *(void *)&a3, a4);

  return [(TSSPropertySet *)self initWithIndexSet:v5];
}

- (TSSMutablePropertySet)initWithPropertySet:(id)a3
{
  id v4 = (id)[*((id *)a3 + 1) mutableCopy];

  return [(TSSPropertySet *)self initWithIndexSet:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [TSSPropertySet alloc];
  id v5 = (id)[self->super.mIndexSet copy];

  return [(TSSPropertySet *)v4 initWithIndexSet:v5];
}

- (void)addProperties:(id)a3
{
  if (a3) {
    [self->super.mIndexSet addIndexes:*((void *)a3 + 1)];
  }
}

- (void)removeProperty:(int)a3
{
}

- (void)removeProperties:(id)a3
{
  if (a3) {
    [self->super.mIndexSet removeIndexes:*((void *)a3 + 1)];
  }
}

- (void)intersectPropertySet:(id)a3
{
  id v5 = (id)[(TSSMutablePropertySet *)self mutableCopy];
  [v5 removeProperties:a3];
  [(TSSMutablePropertySet *)self removeProperties:v5];
}

@end
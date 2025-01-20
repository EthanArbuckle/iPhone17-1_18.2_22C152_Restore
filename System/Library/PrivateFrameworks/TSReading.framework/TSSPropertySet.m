@interface TSSPropertySet
+ (id)p_mutableIndexSetWithFirstProperty:(int)a3 argumentList:(char *)a4;
+ (id)propertySet;
+ (id)propertySetWithProperties:(int)a3;
+ (id)propertySetWithProperty:(int)a3;
- (BOOL)containsProperties:(id)a3;
- (BOOL)containsProperty:(int)a3;
- (BOOL)intersectsProperties:(id)a3;
- (BOOL)isEqual:(id)a3;
- (TSSPropertySet)init;
- (TSSPropertySet)initWithFirstProperty:(int)a3 argumentList:(char *)a4;
- (TSSPropertySet)initWithIndexSet:(id)a3;
- (TSSPropertySet)initWithProperties:(int)a3;
- (TSSPropertySet)initWithPropertySet:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)propertySetByAddingProperties:(int)a3;
- (id)propertySetByAddingPropertiesFromSet:(id)a3;
- (id)propertySetByAddingProperty:(int)a3;
- (id)propertySetByIntersectingWithPropertySet:(id)a3;
- (id)propertySetByRemovingProperties:(int)a3;
- (id)propertySetByRemovingPropertiesFromSet:(id)a3;
- (id)propertySetByRemovingProperty:(int)a3;
- (id)propertyStrings;
- (unint64_t)count;
- (unint64_t)hash;
- (void)dealloc;
- (void)enumeratePropertiesUsingBlock:(id)a3;
@end

@implementation TSSPropertySet

uint64_t __48__TSSPropertySet_enumeratePropertiesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)propertySetByAddingPropertiesFromSet:(id)a3
{
  id v4 = (id)[self->mIndexSet mutableCopy];
  [v4 addIndexes:*((void *)a3 + 1)];
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIndexSet:v4];

  return v5;
}

- (BOOL)containsProperties:(id)a3
{
  if (a3 && *((void *)a3 + 1)) {
    return objc_msgSend(self->mIndexSet, "containsIndexes:");
  }
  else {
    return 1;
  }
}

- (TSSPropertySet)initWithProperties:(int)a3
{
  return [(TSSPropertySet *)self initWithFirstProperty:*(void *)&a3 argumentList:&v4];
}

- (TSSPropertySet)initWithFirstProperty:(int)a3 argumentList:(char *)a4
{
  id v5 = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "p_mutableIndexSetWithFirstProperty:argumentList:", *(void *)&a3, a4), "copy");

  return [(TSSPropertySet *)self initWithIndexSet:v5];
}

+ (id)p_mutableIndexSetWithFirstProperty:(int)a3 argumentList:(char *)a4
{
  if (!a3) {
    goto LABEL_6;
  }
  for (i = (void *)[objc_alloc(MEMORY[0x263F089C8]) initWithIndex:a3]; ; objc_msgSend(i, "addIndex:", v6))
  {
    id v5 = a4;
    a4 += 8;
    int v6 = *(_DWORD *)v5;
    if (!v6) {
      break;
    }
  }
  if (!i) {
LABEL_6:
  }
    i = objc_opt_new();
  return i;
}

+ (id)propertySet
{
  objc_opt_class();
  v2 = objc_opt_new();

  return v2;
}

- (TSSPropertySet)initWithIndexSet:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSSPropertySet;
  uint64_t v4 = [(TSSPropertySet *)&v6 init];
  if (v4) {
    v4->mIndexSet = a3;
  }
  return v4;
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  id mIndexSet = self->mIndexSet;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__TSSPropertySet_enumeratePropertiesUsingBlock___block_invoke;
  v4[3] = &unk_2646B1218;
  v4[4] = a3;
  [mIndexSet enumerateIndexesUsingBlock:v4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSSPropertySet;
  [(TSSPropertySet *)&v3 dealloc];
}

- (TSSPropertySet)init
{
  uint64_t v3 = [MEMORY[0x263F088D0] indexSet];

  return [(TSSPropertySet *)self initWithIndexSet:v3];
}

- (TSSPropertySet)initWithPropertySet:(id)a3
{
  id v4 = (id)[*((id *)a3 + 1) copy];

  return [(TSSPropertySet *)self initWithIndexSet:v4];
}

+ (id)propertySetWithProperty:(int)a3
{
  return (id)objc_msgSend(a1, "propertySetWithProperties:", *(void *)&a3, 0);
}

+ (id)propertySetWithProperties:(int)a3
{
  return (id)[objc_alloc((Class)a1) initWithFirstProperty:*(void *)&a3 argumentList:&v4];
}

- (unint64_t)count
{
  return [self->mIndexSet count];
}

- (BOOL)containsProperty:(int)a3
{
  return [self->mIndexSet containsIndex:a3];
}

- (BOOL)intersectsProperties:(id)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (a3 && [a3 count])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__TSSPropertySet_intersectsProperties___block_invoke;
    v7[3] = &unk_2646B0EB8;
    v7[4] = a3;
    v7[5] = &v8;
    [(TSSPropertySet *)self enumeratePropertiesUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __39__TSSPropertySet_intersectsProperties___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsProperty:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (id)propertySetByAddingProperties:(int)a3
{
  uint64_t v4 = objc_msgSend((id)objc_opt_class(), "p_mutableIndexSetWithFirstProperty:argumentList:", *(void *)&a3, &v6);
  [v4 addIndexes:self->mIndexSet];
  return (id)[objc_alloc((Class)objc_opt_class()) initWithIndexSet:v4];
}

- (id)propertySetByAddingProperty:(int)a3
{
  id v4 = (id)[self->mIndexSet mutableCopy];
  [v4 addIndex:a3];
  char v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIndexSet:v4];

  return v5;
}

- (id)propertySetByRemovingProperty:(int)a3
{
  id v4 = (id)[self->mIndexSet mutableCopy];
  [v4 removeIndex:a3];
  char v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIndexSet:v4];

  return v5;
}

- (id)propertySetByRemovingProperties:(int)a3
{
  uint64_t v4 = objc_msgSend((id)objc_opt_class(), "p_mutableIndexSetWithFirstProperty:argumentList:", *(void *)&a3, &v7);
  id v5 = (id)[self->mIndexSet mutableCopy];
  [v5 removeIndexes:v4];
  return (id)[objc_alloc((Class)objc_opt_class()) initWithIndexSet:v5];
}

- (id)propertySetByRemovingPropertiesFromSet:(id)a3
{
  id v4 = (id)[self->mIndexSet mutableCopy];
  [v4 removeIndexes:*((void *)a3 + 1)];
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIndexSet:v4];

  return v5;
}

- (id)propertySetByIntersectingWithPropertySet:(id)a3
{
  unint64_t v5 = [(TSSPropertySet *)self count];
  if (v5 >= [a3 count]) {
    p_isa = a3;
  }
  else {
    p_isa = &self->super.isa;
  }
  uint64_t v7 = (void *)p_isa[1];
  unint64_t v8 = [(TSSPropertySet *)self count];
  if (v8 >= [a3 count]) {
    v9 = &self->super.isa;
  }
  else {
    v9 = a3;
  }
  uint64_t v10 = v9[1];
  uint64_t v11 = [MEMORY[0x263F089C8] indexSet];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__TSSPropertySet_propertySetByIntersectingWithPropertySet___block_invoke;
  v13[3] = &unk_2646B1240;
  v13[4] = v10;
  v13[5] = v11;
  [v7 enumerateIndexesUsingBlock:v13];
  return (id)[objc_alloc((Class)objc_opt_class()) initWithIndexSet:v11];
}

uint64_t __59__TSSPropertySet_propertySetByIntersectingWithPropertySet___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  if (result)
  {
    unint64_t v5 = *(void **)(a1 + 40);
    return [v5 addIndex:a2];
  }
  return result;
}

- (id)propertyStrings
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", -[TSSPropertySet count](self, "count"));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__TSSPropertySet_propertyStrings__block_invoke;
  v5[3] = &unk_2646B0F30;
  v5[4] = v3;
  [(TSSPropertySet *)self enumeratePropertiesUsingBlock:v5];
  return v3;
}

uint64_t __33__TSSPropertySet_propertyStrings__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = String(a2);

  return [v2 addObject:v3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [TSSMutablePropertySet alloc];

  return [(TSSMutablePropertySet *)v4 initWithPropertySet:self];
}

- (unint64_t)hash
{
  return [self->mIndexSet hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id mIndexSet = self->mIndexSet;
  uint64_t v6 = *((void *)a3 + 1);

  return [mIndexSet isEqual:v6];
}

@end
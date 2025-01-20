@interface TSSPropertyMap
+ (id)propertyMap;
+ (id)propertyMapWithPropertiesAndValues:(int)a3;
+ (id)propertyMapWithPropertyMap:(id)a3;
- (BOOL)containsAnyPropertyInProperties:(id)a3;
- (BOOL)containsProperty:(int)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (TSSPropertyMap)init;
- (TSSPropertyMap)initWithFirstKey:(int)a3 andArgumentList:(char *)a4;
- (TSSPropertyMap)initWithPropertiesAndValues:(int)a3;
- (TSSPropertyMap)initWithPropertyMap:(id)a3;
- (TSSPropertyMap)propertyMapWithProperties:(id)a3;
- (double)CGFloatValueForProperty:(int)a3;
- (double)doubleValueForProperty:(int)a3;
- (float)floatValueForProperty:(int)a3;
- (id)allKeys;
- (id)allProperties;
- (id)boxedObjectForProperty:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)diff:(id)a3;
- (id)diffOnlyDifferences:(id)a3;
- (id)diffPropertyNames:(id)a3;
- (id)objectForProperty:(int)a3;
- (id)old_description;
- (id)propertyMapByAddingValuesFromPropertyMap:(id)a3;
- (id)propertyMapByRemovingValuesForProperties:(id)a3;
- (id)propertyMapByRemovingValuesFromPropertyMap:(id)a3;
- (int)intValueForProperty:(int)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addValuesFromPropertyMap:(id)a3;
- (void)dealloc;
- (void)enumeratePropertiesAndObjectsUsingBlock:(id)a3;
- (void)filterWithProperties:(id)a3;
- (void)minusPropertyMap:(id)a3;
- (void)pSetArrayOfFloats:(double)a3[9] forProperty:(int)a4;
- (void)pSetArrayOfObjects:(id)a3[9] forProperty:(int)a4;
- (void)p_getAllKeys:(int *)a3;
- (void)removeAllPropertyValues;
- (void)removeValueForProperty:(int)a3;
- (void)removeValuesForProperties:(id)a3;
- (void)removeValuesFromPropertyMap:(id)a3;
- (void)setBoolValue:(BOOL)a3 forProperty:(int)a4;
- (void)setBoxedObject:(id)a3 forProperty:(int)a4;
- (void)setCGFloatValue:(double)a3 forProperty:(int)a4;
- (void)setDoubleValue:(double)a3 forProperty:(int)a4;
- (void)setFloatValue:(float)a3 forProperty:(int)a4;
- (void)setIntValue:(int)a3 forProperty:(int)a4;
- (void)setObject:(id)a3 forProperty:(int)a4;
@end

@implementation TSSPropertyMap

- (void)setBoxedObject:(id)a3 forProperty:(int)a4
{
}

- (void)setIntValue:(int)a3 forProperty:(int)a4
{
}

- (void)setBoolValue:(BOOL)a3 forProperty:(int)a4
{
}

- (int)intValueForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (float)floatValueForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (id)objectForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (void)setFloatValue:(float)a3 forProperty:(int)a4
{
}

- (id)boxedObjectForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (BOOL)containsProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    v6 = *(unint64_t **)(v4 + 8);
    mStore = (unint64_t *)self->mStore;
    LOBYTE(v4) = String(mStore, v6, v5);
  }
  return v4;
}

- (void)dealloc
{
  String(self->mStore);
  v3.receiver = self;
  v3.super_class = (Class)TSSPropertyMap;
  [(TSSPropertyMap *)&v3 dealloc];
}

- (unint64_t)count
{
  return String((uint64_t)self->mStore);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  if (v4)
  {
    v4[1] = String((uint64_t)self->mStore);
    if (!self->mStore)
    {

      return 0;
    }
  }
  return v4;
}

- (void)removeValuesFromPropertyMap:(id)a3
{
  if (a3) {
    String((unint64_t *)self->mStore, *((uint64_t **)a3 + 1), v3);
  }
}

uint64_t __59__TSSPropertyMap_propertyMapByRemovingValuesForProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeValueForProperty:a2];
}

- (void)removeValueForProperty:(int)a3
{
}

- (void)setObject:(id)a3 forProperty:(int)a4
{
}

- (TSSPropertyMap)initWithPropertyMap:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSSPropertyMap;
  uint64_t v4 = [(TSSPropertyMap *)&v7 init];
  if (v4)
  {
    if (a3)
    {
      double v5 = String(*((void *)a3 + 1));
      v4->mStore = (TSSPropertyStore *)v5;
      if (!v5)
      {

        return 0;
      }
    }
    else
    {
      v4->mStore = (TSSPropertyStore *)String();
    }
  }
  return v4;
}

- (id)allProperties
{
  v10[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = String((uint64_t)self->mStore);
  uint64_t v4 = (char *)v10 - ((4 * v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = +[TSSPropertySet propertySet];
  String(self->mStore, (uint64_t)v4);
  if (v3)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      [v5 addProperty:*(unsigned int *)&v4[4 * v6]];
      uint64_t v6 = v7;
    }
    while (v3 > v7++);
  }
  return v5;
}

- (TSSPropertyMap)initWithPropertiesAndValues:(int)a3
{
  return [(TSSPropertyMap *)self initWithFirstKey:*(void *)&a3 andArgumentList:&v4];
}

+ (id)propertyMapWithPropertiesAndValues:(int)a3
{
  return (id)[objc_alloc((Class)a1) initWithFirstKey:*(void *)&a3 andArgumentList:&v4];
}

- (TSSPropertyMap)initWithFirstKey:(int)a3 andArgumentList:(char *)a4
{
  uint64_t v5 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)TSSPropertyMap;
  uint64_t v6 = [(TSSPropertyMap *)&v9 init];
  if (v6)
  {
    PropertyAndArgumentList = (TSSPropertyStore *)i_TSSPropertyStoreCreateWithFirstPropertyAndArgumentList(v5, (void **)a4);
    v6->mStore = PropertyAndArgumentList;
    if (!PropertyAndArgumentList)
    {

      return 0;
    }
  }
  return v6;
}

+ (id)propertyMap
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (TSSPropertyMap)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSSPropertyMap;
  id v2 = [(TSSPropertyMap *)&v4 init];
  if (v2) {
    v2->mStore = (TSSPropertyStore *)String();
  }
  return v2;
}

- (id)propertyMapByRemovingValuesForProperties:(id)a3
{
  id v4 = (id)[(TSSPropertyMap *)self copy];
  uint64_t v5 = v4;
  if (a3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__TSSPropertyMap_propertyMapByRemovingValuesForProperties___block_invoke;
    v7[3] = &unk_2646B0F30;
    v7[4] = v4;
    [a3 enumeratePropertiesUsingBlock:v7];
  }
  return v5;
}

+ (id)propertyMapWithPropertyMap:(id)a3
{
  unint64_t v3 = (void *)[a3 copy];

  return v3;
}

- (unint64_t)hash
{
  return (unint64_t)String(self->mStore);
}

- (id)allKeys
{
  v9[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = String((uint64_t)self->mStore);
  id v4 = (char *)v9 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  String(self->mStore, (uint64_t)v9);
  if (v3)
  {
    uint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      *(void *)&v4[8 * v5] = [NSNumber numberWithInt:*(unsigned int *)((char *)v9 + 4 * v5 - ((4 * v3 + 15) & 0xFFFFFFFFFFFFFFF0))];
      uint64_t v5 = v6;
    }
    while (v3 > v6++);
  }
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:v3];
}

- (void)p_getAllKeys:(int *)a3
{
}

- (id)old_description
{
  if (!self) {
    return &stru_26D688A48;
  }
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  return (id)[v3 stringWithFormat:@"(%@*)%p {\n%@\n}", v5, self, objc_msgSend(NSString, "tsu_stringByIndentingString:", String((uint64_t *)self->mStore))];
}

- (void)enumeratePropertiesAndObjectsUsingBlock:(id)a3
{
  id v5 = [(TSSPropertyMap *)self allProperties];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__TSSPropertyMap_enumeratePropertiesAndObjectsUsingBlock___block_invoke;
  v6[3] = &unk_2646B0E68;
  v6[4] = self;
  v6[5] = a3;
  [v5 enumeratePropertiesUsingBlock:v6];
}

uint64_t __58__TSSPropertyMap_enumeratePropertiesAndObjectsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = String(a2);
  uint64_t v8 = [*(id *)(a1 + 32) boxedObjectForProperty:a2];
  objc_super v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16);

  return v9(v6, a2, v7, v8, a3);
}

- (NSString)description
{
  if (!self) {
    return (NSString *)&stru_26D688A48;
  }
  unint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__TSSPropertyMap_description__block_invoke;
  v5[3] = &unk_2646B0E90;
  v5[4] = v3;
  [(TSSPropertyMap *)self enumeratePropertiesAndObjectsUsingBlock:v5];
  [v3 sortUsingComparator:&__block_literal_global_19];
  return (NSString *)objc_msgSend((id)objc_msgSend(v3, "componentsJoinedByString:", @"$"), "tsu_stringByExpandingTableFormatting");
}

uint64_t __29__TSSPropertyMap_description__block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = NSString;
  uint64_t v8 = String(a2);
  objc_super v9 = p_summaryFromPropertyValue(0, a4);
  v10 = @"int";
  switch(a3)
  {
    case 0:
      v10 = (__CFString *)TSUObjectReferenceDescription();
      break;
    case 1:
      break;
    case 2:
      v10 = @"float";
      break;
    case 3:
      v10 = @"double";
      break;
    default:
      v10 = &stru_26D688A48;
      break;
  }
  uint64_t v11 = [v7 stringWithFormat:@"%@|%@|%@", v8, v9, v10];

  return [v6 addObject:v11];
}

uint64_t __29__TSSPropertyMap_description__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (double)doubleValueForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (double)CGFloatValueForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (void)setDoubleValue:(double)a3 forProperty:(int)a4
{
}

- (void)setCGFloatValue:(double)a3 forProperty:(int)a4
{
}

- (void)addValuesFromPropertyMap:(id)a3
{
  if (a3) {
    String((uint64_t *)self->mStore, *((int64_t **)a3 + 1));
  }
}

- (BOOL)containsAnyPropertyInProperties:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__TSSPropertyMap_containsAnyPropertyInProperties___block_invoke;
  v5[3] = &unk_2646B0EB8;
  v5[4] = self;
  void v5[5] = &v6;
  [a3 enumeratePropertiesUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

BOOL __50__TSSPropertyMap_containsAnyPropertyInProperties___block_invoke(uint64_t a1, unsigned __int16 a2, unsigned char *a3)
{
  BOOL result = String(*(size_t **)(*(void *)(a1 + 32) + 8), a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)removeValuesForProperties:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  size_t v5 = [a3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    if (v5 < 0x21)
    {
      uint64_t v7 = v10;
    }
    else
    {
      uint64_t v7 = malloc_type_calloc(v5, 4uLL, 0x100004052888210uLL);
      if (!v7) {
        return;
      }
    }
    v9[0] = 0;
    v9[1] = v9;
    void v9[2] = 0x2020000000;
    v9[3] = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__TSSPropertyMap_removeValuesForProperties___block_invoke;
    v8[3] = &unk_2646B0EE0;
    v8[4] = v9;
    v8[5] = v7;
    [a3 enumeratePropertiesUsingBlock:v8];
    String((unint64_t *)self->mStore, (uint64_t)v7, v6);
    if (v7 != v10) {
      free(v7);
    }
    _Block_object_dispose(v9, 8);
  }
}

uint64_t __44__TSSPropertyMap_removeValuesForProperties___block_invoke(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 40);
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *(_DWORD *)(v2 + 4 * v4) = a2;
  return result;
}

- (void)removeAllPropertyValues
{
}

- (void)filterWithProperties:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F086B0]);
  id v6 = [(TSSPropertyMap *)self allProperties];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__TSSPropertyMap_filterWithProperties___block_invoke;
  v7[3] = &unk_2646B0F08;
  v7[4] = a3;
  void v7[5] = self;
  [v6 enumeratePropertiesUsingBlock:v7];
}

void __39__TSSPropertyMap_filterWithProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  if (([*(id *)(a1 + 32) containsProperty:a2] & 1) == 0)
  {
    uint64_t v4 = *(unint64_t **)(*(void *)(a1 + 40) + 8);
    String(v4, v2);
  }
}

- (void)minusPropertyMap:(id)a3
{
  if (a3) {
    String((unint64_t *)self->mStore, *((uint64_t **)a3 + 1), v3);
  }
}

- (id)diff:(id)a3
{
  id v5 = NSString;
  uint64_t v6 = TSUObjectReferenceDescription();
  uint64_t v7 = TSUObjectReferenceDescription();
  return (id)[v5 stringWithFormat:@"\nDiff %@ vs. %@:\n%@\n", v6, v7, String(self->mStore, *((void **)a3 + 1), 1)];
}

- (id)diffOnlyDifferences:(id)a3
{
  id v5 = NSString;
  uint64_t v6 = TSUObjectReferenceDescription();
  uint64_t v7 = TSUObjectReferenceDescription();
  return (id)[v5 stringWithFormat:@"\nDiff %@ vs. %@:\n%@\n", v6, v7, String(self->mStore, *((void **)a3 + 1), 0)];
}

- (id)diffPropertyNames:(id)a3
{
  return (id)String(self->mStore, *((void **)a3 + 1));
}

- (id)propertyMapByAddingValuesFromPropertyMap:(id)a3
{
  id v4 = (id)[(TSSPropertyMap *)self copy];
  id v5 = v4;
  if (a3) {
    [v4 addValuesFromPropertyMap:a3];
  }
  return v5;
}

- (id)propertyMapByRemovingValuesFromPropertyMap:(id)a3
{
  id v4 = (id)[(TSSPropertyMap *)self copy];
  id v5 = v4;
  if (a3) {
    [v4 removeValuesFromPropertyMap:a3];
  }
  return v5;
}

- (TSSPropertyMap)propertyMapWithProperties:(id)a3
{
  id v4 = (TSSPropertyMap *)(id)[(TSSPropertyMap *)self copy];
  [(TSSPropertyMap *)v4 filterWithProperties:a3];
  return v4;
}

- (void)pSetArrayOfObjects:(id)a3[9] forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithObjects:a3 count:9];
  [(TSSPropertyMap *)self setObject:v6 forProperty:v4];
}

- (void)pSetArrayOfFloats:(double)a3[9] forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = 0;
  uint64_t v9 = *MEMORY[0x263EF8340];
  do
  {
    *(void *)&v8[v7 * 8] = [NSNumber numberWithDouble:a3[v7]];
    ++v7;
  }
  while (v7 != 9);
  [(TSSPropertyMap *)self pSetArrayOfObjects:v8 forProperty:v4];
}

@end
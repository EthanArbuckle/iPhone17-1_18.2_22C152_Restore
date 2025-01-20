@interface LWCRFact
+ (id)BOOLFact:(BOOL)a3;
+ (id)dataFact:(id)a3;
+ (id)entitlementsFact:(id)a3;
+ (id)integerFact:(id)a3;
+ (id)stringFact:(id)a3;
- (id).cxx_construct;
- (void)bindName:(id)a3;
- (void)dealloc;
@end

@implementation LWCRFact

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dataFactStorage, 0);

  objc_storeStrong((id *)&self->stringFactStorage, 0);
}

- (void)bindName:(id)a3
{
  id v4 = a3;
  self->fact.name.data = (char *)[v4 UTF8String];
  id v5 = v4;
  self->fact.name.length = strlen((const char *)[v5 UTF8String]);
}

- (void)dealloc
{
  if (self->fact.type == 1) {
    CEReleaseManagedContext();
  }
  v3.receiver = self;
  v3.super_class = (Class)LWCRFact;
  [(LWCRFact *)&v3 dealloc];
}

+ (id)dataFact:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(LWCRFact);
  v4->fact.type = 6;
  uint64_t v5 = [v3 copy];
  dataFactStorage = v4->dataFactStorage;
  v4->dataFactStorage = (NSData *)v5;

  v4->fact.value.integer = (int64_t)[(NSData *)v4->dataFactStorage bytes];
  v4->fact.value.string.length = [(NSData *)v4->dataFactStorage length];

  return v4;
}

+ (id)entitlementsFact:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(LWCRFact);
  v4->fact.type = 1;
  uint64_t v5 = CESerializeCFDictionary();
  v6 = (void *)MEMORY[0x263F8BAF0];
  if (v5 == *MEMORY[0x263F8BAF0]
    && (dataFactStorage = v4->dataFactStorage,
        v4->dataFactStorage = 0,
        dataFactStorage,
        CEManagedContextFromCFData() == *v6))
  {
    v8 = v4;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)stringFact:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(LWCRFact);
  v4->fact.type = 4;
  uint64_t v5 = [v3 copy];
  stringFactStorage = v4->stringFactStorage;
  v4->stringFactStorage = (NSString *)v5;

  v4->fact.value.integer = (int64_t)[(NSString *)v4->stringFactStorage UTF8String];
  v4->fact.value.string.length = strlen([(NSString *)v4->stringFactStorage UTF8String]);

  return v4;
}

+ (id)integerFact:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(LWCRFact);
  v4->fact.type = 3;
  v4->fact.value.integer = [v3 longLongValue];

  return v4;
}

+ (id)BOOLFact:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(LWCRFact);
  v4->fact.type = 5;
  v4->fact.value.integer = v3;

  return v4;
}

@end
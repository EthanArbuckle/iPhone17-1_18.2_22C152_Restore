@interface MFPObjectTable
- (MFPObjectTable)init;
- (id)objectAtIndex:(int)a3;
- (void)setObject:(id)a3 atIndex:(int)a4;
@end

@implementation MFPObjectTable

- (MFPObjectTable)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFPObjectTable;
  v2 = [(MFPObjectTable *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mObjects = v2->mObjects;
    v2->mObjects = v3;
  }
  return v2;
}

- (id)objectAtIndex:(int)a3
{
  v4 = (void *)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)self->mObjects objectForKey:v4];

  return v5;
}

- (void)setObject:(id)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  objc_super v6 = (void *)[objc_alloc(NSNumber) initWithInt:v4];
  [(NSMutableDictionary *)self->mObjects setObject:v7 forKey:v6];
}

- (void).cxx_destruct
{
}

@end
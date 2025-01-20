@interface ESDObjectFactory
+ (id)threadLocalFactory;
- (ESDObjectFactory)init;
- (EshObject)createObjectWithType:(unsigned __int16)a3;
- (EshObject)createObjectWithType:(unsigned __int16)a3 version:(unsigned __int16)a4;
- (void)dealloc;
- (void)replaceHostEshFactoryWith:(EshObjectFactory *)a3;
- (void)restoreHostEshFactory;
- (void)setEshFactory:(EshObjectFactory *)a3;
@end

@implementation ESDObjectFactory

+ (id)threadLocalFactory
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];

  v4 = [v3 objectForKey:@"ESDObjectFactory"];
  if (!v4)
  {
    v4 = objc_alloc_init(ESDObjectFactory);
    [v3 setObject:v4 forKey:@"ESDObjectFactory"];
  }

  return v4;
}

- (ESDObjectFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)ESDObjectFactory;
  v2 = [(ESDObjectFactory *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    eshObjectFactoryStack = v2->eshObjectFactoryStack;
    v2->eshObjectFactoryStack = v3;
  }
  return v2;
}

- (void)dealloc
{
  eshObjectFactory = self->eshObjectFactory;
  if (eshObjectFactory)
  {
    (*((void (**)(EshObjectFactory *, SEL))eshObjectFactory->var0 + 1))(eshObjectFactory, a2);
    self->eshObjectFactory = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ESDObjectFactory;
  [(ESDObjectFactory *)&v4 dealloc];
}

- (EshObject)createObjectWithType:(unsigned __int16)a3
{
  result = (EshObject *)self->eshObjectFactory;
  if (result)
  {
    if ((unsigned __int16)(a3 + 4096) >= 6u)
    {
      EshAtom::versionForAtomType((EshAtom *)a3);
      result = (EshObject *)self->eshObjectFactory;
    }
    v5 = (uint64_t (*)(void))*((void *)result->var0 + 2);
    return (EshObject *)v5();
  }
  return result;
}

- (EshObject)createObjectWithType:(unsigned __int16)a3 version:(unsigned __int16)a4
{
  return (EshObject *)(*((uint64_t (**)(EshObjectFactory *, void, void))self->eshObjectFactory->var0 + 2))(self->eshObjectFactory, a3, a4);
}

- (void)replaceHostEshFactoryWith:(EshObjectFactory *)a3
{
  eshObjectFactoryStack = self->eshObjectFactoryStack;
  objc_super v6 = [MEMORY[0x263F08D40] valueWithPointer:self->eshObjectFactory];
  [(NSMutableArray *)eshObjectFactoryStack addObject:v6];

  self->eshObjectFactory = a3;
}

- (void)restoreHostEshFactory
{
  v3 = [(NSMutableArray *)self->eshObjectFactoryStack lastObject];
  self->eshObjectFactory = (EshObjectFactory *)[v3 pointerValue];

  eshObjectFactoryStack = self->eshObjectFactoryStack;
  [(NSMutableArray *)eshObjectFactoryStack removeLastObject];
}

- (void)setEshFactory:(EshObjectFactory *)a3
{
  eshObjectFactory = self->eshObjectFactory;
  if (eshObjectFactory) {
    (*((void (**)(EshObjectFactory *, SEL))eshObjectFactory->var0 + 1))(eshObjectFactory, a2);
  }
  self->eshObjectFactory = a3;
}

- (void).cxx_destruct
{
}

@end
@interface XMLWrapperElementFactory
+ (Class)elementClassByTagName:(id)a3;
+ (id)sharedInstance;
+ (unint64_t)elementTypeByTagName:(id)a3;
+ (void)initialize;
+ (void)registerClass:(Class)a3 forElementName:(id)a4;
- (Class)classForXMLNode:(_xmlNode *)a3 error:(id *)a4;
@end

@implementation XMLWrapperElementFactory

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__XMLWrapperElementFactory_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_factory;
  return v2;
}

uint64_t __42__XMLWrapperElementFactory_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_factory = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v3 = (void *)sClassMap;
    sClassMap = (uint64_t)v2;

    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v5 = (void *)sTypeMap;
    sTypeMap = (uint64_t)v4;

    uint64_t v6 = objc_opt_class();
    +[XMLWrapperElementFactory registerClass:v6 forElementName:@"DefaultElementClass"];
  }
}

+ (void)registerClass:(Class)a3 forElementName:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    id v7 = v5;
    id v5 = (id)[v5 length];
    id v6 = v7;
    if (v5)
    {
      id v5 = (id)[(id)sClassMap setObject:a3 forKey:v7];
      id v6 = v7;
    }
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (Class)classForXMLNode:(_xmlNode *)a3 error:(id *)a4
{
  if (!a3->name
    || (id v5 = objc_opt_class(),
        [NSString stringWithUTF8String:a3->name],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = (void *)[v5 elementClassByTagName:v6],
        v6,
        !v7))
  {
    id v7 = (void *)[(id)objc_opt_class() elementClassByTagName:@"DefaultElementClass"];
  }
  return (Class)v7;
}

+ (Class)elementClassByTagName:(id)a3
{
  return (Class)[(id)sClassMap objectForKeyedSubscript:a3];
}

+ (unint64_t)elementTypeByTagName:(id)a3
{
  v3 = [(id)sTypeMap objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

@end
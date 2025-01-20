@interface WBObjectFactory
+ (WrdObject)create:(int)a3;
@end

@implementation WBObjectFactory

+ (WrdObject)create:(int)a3
{
  if (+[WBObjectFactory create:]::once != -1) {
    dispatch_once(&+[WBObjectFactory create:]::once, &__block_literal_global_78);
  }
  v3 = *(uint64_t (**)(void))(*(void *)s_objectFactory + 16);
  return (WrdObject *)v3();
}

void __26__WBObjectFactory_create___block_invoke()
{
  v0 = (WrdObjectFactory *)operator new(0x10uLL);
  WrdObjectFactory::WrdObjectFactory(v0);
  s_objectFactory = (uint64_t)v0;
}

@end
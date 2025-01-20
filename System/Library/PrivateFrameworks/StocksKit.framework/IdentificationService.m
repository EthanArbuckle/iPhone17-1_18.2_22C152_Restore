@interface IdentificationService
- (_TtC9StocksKit21IdentificationService)init;
@end

@implementation IdentificationService

- (_TtC9StocksKit21IdentificationService)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC9StocksKit21IdentificationService_lockedObservers;
  uint64_t v5 = MEMORY[0x263F8EE78];
  *(_DWORD *)v4 = 0;
  *((void *)v4 + 1) = v5;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(IdentificationService *)&v7 init];
}

- (void).cxx_destruct
{
}

@end
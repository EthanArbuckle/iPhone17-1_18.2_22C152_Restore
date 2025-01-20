@interface TetraDBManager
- (_TtC17MessageProtection14TetraDBManager)init;
- (void)cache:(id)a3 willEvictObject:(id)a4;
@end

@implementation TetraDBManager

- (_TtC17MessageProtection14TetraDBManager)init
{
  return (_TtC17MessageProtection14TetraDBManager *)TetraDBManager.().init()();
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  specialized TetraDBManager.cache(_:willEvictObject:)((uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17MessageProtection14TetraDBManager__persistentContainer));

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17MessageProtection14TetraDBManager____lazy_storage___persistentContainer);
}

@end
@interface BKSharedWithYouProvider
- (BSUIDynamicArray)dynamicArray;
- (_TtC5Books23BKSharedWithYouProvider)init;
- (void)refresh;
- (void)update:(id)a3;
@end

@implementation BKSharedWithYouProvider

- (_TtC5Books23BKSharedWithYouProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1007F3850();
  v3 = (void *)sub_1007F3830();
  id v4 = objc_allocWithZone(ObjectType);
  sub_10002B234(v3);
  v6 = v5;
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (BSUIDynamicArray)dynamicArray
{
  return (BSUIDynamicArray *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC5Books23BKSharedWithYouProvider_dynamicArray));
}

- (void)update:(id)a3
{
  id v4 = a3;
  v5 = self;
  BKSharedWithYouProvider.update(_:)();
}

- (void)refresh
{
  v2 = self;
  sub_1000186B8();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books23BKSharedWithYouProvider_dynamicArray);
}

@end
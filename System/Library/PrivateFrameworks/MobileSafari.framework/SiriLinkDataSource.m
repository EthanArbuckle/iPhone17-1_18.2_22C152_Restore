@interface SiriLinkDataSource
- (_TtC12MobileSafari18SiriLinkDataSource)init;
@end

@implementation SiriLinkDataSource

- (_TtC12MobileSafari18SiriLinkDataSource)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12MobileSafari18SiriLinkDataSource____lazy_storage___connection) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(SiriLinkDataSource *)&v5 init];
}

- (void).cxx_destruct
{
  sub_18C57B508((uint64_t)self + OBJC_IVAR____TtC12MobileSafari18SiriLinkDataSource_applicationProxy);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12MobileSafari18SiriLinkDataSource____lazy_storage___connection);
}

@end
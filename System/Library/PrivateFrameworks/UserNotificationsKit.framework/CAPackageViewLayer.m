@interface CAPackageViewLayer
- (_TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer)init;
- (_TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer)initWithCoder:(id)a3;
- (_TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation CAPackageViewLayer

- (void)layoutSublayers
{
  v2 = self;
  sub_2201489F4();
}

- (_TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_packageLayer) = 0;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_contentMode) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  return [(CAPackageViewLayer *)&v3 init];
}

- (_TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_2201826D0();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_packageLayer) = 0;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_contentMode) = 0;
  __swift_project_boxed_opaque_existential_0(v8, v8[3]);
  uint64_t v4 = sub_220182900();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  v5 = [(CAPackageViewLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

- (_TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_packageLayer) = 0;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_contentMode) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  return [(CAPackageViewLayer *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_packageLayer));
}

@end
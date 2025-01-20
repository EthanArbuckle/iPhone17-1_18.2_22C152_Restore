@interface _UICloudChamber
+ (Class)layerClass;
- (_TtC5UIKit15_UICloudChamber)initWithCoder:(id)a3;
- (_TtC5UIKit15_UICloudChamber)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation _UICloudChamber

+ (Class)layerClass
{
  sub_1853B985C(0, &qword_1E8FB2608);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC5UIKit15_UICloudChamber)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5UIKit15_UICloudChamber_emitterCell;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F39BA8]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (char *)self + OBJC_IVAR____TtC5UIKit15_UICloudChamber_appliedSpriteHash;
  *(void *)v8 = 0;
  v8[8] = 1;

  result = (_TtC5UIKit15_UICloudChamber *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1859D5AF4();
}

- (_TtC5UIKit15_UICloudChamber)initWithFrame:(CGRect)a3
{
  result = (_TtC5UIKit15_UICloudChamber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
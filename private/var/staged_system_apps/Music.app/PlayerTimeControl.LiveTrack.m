@interface PlayerTimeControl.LiveTrack
+ (Class)layerClass;
- (UIColor)backgroundColor;
- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack)initWithCoder:(id)a3;
- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack)initWithFrame:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation PlayerTimeControl.LiveTrack

+ (Class)layerClass
{
  sub_100057778(0, &qword_1010A2668);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack)initWithFrame:(CGRect)a3
{
  return (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack *)sub_1002CC318(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack_erasedPercentage) = (Class)0x3FD0000000000000;
  uint64_t v5 = OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack__backgroundColor;
  v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 systemFillColor];

  result = (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack__backgroundColor));
}

- (void)setBackgroundColor:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1002CD5F0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E9583189LiveTrack__backgroundColor));
}

@end
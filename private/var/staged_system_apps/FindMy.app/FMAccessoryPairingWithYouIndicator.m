@interface FMAccessoryPairingWithYouIndicator
- (_TtC6FindMy34FMAccessoryPairingWithYouIndicator)init;
- (_TtC6FindMy34FMAccessoryPairingWithYouIndicator)initWithCoder:(id)a3;
- (_TtC6FindMy34FMAccessoryPairingWithYouIndicator)initWithFrame:(CGRect)a3;
- (void)layoutSublayersOfLayer:(id)a3;
@end

@implementation FMAccessoryPairingWithYouIndicator

- (_TtC6FindMy34FMAccessoryPairingWithYouIndicator)init
{
  return (_TtC6FindMy34FMAccessoryPairingWithYouIndicator *)sub_100252D0C();
}

- (_TtC6FindMy34FMAccessoryPairingWithYouIndicator)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10025399C();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMAccessoryPairingWithYouIndicator();
  id v4 = a3;
  id v5 = v8.receiver;
  [(FMAccessoryPairingWithYouIndicator *)&v8 layoutSublayersOfLayer:v4];
  sub_100006060(0, (unint64_t *)&qword_1006B3E40);
  id v6 = [v5 layer];
  char v7 = static NSObject.== infix(_:_:)();

  if (v7) {
    sub_100253574();
  }
}

- (_TtC6FindMy34FMAccessoryPairingWithYouIndicator)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy34FMAccessoryPairingWithYouIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMAccessoryPairingWithYouIndicator_foregroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMAccessoryPairingWithYouIndicator_borderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMAccessoryPairingWithYouIndicator_backgroundLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy34FMAccessoryPairingWithYouIndicator_animationGroup);
}

@end
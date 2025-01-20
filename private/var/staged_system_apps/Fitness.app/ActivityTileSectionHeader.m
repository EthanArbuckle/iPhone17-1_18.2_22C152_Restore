@interface ActivityTileSectionHeader
+ (NSString)reuseIdentifier;
- (_TtC10FitnessApp25ActivityTileSectionHeader)initWithCoder:(id)a3;
- (_TtC10FitnessApp25ActivityTileSectionHeader)initWithReuseIdentifier:(id)a3;
- (void)configureWithTitle:(id)a3 subtitle:(id)a4 buttonAction:(id)a5 horizontalMargin:(double)a6;
- (void)didTapButton;
- (void)prepareForReuse;
@end

@implementation ActivityTileSectionHeader

- (_TtC10FitnessApp25ActivityTileSectionHeader)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC10FitnessApp25ActivityTileSectionHeader *)sub_10056F044(v3, v4);
}

- (void)configureWithTitle:(id)a3 subtitle:(id)a4 buttonAction:(id)a5 horizontalMargin:(double)a6
{
  v10 = _Block_copy(a5);
  if (a3)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v12;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v13 = 0;
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v11 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a4 = v14;
  if (v10)
  {
LABEL_4:
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v10;
    v10 = sub_100570E4C;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v15 = 0;
LABEL_8:
  v16 = self;
  sub_100570074(v11, a3, v13, a4, (uint64_t)v10, v15, a6);
  sub_10005E5F8((uint64_t)v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100570584();
}

- (void)didTapButton
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_buttonAction);
  if (v2)
  {
    uint64_t v3 = self;
    sub_10008A670((uint64_t)v2);
    v2(1);
    sub_10005E5F8((uint64_t)v2);
  }
}

- (_TtC10FitnessApp25ActivityTileSectionHeader)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100570998();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_button));
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_buttonAction));

  swift_bridgeObjectRelease();
}

+ (NSString)reuseIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

@end
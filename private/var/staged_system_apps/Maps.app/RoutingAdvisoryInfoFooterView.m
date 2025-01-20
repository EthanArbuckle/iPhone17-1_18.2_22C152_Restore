@interface RoutingAdvisoryInfoFooterView
+ (NSString)reuseIdentifier;
+ (id)learnMoreText;
- (UILabel)descriptionLabel;
- (_TtC4Maps29RoutingAdvisoryInfoFooterView)initWithCoder:(id)a3;
- (_TtC4Maps29RoutingAdvisoryInfoFooterView)initWithFrame:(CGRect)a3;
- (id)tapActionHandler;
- (void)advisoryInfoTapped:(id)a3;
- (void)prepareForReuse;
- (void)setDescriptionLabel:(id)a3;
- (void)setTapActionHandler:(id)a3;
- (void)updateDescriptionInfo:(id)a3 tapHandler:(id)a4;
@end

@implementation RoutingAdvisoryInfoFooterView

+ (NSString)reuseIdentifier
{
  type metadata accessor for RoutingAdvisoryInfoFooterView();
  sub_1000FF33C(&qword_1015D43C8);
  String.init<A>(describing:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (UILabel)descriptionLabel
{
  NSString v2 = self;
  id v3 = sub_1001D493C();

  return (UILabel *)v3;
}

- (void)setDescriptionLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView____lazy_storage___descriptionLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView____lazy_storage___descriptionLabel) = (Class)a3;
  id v3 = a3;
}

- (_TtC4Maps29RoutingAdvisoryInfoFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps29RoutingAdvisoryInfoFooterView *)sub_1001D4B0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps29RoutingAdvisoryInfoFooterView)initWithCoder:(id)a3
{
  return (_TtC4Maps29RoutingAdvisoryInfoFooterView *)sub_1001D4C1C(a3);
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoutingAdvisoryInfoFooterView();
  id v2 = v5.receiver;
  [(RoutingAdvisoryInfoFooterView *)&v5 prepareForReuse];
  id v3 = sub_1001D493C();
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 setText:v4];
}

- (id)tapActionHandler
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler))
  {
    uint64_t v2 = *(void *)&self->horizontalMargin[OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler];
    v5[4] = *(Class *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_10008C380;
    v5[3] = &unk_1012DCED8;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setTapActionHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1001D5E8C;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10006C5D8(v8);
}

- (void)updateDescriptionInfo:(id)a3 tapHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_100135AFC;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1001D5270(v8, (uint64_t)v6, v7);
  sub_10006C5D8((uint64_t)v6);
}

- (void)advisoryInfoTapped:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler);
  if (v3)
  {
    id v5 = a3;
    uint64_t v7 = self;
    uint64_t v6 = sub_1000F4F24((uint64_t)v3);
    v3(v6);
    sub_10006C5D8((uint64_t)v3);
  }
}

+ (id)learnMoreText
{
  if (qword_1015CBD78 != -1) {
    swift_once();
  }
  v7._countAndFlagsBits = 0xD000000000000045;
  v7._object = (void *)0x8000000100F7B480;
  v2._object = (void *)0x8000000100F7B450;
  v2._countAndFlagsBits = 0xD000000000000021;
  v3._countAndFlagsBits = 0x6F4D206E7261654CLL;
  v3._object = (void *)0xEA00000000006572;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v2, (Swift::String_optional)0, (NSBundle)qword_101611820, v3, v7);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView____lazy_storage___descriptionLabel));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler);

  sub_10006C5D8(v3);
}

@end
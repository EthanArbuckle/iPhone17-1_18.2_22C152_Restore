@interface FMSingleLineIconPlatterButton
- (BOOL)isUserInteractionEnabled;
- (NSString)accessibilityLabel;
- (_TtC6FindMy29FMSingleLineIconPlatterButton)init;
- (_TtC6FindMy29FMSingleLineIconPlatterButton)initWithCoder:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation FMSingleLineIconPlatterButton

- (_TtC6FindMy29FMSingleLineIconPlatterButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001C56F4();
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy29FMSingleLineIconPlatterButton_label);
  id v3 = self;
  id v4 = [v2 text];
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (BOOL)isUserInteractionEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMSingleLineIconPlatterButton();
  return [(FMSingleLineIconPlatterButton *)&v3 isUserInteractionEnabled];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMSingleLineIconPlatterButton();
  id v4 = (char *)v5.receiver;
  [(FMSingleLineIconPlatterButton *)&v5 setUserInteractionEnabled:v3];
  [*(id *)&v4[OBJC_IVAR____TtC6FindMy29FMSingleLineIconPlatterButton_label] setEnabled:v3];
}

- (_TtC6FindMy29FMSingleLineIconPlatterButton)init
{
  result = (_TtC6FindMy29FMSingleLineIconPlatterButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMSingleLineIconPlatterButton_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMSingleLineIconPlatterButton_glyphAndLabelView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMSingleLineIconPlatterButton_glyphView));
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy29FMSingleLineIconPlatterButton_color);
}

@end
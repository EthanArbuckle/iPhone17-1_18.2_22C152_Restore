@interface RCDoneButton
- (NSString)title;
- (_TtC10VoiceMemos12RCDoneButton)init;
- (_TtC10VoiceMemos12RCDoneButton)initWithCoder:(id)a3;
- (_TtC10VoiceMemos12RCDoneButton)initWithFrame:(CGRect)a3;
- (double)buttonHeight;
- (double)calculatedWidth;
- (void)setEnabled:(BOOL)a3 isHidden:(BOOL)a4 userInteractionEnabled:(BOOL)a5;
- (void)setTitle:(id)a3;
- (void)updateConfiguration;
@end

@implementation RCDoneButton

- (double)buttonHeight
{
  return 49.0;
}

- (NSString)title
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10VoiceMemos12RCDoneButton_titleString);
  uint64_t *v5 = v4;
  v5[1] = v6;
  v7 = self;
  swift_bridgeObjectRelease();
  [(RCDoneButton *)v7 setNeedsUpdateConfiguration];
}

- (_TtC10VoiceMemos12RCDoneButton)init
{
  return (_TtC10VoiceMemos12RCDoneButton *)sub_10016931C();
}

- (_TtC10VoiceMemos12RCDoneButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10016A6CC();
}

- (void)setEnabled:(BOOL)a3 isHidden:(BOOL)a4 userInteractionEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  v8 = self;
  [(RCDoneButton *)v8 setEnabled:v7];
  [(RCDoneButton *)v8 setHidden:v6];
  [(RCDoneButton *)v8 setUserInteractionEnabled:v5];
}

- (void)updateConfiguration
{
  NSString v2 = self;
  sub_100169DB0();
}

- (double)calculatedWidth
{
  NSString v2 = self;
  double v3 = sub_10016A0E0();

  return v3;
}

- (_TtC10VoiceMemos12RCDoneButton)initWithFrame:(CGRect)a3
{
  result = (_TtC10VoiceMemos12RCDoneButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos12RCDoneButton_layoutHelper));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos12RCDoneButton_styleProvider));

  swift_bridgeObjectRelease();
}

@end
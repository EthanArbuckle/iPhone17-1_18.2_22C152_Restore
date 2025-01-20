@interface AudioAssetGridView
- (NSString)accessibilityLabel;
- (_TtC7Journal18AudioAssetGridView)initWithCoder:(id)a3;
- (_TtC7Journal18AudioAssetGridView)initWithFrame:(CGRect)a3;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation AudioAssetGridView

- (_TtC7Journal18AudioAssetGridView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal18AudioAssetGridView *)sub_10049DE90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal18AudioAssetGridView)initWithCoder:(id)a3
{
  return (_TtC7Journal18AudioAssetGridView *)sub_10049E248(a3);
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1004A149C();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v4 = self;
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudioAssetGridView();
  [(AudioAssetGridView *)&v7 setAccessibilityLabel:v5];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18AudioAssetGridView_playImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18AudioAssetGridView_pauseImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18AudioAssetGridView_playbackButton));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal18AudioAssetGridView_audioLabel);
}

@end
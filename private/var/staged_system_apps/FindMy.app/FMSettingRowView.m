@interface FMSettingRowView
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityLabel;
- (UIImage)accessibilityChevronImage;
- (_TtC6FindMy16FMSettingRowView)initWithCoder:(id)a3;
- (_TtC6FindMy16FMSettingRowView)initWithFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation FMSettingRowView

- (UIImage)accessibilityChevronImage
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy16FMSettingRowView_chevron) image];

  return (UIImage *)v2;
}

- (_TtC6FindMy16FMSettingRowView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005145AC();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  id v2 = self;
  sub_100512BC0();
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

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100006060(0, (unint64_t *)&qword_1006B0290);
  sub_1000C8370();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  sub_1005140A8(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_TtC6FindMy16FMSettingRowView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy16FMSettingRowView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMSettingRowView_secondaryDetailLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMSettingRowView_imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMSettingRowView_titleLabelLeadingConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy16FMSettingRowView_image);
}

@end
@interface BadgingView
- (CGRect)bounds;
- (CGRect)frame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication11BadgingView)initWithCoder:(id)a3;
- (_TtC16MusicApplication11BadgingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation BadgingView

- (_TtC16MusicApplication11BadgingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication11BadgingView_badgingItems) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication11BadgingView_fontTextStyle) = (Class)UIFontTextStyleSubheadline;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication11BadgingView_layoutInvalidationHandler);
  void *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication11BadgingView_longestTextWidth) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication11BadgingView_itemLabels) = (Class)_swiftEmptyArrayStorage;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BadgingView();
  v8 = UIFontTextStyleSubheadline;
  return -[BadgingView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication11BadgingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2B17A4();
}

- (CGRect)frame
{
  sub_2B0714(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_2B07E0((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);
}

- (CGRect)bounds
{
  sub_2B0714(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_2B07E0((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BadgingView();
  double v2 = (char *)v4.receiver;
  [(BadgingView *)&v4 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
  double v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC16MusicApplication11BadgingView_layoutInvalidationHandler];
  if (v3)
  {
    swift_retain();
    v3(v2);
    sub_1A528((uint64_t)v3);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  objc_super v4 = self;
  sub_2B09C8(width);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_2B0D98();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication11BadgingView_fontTextStyle));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication11BadgingView_layoutInvalidationHandler));

  swift_bridgeObjectRelease();
}

@end
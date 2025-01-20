@interface VideoDurationView
- (CGSize)intrinsicContentSize;
- (_TtC8NewsFeed17VideoDurationView)initWithCoder:(id)a3;
- (_TtC8NewsFeed17VideoDurationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VideoDurationView

- (_TtC8NewsFeed17VideoDurationView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed17VideoDurationView *)VideoDurationView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed17VideoDurationView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed17VideoDurationView_label;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed17VideoDurationView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(VideoDurationView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed17VideoDurationView_label];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed17VideoDurationView_label);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_font);
  if (v4)
  {
    id v7 = v4;
    objc_msgSend(v4, sel_capHeight);
    double v9 = v8;

    objc_msgSend(v2, sel_intrinsicContentSize);
    double v11 = v10;

    double v5 = v11 + 12.0;
    double v6 = v9 + 12.0;
  }
  else
  {
    __break(1u);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
}

@end
@interface JournalDividerView
- (CGRect)bounds;
- (_TtC7Journal18JournalDividerView)initWithCoder:(id)a3;
- (_TtC7Journal18JournalDividerView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
@end

@implementation JournalDividerView

- (_TtC7Journal18JournalDividerView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal18JournalDividerView *)sub_10004A9A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal18JournalDividerView)initWithCoder:(id)a3
{
  return (_TtC7Journal18JournalDividerView *)sub_10004AB34(a3);
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for JournalDividerView();
  [(JournalDividerView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for JournalDividerView();
  v7 = (char *)v10.receiver;
  -[JournalDividerView setBounds:](&v10, "setBounds:", x, y, width, height);
  id v8 = [self mainScreen];
  [v8 scale];

  v9 = *(void **)&v7[OBJC_IVAR____TtC7Journal18JournalDividerView_dividerView];
  [v7 frame];
  [v9 setFrame:0.0, 0.0];
}

- (void).cxx_destruct
{
}

@end
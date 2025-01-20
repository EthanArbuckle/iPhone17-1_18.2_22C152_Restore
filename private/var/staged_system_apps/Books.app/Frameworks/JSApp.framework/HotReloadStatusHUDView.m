@interface HotReloadStatusHUDView
- (CGRect)frame;
- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView)initWithCoder:(id)a3;
- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation HotReloadStatusHUDView

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HotReloadStatusHUDView();
  [(HotReloadStatusHUDView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HotReloadStatusHUDView();
  id v7 = v8.receiver;
  -[HotReloadStatusHUDView setFrame:](&v8, "setFrame:", x, y, width, height);
  sub_6219C();
}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView)initWithFrame:(CGRect)a3
{
  return (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView *)sub_622A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView)initWithCoder:(id)a3
{
  CGRect result = (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView *)sub_86F70();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView_activityIndicatorView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView_label);
}

@end
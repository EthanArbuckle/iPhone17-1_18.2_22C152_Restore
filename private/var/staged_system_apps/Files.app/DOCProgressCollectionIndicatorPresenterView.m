@interface DOCProgressCollectionIndicatorPresenterView
- (_TtC5Files43DOCProgressCollectionIndicatorPresenterView)initWithFrame:(CGRect)a3;
- (void)progressIndicatorViewDidReceiveTap:(id)a3;
@end

@implementation DOCProgressCollectionIndicatorPresenterView

- (void)progressIndicatorViewDidReceiveTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004B0B3C(v4);
}

- (_TtC5Files43DOCProgressCollectionIndicatorPresenterView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Files43DOCProgressCollectionIndicatorPresenterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files43DOCProgressCollectionIndicatorPresenterView_preferredIconColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Files43DOCProgressCollectionIndicatorPresenterView_progressIndicatorView);
}

@end
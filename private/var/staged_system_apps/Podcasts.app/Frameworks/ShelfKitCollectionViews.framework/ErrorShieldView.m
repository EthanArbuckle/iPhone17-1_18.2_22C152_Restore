@interface ErrorShieldView
- (_TtC23ShelfKitCollectionViews15ErrorShieldView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews15ErrorShieldView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)a3;
@end

@implementation ErrorShieldView

- (_TtC23ShelfKitCollectionViews15ErrorShieldView)initWithFrame:(CGRect)a3
{
  sub_2A66F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC23ShelfKitCollectionViews15ErrorShieldView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews15ErrorShieldView_retryHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews15ErrorShieldView *)sub_385890();
  __break(1u);
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  id v5 = a3;
  [(ErrorShieldView *)&v6 willMoveToWindow:v5];
  if (v5)
  {
    sub_380AB0();
  }
}

- (void)didMoveToWindow
{
  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  [(ErrorShieldView *)&v2 didMoveToWindow];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  objc_super v2 = (char *)v3.receiver;
  [(ErrorShieldView *)&v3 layoutSubviews];
  [v2 bounds];
  [*(id *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews15ErrorShieldView_errorView] setFrame:];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15ErrorShieldView_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15ErrorShieldView_errorView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews15ErrorShieldView_retryHandler);

  sub_27760(v3);
}

@end
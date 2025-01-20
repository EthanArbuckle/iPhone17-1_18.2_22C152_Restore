@interface CarouselItemSingleModuleOverlay
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore31CarouselItemSingleModuleOverlay)initWithCoder:(id)a3;
- (_TtC8AppStore31CarouselItemSingleModuleOverlay)initWithFrame:(CGRect)a3;
- (void)handleSelection:(id)a3;
- (void)layoutSubviews;
@end

@implementation CarouselItemSingleModuleOverlay

- (_TtC8AppStore31CarouselItemSingleModuleOverlay)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31CarouselItemSingleModuleOverlay *)sub_10031021C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31CarouselItemSingleModuleOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10031151C();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(CarouselItemSingleModuleOverlay *)&v5 layoutSubviews];
  sub_1003106D0(v4);
  sub_100081D90(v4, v4[3]);
  LayoutMarginsAware<>.layoutFrame.getter();
  id v3 = [v2 traitCollection];
  dispatch thunk of Placeable.place(at:with:)();

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v5 = self;
  double v6 = sub_1002D39C4(width, height);
  sub_1003106D0(v12);
  double v7 = sub_10069A530((uint64_t)v12, v6, height);
  double v9 = v8;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v12);

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  BOOL v9 = sub_1003117B8(v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)handleSelection:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_selectionHandler);
  if (v3)
  {
    id v5 = a3;
    id v7 = self;
    uint64_t v6 = sub_100060050((uint64_t)v3);
    v3(v6);
    sub_10006012C((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_tapGestureRecognizer));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_displayOptions;
  uint64_t v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_selectionHandler);

  sub_10006012C(v5);
}

@end
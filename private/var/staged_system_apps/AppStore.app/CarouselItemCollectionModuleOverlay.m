@interface CarouselItemCollectionModuleOverlay
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore35CarouselItemCollectionModuleOverlay)initWithCoder:(id)a3;
- (_TtC8AppStore35CarouselItemCollectionModuleOverlay)initWithFrame:(CGRect)a3;
- (void)handleSelection:(id)a3;
- (void)layoutSubviews;
@end

@implementation CarouselItemCollectionModuleOverlay

- (_TtC8AppStore35CarouselItemCollectionModuleOverlay)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore35CarouselItemCollectionModuleOverlay *)sub_10069A904(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore35CarouselItemCollectionModuleOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10069BCC8();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(CarouselItemCollectionModuleOverlay *)&v5 layoutSubviews];
  sub_10069AD4C(v4);
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
  sub_10069AD4C(v12);
  double v7 = sub_10069A548((uint64_t)v12, sub_1002D39C4, v6, height);
  double v9 = v8;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v12);

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)handleSelection:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore35CarouselItemCollectionModuleOverlay_selectionHandler);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_100060050((uint64_t)v3);
    v3(v6);
    sub_10006012C((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35CarouselItemCollectionModuleOverlay_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35CarouselItemCollectionModuleOverlay_platterView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35CarouselItemCollectionModuleOverlay_tapGestureRecognizer));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore35CarouselItemCollectionModuleOverlay_displayOptions;
  uint64_t v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore35CarouselItemCollectionModuleOverlay_selectionHandler);

  sub_10006012C(v5);
}

@end
@interface UnknownPageView
- (_TtC8PaperKit15UnknownPageView)initWithCoder:(id)a3;
- (_TtC8PaperKit15UnknownPageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation UnknownPageView

- (_TtC8PaperKit15UnknownPageView)initWithFrame:(CGRect)a3
{
  return (_TtC8PaperKit15UnknownPageView *)UnknownPageView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8PaperKit15UnknownPageView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC8PaperKit15UnknownPageView_textualContextProvider) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC8PaperKit15UnknownPageView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  UnknownPageView.layoutSubviews()();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit15UnknownPageView_textualContextProvider;
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)v3);
}

@end
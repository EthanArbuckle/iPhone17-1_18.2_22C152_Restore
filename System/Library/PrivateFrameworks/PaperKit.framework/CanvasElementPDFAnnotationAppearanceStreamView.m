@interface CanvasElementPDFAnnotationAppearanceStreamView
- (_TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView)initWithCoder:(id)a3;
- (_TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation CanvasElementPDFAnnotationAppearanceStreamView

- (_TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  CanvasElementPDFAnnotationAppearanceStreamView.draw(_:)(v9);
}

- (_TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
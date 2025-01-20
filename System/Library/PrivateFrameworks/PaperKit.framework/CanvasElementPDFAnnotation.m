@interface CanvasElementPDFAnnotation
- (Class)annotationSubclassForPopup;
- (_TtC8PaperKit26CanvasElementPDFAnnotation)init;
- (_TtC8PaperKit26CanvasElementPDFAnnotation)initWithAnnotationDictionary:(void *)a3 forPage:(id)a4;
- (_TtC8PaperKit26CanvasElementPDFAnnotation)initWithBounds:(CGRect)a3 forType:(id)a4 withProperties:(id)a5;
- (_TtC8PaperKit26CanvasElementPDFAnnotation)initWithCGPDFAnnotation:(CGPDFAnnotation *)a3 forPage:(id)a4;
- (_TtC8PaperKit26CanvasElementPDFAnnotation)initWithCoder:(id)a3;
- (id)akAnnotation;
- (id)copyWithZone:(void *)a3;
- (id)initCommonWithBounds:(CGRect)a3;
- (id)interactiveBackgroundColor;
- (void)_addAKAnnotationToDictionary:(__CFDictionary *)a3;
- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4;
- (void)setIsFullyConstructed:(BOOL)a3;
@end

@implementation CanvasElementPDFAnnotation

- (_TtC8PaperKit26CanvasElementPDFAnnotation)initWithBounds:(CGRect)a3 forType:(id)a4 withProperties:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a5) {
    uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v10 = 0;
  }
  return (_TtC8PaperKit26CanvasElementPDFAnnotation *)CanvasElementPDFAnnotation.init(bounds:forType:withProperties:)(a4, v10, x, y, width, height);
}

- (_TtC8PaperKit26CanvasElementPDFAnnotation)init
{
  return (_TtC8PaperKit26CanvasElementPDFAnnotation *)CanvasElementPDFAnnotation.init()();
}

- (_TtC8PaperKit26CanvasElementPDFAnnotation)initWithCoder:(id)a3
{
  return (_TtC8PaperKit26CanvasElementPDFAnnotation *)CanvasElementPDFAnnotation.init(coder:)(a3);
}

- (id)initCommonWithBounds:(CGRect)a3
{
  return CanvasElementPDFAnnotation.init(commonWithBounds:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8PaperKit26CanvasElementPDFAnnotation)initWithAnnotationDictionary:(void *)a3 forPage:(id)a4
{
  id v6 = a4;
  return (_TtC8PaperKit26CanvasElementPDFAnnotation *)CanvasElementPDFAnnotation.init(annotationDictionary:for:)((uint64_t)a3, a4);
}

- (_TtC8PaperKit26CanvasElementPDFAnnotation)initWithCGPDFAnnotation:(CGPDFAnnotation *)a3 forPage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  return (_TtC8PaperKit26CanvasElementPDFAnnotation *)CanvasElementPDFAnnotation.init(cgpdfAnnotation:for:)(a3, a4);
}

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  CanvasElementPDFAnnotation.copy(with:)((uint64_t)a3, (uint64_t)v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (void)setIsFullyConstructed:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  v5 = v4;
  if (v3)
  {
    id v6 = (objc_class *)[(PDFAnnotation *)v4 createAKAnnotation];
    id v7 = *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC8PaperKit26CanvasElementPDFAnnotation__akAnnotation);
    *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC8PaperKit26CanvasElementPDFAnnotation__akAnnotation) = v6;
  }
  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CanvasElementPDFAnnotation();
  [(PDFAnnotation *)&v8 setIsFullyConstructed:v3];
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4
{
  id v6 = a4;
  id v7 = self;
  CanvasElementPDFAnnotation.draw(with:in:)(a3, v6);
}

- (id)akAnnotation
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____TtC8PaperKit26CanvasElementPDFAnnotation__akAnnotation));
}

- (void)_addAKAnnotationToDictionary:(__CFDictionary *)a3
{
  v5 = a3;
  id v6 = self;
  CanvasElementPDFAnnotation._addAKAnnotation(to:)((CFMutableDictionaryRef_optional)a3);
}

- (id)interactiveBackgroundColor
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____TtC8PaperKit26CanvasElementPDFAnnotation__interactiveBackgroundColor));
}

- (Class)annotationSubclassForPopup
{
  type metadata accessor for CanvasElementPDFAnnotation();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@guaranteed [NSAttributedStringKey : Any], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8PaperKit26CanvasElementPDFAnnotation_render));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26CanvasElementPDFAnnotation__akAnnotation));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed [NSAttributedStringKey : Any], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8PaperKit26CanvasElementPDFAnnotation_writePaperKitAnnotation));
  outlined destroy of CRKeyPath?((uint64_t)self + OBJC_IVAR____TtC8PaperKit26CanvasElementPDFAnnotation_subelementId);
  BOOL v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8PaperKit26CanvasElementPDFAnnotation__interactiveBackgroundColor);
}

@end
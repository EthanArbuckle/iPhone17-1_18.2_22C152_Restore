@interface BECustomViewMenuElement
+ (id)createHighlightMenuElementFor:(int64_t)a3 annotationUUID:(id)a4 delegate:(id)a5;
+ (id)createHighlightMenuElementFor:(int64_t)a3 annotationUUID:(id)a4 view:(id)a5 rect:(CGRect)a6 delegate:(id)a7;
- (_TtC8BookCore23BECustomViewMenuElement)initWithCoder:(id)a3;
@end

@implementation BECustomViewMenuElement

+ (id)createHighlightMenuElementFor:(int64_t)a3 annotationUUID:(id)a4 delegate:(id)a5
{
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = _s8BookCore23BECustomViewMenuElementC015createHighlighteF03for14annotationUUID8delegateSo06UIMenuF0CSo022AEAnnotationTheme_PageO0V_So8NSStringCSgAA0heF8Delegate_ptFZ_0(a3, a4, (uint64_t)a5);

  swift_unknownObjectRelease();

  return v9;
}

+ (id)createHighlightMenuElementFor:(int64_t)a3 annotationUUID:(id)a4 view:(id)a5 rect:(CGRect)a6 delegate:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  swift_getObjCClassMetadata();
  id v15 = a4;
  id v16 = a5;
  swift_unknownObjectRetain();
  id v17 = static BECustomViewMenuElement.createHighlightMenuElement(for:annotationUUID:view:rect:delegate:)(a3, a4, v16, (uint64_t)a7, x, y, width, height);

  swift_unknownObjectRelease();

  return v17;
}

- (_TtC8BookCore23BECustomViewMenuElement)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BECustomViewMenuElement();
  return [(BECustomViewMenuElement *)&v5 initWithCoder:a3];
}

@end
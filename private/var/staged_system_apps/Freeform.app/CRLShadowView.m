@interface CRLShadowView
+ (Class)layerClass;
- (_TtC8Freeform13CRLShadowView)initWithCoder:(id)a3;
- (_TtC8Freeform13CRLShadowView)initWithFrame:(CGRect)a3;
@end

@implementation CRLShadowView

- (_TtC8Freeform13CRLShadowView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLShadowView();
  return -[CRLShadowView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform13CRLShadowView)initWithCoder:(id)a3
{
  return (_TtC8Freeform13CRLShadowView *)sub_100B43350(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for CRLShadowView);
}

+ (Class)layerClass
{
  type metadata accessor for CRLShadowLayer();

  return (Class)swift_getObjCClassFromMetadata();
}

@end
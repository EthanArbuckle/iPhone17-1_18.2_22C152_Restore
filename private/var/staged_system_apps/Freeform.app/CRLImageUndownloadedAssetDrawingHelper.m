@interface CRLImageUndownloadedAssetDrawingHelper
- (_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper)initWithImageRep:(id)a3 asset:(id)a4;
- (_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper)initWithRep:(id)a3 asset:(id)a4;
- (void)drawInConext:(CGContext *)a3 withOriginalImageRect:(CGRect)a4;
@end

@implementation CRLImageUndownloadedAssetDrawingHelper

- (_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper)initWithImageRep:(id)a3 asset:(id)a4
{
  return (_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper *)sub_100745CD0(a3, a4);
}

- (void)drawInConext:(CGContext *)a3 withOriginalImageRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v9 = a3;
  v10 = self;
  sub_100745E34(v9, x, y, width, height);
}

- (_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper)initWithRep:(id)a3 asset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
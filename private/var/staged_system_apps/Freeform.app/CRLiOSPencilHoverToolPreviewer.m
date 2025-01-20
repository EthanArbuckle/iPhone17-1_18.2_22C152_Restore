@interface CRLiOSPencilHoverToolPreviewer
- (CALayer)layer;
- (_TtC8Freeform30CRLiOSPencilHoverToolPreviewer)init;
- (void)clearPreview;
@end

@implementation CRLiOSPencilHoverToolPreviewer

- (CALayer)layer
{
  return (CALayer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC8Freeform30CRLiOSPencilHoverToolPreviewer_shapeLayer));
}

- (void)clearPreview
{
  v2 = self;
  sub_100744E08();
}

- (_TtC8Freeform30CRLiOSPencilHoverToolPreviewer)init
{
  return (_TtC8Freeform30CRLiOSPencilHoverToolPreviewer *)sub_100745080();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLiOSPencilHoverToolPreviewer_imageLayer);
}

@end
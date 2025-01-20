@interface PFXInteractiveImageWidgetViewObj
- (CGPoint)translation;
- (NSArray)children;
- (TSDInfoGeometry)canvasGeometry;
- (TSWPShapeStyle)style;
- (double)scale;
- (void)dealloc;
- (void)setCanvasGeometry:(id)a3;
- (void)setChildren:(id)a3;
- (void)setScale:(double)a3;
- (void)setStyle:(id)a3;
- (void)setTranslation:(CGPoint)a3;
@end

@implementation PFXInteractiveImageWidgetViewObj

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXInteractiveImageWidgetViewObj;
  [(PFXInteractiveImageWidgetViewObj *)&v3 dealloc];
}

- (NSArray)children
{
  return self->mChildren;
}

- (void)setChildren:(id)a3
{
}

- (double)scale
{
  return self->mScale;
}

- (void)setScale:(double)a3
{
  self->mScale = a3;
}

- (CGPoint)translation
{
  double x = self->mTranslation.x;
  double y = self->mTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTranslation:(CGPoint)a3
{
  self->mTranslation = a3;
}

- (TSDInfoGeometry)canvasGeometry
{
  return self->mCanvasGeometry;
}

- (void)setCanvasGeometry:(id)a3
{
}

- (TSWPShapeStyle)style
{
  return self->mStyle;
}

- (void)setStyle:(id)a3
{
}

@end
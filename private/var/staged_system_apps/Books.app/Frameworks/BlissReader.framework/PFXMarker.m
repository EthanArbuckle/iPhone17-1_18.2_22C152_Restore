@interface PFXMarker
- (void)dealloc;
- (void)end;
- (void)setBezierPath:(id)a3;
- (void)setFilled:(BOOL)a3;
@end

@implementation PFXMarker

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXMarker;
  [(PFXSvgElement *)&v3 dealloc];
}

- (void)setBezierPath:(id)a3
{
  self->mBezierPath = (TSDBezierPath *)a3;
}

- (void)setFilled:(BOOL)a3
{
  self->mIsFilled = a3;
}

- (void)end
{
  [self valueForAttributeName:@"refX"].doubleValue;
  double v4 = v3;
  [self valueForAttributeName:@"refY"].doubleValue;
  double v6 = v5;
  id v8 = [(PFXSvgElement *)self valueForAttributeName:"markerId"];
  if (v8 && (v7 = +[TSDLineEnd lineEndWithIdentifier:v8]) != 0
    || (v7 = +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", [(TSDBezierPath *)self->mBezierPath CGPath], self->mIsFilled, v8, v4, v6)) != 0)
  {
    [(PFXSvgElement *)self cacheDefinition:v7];
  }
}

@end
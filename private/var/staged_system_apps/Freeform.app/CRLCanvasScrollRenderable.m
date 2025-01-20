@interface CRLCanvasScrollRenderable
+ (id)renderable;
+ (id)renderableFromScrollLayer:(id)a3;
- (CRLCanvasScrollRenderable)initWithScrollLayer:(id)a3;
@end

@implementation CRLCanvasScrollRenderable

- (CRLCanvasScrollRenderable)initWithScrollLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasScrollRenderable;
  return [(CRLCanvasRenderable *)&v4 initWithCALayer:a3];
}

+ (id)renderableFromScrollLayer:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithScrollLayer:v4];

  return v5;
}

+ (id)renderable
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[CAScrollLayer layer];
  id v4 = [v2 initWithScrollLayer:v3];

  return v4;
}

@end
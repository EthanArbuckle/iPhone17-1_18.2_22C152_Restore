@interface CRLNoDefaultImplicitActionRenderable
+ (id)renderable;
+ (id)renderableFromNoImplicitActionLayer:(id)a3;
- (CRLNoDefaultImplicitActionRenderable)initWithNoImplicitActionLayer:(id)a3;
@end

@implementation CRLNoDefaultImplicitActionRenderable

- (CRLNoDefaultImplicitActionRenderable)initWithNoImplicitActionLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLNoDefaultImplicitActionRenderable;
  return [(CRLCanvasRenderable *)&v4 initWithCALayer:a3];
}

+ (id)renderableFromNoImplicitActionLayer:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithNoImplicitActionLayer:v4];

  return v5;
}

+ (id)renderable
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[CRLNoDefaultImplicitActionLayer layer];
  id v4 = [v2 initWithNoImplicitActionLayer:v3];

  return v4;
}

@end
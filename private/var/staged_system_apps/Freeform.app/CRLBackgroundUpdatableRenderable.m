@interface CRLBackgroundUpdatableRenderable
+ (id)renderable;
+ (id)renderableFromBackgroundUpdatableLayer:(id)a3;
- (CRLBackgroundUpdatableRenderable)initWithBackgroundUpdatableLayer:(id)a3;
- (id)p_backgroundUpdatableLayer;
- (void)setContentsFromBackground:(void *)a3;
@end

@implementation CRLBackgroundUpdatableRenderable

- (CRLBackgroundUpdatableRenderable)initWithBackgroundUpdatableLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLBackgroundUpdatableRenderable;
  return [(CRLCanvasRenderable *)&v4 initWithCALayer:a3];
}

+ (id)renderableFromBackgroundUpdatableLayer:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithBackgroundUpdatableLayer:v4];

  return v5;
}

+ (id)renderable
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[CRLBackgroundUpdatableLayer layer];
  id v4 = [v2 initWithBackgroundUpdatableLayer:v3];

  return v4;
}

- (id)p_backgroundUpdatableLayer
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasRenderable *)self layer];
  id v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (void)setContentsFromBackground:(void *)a3
{
  id v4 = [(CRLBackgroundUpdatableRenderable *)self p_backgroundUpdatableLayer];
  [v4 setContentsFromBackground:a3];
}

@end
@interface CRLTilingRenderable
+ (id)renderable;
+ (id)renderableFromTilingLayer:(id)a3;
- (BOOL)forceTiled;
- (CRLTilingRenderable)initWithTilingLayer:(id)a3;
- (id)p_tilingLayer;
- (int64_t)tilingMode;
- (void)setForceTiled:(BOOL)a3;
- (void)setTilingMode:(int64_t)a3;
@end

@implementation CRLTilingRenderable

- (CRLTilingRenderable)initWithTilingLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLTilingRenderable;
  return [(CRLCanvasRenderable *)&v4 initWithCALayer:a3];
}

+ (id)renderableFromTilingLayer:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithTilingLayer:v4];

  return v5;
}

+ (id)renderable
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[CRLTilingLayer layer];
  id v4 = [v2 initWithTilingLayer:v3];

  return v4;
}

- (id)p_tilingLayer
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasRenderable *)self layer];
  id v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (int64_t)tilingMode
{
  id v2 = [(CRLTilingRenderable *)self p_tilingLayer];
  id v3 = [v2 tilingMode];

  return (int64_t)v3;
}

- (void)setTilingMode:(int64_t)a3
{
  id v4 = [(CRLTilingRenderable *)self p_tilingLayer];
  [v4 setTilingMode:a3];
}

- (BOOL)forceTiled
{
  id v2 = [(CRLTilingRenderable *)self p_tilingLayer];
  unsigned __int8 v3 = [v2 forceTiled];

  return v3;
}

- (void)setForceTiled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CRLTilingRenderable *)self p_tilingLayer];
  [v4 setForceTiled:v3];
}

@end
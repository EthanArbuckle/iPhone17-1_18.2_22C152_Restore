@interface CRLSixChannelTilingRenderable
+ (id)renderable;
+ (id)renderableFromSixChannelTilingLayer:(id)a3;
- (CRLSixChannelTilingRenderable)initWithSixChannelTilingLayer:(id)a3;
- (id)p_sixChannelTilingLayer;
@end

@implementation CRLSixChannelTilingRenderable

- (CRLSixChannelTilingRenderable)initWithSixChannelTilingLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLSixChannelTilingRenderable;
  return [(CRLCanvasRenderable *)&v4 initWithCALayer:a3];
}

+ (id)renderableFromSixChannelTilingLayer:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithSixChannelTilingLayer:v4];

  return v5;
}

+ (id)renderable
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[CRLSixChannelTilingLayer layer];
  id v4 = [v2 initWithSixChannelTilingLayer:v3];

  return v4;
}

- (id)p_sixChannelTilingLayer
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasRenderable *)self layer];
  id v5 = sub_1002469D0(v3, v4);

  return v5;
}

@end
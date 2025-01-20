@interface TUIRenderModelDraw
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIIdentifier)identifier;
- (TUIRenderModelDraw)draw;
- (TUIRenderModelDraw)initWithDraw:(id)a3 erasableInsets:(UIEdgeInsets)a4;
- (UIEdgeInsets)eraseableInsets;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)drawInContext:(CGContext *)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TUIRenderModelDraw

- (unint64_t)kind
{
  return 1;
}

- (TUIRenderModelDraw)initWithDraw:(id)a3 erasableInsets:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUIRenderModelDraw;
  v11 = [(TUIRenderModelDraw *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_draw, a3);
    v12->_eraseableInsets.CGFloat top = top;
    v12->_eraseableInsets.CGFloat left = left;
    v12->_eraseableInsets.CGFloat bottom = bottom;
    v12->_eraseableInsets.CGFloat right = right;
    v12->_size = CGSizeZero;
  }

  return v12;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  draw = self->_draw;
  long long v5 = *(_OWORD *)&a4->c;
  v6[0] = *(_OWORD *)&a4->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->tx;
  [(TUIRenderModelDraw *)draw appendResourcesToCollector:a3 transform:v6];
}

- (void)drawInContext:(CGContext *)a3
{
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  [a3 bounds];
  CGContextTranslateCTM(a4, v6, v7);
  draw = self->_draw;

  [(TUIRenderModelDraw *)draw drawInContext:a4];
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  return self == a3;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(TUIRenderModelDraw *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (TUIRenderModelDraw)draw
{
  return self->_draw;
}

- (UIEdgeInsets)eraseableInsets
{
  double top = self->_eraseableInsets.top;
  double left = self->_eraseableInsets.left;
  double bottom = self->_eraseableInsets.bottom;
  double right = self->_eraseableInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draw, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong(&self->_renderBlock, 0);
}

@end
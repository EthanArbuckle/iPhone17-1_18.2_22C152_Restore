@interface CLKUIQuad
- (BOOL)isOpaque;
- (BOOL)prepareForTime:(double)a3;
- (CLKUIQuad)init;
- (CLKUIQuadView)quadView;
- (void)setOpaque:(BOOL)a3;
- (void)setQuadView:(id)a3;
@end

@implementation CLKUIQuad

- (CLKUIQuad)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLKUIQuad;
  return [(CLKUIQuad *)&v3 init];
}

- (BOOL)prepareForTime:(double)a3
{
  return 0;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)a3
{
  self->_opaque = a3;
}

- (CLKUIQuadView)quadView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quadView);
  return (CLKUIQuadView *)WeakRetained;
}

- (void)setQuadView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
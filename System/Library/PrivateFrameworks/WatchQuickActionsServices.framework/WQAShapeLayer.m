@interface WQAShapeLayer
- (NSString)quickActionIdentifier;
- (id)description;
- (int64_t)quickActionVisualsToken;
- (void)setQuickActionIdentifier:(id)a3;
- (void)setQuickActionVisualsToken:(int64_t)a3;
@end

@implementation WQAShapeLayer

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)WQAShapeLayer;
  v4 = [(WQAShapeLayer *)&v9 description];
  int64_t v5 = [(WQAShapeLayer *)self quickActionVisualsToken];
  v6 = [(WQAShapeLayer *)self quickActionIdentifier];
  v7 = [v3 stringWithFormat:@"[%@] token=%li, identifier=%@", v4, v5, v6];

  return v7;
}

- (NSString)quickActionIdentifier
{
  return self->_quickActionIdentifier;
}

- (void)setQuickActionIdentifier:(id)a3
{
}

- (int64_t)quickActionVisualsToken
{
  return self->_quickActionVisualsToken;
}

- (void)setQuickActionVisualsToken:(int64_t)a3
{
  self->_quickActionVisualsToken = a3;
}

- (void).cxx_destruct
{
}

@end
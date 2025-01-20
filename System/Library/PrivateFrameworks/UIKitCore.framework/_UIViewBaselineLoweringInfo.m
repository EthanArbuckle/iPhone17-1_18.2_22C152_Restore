@interface _UIViewBaselineLoweringInfo
- (UIView)baselineView;
- (double)baselineOffset;
- (id)description;
- (void)setBaselineOffset:(double)a3;
- (void)setBaselineView:(id)a3;
@end

@implementation _UIViewBaselineLoweringInfo

- (void)setBaselineView:(id)a3
{
  self->_baselineView = (UIView *)a3;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (UIView)baselineView
{
  return self->_baselineView;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p baselineOffset = %f, baselineView = %@>", NSStringFromClass(v4), self, *(void *)&self->_baselineOffset, self->_baselineView];
}

@end
@interface PXMemoriesFeedLayoutMetrics
- (PXMemoriesSpec)spec;
- (UIEdgeInsets)contentInsets;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setSpec:(id)a3;
@end

@implementation PXMemoriesFeedLayoutMetrics

- (void).cxx_destruct
{
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSpec:(id)a3
{
}

- (PXMemoriesSpec)spec
{
  return self->_spec;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXMemoriesFeedLayoutMetrics;
  v4 = [(PXLayoutMetrics *)&v7 copyWithZone:a3];
  objc_storeStrong(v4 + 3, self->_spec);
  long long v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *((_OWORD *)v4 + 2) = *(_OWORD *)&self->_contentInsets.top;
  *((_OWORD *)v4 + 3) = v5;
  return v4;
}

@end
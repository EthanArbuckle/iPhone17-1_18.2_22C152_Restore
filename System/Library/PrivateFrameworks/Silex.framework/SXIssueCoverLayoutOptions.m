@interface SXIssueCoverLayoutOptions
- (SXIssueCoverLayoutOptions)initWithBoundingWidth:(double)a3;
- (double)boundingWidth;
@end

@implementation SXIssueCoverLayoutOptions

- (SXIssueCoverLayoutOptions)initWithBoundingWidth:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXIssueCoverLayoutOptions;
  result = [(SXIssueCoverLayoutOptions *)&v5 init];
  if (result) {
    result->_boundingWidth = a3;
  }
  return result;
}

- (double)boundingWidth
{
  return self->_boundingWidth;
}

@end
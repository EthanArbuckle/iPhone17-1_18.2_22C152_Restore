@interface SXComponentAnchor
- (NSString)description;
- (NSString)targetComponentIdentifier;
- (SXComponentAnchor)initWithTargetComponentIdentifier:(id)a3;
- (_NSRange)range;
- (int64_t)originAnchorPosition;
- (int64_t)targetAnchorPosition;
- (void)setOriginAnchorPosition:(int64_t)a3;
- (void)setRange:(_NSRange)a3;
- (void)setTargetAnchorPosition:(int64_t)a3;
@end

@implementation SXComponentAnchor

- (SXComponentAnchor)initWithTargetComponentIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXComponentAnchor;
  v6 = [(SXComponentAnchor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_targetComponentIdentifier, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = [(SXComponentAnchor *)self targetComponentIdentifier];
  [v3 appendFormat:@"; target component: %@", v4];

  v8.location = [(SXComponentAnchor *)self range];
  id v5 = NSStringFromRange(v8);
  [v3 appendFormat:@"; range: %@", v5];

  return (NSString *)v3;
}

- (NSString)targetComponentIdentifier
{
  return self->_targetComponentIdentifier;
}

- (int64_t)targetAnchorPosition
{
  return self->_targetAnchorPosition;
}

- (void)setTargetAnchorPosition:(int64_t)a3
{
  self->_targetAnchorPosition = a3;
}

- (int64_t)originAnchorPosition
{
  return self->_originAnchorPosition;
}

- (void)setOriginAnchorPosition:(int64_t)a3
{
  self->_originAnchorPosition = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (void).cxx_destruct
{
}

@end
@interface _LTMatch
- (NSDictionary)node;
- (NSString)token;
- (_LTMatch)initWithNode:(id)a3 range:(_NSRange)a4;
- (_NSRange)range;
- (id)description;
- (void)setNode:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setToken:(id)a3;
@end

@implementation _LTMatch

- (_LTMatch)initWithNode:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v9 = [(_LTMatch *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_node, a3);
    v10->_range.NSUInteger location = location;
    v10->_range.NSUInteger length = length;
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  token = self->_token;
  v5 = NSStringFromRange(self->_range);
  v6 = [v3 stringWithFormat:@"%@ %@ %@", token, v5, self->_node];

  return v6;
}

- (NSDictionary)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
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

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

@end
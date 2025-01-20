@interface SRCSCommandSegmentInfo
+ (id)segmentInfoWith:(_NSRange)a3 text:(id)a4;
- (NSString)text;
- (_NSRange)range;
- (id)description;
- (void)setRange:(_NSRange)a3;
- (void)setText:(id)a3;
@end

@implementation SRCSCommandSegmentInfo

+ (id)segmentInfoWith:(_NSRange)a3 text:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  v7 = objc_opt_new();
  objc_msgSend(v7, "setRange:", location, length);
  [v7 setText:v6];

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"“%@”", self->_text];
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

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface WBSOpenSearchURLTemplateParameter
- (BOOL)isOptional;
- (NSString)name;
- (NSString)prefix;
- (_NSRange)range;
- (void)setName:(id)a3;
- (void)setOptional:(BOOL)a3;
- (void)setPrefix:(id)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation WBSOpenSearchURLTemplateParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setPrefix:(id)a3
{
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (void)setName:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end
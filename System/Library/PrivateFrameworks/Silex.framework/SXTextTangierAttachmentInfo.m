@interface SXTextTangierAttachmentInfo
- (Class)layoutClass;
- (Class)repClass;
- (SXTextExclusionPath)exclusionPath;
- (_NSRange)actualRange;
- (void)setActualRange:(_NSRange)a3;
- (void)setExclusionPath:(id)a3;
@end

@implementation SXTextTangierAttachmentInfo

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (SXTextExclusionPath)exclusionPath
{
  return self->_exclusionPath;
}

- (void)setExclusionPath:(id)a3
{
}

- (_NSRange)actualRange
{
  p_actualRange = &self->_actualRange;
  NSUInteger location = self->_actualRange.location;
  NSUInteger length = p_actualRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setActualRange:(_NSRange)a3
{
  self->_actualRange = a3;
}

- (void).cxx_destruct
{
}

@end
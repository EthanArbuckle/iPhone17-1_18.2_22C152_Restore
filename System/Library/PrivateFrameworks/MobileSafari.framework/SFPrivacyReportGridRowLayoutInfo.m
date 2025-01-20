@interface SFPrivacyReportGridRowLayoutInfo
- (SFPrivacyReportGridRowLayoutInfo)initWithRow:(int64_t)a3 itemRange:(_NSRange)a4;
- (_NSRange)itemRange;
- (double)height;
- (int64_t)row;
- (void)setHeight:(double)a3;
@end

@implementation SFPrivacyReportGridRowLayoutInfo

- (SFPrivacyReportGridRowLayoutInfo)initWithRow:(int64_t)a3 itemRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v11.receiver = self;
  v11.super_class = (Class)SFPrivacyReportGridRowLayoutInfo;
  v7 = [(SFPrivacyReportGridRowLayoutInfo *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_row = a3;
    v7->_itemRange.NSUInteger location = location;
    v7->_itemRange.NSUInteger length = length;
    v9 = v7;
  }

  return v8;
}

- (int64_t)row
{
  return self->_row;
}

- (_NSRange)itemRange
{
  NSUInteger length = self->_itemRange.length;
  NSUInteger location = self->_itemRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

@end
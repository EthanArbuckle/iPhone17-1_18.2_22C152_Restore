@interface PXStoryAutoEditModule
- (PXStoryAutoEditModule)initWithModuleType:(int64_t)a3 range:(_NSRange)a4;
- (_NSRange)range;
- (id)debugDescription;
- (int64_t)moduleType;
@end

@implementation PXStoryAutoEditModule

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (int64_t)moduleType
{
  return self->_moduleType;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t moduleType = self->_moduleType;
  if (moduleType > 3) {
    v6 = @"??";
  }
  else {
    v6 = off_1E5DB4F20[moduleType];
  }
  v7 = v6;
  v8 = [v3 stringWithFormat:@"<%@:%p type:%@ [%ld...%ld]>", v4, self, v7, self->_range.location, self->_range.length + self->_range.location];

  return v8;
}

- (PXStoryAutoEditModule)initWithModuleType:(int64_t)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v8.receiver = self;
  v8.super_class = (Class)PXStoryAutoEditModule;
  _NSRange result = [(PXStoryAutoEditModule *)&v8 init];
  if (result)
  {
    result->_unint64_t moduleType = a3;
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
  }
  return result;
}

@end
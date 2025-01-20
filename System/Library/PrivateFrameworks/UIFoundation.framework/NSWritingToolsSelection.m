@interface NSWritingToolsSelection
- (NSUUID)contextIdentifier;
- (NSWritingToolsSelection)initWithRange:(_NSRange)a3 contextIdentifier:(id)a4;
- (_NSRange)range;
- (id)description;
@end

@implementation NSWritingToolsSelection

- (NSWritingToolsSelection)initWithRange:(_NSRange)a3 contextIdentifier:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NSWritingToolsSelection;
  v9 = [(NSWritingToolsSelection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_range.NSUInteger location = location;
    v9->_range.NSUInteger length = length;
    objc_storeStrong((id *)&v9->_contextIdentifier, a4);
  }

  return v10;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)NSWritingToolsSelection;
  v3 = [(NSWritingToolsSelection *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" range={%lu, %lu} contextID=%@", self->_range.location, self->_range.length, self->_contextIdentifier];

  return v4;
}

- (_NSRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (NSUUID)contextIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end
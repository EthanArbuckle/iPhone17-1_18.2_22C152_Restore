@interface PSIParsedDate
- (NSDictionary)attributes;
- (PSIParsedDate)initWithAttributes:(id)a3 range:(_NSRange)a4 extensionRange:(_NSRange)a5;
- (_NSRange)extensionRange;
- (_NSRange)range;
@end

@implementation PSIParsedDate

- (void).cxx_destruct
{
}

- (_NSRange)extensionRange
{
  NSUInteger length = self->_extensionRange.length;
  NSUInteger location = self->_extensionRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (PSIParsedDate)initWithAttributes:(id)a3 range:(_NSRange)a4 extensionRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a4.length;
  NSUInteger v8 = a4.location;
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSIParsedDate;
  v12 = [(PSIParsedDate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_attributes, a3);
    v13->_range.NSUInteger location = v8;
    v13->_range.NSUInteger length = v7;
    v13->_extensionRange.NSUInteger location = location;
    v13->_extensionRange.NSUInteger length = length;
  }

  return v13;
}

@end
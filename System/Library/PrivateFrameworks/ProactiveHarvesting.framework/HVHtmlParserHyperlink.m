@interface HVHtmlParserHyperlink
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHtmlParserHyperlink:(id)a3;
- (HVHtmlParserHyperlink)initWithURL:(id)a3 range:(_NSRange)a4;
- (NSURL)url;
- (_NSRange)range;
- (id)description;
- (unint64_t)hash;
@end

@implementation HVHtmlParserHyperlink

- (void).cxx_destruct
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

- (NSURL)url
{
  return self->_url;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  url = self->_url;
  v7 = NSStringFromRange(self->_range);
  v8 = (void *)[v3 initWithFormat:@"<%@ %@ %@>", v5, url, v7];

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_url hash];
  NSUInteger v4 = self->_range.location - v3 + 32 * v3;
  return self->_range.length - v4 + 32 * v4;
}

- (BOOL)isEqualToHtmlParserHyperlink:(id)a3
{
  NSUInteger v4 = (id *)a3;
  url = self->_url;
  v6 = (NSURL *)v4[1];
  if (url == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = url;
    char v9 = [(NSURL *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      BOOL v10 = 0;
      goto LABEL_11;
    }
  }
  BOOL v10 = self->_range.location == v4[2] && self->_range.length == (void)v4[3];
LABEL_11:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (HVHtmlParserHyperlink *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(HVHtmlParserHyperlink *)self isEqualToHtmlParserHyperlink:v5];

  return v6;
}

- (HVHtmlParserHyperlink)initWithURL:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HVHtmlParserHyperlink;
  char v9 = [(HVHtmlParserHyperlink *)&v12 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    v10->_range.NSUInteger location = location;
    v10->_range.NSUInteger length = length;
  }

  return v10;
}

@end
@interface UITextItem
+ (id)_itemWithLink:(id)a3 range:(_NSRange)a4;
+ (id)_itemWithTag:(id)a3 range:(_NSRange)a4;
+ (id)_itemWithTextAttachment:(id)a3 range:(_NSRange)a4;
- (NSRange)range;
- (NSString)tagIdentifier;
- (NSTextAttachment)textAttachment;
- (NSURL)link;
- (UITextItemContentType)contentType;
- (id)_initWithType:(int64_t)a3 range:(_NSRange)a4;
@end

@implementation UITextItem

- (id)_initWithType:(int64_t)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v8.receiver = self;
  v8.super_class = (Class)UITextItem;
  id result = [(UITextItem *)&v8 init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 5) = location;
    *((void *)result + 6) = length;
  }
  return result;
}

+ (id)_itemWithLink:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  objc_super v8 = objc_msgSend(objc_alloc((Class)a1), "_initWithType:range:", 0, location, length);
  v9 = (void *)v8[2];
  v8[2] = v7;

  return v8;
}

+ (id)_itemWithTextAttachment:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  objc_super v8 = objc_msgSend(objc_alloc((Class)a1), "_initWithType:range:", 1, location, length);
  v9 = (void *)v8[3];
  v8[3] = v7;

  return v8;
}

+ (id)_itemWithTag:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  objc_super v8 = objc_msgSend(objc_alloc((Class)a1), "_initWithType:range:", 2, location, length);
  v9 = (void *)v8[4];
  v8[4] = v7;

  return v8;
}

- (UITextItemContentType)contentType
{
  return self->_contentType;
}

- (NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSURL)link
{
  return self->_link;
}

- (NSTextAttachment)textAttachment
{
  return self->_textAttachment;
}

- (NSString)tagIdentifier
{
  return self->_tagIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIdentifier, 0);
  objc_storeStrong((id *)&self->_textAttachment, 0);
  objc_storeStrong((id *)&self->_link, 0);
}

@end
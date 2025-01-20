@interface _UIDatePickerLinkedLabelCacheKey
+ (id)keyWithText:(id)a3 font:(id)a4 height:(double)a5;
- (BOOL)isEqual:(id)a3;
- (_UIDatePickerLinkedLabelCacheKey)initWithText:(id)a3 font:(id)a4 height:(double)a5;
- (unint64_t)hash;
@end

@implementation _UIDatePickerLinkedLabelCacheKey

+ (id)keyWithText:(id)a3 font:(id)a4 height:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithText:v9 font:v8 height:a5];

  return v10;
}

- (_UIDatePickerLinkedLabelCacheKey)initWithText:(id)a3 font:(id)a4 height:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIDatePickerLinkedLabelCacheKey;
  v11 = [(_UIDatePickerLinkedLabelCacheKey *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_text, a3);
    objc_storeStrong((id *)&v12->_font, a4);
    v12->_height = a5;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    NSUInteger v4 = [(NSString *)self->_text hash];
    unint64_t result = [(UIFont *)self->_font hash] ^ v4 ^ (unint64_t)self->_height;
    self->_hash = result;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (_UIDatePickerLinkedLabelCacheKey *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if ([(_UIDatePickerLinkedLabelCacheKey *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    BOOL v6 = self->_height == v5->_height
      && [(UIFont *)self->_font isEqual:v5->_font]
      && [(NSString *)self->_text isEqualToString:v5->_text];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
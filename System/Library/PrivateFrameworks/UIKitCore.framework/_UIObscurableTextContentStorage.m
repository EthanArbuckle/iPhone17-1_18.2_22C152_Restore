@interface _UIObscurableTextContentStorage
- (BOOL)isObscured;
- (NSAttributedString)obscuredAttributedString;
- (_NSRange)unobscuredRange;
- (_UIObscurableTextContentStorage)initWithTextStorage:(id)a3;
- (id)attributedString;
- (void)_invalidateObscuredAttributedString;
- (void)_validateUnobscuredRange;
- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7;
- (void)setObscured:(BOOL)a3;
- (void)setTextStorage:(id)a3;
- (void)setUnobscuredRange:(_NSRange)a3;
@end

@implementation _UIObscurableTextContentStorage

- (id)attributedString
{
  if ([(_UIObscurableTextContentStorage *)self isObscured])
  {
    v3 = [(_UIObscurableTextContentStorage *)self obscuredAttributedString];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIObscurableTextContentStorage;
    v3 = [(NSTextContentStorage *)&v5 attributedString];
  }
  return v3;
}

- (BOOL)isObscured
{
  return self->_obscured;
}

- (void)setUnobscuredRange:(_NSRange)a3
{
  p_NSRange unobscuredRange = &self->_unobscuredRange;
  NSRange unobscuredRange = self->_unobscuredRange;
  if (unobscuredRange.location != a3.location || unobscuredRange.length != a3.length)
  {
    _NSRange *p_unobscuredRange = a3;
    if (unobscuredRange.length) {
      BOOL v7 = a3.length == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (a3.length) {
        NSUInteger length = a3.length;
      }
      else {
        NSUInteger length = unobscuredRange.length;
      }
      if (a3.length) {
        NSUInteger location = a3.location;
      }
      else {
        NSUInteger location = unobscuredRange.location;
      }
    }
    else
    {
      NSRange v8 = NSUnionRange(unobscuredRange, a3);
      NSUInteger location = v8.location;
      NSUInteger length = v8.length;
    }
    id v11 = [(NSTextContentStorage *)self textStorage];
    -[_UIObscurableTextContentStorage processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:](self, "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", v11, 2, location, length, 0, location, length);
  }
}

- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v12 = a3;
  [(_UIObscurableTextContentStorage *)self _validateUnobscuredRange];
  [(_UIObscurableTextContentStorage *)self _invalidateObscuredAttributedString];
  v13.receiver = self;
  v13.super_class = (Class)_UIObscurableTextContentStorage;
  -[NSTextContentStorage processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:](&v13, sel_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange_, v12, a4, location, length, a6, a7.location, a7.length);
}

- (void)_validateUnobscuredRange
{
  v3 = [(NSTextContentStorage *)self textStorage];
  unint64_t v4 = [v3 length];

  NSUInteger location = self->_unobscuredRange.location;
  if (self->_unobscuredRange.length + location > v4)
  {
    if (location >= v4) {
      NSUInteger location = v4;
    }
    self->_unobscuredRange.NSUInteger location = location;
    self->_unobscuredRange.NSUInteger length = v4 - location;
  }
}

- (void)_invalidateObscuredAttributedString
{
  obscuredAttributedString = self->_obscuredAttributedString;
  self->_obscuredAttributedString = 0;
}

- (_UIObscurableTextContentStorage)initWithTextStorage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIObscurableTextContentStorage;
  objc_super v5 = [(NSTextContentStorage *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_UIObscurableTextContentStorage *)v5 setTextStorage:v4];
  }

  return v6;
}

- (void)setTextStorage:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  if (objc_opt_isKindOfClass()) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  objc_storeStrong((id *)&self->_cascadingTextStorage, v6);

  v7.receiver = self;
  v7.super_class = (Class)_UIObscurableTextContentStorage;
  [(NSTextContentStorage *)&v7 setTextStorage:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obscuredAttributedString, 0);
  objc_storeStrong((id *)&self->_cascadingTextStorage, 0);
}

- (NSAttributedString)obscuredAttributedString
{
  obscuredAttributedString = self->_obscuredAttributedString;
  if (!obscuredAttributedString)
  {
    v27.receiver = self;
    v27.super_class = (Class)_UIObscurableTextContentStorage;
    id v4 = [(NSTextContentStorage *)&v27 attributedString];
    objc_super v5 = objc_opt_new();
    v24 = self;
    unint64_t v6 = [(_UIObscurableTextContentStorage *)self unobscuredRange];
    unint64_t v25 = v7;
    if ([v4 length])
    {
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)off_1E52D2040;
      do
      {
        if (v6 > v8 || v8 - v6 >= v25)
        {
          id v11 = [v4 attributesAtIndex:v8 effectiveRange:0];
          v10 = (void *)[v11 mutableCopy];

          id v12 = [v10 objectForKeyedSubscript:v9];
          objc_super v13 = v12;
          if (v12)
          {
            id v14 = v12;
          }
          else
          {
            v15 = [(_UICascadingTextStorage *)v24->_cascadingTextStorage font];
            v16 = v15;
            if (v15)
            {
              id v17 = v15;
            }
            else
            {
              [off_1E52D39B8 defaultFontSize];
              objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
              id v17 = (id)objc_claimAutoreleasedReturnValue();
            }
            id v14 = v17;
          }
          id v26 = 0;
          v18 = objc_msgSend(v14, "_ui_bulletStringWithFont:", &v26);
          id v19 = v26;
          if (v19) {
            [v10 setObject:v19 forKeyedSubscript:v9];
          }
          v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v18 attributes:v10];
          [v5 appendAttributedString:v20];
        }
        else
        {
          v10 = objc_msgSend(v4, "attributedSubstringFromRange:", v8, 1);
          [v5 appendAttributedString:v10];
        }

        ++v8;
      }
      while (v8 < [v4 length]);
    }
    uint64_t v21 = [v5 copy];
    v22 = v24->_obscuredAttributedString;
    v24->_obscuredAttributedString = (NSAttributedString *)v21;

    obscuredAttributedString = v24->_obscuredAttributedString;
  }
  return obscuredAttributedString;
}

- (void)setObscured:(BOOL)a3
{
  if (self->_obscured != a3)
  {
    self->_obscured = a3;
    id v5 = [(NSTextContentStorage *)self textStorage];
    uint64_t v4 = [v5 length];
    -[_UIObscurableTextContentStorage processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:](self, "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", v5, 2, 0, v4, 0, 0, v4);
  }
}

- (_NSRange)unobscuredRange
{
  p_NSRange unobscuredRange = &self->_unobscuredRange;
  NSUInteger location = self->_unobscuredRange.location;
  NSUInteger length = p_unobscuredRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end
@interface _UITextFieldEditingToken
- (BOOL)endEditing;
- (BOOL)restoreDefaultAttributes;
- (BOOL)restoreTextAttributes;
- (NSArray)attributeNames;
- (_UICascadingTextStorage)textStorage;
- (_UITextFieldEditingToken)initWithTextStorage:(id)a3 attributeNames:(id)a4;
- (void)setRestoreDefaultAttributes:(BOOL)a3;
- (void)setRestoreTextAttributes:(BOOL)a3;
@end

@implementation _UITextFieldEditingToken

- (_UITextFieldEditingToken)initWithTextStorage:(id)a3 attributeNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UITextFieldEditingToken;
  v8 = [(_UITextFieldEditingToken *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_textStorage, v6);
    uint64_t v10 = [v7 copy];
    attributeNames = v9->_attributeNames;
    v9->_attributeNames = (NSArray *)v10;
  }
  return v9;
}

- (BOOL)endEditing
{
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    NSUInteger v3 = [(NSArray *)self->_attributeNames count];
    if (v3)
    {
      char flags = (char)self->_flags;
      *(unsigned char *)&self->_char flags = flags | 4;
      if (flags)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_textStorage);
        uint64_t v6 = [WeakRetained length];

        if (v6)
        {
          id v7 = objc_loadWeakRetained((id *)&self->_textStorage);
          [v7 coordinateAccess:&__block_literal_global_575];
        }
      }
      char v8 = (char)self->_flags;
      if ((v8 & 2) != 0)
      {
        id v9 = objc_loadWeakRetained((id *)&self->_textStorage);
        [v9 coordinateAccess:&__block_literal_global_22_4];

        char v8 = (char)self->_flags;
      }
      LOBYTE(v3) = (v8 & 3) != 0;
    }
  }
  return v3;
}

- (BOOL)restoreTextAttributes
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)setRestoreTextAttributes:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)restoreDefaultAttributes
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)setRestoreDefaultAttributes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (_UICascadingTextStorage)textStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textStorage);
  return (_UICascadingTextStorage *)WeakRetained;
}

- (NSArray)attributeNames
{
  return self->_attributeNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeNames, 0);
  objc_destroyWeak((id *)&self->_textStorage);
}

@end
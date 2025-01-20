@interface _UITextFieldDrawingBackgroundProvider
- (BOOL)drawsContent;
- (_UITextFieldDrawingBackgroundProvider)init;
- (void)_buildDescription:(id)a3;
- (void)_setDrawsContent:(BOOL)a3;
- (void)addToTextField:(id)a3;
- (void)drawInBounds:(CGRect)a3;
- (void)removeFromTextField;
- (void)setDrawsContent:(BOOL)a3;
- (void)setDrawsContentBasedOnTraitsIfNeeded;
- (void)setNeedsDisplay;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _UITextFieldDrawingBackgroundProvider

- (_UITextFieldDrawingBackgroundProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  result = [(_UITextFieldDrawingBackgroundProvider *)&v3 init];
  if (result) {
    *((unsigned char *)&result->_flags + 1) = 1;
  }
  return result;
}

- (void)setDrawsContent:(BOOL)a3
{
  *(unsigned char *)&self->_flags &= ~1u;
  [(_UITextFieldDrawingBackgroundProvider *)self _setDrawsContent:a3];
}

- (void)_setDrawsContent:(BOOL)a3
{
  *(unsigned char *)&self->_flags &= ~1u;
  if (*((unsigned char *)&self->_flags + 1) != a3)
  {
    BOOL v3 = a3;
    *((unsigned char *)&self->_flags + 1) = a3;
    v4 = [(_UITextFieldBackgroundProvider *)self textField];
    id v6 = v4;
    if (v3)
    {
      [v4 setNeedsDisplay];
    }
    else
    {
      v5 = [v4 layer];
      [v5 setContents:0];
    }
  }
}

- (void)setDrawsContentBasedOnTraitsIfNeeded
{
  BOOL v3 = [(_UITextFieldBackgroundProvider *)self textField];
  if ((*(unsigned char *)&self->_flags & 1) != 0 && v3)
  {
    id v7 = v3;
    v4 = [v3 traitCollection];
    v5 = v4;
    if (v4) {
      BOOL v6 = [v4 userInterfaceIdiom] != 2;
    }
    else {
      BOOL v6 = 1;
    }
    [(_UITextFieldDrawingBackgroundProvider *)self setDrawsContent:v6];

    BOOL v3 = v7;
  }
}

- (void)addToTextField:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  [(_UITextFieldBackgroundProvider *)&v5 addToTextField:v4];
  [(_UITextFieldDrawingBackgroundProvider *)self setDrawsContentBasedOnTraitsIfNeeded];
  if ([(_UITextFieldDrawingBackgroundProvider *)self drawsContent]) {
    [v4 setNeedsDisplay];
  }
}

- (void)removeFromTextField
{
  if ([(_UITextFieldDrawingBackgroundProvider *)self drawsContent])
  {
    BOOL v3 = [(_UITextFieldBackgroundProvider *)self textField];
    id v4 = [v3 layer];
    [v4 setContents:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  [(_UITextFieldBackgroundProvider *)&v5 removeFromTextField];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  [(_UITextFieldBackgroundProvider *)&v4 traitCollectionDidChange:a3];
  [(_UITextFieldDrawingBackgroundProvider *)self setDrawsContentBasedOnTraitsIfNeeded];
}

- (void)drawInBounds:(CGRect)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___UITextFieldDrawingBackgroundProvider_drawInBounds___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  if (drawInBounds__once != -1) {
    dispatch_once(&drawInBounds__once, block);
  }
}

- (void)setNeedsDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  [(_UITextFieldBackgroundProvider *)&v4 setNeedsDisplay];
  BOOL v3 = [(_UITextFieldBackgroundProvider *)self textField];
  [v3 setNeedsDisplay];
}

- (void)_buildDescription:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  [(_UITextFieldBackgroundProvider *)&v9 _buildDescription:v4];
  if (*((unsigned char *)&self->_flags + 1)) {
    objc_super v5 = @"yes";
  }
  else {
    objc_super v5 = @"no";
  }
  if (*(unsigned char *)&self->_flags) {
    BOOL v6 = @", based on traits";
  }
  else {
    BOOL v6 = &stru_1ED0E84C0;
  }
  id v7 = [NSString stringWithFormat:@"%@%@", v5, v6];
  id v8 = (id)[v4 appendName:@"drawsContent" object:v7];
}

- (BOOL)drawsContent
{
  return *((unsigned char *)&self->_flags + 1);
}

@end
@interface SUUICommentPostBarTextField
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (CGRect)editingRectForBounds:(CGRect)result;
- (CGRect)textRectForBounds:(CGRect)result;
@end

@implementation SUUICommentPostBarTextField

- (BOOL)becomeFirstResponder
{
  v3 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  [(SUUICommentPostBarTextField *)self setBackgroundColor:v3];

  v5.receiver = self;
  v5.super_class = (Class)SUUICommentPostBarTextField;
  return [(SUUICommentPostBarTextField *)&v5 becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  v3 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
  [(SUUICommentPostBarTextField *)self setBackgroundColor:v3];

  v5.receiver = self;
  v5.super_class = (Class)SUUICommentPostBarTextField;
  return [(SUUICommentPostBarTextField *)&v5 resignFirstResponder];
}

- (CGRect)textRectForBounds:(CGRect)result
{
  double v3 = result.size.width + -20.0;
  double v4 = 10.0;
  result.size.width = v3;
  result.origin.x = v4;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)result
{
  double v3 = result.size.width + -20.0;
  double v4 = 10.0;
  result.size.width = v3;
  result.origin.x = v4;
  return result;
}

@end
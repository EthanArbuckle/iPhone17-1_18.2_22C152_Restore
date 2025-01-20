@interface UITextFieldLabel
+ (id)_defaultAttributes;
+ (id)defaultFont;
- (BOOL)_shouldDrawUnderlinesLikeWebKit;
- (BOOL)shouldRenderWithoutTextField;
- (void)_defaultDrawTextInRect:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
- (void)setShouldRenderWithoutTextField:(BOOL)a3;
@end

@implementation UITextFieldLabel

+ (id)defaultFont
{
  [off_1E52D39B8 defaultFontSize];
  return (id)objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  v8 = v7;
  while (1)
  {
    v9 = v8;
    v8 = [v8 superview];

    if (!v8) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v8, "_drawTextInRect:forLabel:", v7, x, y, width, height);
      goto LABEL_7;
    }
  }
  if ([(UITextFieldLabel *)v7 shouldRenderWithoutTextField])
  {
    v10.receiver = v7;
    v10.super_class = (Class)UITextFieldLabel;
    -[UILabel drawTextInRect:](&v10, sel_drawTextInRect_, x, y, width, height);
  }
LABEL_7:
}

- (void)_defaultDrawTextInRect:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UITextFieldLabel;
  -[UILabel drawTextInRect:](&v3, sel_drawTextInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

void __38__UITextFieldLabel__defaultAttributes__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___UITextFieldLabel;
  uint64_t v1 = objc_msgSendSuper2(&v3, sel__defaultAttributes);
  v2 = (void *)qword_1EB264698;
  qword_1EB264698 = v1;
}

+ (id)_defaultAttributes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__UITextFieldLabel__defaultAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1257 != -1) {
    dispatch_once(&_MergedGlobals_1257, block);
  }
  v2 = (void *)qword_1EB264698;
  return v2;
}

- (BOOL)_shouldDrawUnderlinesLikeWebKit
{
  return 1;
}

- (BOOL)shouldRenderWithoutTextField
{
  return self->_shouldRenderWithoutTextField;
}

- (void)setShouldRenderWithoutTextField:(BOOL)a3
{
  self->_shouldRenderWithoutTextField = a3;
}

@end
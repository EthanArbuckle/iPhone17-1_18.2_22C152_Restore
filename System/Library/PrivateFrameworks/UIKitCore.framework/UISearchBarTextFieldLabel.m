@interface UISearchBarTextFieldLabel
+ (id)_defaultAttributes;
- (BOOL)ignoresGeometryChanges;
- (void)setFrame:(CGRect)a3;
- (void)setIgnoresGeometryChanges:(BOOL)a3;
@end

@implementation UISearchBarTextFieldLabel

+ (id)_defaultAttributes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__UISearchBarTextFieldLabel__defaultAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_29_1 != -1) {
    dispatch_once(&_MergedGlobals_29_1, block);
  }
  v2 = (void *)qword_1EB25C3B8;
  return v2;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(UISearchBarTextFieldLabel *)self ignoresGeometryChanges])
  {
    v8.receiver = self;
    v8.super_class = (Class)UISearchBarTextFieldLabel;
    -[UILabel setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (BOOL)ignoresGeometryChanges
{
  return *(&self->super._shouldRenderWithoutTextField + 1);
}

void __47__UISearchBarTextFieldLabel__defaultAttributes__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___UISearchBarTextFieldLabel;
  uint64_t v1 = objc_msgSendSuper2(&v3, sel__defaultAttributes);
  v2 = (void *)qword_1EB25C3B8;
  qword_1EB25C3B8 = v1;
}

- (void)setIgnoresGeometryChanges:(BOOL)a3
{
  *(&self->super._shouldRenderWithoutTextField + 1) = a3;
}

@end
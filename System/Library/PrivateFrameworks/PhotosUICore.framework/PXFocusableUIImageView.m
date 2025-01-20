@interface PXFocusableUIImageView
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)allowsFocus;
- (BOOL)canBecomeFocused;
- (BOOL)drawsFocusRing;
- (BOOL)reusable;
- (PXFocusableUIImageView)initWithCoder:(id)a3;
- (PXFocusableUIImageView)initWithFrame:(CGRect)a3;
- (id)focusEffect;
- (void)setAllowsFocus:(BOOL)a3;
- (void)setDrawsFocusRing:(BOOL)a3;
- (void)setReusable:(BOOL)a3;
@end

@implementation PXFocusableUIImageView

- (void)setReusable:(BOOL)a3
{
  self->_reusable = a3;
}

- (BOOL)reusable
{
  return self->_reusable;
}

- (void)setDrawsFocusRing:(BOOL)a3
{
  self->_drawsFocusRing = a3;
}

- (BOOL)drawsFocusRing
{
  return self->_drawsFocusRing;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (id)focusEffect
{
  if ([(PXFocusableUIImageView *)self drawsFocusRing])
  {
    v3 = (void *)MEMORY[0x1E4FB1788];
    [(PXFocusableUIImageView *)self bounds];
    v4 = objc_msgSend(v3, "effectWithRect:");
    [v4 setPosition:2];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)canBecomeFocused
{
  return self->_allowsFocus;
}

- (BOOL)_isEligibleForFocusInteraction
{
  if ([(PXFocusableUIImageView *)self isUserInteractionEnabled])
  {
    v3 = [(PXFocusableUIImageView *)self window];
    if (v3) {
      BOOL v4 = ![(PXFocusableUIImageView *)self reusable];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (PXFocusableUIImageView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXFocusableUIImageView;
  v3 = [(PXFocusableUIImageView *)&v6 initWithCoder:a3];
  BOOL v4 = v3;
  if (v3)
  {
    v3->_allowsFocus = 1;
    [(PXFocusableUIImageView *)v3 setUserInteractionEnabled:1];
  }
  return v4;
}

- (PXFocusableUIImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXFocusableUIImageView;
  v3 = -[PXFocusableUIImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    v3->_allowsFocus = 1;
    [(PXFocusableUIImageView *)v3 setUserInteractionEnabled:1];
  }
  return v4;
}

@end
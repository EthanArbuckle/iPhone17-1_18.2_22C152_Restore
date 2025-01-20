@interface PXGFocusableView
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)canBecomeFocused;
- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4;
- (CGRect)clippingRect;
- (PXGFocusableViewConfiguration)userData;
- (id)description;
- (void)addHostedLayer:(id)a3;
- (void)didHintFocusMovement:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXGFocusableView

- (void).cxx_destruct
{
}

- (PXGFocusableViewConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(PXGFocusableView *)self layer];
  objc_msgSend(v8, "convertPoint:fromLayer:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)addHostedLayer:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGFocusableView *)self layer];
  [v5 addSublayer:v4];
}

- (void)setUserData:(id)a3
{
  v15 = (PXGFocusableViewConfiguration *)a3;
  id v4 = self->_userData;
  id v5 = v15;
  if (v4 != v15)
  {
    v6 = v4;
    BOOL v7 = [(PXGFocusableViewConfiguration *)v4 isEqual:v15];

    if (v7) {
      goto LABEL_12;
    }
    v8 = (PXGFocusableViewConfiguration *)[(PXGFocusableViewConfiguration *)v15 copy];
    userData = self->_userData;
    self->_userData = v8;

    [(PXGFocusableView *)self setNeedsLayout];
    double v10 = [(PXGFocusableView *)self userData];
    id v5 = [v10 delegate];

    *(unsigned char *)&self->_char delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v11 = 2;
    }
    else {
      char v11 = 0;
    }
    *(unsigned char *)&self->_char delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v11;
    char v12 = objc_opt_respondsToSelector();
    char delegateFlags = (char)self->_delegateFlags;
    if (v12) {
      char v14 = 4;
    }
    else {
      char v14 = 0;
    }
    *(unsigned char *)&self->_char delegateFlags = delegateFlags & 0xFB | v14;
    if (delegateFlags) {
      [v5 focusableViewDidUpdateUserInfo:self];
    }
  }

LABEL_12:
}

- (void)didHintFocusMovement:(id)a3
{
  if ((*(unsigned char *)&self->_delegateFlags & 4) != 0)
  {
    id v4 = a3;
    id v6 = [(PXGFocusableView *)self userData];
    id v5 = [v6 delegate];
    [v5 focusableView:self didHintFocusMovement:v4];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  if ((*(unsigned char *)&self->_delegateFlags & 2) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v9 = [(PXGFocusableView *)self userData];
    v8 = [v9 delegate];
    [v8 focusableView:self didUpdateFocusInContext:v7 withAnimationCoordinator:v6];
  }
}

- (BOOL)canBecomeFocused
{
  id v4 = [(PXGFocusableView *)self userData];
  uint64_t v5 = [v4 focusability];

  if (!v5) {
    return 1;
  }
  if (v5 != 1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXGFocusableView.m" lineNumber:117 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 0;
}

- (BOOL)_isEligibleForFocusInteraction
{
  id v4 = [(PXGFocusableView *)self userData];
  uint64_t v5 = [v4 focusability];

  if (v5 == 1) {
    return 0;
  }
  if (v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXGFocusableView.m" lineNumber:106 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8.receiver = self;
  v8.super_class = (Class)PXGFocusableView;
  return [(PXGFocusableView *)&v8 _isEligibleForFocusInteraction];
}

- (id)description
{
  v3 = [(PXGFocusableView *)self userData];
  uint64_t v4 = [v3 focusability];
  uint64_t v5 = [v3 debugName];
  id v6 = objc_alloc(MEMORY[0x1E4F28E78]);
  if (v4)
  {
    if (v4 != 1)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"NSString *PXGFocusableViewFocusabilityDescription(PXGFocusableViewFocusability)"];
      [v16 handleFailureInFunction:v17 file:@"PXGFocusableView.m" lineNumber:22 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v7 = @"Invisible";
  }
  else
  {
    id v7 = @"Default";
  }
  v8 = (void *)[v6 initWithFormat:@"; focusabilitdouble y = %@", v7];
  id v9 = v8;
  if (v5) {
    [v8 appendFormat:@"; debugName = '%@'", v5];
  }
  v18.receiver = self;
  v18.super_class = (Class)PXGFocusableView;
  double v10 = [(PXGFocusableView *)&v18 description];
  char v11 = (void *)[v10 mutableCopy];
  char v12 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 59, 1);
  uint64_t v13 = [v10 rangeOfCharacterFromSet:v12];

  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    [v11 appendString:v9];
  }
  else {
    [v11 insertString:v9 atIndex:v13];
  }
  char v14 = (void *)[v11 copy];

  return v14;
}

@end
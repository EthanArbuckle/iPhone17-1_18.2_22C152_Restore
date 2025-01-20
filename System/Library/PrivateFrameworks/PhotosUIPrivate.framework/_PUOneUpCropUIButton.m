@interface _PUOneUpCropUIButton
- (BOOL)isBeingTouched;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_PUOneUpCropUIButtonDelegate)delegate;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setBeingTouched:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _PUOneUpCropUIButton

- (void).cxx_destruct
{
}

- (void)setBeingTouched:(BOOL)a3
{
  self->_beingTouched = a3;
}

- (BOOL)isBeingTouched
{
  return self->_beingTouched;
}

- (void)setDelegate:(id)a3
{
}

- (_PUOneUpCropUIButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_PUOneUpCropUIButtonDelegate *)WeakRetained;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)_PUOneUpCropUIButton;
  BOOL v7 = -[_PUOneUpCropUIButton pointInside:withEvent:](&v13, sel_pointInside_withEvent_, a4);
  [(_PUOneUpCropUIButton *)self bounds];
  if (!CGRectIsEmpty(v15))
  {
    PXEdgeInsetsInvert();
    PXEdgeInsetsInsetRect();
    if (v7)
    {
      return 1;
    }
    else
    {
      v14.CGFloat x = x;
      v14.CGFloat y = y;
      return CGRectContainsPoint(*(CGRect *)&v8, v14);
    }
  }
  return v7;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_PUOneUpCropUIButton;
  [(_PUOneUpCropUIButton *)&v5 touchesCancelled:a3 withEvent:a4];
  [(_PUOneUpCropUIButton *)self setBeingTouched:0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_PUOneUpCropUIButton;
  [(_PUOneUpCropUIButton *)&v5 touchesEnded:a3 withEvent:a4];
  [(_PUOneUpCropUIButton *)self setBeingTouched:0];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_PUOneUpCropUIButton;
  [(_PUOneUpCropUIButton *)&v5 touchesBegan:a3 withEvent:a4];
  [(_PUOneUpCropUIButton *)self setBeingTouched:1];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)_PUOneUpCropUIButton;
  [(_PUOneUpCropUIButton *)&v7 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:a5];
  v6 = [(_PUOneUpCropUIButton *)self delegate];
  [v6 oneUpCropUIButton:self menuPresentedDidChange:0];
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)_PUOneUpCropUIButton;
  [(_PUOneUpCropUIButton *)&v7 contextMenuInteraction:a3 willDisplayMenuForConfiguration:a4 animator:a5];
  v6 = [(_PUOneUpCropUIButton *)self delegate];
  [v6 oneUpCropUIButton:self menuPresentedDidChange:1];
}

@end
@interface _NTKEFaceChoiceHighlightButton
- (_NTKEFaceChoiceHighlightButtonDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation _NTKEFaceChoiceHighlightButton

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_NTKEFaceChoiceHighlightButton;
  -[_NTKEFaceChoiceHighlightButton setHighlighted:](&v6, "setHighlighted:");
  v5 = [(_NTKEFaceChoiceHighlightButton *)self delegate];
  [v5 button:self didHighlight:v3];
}

- (_NTKEFaceChoiceHighlightButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_NTKEFaceChoiceHighlightButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
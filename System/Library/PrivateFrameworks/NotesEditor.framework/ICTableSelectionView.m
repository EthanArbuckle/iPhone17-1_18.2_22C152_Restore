@interface ICTableSelectionView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)resignFirstResponder;
- (BOOL)shouldAvoidResigningFirstResponder;
- (ICTableSelectionDelegate)delegate;
- (ICTableSelectionView)initWithFrame:(CGRect)a3;
- (id)keyCommands;
- (void)addColumnLeft:(id)a3;
- (void)addColumnRight:(id)a3;
- (void)addRowDown:(id)a3;
- (void)addRowUp:(id)a3;
- (void)deletePressed:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setShouldAvoidResigningFirstResponder:(BOOL)a3;
- (void)strikethrough:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
@end

@implementation ICTableSelectionView

- (ICTableSelectionView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICTableSelectionView;
  v3 = -[ICTableSelectionView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(ICTableSelectionView *)v3 layer];
    [v5 setBorderWidth:2.0];

    uint64_t v6 = *MEMORY[0x263F15A20];
    v7 = [(ICTableSelectionView *)v4 layer];
    [v7 setCornerCurve:v6];

    v8 = [(ICTableSelectionView *)v4 layer];
    [v8 setCornerRadius:2.0];

    [(ICTableSelectionView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)ICTableSelectionView;
  [(ICTableSelectionView *)&v6 layoutSubviews];
  id v3 = [(ICTableSelectionView *)self tintColor];
  uint64_t v4 = [v3 CGColor];
  v5 = [(ICTableSelectionView *)self layer];
  [v5 setBorderColor:v4];
}

- (void)toggleBoldface:(id)a3
{
  id v4 = a3;
  id v6 = [(ICTableSelectionView *)self delegate];
  v5 = [v6 auxiliaryStylingController];
  [v5 toggleBoldface:v4];
}

- (void)toggleItalics:(id)a3
{
  id v4 = a3;
  id v6 = [(ICTableSelectionView *)self delegate];
  v5 = [v6 auxiliaryStylingController];
  [v5 toggleItalics:v4];
}

- (void)toggleUnderline:(id)a3
{
  id v4 = a3;
  id v6 = [(ICTableSelectionView *)self delegate];
  v5 = [v6 auxiliaryStylingController];
  [v5 toggleUnderline:v4];
}

- (void)strikethrough:(id)a3
{
  id v4 = a3;
  id v6 = [(ICTableSelectionView *)self delegate];
  v5 = [v6 auxiliaryStylingController];
  [v5 toggleStrikethrough:v4];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  id v3 = [(ICTableSelectionView *)self delegate];
  [v3 selectionWillBecomeFirstResponder:self];

  v5.receiver = self;
  v5.super_class = (Class)ICTableSelectionView;
  return [(ICTableSelectionView *)&v5 becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  if ([(ICTableSelectionView *)self shouldAvoidResigningFirstResponder])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ICTableSelectionView;
    BOOL v3 = [(ICTableSelectionView *)&v6 resignFirstResponder];
    if (v3)
    {
      id v4 = [(ICTableSelectionView *)self delegate];
      [v4 selectionDidResignFirstResponder:self];

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ICTableSelectionView;
  BOOL v6 = [(ICTableSelectionView *)&v11 canPerformAction:a3 withSender:a4];
  v7 = [(ICTableSelectionView *)self delegate];
  int v8 = [v7 isShowingTextStyleOptions];

  if (v8) {
    return sel_toggleBoldface_ == a3 || sel_toggleItalics_ == a3 || sel_toggleUnderline_ == a3;
  }
  return v6;
}

- (id)keyCommands
{
  v10[6] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83770] modifierFlags:1572864 action:sel_addRowUp_];
  v10[0] = v2;
  BOOL v3 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83750] modifierFlags:1572864 action:sel_addRowDown_];
  v10[1] = v3;
  id v4 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83760] modifierFlags:1572864 action:sel_addColumnLeft_];
  v10[2] = v4;
  objc_super v5 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83768] modifierFlags:1572864 action:sel_addColumnRight_];
  v10[3] = v5;
  BOOL v6 = [MEMORY[0x263F82890] keyCommandWithInput:@"c" modifierFlags:0x100000 action:sel_copy_];
  v10[4] = v6;
  v7 = [MEMORY[0x263F82890] keyCommandWithInput:@"\b" modifierFlags:0 action:sel_deletePressed_];
  v10[5] = v7;
  int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:6];

  return v8;
}

- (void)addRowUp:(id)a3
{
  id v4 = [(ICTableSelectionView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICTableSelectionView *)self delegate];
    [v6 addRowAboveSelection:self];
  }
}

- (void)addRowDown:(id)a3
{
  id v4 = [(ICTableSelectionView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICTableSelectionView *)self delegate];
    [v6 addRowBelowSelection:self];
  }
}

- (void)addColumnLeft:(id)a3
{
  id v4 = [(ICTableSelectionView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICTableSelectionView *)self delegate];
    [v6 addColumnLeftOfSelection:self];
  }
}

- (void)addColumnRight:(id)a3
{
  id v4 = [(ICTableSelectionView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICTableSelectionView *)self delegate];
    [v6 addColumnRightOfSelection:self];
  }
}

- (void)deletePressed:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableSelectionView *)self delegate];
  [v5 deleteSelection:v4];
}

- (ICTableSelectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICTableSelectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldAvoidResigningFirstResponder
{
  return self->_shouldAvoidResigningFirstResponder;
}

- (void)setShouldAvoidResigningFirstResponder:(BOOL)a3
{
  self->_shouldAvoidResigningFirstResponder = a3;
}

- (void).cxx_destruct
{
}

@end
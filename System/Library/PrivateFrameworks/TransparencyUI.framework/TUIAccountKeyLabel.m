@interface TUIAccountKeyLabel
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (void)copy:(id)a3;
@end

@implementation TUIAccountKeyLabel

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (NSSelectorFromString(&cfstr_Define.isa) == a3)
  {
    BOOL v7 = 0;
  }
  else if (sel_copy_ == a3)
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TUIAccountKeyLabel;
    BOOL v7 = [(TUIAccountKeyLabel *)&v9 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)copy:(id)a3
{
  objc_msgSend(MEMORY[0x263F1C840], "generalPasteboard", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(TUIAccountKeyLabel *)self text];
  [v5 setString:v4];
}

@end
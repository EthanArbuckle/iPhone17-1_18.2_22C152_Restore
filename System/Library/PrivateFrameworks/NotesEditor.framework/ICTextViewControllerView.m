@interface ICTextViewControllerView
- (ICTextView)textView;
- (ICTextViewControllerView)initWithTextView:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation ICTextViewControllerView

- (ICTextViewControllerView)initWithTextView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextViewControllerView;
  v6 = -[ICTextViewControllerView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_textView, a3);
  }

  return v7;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(ICTextViewControllerView *)self textView];
  [v8 frame];
  double v10 = v9;

  v11 = [(ICTextViewControllerView *)self textView];
  [v11 frame];
  double v13 = v12;

  if ((([(ICTextViewControllerView *)self ic_isRTL] & 1) != 0 || x >= v10)
    && (![(ICTextViewControllerView *)self ic_isRTL] || x <= v10 + v13))
  {
    v17.receiver = self;
    v17.super_class = (Class)ICTextViewControllerView;
    uint64_t v14 = -[ICTextViewControllerView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
  }
  else
  {
    uint64_t v14 = [(ICTextViewControllerView *)self textView];
  }
  v15 = (void *)v14;

  return v15;
}

- (ICTextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
}

@end
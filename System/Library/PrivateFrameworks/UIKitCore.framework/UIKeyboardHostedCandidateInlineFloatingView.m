@interface UIKeyboardHostedCandidateInlineFloatingView
- (BOOL)hostInlineRectIsVertical;
- (BOOL)shouldExtendUpwards;
- (UIKeyboardHostedCandidateInlineFloatingView)initWithContainer:(id)a3 delegate:(id)a4;
- (UIKeyboardHostedCandidateInlineFloatingViewDelegate)delegate;
- (void)hostIsTextVerticalDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation UIKeyboardHostedCandidateInlineFloatingView

- (BOOL)hostInlineRectIsVertical
{
  v2 = self;
  char v3 = sub_1859E6A64();

  return v3 & 1;
}

- (UIKeyboardHostedCandidateInlineFloatingView)initWithContainer:(id)a3 delegate:(id)a4
{
  v33[4] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)UIKeyboardHostedCandidateInlineFloatingView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v9 = a4;
  id v10 = a3;
  v11 = -[UIKeyboardCandidateInlineFloatingView initWithFrame:](&v32, sel_initWithFrame_, v5, v6, v7, v8);
  [(UIView *)v11 setClipsToBounds:1];
  [v10 addSubview:v11];
  [(UIView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIKeyboardHostedCandidateInlineFloatingView *)v11 setDelegate:v9];

  v12 = +[UIColor clearColor];
  [(UIView *)v11 setBackgroundColor:v12];

  v13 = +[UIColor systemBackgroundColor];
  [v10 setBackgroundColor:v13];

  v14 = [v10 layer];
  [v14 setCornerRadius:22.0];

  v15 = [(UIView *)v11 layer];
  [v15 setCornerRadius:18.0];

  v27 = (void *)MEMORY[0x1E4F5B268];
  v31 = [(UIView *)v11 topAnchor];
  v30 = [v10 topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:4.0];
  v33[0] = v29;
  v28 = [(UIView *)v11 leadingAnchor];
  v16 = [v10 leadingAnchor];
  v17 = [v28 constraintEqualToAnchor:v16 constant:4.0];
  v33[1] = v17;
  v18 = [(UIView *)v11 trailingAnchor];
  v19 = [v10 trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:-4.0];
  v33[2] = v20;
  v21 = [(UIView *)v11 bottomAnchor];
  v22 = [v10 bottomAnchor];

  v23 = [v21 constraintEqualToAnchor:v22 constant:-4.0];
  v33[3] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  [v27 activateConstraints:v24];

  v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 addObserver:v11 selector:sel_hostIsTextVerticalDidChange_ name:@"_UIKeyboardCandidateInlineFloatingViewHostIsTextVerticalDidChangeNotification" object:0];

  return v11;
}

- (BOOL)shouldExtendUpwards
{
  return 0;
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardHostedCandidateInlineFloatingView;
  -[UIView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(UIKeyboardHostedCandidateInlineFloatingView *)self delegate];
  [v4 hostedInlineFloatingViewFrameUpdated];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardHostedCandidateInlineFloatingView;
  -[UIView setHidden:](&v7, sel_setHidden_);
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v8 = @"_UIKeyboardCandidateInlineFloatingViewHiddenDidChangeHiddenKey";
  objc_super v5 = [NSNumber numberWithBool:v3];
  v9[0] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 postNotificationName:@"_UIKeyboardCandidateInlineFloatingViewHiddenDidChangeNotification" object:0 userInfo:v6];
}

- (void)hostIsTextVerticalDidChange:(id)a3
{
  id v7 = [a3 userInfo];
  v4 = [v7 objectForKeyedSubscript:@"isVertical"];
  uint64_t v5 = [v4 BOOLValue];

  double v6 = [(UIKeyboardHostedCandidateInlineFloatingView *)self delegate];
  [v6 hostedInlineFloatingViewIsTextVerticalUpdated:v5];
}

- (UIKeyboardHostedCandidateInlineFloatingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardHostedCandidateInlineFloatingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
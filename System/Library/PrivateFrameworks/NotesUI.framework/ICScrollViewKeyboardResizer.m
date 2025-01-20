@interface ICScrollViewKeyboardResizer
- (BOOL)didResizeScrollView;
- (BOOL)fullyShowingKeyboard;
- (BOOL)isAutoResizing;
- (BOOL)isObservingKeyboardNotifications;
- (BOOL)showingKeyboard;
- (ICScrollViewKeyboardResizer)init;
- (ICScrollViewKeyboardResizer)initWithDelegate:(id)a3;
- (ICScrollViewKeyboardResizerDelegate)delegate;
- (UIScrollView)scrollView;
- (void)applyInsetsFromKeyboardFrame:(CGRect)a3 duration:(double)a4;
- (void)clearInsetsWithDuration:(double)a3;
- (void)dealloc;
- (void)handleKeyboardDidShow:(id)a3;
- (void)handleKeyboardWillHide:(id)a3;
- (void)handleKeyboardWillShow:(id)a3;
- (void)reapplyInsets;
- (void)setAutoResizing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidResizeScrollView:(BOOL)a3;
- (void)setFullyShowingKeyboard:(BOOL)a3;
- (void)setObservingKeyboardNotifications:(BOOL)a3;
- (void)setShowingKeyboard:(BOOL)a3;
- (void)startAutoResizing;
- (void)stopAutoResizing;
@end

@implementation ICScrollViewKeyboardResizer

- (BOOL)isAutoResizing
{
  return self->_autoResizing;
}

- (void)startAutoResizing
{
  v3 = [(ICScrollViewKeyboardResizer *)self scrollView];
  [v3 layoutIfNeeded];

  if (![(ICScrollViewKeyboardResizer *)self isObservingKeyboardNotifications])
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel_handleKeyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel_handleKeyboardDidShow_ name:*MEMORY[0x1E4FB2BC8] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel_handleKeyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

    [(ICScrollViewKeyboardResizer *)self setObservingKeyboardNotifications:1];
  }
  id v17 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  v7 = [v17 window];

  if (v7)
  {
    v8 = +[ICKeyboardNotificationListener sharedListener];
    [v8 currentKeyboardFrame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    -[ICScrollViewKeyboardResizer applyInsetsFromKeyboardFrame:duration:](self, "applyInsetsFromKeyboardFrame:duration:", v10, v12, v14, v16, 0.0);
  }
  else if ([(ICScrollViewKeyboardResizer *)self didResizeScrollView])
  {
    [(ICScrollViewKeyboardResizer *)self clearInsetsWithDuration:0.0];
  }
  [(ICScrollViewKeyboardResizer *)self setAutoResizing:1];
}

- (void)setObservingKeyboardNotifications:(BOOL)a3
{
  self->_observingKeyboardNotifications = a3;
}

- (void)setAutoResizing:(BOOL)a3
{
  self->_autoResizing = a3;
}

- (UIScrollView)scrollView
{
  v2 = [(ICScrollViewKeyboardResizer *)self delegate];
  v3 = [v2 keyboardResizerScrollView];

  return (UIScrollView *)v3;
}

- (BOOL)isObservingKeyboardNotifications
{
  return self->_observingKeyboardNotifications;
}

- (BOOL)didResizeScrollView
{
  return self->_didResizeScrollView;
}

- (ICScrollViewKeyboardResizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICScrollViewKeyboardResizerDelegate *)WeakRetained;
}

- (ICScrollViewKeyboardResizer)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICScrollViewKeyboardResizer;
  v5 = [(ICScrollViewKeyboardResizer *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = +[ICKeyboardNotificationListener sharedListener];
  }

  return v6;
}

- (ICScrollViewKeyboardResizer)init
{
  return [(ICScrollViewKeyboardResizer *)self initWithDelegate:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICScrollViewKeyboardResizer;
  [(ICScrollViewKeyboardResizer *)&v4 dealloc];
}

- (void)stopAutoResizing
{
  if ([(ICScrollViewKeyboardResizer *)self isObservingKeyboardNotifications])
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];

    [(ICScrollViewKeyboardResizer *)self setObservingKeyboardNotifications:0];
  }
  [(ICScrollViewKeyboardResizer *)self setAutoResizing:0];
}

- (void)reapplyInsets
{
  id v13 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  v3 = [v13 window];

  if (v3)
  {
    objc_super v4 = +[ICKeyboardNotificationListener sharedListener];
    [v4 currentKeyboardFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    -[ICScrollViewKeyboardResizer applyInsetsFromKeyboardFrame:duration:](self, "applyInsetsFromKeyboardFrame:duration:", v6, v8, v10, v12, 0.0);
  }
  else
  {
    [(ICScrollViewKeyboardResizer *)self clearInsetsWithDuration:0.0];
  }
}

- (void)applyInsetsFromKeyboardFrame:(CGRect)a3 duration:(double)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = [(ICScrollViewKeyboardResizer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v10 = [(ICScrollViewKeyboardResizer *)self delegate];
    int v11 = [v10 keyboardResizerAutoscrollAboveKeyboard];

    double v12 = 0.0;
    if (v11)
    {
      int v13 = objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isLargeiPad");
      double v12 = 60.0;
      if (v13) {
        double y = y + -60.0;
      }
      else {
        double v12 = 0.0;
      }
      if (v13) {
        double height = height + 60.0;
      }
    }
  }
  else
  {

    double v12 = 0.0;
  }
  double v75 = v12;
  if (!ICInternalSettingsIsTextKit2Enabled()
    || ([(ICScrollViewKeyboardResizer *)self scrollView],
        double v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isFirstResponder],
        v14,
        v15))
  {
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __69__ICScrollViewKeyboardResizer_applyInsetsFromKeyboardFrame_duration___block_invoke;
    v82[3] = &unk_1E5FD8DF0;
    v82[4] = self;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "performWithoutAnimation:", v82, *(void *)&v75);
    double v16 = [(ICScrollViewKeyboardResizer *)self scrollView];
    [v16 layoutIfNeeded];
  }
  id v17 = [(ICScrollViewKeyboardResizer *)self scrollView];
  v18 = [(ICScrollViewKeyboardResizer *)self scrollView];
  [v18 bounds];
  objc_msgSend(v17, "convertRect:toView:", 0);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  v27 = [(ICScrollViewKeyboardResizer *)self scrollView];
  uint64_t v28 = [v27 window];
  objc_msgSend((id)v28, "convertRect:toWindow:", 0, v20, v22, v24, v26);
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;

  v83.origin.double x = x;
  v83.origin.double y = y;
  v83.size.CGFloat width = width;
  v83.size.double height = height;
  double v80 = width;
  double MaxY = CGRectGetMaxY(v83);
  v84.origin.double x = v30;
  v84.origin.double y = v32;
  v84.size.CGFloat width = v34;
  v84.size.double height = v36;
  double v38 = height - fmax(MaxY - CGRectGetMaxY(v84), 0.0);
  v39 = [(ICScrollViewKeyboardResizer *)self delegate];
  LOBYTE(v28) = objc_opt_respondsToSelector();

  if (v28)
  {
    v40 = [(ICScrollViewKeyboardResizer *)self delegate];
    objc_msgSend(v40, "keyboardResizerAdjustInsetsWithKeyboardFrame:scrollAboveHeight:duration:", x, y, v80, v38, v76, a4);
  }
  else
  {
    v40 = [(ICScrollViewKeyboardResizer *)self scrollView];
    objc_msgSend(v40, "convertRect:fromView:", 0, x, y, v80, v38);
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    [v40 bounds];
    v88.origin.double x = v49;
    v88.origin.double y = v50;
    v88.size.CGFloat width = v51;
    v88.size.double height = v52;
    v85.origin.double x = v42;
    v85.origin.double y = v44;
    v85.size.CGFloat width = v46;
    v85.size.double height = v48;
    CGRect v86 = CGRectIntersection(v85, v88);
    CGFloat v53 = v86.origin.x;
    CGFloat v54 = v86.origin.y;
    CGFloat v55 = v86.size.width;
    CGFloat v56 = v86.size.height;
    [v40 contentInset];
    double v58 = v57;
    double v79 = v59;
    double v81 = v60;
    [v40 verticalScrollIndicatorInsets];
    double v62 = v61;
    double v64 = v63;
    double v77 = v65;
    v66 = [(ICScrollViewKeyboardResizer *)self delegate];
    [v66 consumedBottomAreaForResizer:self];
    double v68 = v67;

    v87.origin.double x = v53;
    v87.origin.double y = v54;
    v87.size.CGFloat width = v55;
    v87.size.double height = v56;
    double v69 = CGRectGetHeight(v87);
    if (v68 >= v69) {
      double v70 = v68;
    }
    else {
      double v70 = v69;
    }
    v71 = [(ICScrollViewKeyboardResizer *)self delegate];
    char v72 = objc_opt_respondsToSelector();

    if (v72)
    {
      v73 = [(ICScrollViewKeyboardResizer *)self delegate];
      [v73 topInsetForResizer:self];
      double v58 = v74;

      double v62 = v58;
    }
    objc_msgSend(v40, "setContentInset:", v58, v79, v70, v81);
    objc_msgSend(v40, "setScrollIndicatorInsets:", v62, v64, v70, v77);
  }

  [(ICScrollViewKeyboardResizer *)self setDidResizeScrollView:1];
}

void __69__ICScrollViewKeyboardResizer_applyInsetsFromKeyboardFrame_duration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) scrollView];
  v1 = [v2 window];
  [v1 layoutIfNeeded];
}

- (void)clearInsetsWithDuration:(double)a3
{
  double v5 = [(ICScrollViewKeyboardResizer *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(ICScrollViewKeyboardResizer *)self delegate];
    objc_msgSend(v7, "keyboardResizerAdjustInsetsWithKeyboardFrame:scrollAboveHeight:duration:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), 0.0, a3);
  }
  else
  {
    double v7 = [(ICScrollViewKeyboardResizer *)self scrollView];
    double v8 = [(ICScrollViewKeyboardResizer *)self delegate];
    [v8 consumedBottomAreaForResizer:self];
    double v10 = v9;

    [v7 contentInset];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [v7 verticalScrollIndicatorInsets];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v23 = [(ICScrollViewKeyboardResizer *)self delegate];
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      double v25 = [(ICScrollViewKeyboardResizer *)self delegate];
      [v25 topInsetForResizer:self];
      double v18 = v26;

      double v12 = v18;
    }
    objc_msgSend(v7, "setContentInset:", v12, v14, v10, v16);
    objc_msgSend(v7, "setScrollIndicatorInsets:", v18, v20, v10, v22);
  }

  [(ICScrollViewKeyboardResizer *)self setDidResizeScrollView:0];
}

- (void)handleKeyboardWillShow:(id)a3
{
  id v4 = a3;
  [(ICScrollViewKeyboardResizer *)self setShowingKeyboard:1];
  double v5 = [v4 userInfo];
  char v6 = [v5 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v6 CGRectValue];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;

  double v15 = [v4 userInfo];
  double v16 = [v15 objectForKey:*MEMORY[0x1E4FB2BA8]];
  [v16 doubleValue];
  double v18 = v17;

  double v19 = [v4 userInfo];

  double v20 = [v19 objectForKey:*MEMORY[0x1E4FB2BA0]];
  uint64_t v21 = [v20 unsignedIntegerValue];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__ICScrollViewKeyboardResizer_handleKeyboardWillShow___block_invoke;
  v22[3] = &unk_1E5FD9F40;
  v22[4] = self;
  v22[5] = v8;
  v22[6] = v10;
  v22[7] = v12;
  v22[8] = v14;
  *(double *)&v22[9] = v18;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v21 << 16 delay:v22 options:0 animations:v18 completion:0.0];
}

uint64_t __54__ICScrollViewKeyboardResizer_handleKeyboardWillShow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyInsetsFromKeyboardFrame:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)handleKeyboardDidShow:(id)a3
{
}

- (void)handleKeyboardWillHide:(id)a3
{
  id v4 = a3;
  [(ICScrollViewKeyboardResizer *)self setShowingKeyboard:0];
  [(ICScrollViewKeyboardResizer *)self setFullyShowingKeyboard:0];
  double v5 = [v4 userInfo];
  char v6 = [v5 objectForKey:*MEMORY[0x1E4FB2BA8]];
  [v6 doubleValue];
  double v8 = v7;

  uint64_t v9 = [v4 userInfo];

  uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4FB2BA0]];
  uint64_t v11 = [v10 unsignedIntegerValue];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__ICScrollViewKeyboardResizer_handleKeyboardWillHide___block_invoke;
  v12[3] = &unk_1E5FD9B40;
  v12[4] = self;
  *(double *)&v12[5] = v8;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 << 16 delay:v12 options:0 animations:v8 completion:0.0];
}

uint64_t __54__ICScrollViewKeyboardResizer_handleKeyboardWillHide___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearInsetsWithDuration:*(double *)(a1 + 40)];
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showingKeyboard
{
  return self->_showingKeyboard;
}

- (void)setShowingKeyboard:(BOOL)a3
{
  self->_showingKeyboard = a3;
}

- (BOOL)fullyShowingKeyboard
{
  return self->_fullyShowingKeyboard;
}

- (void)setFullyShowingKeyboard:(BOOL)a3
{
  self->_fullyShowingKeyboard = a3;
}

- (void)setDidResizeScrollView:(BOOL)a3
{
  self->_didResizeScrollView = a3;
}

- (void).cxx_destruct
{
}

@end
@interface SUUIComposeReviewView
- (BOOL)_composeReviewTextViewShouldChangeTextInRange:(_NSRange)a3 replacementText:(id)a4;
- (BOOL)_isReviewTextOptional;
- (BOOL)isLoading;
- (BOOL)isValid;
- (BOOL)textContentView:(id)a3 shouldChangeSizeForContentSize:(CGSize)a4;
- (BOOL)textContentView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textContentView:(id)a3 shouldScrollForPendingContentSize:(CGSize)a4;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (SUUIComposeReviewView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (SUUIComposeReviewViewDelegate)delegate;
- (float)rating;
- (id)_body;
- (id)_reviewPlaceholder;
- (id)copyReview;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)composeReviewStyle;
- (void)_delayedUpdateReviewLength;
- (void)_keyboardVisibilityDidChangeNotification:(id)a3;
- (void)_layoutComposeView;
- (void)_layoutLoadingView;
- (void)_remoteKeyboardVisibilityDidChangeNotification:(id)a3;
- (void)_showComposeView;
- (void)_showLoadingView;
- (void)_updateContentSize;
- (void)composeHeaderViewValidityDidChange:(id)a3;
- (void)composeHeaderViewValuesDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)reloadData;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLoading:(BOOL)a3;
- (void)setRating:(float)a3;
- (void)setReview:(id)a3;
- (void)textContentViewDidChange:(id)a3;
@end

@implementation SUUIComposeReviewView

- (SUUIComposeReviewView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SUUIComposeReviewView;
  v5 = -[SUUIComposeReviewView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    CGSize v7 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    v5->_remoteKeyboardFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
    v5->_remoteKeyboardFrame.size = v7;
    v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(SUUIComposeReviewView *)v6 setBackgroundColor:v8];

    [(SUUIComposeReviewView *)v6 _showComposeView];
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v6 selector:sel__keyboardVisibilityDidChangeNotification_ name:*MEMORY[0x263F837A0] object:0];
    [v9 addObserver:v6 selector:sel__keyboardVisibilityDidChangeNotification_ name:*MEMORY[0x263F837A8] object:0];
    [v9 addObserver:v6 selector:sel__remoteKeyboardVisibilityDidChangeNotification_ name:@"SUUIRemoteKeyboardFrameChangedNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F837A0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F837A8] object:0];
  [v3 removeObserver:self name:@"SUUIRemoteKeyboardFrameChangedNotification" object:0];
  [(SUUIComposeReviewHeaderView *)self->_headerView setDelegate:0];
  [(SUTextContentView *)self->_textContentView setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIComposeReviewView;
  [(SUUIComposeReviewView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  if (*((unsigned char *)self + 496)) {
    [(SUUIComposeReviewView *)self _layoutLoadingView];
  }
  else {
    [(SUUIComposeReviewView *)self _layoutComposeView];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  v12.receiver = self;
  v12.super_class = (Class)SUUIComposeReviewView;
  v6 = [(SUUIComposeReviewView *)&v12 hitTest:a4 withEvent:a3.x];
  textContentView = self->_textContentView;
  [(SUTextContentView *)textContentView frame];
  -[SUTextContentView convertRect:toView:](textContentView, "convertRect:toView:", self->_scrollView);
  if (v6 == self->_scrollView && y > v8)
  {
    v10 = self->_textContentView;

    v6 = (UIScrollView *)v10;
  }
  return v6;
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIComposeReviewView;
  -[SUUIComposeReviewView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)copyReview
{
  objc_super v3 = (void *)[(SUUIReviewMetadata *)self->_review copy];
  objc_super v4 = [(SUUIComposeReviewView *)self _body];
  [v3 setBody:v4];

  [(SUUIComposeReviewView *)self rating];
  objc_msgSend(v3, "setRating:");
  v5 = [(SUUIComposeReviewHeaderView *)self->_headerView title];
  [v3 setTitle:v5];

  return v3;
}

- (BOOL)isLoading
{
  return *((unsigned char *)self + 496) & 1;
}

- (BOOL)isValid
{
  review = self->_review;
  objc_super v4 = [(SUUIComposeReviewHeaderView *)self->_headerView title];
  if ([v4 length] || (BOOL v5 = review != 0, self->_currentBodyLength >= 1))
  {
    if ([v4 length]) {
      BOOL v5 = self->_currentBodyLength > 0;
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (float)rating
{
  [(SUUIComposeReviewHeaderView *)self->_headerView rating];
  return result;
}

- (void)reloadData
{
  id v8 = [(SUUIReviewMetadata *)self->_review body];
  if ([(SUUIReviewMetadata *)self->_review bodyMaxLength]) {
    unint64_t v3 = [(SUUIReviewMetadata *)self->_review bodyMaxLength];
  }
  else {
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v4 = [v8 length];
  self->_currentBodyLength = v4;
  if (v4 <= v3)
  {
    id v6 = v8;
  }
  else
  {
    uint64_t v5 = [v8 substringToIndex:v3];

    self->_currentBodyLength = v3;
    id v6 = (id)v5;
  }
  id v9 = v6;
  [(SUTextContentView *)self->_textContentView setText:v6];
  [(SUUIComposeReviewHeaderView *)self->_headerView setReview:self->_review];
  [(SUUIComposeReviewHeaderView *)self->_headerView sizeToFit];
  [(SUUIComposeReviewView *)self setNeedsLayout];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeReviewViewValidityChanged:self];
}

- (void)setLoading:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 496);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 496) = v3 & 0xFE | a3;
    if (a3) {
      [(SUUIComposeReviewView *)self _showLoadingView];
    }
    else {
      [(SUUIComposeReviewView *)self _showComposeView];
    }
  }
}

- (void)setRating:(float)a3
{
}

- (void)setReview:(id)a3
{
  uint64_t v5 = (SUUIReviewMetadata *)a3;
  p_review = &self->_review;
  if (self->_review != v5)
  {
    CGSize v7 = v5;
    objc_storeStrong((id *)p_review, a3);
    uint64_t v5 = v7;
  }
  MEMORY[0x270F9A758](p_review, v5);
}

- (void)composeHeaderViewValidityDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeReviewViewValidityChanged:self];
}

- (void)composeHeaderViewValuesDidChange:(id)a3
{
  textContentView = self->_textContentView;
  uint64_t v5 = [(SUUIComposeReviewView *)self _reviewPlaceholder];
  [(SUTextContentView *)textContentView setPlaceholder:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeReviewViewValidityChanged:self];
}

- (BOOL)textContentView:(id)a3 shouldChangeSizeForContentSize:(CGSize)a4
{
  return 1;
}

- (BOOL)textContentView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return -[SUUIComposeReviewView _composeReviewTextViewShouldChangeTextInRange:replacementText:](self, "_composeReviewTextViewShouldChangeTextInRange:replacementText:", a4.location, a4.length, a5);
}

- (BOOL)textContentView:(id)a3 shouldScrollForPendingContentSize:(CGSize)a4
{
  return 0;
}

- (void)textContentViewDidChange:(id)a3
{
  id v8 = a3;
  [v8 rectForScrollToVisible];
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  if (!CGRectIsEmpty(v10))
  {
    objc_msgSend(v8, "convertRect:toView:", self->_scrollView, x, y, width, height);
    -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 1);
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return -[SUUIComposeReviewView _composeReviewTextViewShouldChangeTextInRange:replacementText:](self, "_composeReviewTextViewShouldChangeTextInRange:replacementText:", a4.location, a4.length, a5);
}

- (BOOL)_composeReviewTextViewShouldChangeTextInRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (self->_currentBodyLength <= location + length) {
    int64_t currentBodyLength = location + length;
  }
  else {
    int64_t currentBodyLength = self->_currentBodyLength;
  }
  if ([(SUUIReviewMetadata *)self->_review bodyMaxLength]) {
    int64_t v9 = [(SUUIReviewMetadata *)self->_review bodyMaxLength];
  }
  else {
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v10 = currentBodyLength - length + [v7 length];
  if (v10 <= v9) {
    [(SUUIComposeReviewView *)self performSelector:sel__delayedUpdateReviewLength withObject:0 afterDelay:0.0];
  }

  return v10 <= v9;
}

- (void)_keyboardVisibilityDidChangeNotification:(id)a3
{
  unint64_t v4 = [a3 userInfo];
  id v20 = [v4 objectForKey:*MEMORY[0x263F837B8]];

  p_keyboardFrame = &self->_keyboardFrame;
  if (v20)
  {
    [v20 CGRectValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = [MEMORY[0x263F82E88] keyWindow];
    -[SUUIComposeReviewView convertRect:fromView:](self, "convertRect:fromView:", v14, v7, v9, v11, v13);
    p_keyboardFrame->origin.double x = v15;
    self->_keyboardFrame.origin.double y = v16;
    self->_keyboardFrame.size.double width = v17;
    self->_keyboardFrame.size.double height = v18;
  }
  else
  {
    CGSize v19 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    p_keyboardFrame->origin = (CGPoint)*MEMORY[0x263F001A8];
    self->_keyboardFrame.size = v19;
  }
  if (![(SUUIComposeReviewView *)self isLoading]) {
    [(SUUIComposeReviewView *)self _layoutComposeView];
  }
}

- (void)_remoteKeyboardVisibilityDidChangeNotification:(id)a3
{
  unint64_t v4 = [a3 userInfo];
  id v7 = [v4 objectForKey:@"SUUIRemoteKeyboardFrame"];

  p_remoteKeyboardFrame = &self->_remoteKeyboardFrame;
  if (v7)
  {
    [v7 CGRectValue];
    CGRect v10 = CGRectIntegral(v9);
    p_remoteKeyboardFrame->origin.double x = v10.origin.x;
    self->_remoteKeyboardFrame.origin.double y = v10.origin.y;
    self->_remoteKeyboardFrame.size.double width = v10.size.width;
    self->_remoteKeyboardFrame.size.double height = v10.size.height;
  }
  else
  {
    CGSize v6 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    p_remoteKeyboardFrame->origin = (CGPoint)*MEMORY[0x263F001A8];
    self->_remoteKeyboardFrame.size = v6;
  }
  if (![(SUUIComposeReviewView *)self isLoading]) {
    [(SUUIComposeReviewView *)self _layoutComposeView];
  }
}

- (id)_body
{
  v2 = [(SUTextContentView *)self->_textContentView text];
  char v3 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  unint64_t v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

- (void)_delayedUpdateReviewLength
{
  char v3 = [(SUTextContentView *)self->_textContentView text];
  self->_int64_t currentBodyLength = [v3 length];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeReviewViewValidityChanged:self];
}

- (BOOL)_isReviewTextOptional
{
  v2 = [(SUUIComposeReviewHeaderView *)self->_headerView title];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (void)_layoutComposeView
{
  [(SUUIComposeReviewView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SUUIComposeReviewView *)self safeAreaInsets];
  double v12 = v11;
  double v14 = v13;
  p_remoteKeyboardFrame = &self->_remoteKeyboardFrame;
  if (CGRectEqualToRect(self->_remoteKeyboardFrame, *MEMORY[0x263F001A8])) {
    p_remoteKeyboardFrame = &self->_keyboardFrame;
  }
  double height = p_remoteKeyboardFrame->size.height;
  if (height > 0.00000011920929)
  {
    double y = p_remoteKeyboardFrame->origin.y;
    CGFloat width = p_remoteKeyboardFrame->size.width;
    CGFloat x = p_remoteKeyboardFrame->origin.x;
    double v20 = y;
    v37.origin.CGFloat x = v4;
    v37.origin.double y = v6;
    v37.size.CGFloat width = v8;
    v37.size.double height = v10;
    if (CGRectIntersectsRect(*(CGRect *)(&height - 3), v37)) {
      double v10 = y + -3.0;
    }
  }
  [(UIScrollView *)self->_scrollView frame];
  v38.origin.CGFloat x = v21;
  v38.origin.double y = v22;
  v38.size.CGFloat width = v23;
  v38.size.double height = v24;
  v35.origin.CGFloat x = v4;
  v35.origin.double y = v6;
  v35.size.CGFloat width = v8;
  v35.size.double height = v10;
  if (!CGRectEqualToRect(v35, v38)) {
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10);
  }
  [(SUUIComposeReviewHeaderView *)self->_headerView frame];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  -[SUUIComposeReviewHeaderView setFrame:](self->_headerView, "setFrame:");
  v36.origin.CGFloat x = v26;
  v36.origin.double y = v28;
  v36.size.CGFloat width = v8;
  v36.size.double height = v30;
  double MaxY = CGRectGetMaxY(v36);
  [(SUTextContentView *)self->_textContentView frame];
  textContentView = self->_textContentView;
  if (v32 < v10 - MaxY) {
    double v32 = v10 - MaxY;
  }
  -[SUTextContentView setFrame:](textContentView, "setFrame:", v12 + 7.0, MaxY, v8 - v14 - (v12 + 7.0), v32);
}

- (void)_layoutLoadingView
{
  [(SUUIComposeReviewView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(SULoadingView *)self->_loadingView frame];
  double v8 = floor((v4 - v7) * 0.5);
  loadingView = self->_loadingView;
  double v11 = floor((v6 - v9) * 0.5);
  -[SULoadingView setFrame:](loadingView, "setFrame:", v8, v11);
}

- (id)_reviewPlaceholder
{
  if (self->_style == 1)
  {
    v2 = 0;
  }
  else
  {
    BOOL v3 = [(SUUIComposeReviewView *)self _isReviewTextOptional];
    double v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v5 = v4;
    if (v3) {
      double v6 = @"REVIEW_PLACEHOLDER";
    }
    else {
      double v6 = @"REVIEW_PLACEHOLDER_NOT_OPTIONAL";
    }
    v2 = [v4 localizedStringForKey:v6 value:&stru_2704F8130 table:0];
  }
  return v2;
}

- (void)_showComposeView
{
  [(SULoadingView *)self->_loadingView removeFromSuperview];
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    double v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F82B88]);
    double v5 = self->_scrollView;
    self->_scrollView = v4;

    [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
    double v6 = self->_scrollView;
    double v7 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(UIScrollView *)v6 setTopExtensionViewColor:v7];

    scrollView = self->_scrollView;
  }
  double v8 = [(UIScrollView *)scrollView superview];

  if (v8 != self) {
    [(SUUIComposeReviewView *)self addSubview:self->_scrollView];
  }
  headerView = self->_headerView;
  if (!headerView)
  {
    double v10 = [SUUIComposeReviewHeaderView alloc];
    int64_t v11 = [(SUUIComposeReviewView *)self composeReviewStyle];
    double v12 = -[SUUIComposeReviewHeaderView initWithFrame:style:](v10, "initWithFrame:style:", v11, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v13 = self->_headerView;
    self->_headerView = v12;

    [(SUUIComposeReviewHeaderView *)self->_headerView setDelegate:self];
    headerView = self->_headerView;
  }
  [(SUUIComposeReviewHeaderView *)headerView setReview:self->_review];
  [(SUUIComposeReviewHeaderView *)self->_headerView sizeToFit];
  double v14 = [(SUUIComposeReviewHeaderView *)self->_headerView superview];
  CGFloat v15 = self->_scrollView;

  if (v14 != v15) {
    [(UIScrollView *)self->_scrollView addSubview:self->_headerView];
  }
  textContentView = self->_textContentView;
  if (!textContentView)
  {
    CGFloat v17 = (SUTextContentView *)objc_alloc_init(MEMORY[0x263F896C8]);
    CGFloat v18 = self->_textContentView;
    self->_textContentView = v17;

    [(SUTextContentView *)self->_textContentView setDelegate:self];
    CGSize v19 = self->_textContentView;
    double v20 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [(SUTextContentView *)v19 setFont:v20];

    CGFloat v21 = self->_textContentView;
    CGFloat v22 = [(SUUIComposeReviewView *)self _reviewPlaceholder];
    [(SUTextContentView *)v21 setPlaceholder:v22];

    CGFloat v23 = self->_textContentView;
    CGFloat v24 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
    [(SUTextContentView *)v23 setFont:v24];

    double v25 = self->_textContentView;
    CGFloat v26 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(SUTextContentView *)v25 setBackgroundColor:v26];

    double v27 = self->_textContentView;
    CGFloat v28 = [MEMORY[0x263F825C8] labelColor];
    [(SUTextContentView *)v27 setTextColor:v28];

    textContentView = self->_textContentView;
  }
  double v29 = [(SUTextContentView *)textContentView superview];
  CGFloat v30 = self->_scrollView;

  if (v29 != v30) {
    [(UIScrollView *)self->_scrollView addSubview:self->_textContentView];
  }
  v31 = [(SUUIComposeReviewHeaderView *)self->_headerView initialFirstResponder];
  if (!v31) {
    v31 = self->_textContentView;
  }
  double v32 = v31;
  [(SUTextContentView *)v31 becomeFirstResponder];
  [(SUUIComposeReviewView *)self _layoutComposeView];
  [(SUUIComposeReviewView *)self _updateContentSize];
}

- (void)_showLoadingView
{
  [(UIScrollView *)self->_scrollView removeFromSuperview];
  loadingView = self->_loadingView;
  if (!loadingView)
  {
    double v4 = (SULoadingView *)objc_alloc_init(MEMORY[0x263F89618]);
    double v5 = self->_loadingView;
    self->_loadingView = v4;

    [(SULoadingView *)self->_loadingView sizeToFit];
    loadingView = self->_loadingView;
  }
  double v6 = [(SULoadingView *)loadingView superview];

  if (v6 != self)
  {
    double v7 = self->_loadingView;
    [(SUUIComposeReviewView *)self addSubview:v7];
  }
}

- (void)_updateContentSize
{
  [(SUUIComposeReviewHeaderView *)self->_headerView frame];
  double v4 = v3;
  [(SUTextContentView *)self->_textContentView frame];
  double MaxY = CGRectGetMaxY(v8);
  scrollView = self->_scrollView;
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v4, MaxY);
}

- (int64_t)composeReviewStyle
{
  return self->_style;
}

- (SUUIComposeReviewViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIComposeReviewViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContentViewAlt, 0);
  objc_storeStrong((id *)&self->_textContentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_review, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
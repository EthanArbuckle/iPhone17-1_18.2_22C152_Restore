@interface ICTodoButton
+ (CGSize)defaultImageSize;
+ (CGSize)defaultSize;
- (BOOL)isDone;
- (BOOL)trackedParagraphIsRTL;
- (BOOL)useConstraintBasedRendering;
- (CGRect)imageFrame;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGSize)defaultImageSize;
- (ICTodoButton)init;
- (ICTodoButton)initWithDragDelegate:(id)a3;
- (ICTodoButton)initWithFrame:(CGRect)a3;
- (ICTrackedParagraph)trackedParagraph;
- (UIColor)highlightColor;
- (UIColor)overrideTintColor;
- (id)_icaxParentUITextView;
- (id)debugDescription;
- (id)icaxCorrespondingParagraphText;
- (id)imageForChecked:(BOOL)a3 withHighlight:(BOOL)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)didMoveToWindow;
- (void)setDefaultImageSize:(CGSize)a3;
- (void)setDone:(BOOL)a3;
- (void)setDone:(BOOL)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3 leftToRight:(BOOL)a4;
- (void)setHighlightColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOverrideTintColor:(id)a3;
- (void)setTrackedParagraph:(id)a3;
- (void)setTrackedParagraphIsRTL:(BOOL)a3;
- (void)setUseConstraintBasedRendering:(BOOL)a3;
- (void)trackedParagraphDidChange;
- (void)updateImagesAnimated:(BOOL)a3;
- (void)updateTintColor;
- (void)wasPressed;
@end

@implementation ICTodoButton

+ (CGSize)defaultSize
{
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  double v3 = 60.0;
  double v4 = 25.0;
  if (IsTextKit2Enabled) {
    double v3 = 25.0;
  }
  else {
    double v4 = 34.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)defaultImageSize
{
  double v2 = 22.0;
  double v3 = 22.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (ICTodoButton)init
{
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  if (IsTextKit2Enabled) {
    double v4 = 25.0;
  }
  else {
    double v4 = 60.0;
  }
  if (IsTextKit2Enabled) {
    double v5 = 25.0;
  }
  else {
    double v5 = 34.0;
  }
  return -[ICTodoButton initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v4, v5);
}

- (void)setDone:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_done != a3)
  {
    self->_done = a3;
    [(ICTodoButton *)self updateImagesAnimated:a4];
  }
}

- (void)setDone:(BOOL)a3
{
}

- (void)setTrackedParagraph:(id)a3
{
  p_trackedParagraph = &self->_trackedParagraph;
  id v5 = a3;
  objc_storeWeak((id *)p_trackedParagraph, v5);
  v6 = [v5 paragraph];

  self->_trackedParagraphIsRTL = [v6 isRTL];
  [(ICTodoButton *)self trackedParagraphDidChange];
}

- (void)setTrackedParagraphIsRTL:(BOOL)a3
{
  if (self->_trackedParagraphIsRTL != a3)
  {
    self->_trackedParagraphIsRTL = a3;
    [(ICTodoButton *)self trackedParagraphDidChange];
  }
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
  [(ICTodoButton *)self updateTintColor];
}

- (id)debugDescription
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICTodoButton;
  double v4 = [(ICTodoButton *)&v8 description];
  id v5 = [(ICTodoButton *)self accessibilityLabel];
  v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  v6 = (void *)MEMORY[0x1E4FB1AD8];
  id v7 = a5;
  objc_super v8 = [(ICTodoButton *)self imageView];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [v7 identifier];

  v18 = objc_msgSend(v6, "regionWithRect:identifier:", v17, v10, v12, v14, v16);

  return v18;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc(MEMORY[0x1E4FB1D48]);
  v6 = [(ICTodoButton *)self imageView];
  id v7 = (void *)[v5 initWithView:v6];

  objc_super v8 = [(ICTodoButton *)self imageView];
  [v8 frame];
  double v10 = v9;

  double v11 = [(ICTodoButton *)self imageView];
  [v11 frame];
  double v13 = v12;

  if (v10 < v13) {
    double v10 = v13;
  }
  double v14 = [(ICTodoButton *)self imageView];
  [v14 frame];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  v23 = [(ICTodoButton *)self imageView];
  [v23 frame];
  CGFloat v25 = v24 - v10;
  v26 = [(ICTodoButton *)self imageView];
  [v26 frame];
  CGFloat v28 = v27 - v10;
  v40.origin.double x = v16;
  v40.origin.double y = v18;
  v40.size.double width = v20;
  v40.size.double height = v22;
  CGRect v41 = CGRectInset(v40, v25, v28);
  double x = v41.origin.x;
  double y = v41.origin.y;
  double width = v41.size.width;
  double height = v41.size.height;

  v33 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v10);
  BOOL v34 = [(ICTodoButton *)self isDone];
  v35 = (id *)0x1E4FB1AD0;
  if (!v34) {
    v35 = (id *)0x1E4FB1AB0;
  }
  v36 = [*v35 effectWithPreview:v7];
  v37 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v36 shape:v33];

  return v37;
}

- (BOOL)isDone
{
  return self->_done;
}

- (ICTrackedParagraph)trackedParagraph
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackedParagraph);
  return (ICTrackedParagraph *)WeakRetained;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (UIColor)overrideTintColor
{
  return self->_overrideTintColor;
}

- (void)setOverrideTintColor:(id)a3
{
}

- (CGSize)defaultImageSize
{
  double width = self->_defaultImageSize.width;
  double height = self->_defaultImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDefaultImageSize:(CGSize)a3
{
  self->_defaultImageSize = a3;
}

- (BOOL)trackedParagraphIsRTL
{
  return self->_trackedParagraphIsRTL;
}

- (BOOL)useConstraintBasedRendering
{
  return self->_useConstraintBasedRendering;
}

- (void)setUseConstraintBasedRendering:(BOOL)a3
{
  self->_useConstraintBasedRendering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTintColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_destroyWeak((id *)&self->_trackedParagraph);
}

- (ICTodoButton)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICTodoButton;
  double v3 = -[ICTodoButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(ICTodoButton *)v3 setContentMode:1];
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      id v5 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
      v6 = [MEMORY[0x1E4FB1498] clearConfiguration];
      id v7 = [MEMORY[0x1E4FB1618] clearColor];
      [v6 setBackgroundColor:v7];

      [v5 setBackground:v6];
      objc_msgSend(v5, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
      [v5 setImagePlacement:8];
      [(ICTodoButton *)v4 setConfiguration:v5];
    }
    else
    {
      [(ICTodoButton *)v4 setContentVerticalAlignment:0];
      [(ICTodoButton *)v4 setContentHorizontalAlignment:5];
      -[ICTodoButton setImageEdgeInsets:](v4, "setImageEdgeInsets:", 0.0, 4.0, 1.0, 4.0);
      -[ICTodoButton setLargeContentImageInsets:](v4, "setLargeContentImageInsets:", 0.0, 4.0, 1.0, 4.0);
    }
    [(ICTodoButton *)v4 updateImagesAnimated:0];
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v4];
    [(ICTodoButton *)v4 addInteraction:v8];
  }
  return v4;
}

- (ICTodoButton)initWithDragDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTodoButton *)self init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:v4];
    [(ICTodoButton *)v5 addInteraction:v6];
  }
  return v5;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)ICTodoButton;
  [(ICTodoButton *)&v3 didMoveToWindow];
  [(ICTodoButton *)self updateTintColor];
}

- (void)trackedParagraphDidChange
{
  BOOL v3 = [(UIView *)self ic_isRTL];
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  if (v3)
  {
    if (IsTextKit2Enabled)
    {
      id v5 = [(ICTodoButton *)self configuration];
      v6 = [(ICTodoButton *)self trackedParagraph];
      id v7 = [v6 paragraph];
      BOOL v8 = [v7 isRTL] == 0;
      uint64_t v9 = 2;
      uint64_t v10 = 8;
LABEL_6:
      if (v8) {
        uint64_t v11 = v9;
      }
      else {
        uint64_t v11 = v10;
      }
      [v5 setImagePlacement:v11];

      [(ICTodoButton *)self setConfiguration:v5];
      goto LABEL_17;
    }
    id v5 = [(ICTodoButton *)self trackedParagraph];
    double v12 = [v5 paragraph];
    if ([v12 isRTL]) {
      uint64_t v13 = 5;
    }
    else {
      uint64_t v13 = 4;
    }
  }
  else
  {
    if (IsTextKit2Enabled)
    {
      id v5 = [(ICTodoButton *)self configuration];
      v6 = [(ICTodoButton *)self trackedParagraph];
      id v7 = [v6 paragraph];
      BOOL v8 = [v7 isRTL] == 0;
      uint64_t v9 = 8;
      uint64_t v10 = 2;
      goto LABEL_6;
    }
    id v5 = [(ICTodoButton *)self trackedParagraph];
    double v12 = [v5 paragraph];
    if ([v12 isRTL]) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = 5;
    }
  }
  [(ICTodoButton *)self setContentHorizontalAlignment:v13];

LABEL_17:
  [(ICTodoButton *)self setNeedsLayout];
  [(ICTodoButton *)self layoutIfNeeded];
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    v26.receiver = self;
    v26.super_class = (Class)ICTodoButton;
    -[ICTodoButton imageRectForContentRect:](&v26, sel_imageRectForContentRect_, x, y, width, height);
    double v9 = v8;
    double y = v10;
    double width = v11;
    double height = v12;
    uint64_t v13 = [(ICTodoButton *)self imageForChecked:1 withHighlight:0];
    [v13 size];
    double v15 = v14;
    double v17 = v16;

    if (vabdd_f64(v15 / v17, width / height) <= 0.01)
    {
      if (vabdd_f64(width, v15) > 1.0) {
        double v9 = v9 + (width - v15) * 0.5;
      }
    }
    else
    {
      double v9 = v9 + width - height;
      double width = width - (width - height);
    }
    CGFloat v18 = [(ICTodoButton *)self trackedParagraph];
    double v19 = [v18 paragraph];
    int v20 = [v19 isRTL];

    if (v20)
    {
      [(ICTodoButton *)self imageEdgeInsets];
      double x = v21;
    }
    else
    {
      double x = v9 + -3.0;
    }
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ICTodoButton;
  [(ICTodoButton *)&v9 setHighlighted:a3];
  if ([(ICTodoButton *)self isDone]) {
    id v4 = @"completed: %@";
  }
  else {
    id v4 = @"incomplete: %@";
  }
  id v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v4 value:v4 table:0 allowSiri:1];
  v6 = NSString;
  id v7 = [(ICTodoButton *)self icaxCorrespondingParagraphText];
  double v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  ICAccessibilityPostHighPriorityAnnouncementNotification(0, v8);
}

- (void)wasPressed
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:0];
  [v2 prepare];
  [v2 impactOccurred];
}

- (id)imageForChecked:(BOOL)a3 withHighlight:(BOOL)a4
{
  BOOL v4 = a3;
  id v5 = (void *)sICTodoCheckedImage;
  if (!sICTodoCheckedImage)
  {
    v6 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:3 scale:17.0];
    id v7 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:3 scale:17.0];
    double v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
    uint64_t v9 = [v8 imageWithConfiguration:v6];
    double v10 = (void *)sICTodoCheckedImage;
    sICTodoCheckedImage = v9;

    double v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
    uint64_t v12 = [v11 imageWithConfiguration:v7];
    uint64_t v13 = (void *)sICTodoUncheckedImage;
    sICTodoUncheckedImage = v12;

    id v5 = (void *)sICTodoCheckedImage;
  }
  if (!v4) {
    id v5 = (void *)sICTodoUncheckedImage;
  }
  id v14 = v5;
  return v14;
}

- (void)updateImagesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICTodoButton *)self window];
  if (v5)
  {
  }
  else
  {
    v6 = [(ICTodoButton *)self overrideTintColor];

    if (!v6) {
      return;
    }
  }
  BOOL v7 = [(ICTodoButton *)self isDone];
  double v8 = [(ICTodoButton *)self imageForChecked:v7 withHighlight:[(ICTodoButton *)self isHighlighted]];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__ICTodoButton_PlatformSpecificResponsibility__updateImagesAnimated___block_invoke;
  aBlock[3] = &unk_1E5FDBCB0;
  aBlock[4] = self;
  id v9 = v8;
  id v13 = v9;
  BOOL v14 = v7;
  double v10 = _Block_copy(aBlock);
  double v11 = v10;
  if (v3) {
    [MEMORY[0x1E4FB1EB0] transitionWithView:self duration:5242880 options:v10 animations:0 completion:0.25];
  }
  else {
    (*((void (**)(void *))v10 + 2))(v10);
  }
}

void __69__ICTodoButton_PlatformSpecificResponsibility__updateImagesAnimated___block_invoke(uint64_t a1)
{
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  BOOL v3 = *(void **)(a1 + 32);
  if (IsTextKit2Enabled)
  {
    id v12 = [v3 configuration];
    [v12 setImage:*(void *)(a1 + 40)];
    BOOL v4 = [*(id *)(a1 + 32) overrideTintColor];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) tintColor];
    }
    BOOL v7 = v6;

    if (*(unsigned char *)(a1 + 48))
    {
      id v8 = v7;
    }
    else
    {
      id v8 = [MEMORY[0x1E4FB1618] ICGrayTodoButtonColor];
    }
    id v9 = v8;
    double v10 = [*(id *)(a1 + 32) highlightColor];
    double v11 = objc_msgSend(v9, "ic_colorBlendedWithColor:", v10);
    [v12 setBaseForegroundColor:v11];

    [*(id *)(a1 + 32) setConfiguration:v12];
  }
  else
  {
    [v3 setImage:*(void *)(a1 + 40) forState:0];
    if (*(unsigned char *)(a1 + 48)) {
      [MEMORY[0x1E4FB1618] ICControlAccentColor];
    }
    else {
    id v12 = [MEMORY[0x1E4FB1618] ICGrayTodoButtonColor];
    }
    BOOL v7 = [*(id *)(a1 + 32) highlightColor];
    id v9 = objc_msgSend(v12, "ic_colorBlendedWithColor:", v7);
    [*(id *)(a1 + 32) setTintColor:v9];
  }
}

- (void)updateTintColor
{
}

- (CGRect)imageFrame
{
  char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  BOOL v4 = [(ICTodoButton *)self imageView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ((IsTextKit2Enabled & 1) == 0)
  {
    id v13 = [(ICTodoButton *)self superview];
    -[ICTodoButton convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
    double v6 = v14;
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
  }
  double v18 = v6;
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (void)setFrame:(CGRect)a3 leftToRight:(BOOL)a4
{
  -[ICTodoButton setFrame:](self, "setFrame:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v6 = [(ICTodoButton *)self trackedParagraph];
  double v5 = [v6 paragraph];
  -[ICTodoButton setTrackedParagraphIsRTL:](self, "setTrackedParagraphIsRTL:", [v5 isRTL]);
}

- (id)icaxCorrespondingParagraphText
{
  BOOL v3 = [(ICTodoButton *)self _icaxParentUITextView];
  BOOL v4 = [v3 textStorage];
  double v5 = [v4 string];
  id v6 = [(ICTodoButton *)self trackedParagraph];
  [v6 characterRange];
  double v7 = [v3 textStorage];
  objc_msgSend(v7, "ic_range");
  uint64_t v8 = TSUClampRange();
  double v10 = objc_msgSend(v5, "ic_substringWithRange:", v8, v9);

  double v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  double v12 = [v10 stringByTrimmingCharactersInSet:v11];

  return v12;
}

- (id)_icaxParentUITextView
{
  id v2 = [(ICTodoButton *)self superview];
  objc_opt_class();
  while ((objc_opt_isKindOfClass() & 1) == 0 && v2)
  {
    BOOL v3 = v2;
    id v2 = [v2 superview];

    objc_opt_class();
  }
  return v2;
}

@end
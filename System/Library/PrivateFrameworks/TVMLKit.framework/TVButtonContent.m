@interface TVButtonContent
- (BOOL)blurEnabled;
- (BOOL)canBecomeFocused;
- (BOOL)imageTrailsTextContent;
- (BOOL)isDisabled;
- (BOOL)isFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (IKViewElement)viewElement;
- (NSString)groupName;
- (TVButtonContent)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5;
- (UIColor)highlightColor;
- (UILabel)textContentView;
- (UIView)overlayView;
- (UIVisualEffectView)backdropView;
- (_TVImageView)accessoryView;
- (_TVImageView)imageView;
- (double)_imageMarginFromText;
- (double)cornerRadius;
- (double)focusSizeIncrease;
- (id)backgroundColor;
- (int64_t)backdropStyle;
- (void)_setFocused:(BOOL)a3 animationCoordinator:(id)a4;
- (void)_updateBackgroundColorForState:(unint64_t)a3;
- (void)_updateFloaingViewFocusState:(BOOL)a3 coordinator:(id)a4;
- (void)_updateFocusStateWithCoordinator:(id)a3;
- (void)layoutSubviews;
- (void)setAccessoryView:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setFocusSizeIncrease:(double)a3;
- (void)setGroupName:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageTrailsTextContent:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setTextContentView:(id)a3;
- (void)setViewElement:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVButtonContent

- (TVButtonContent)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TVButtonContent;
  v7 = -[_UIFloatingContentView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_focused = 0;
    v7->_backdropStyle = a4;
    v7->_blurEnabled = a5;
    [(TVButtonContent *)v7 setUserInteractionEnabled:0];
  }
  return v8;
}

- (void)setGroupName:(id)a3
{
}

- (id)backgroundColor
{
  return self->__backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TVButtonContent;
  id v4 = a3;
  [(TVButtonContent *)&v7 setBackgroundColor:v4];
  v5 = (UIColor *)objc_msgSend(v4, "copy", v7.receiver, v7.super_class);

  backgroundColor = self->__backgroundColor;
  self->__backgroundColor = v5;
}

- (void)setHighlightColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_highlightColor = &self->_highlightColor;
  if (self->_highlightColor != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)p_highlightColor, a3);
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_highlightColor, v5);
}

- (void)_updateBackgroundColorForState:(unint64_t)a3
{
  v3 = &OBJC_IVAR___TVButtonContent__highlightColor;
  if ((a3 & 0xD) == 0) {
    v3 = &OBJC_IVAR___TVButtonContent___backgroundColor;
  }
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v3);
  v5.receiver = self;
  v5.super_class = (Class)TVButtonContent;
  [(TVButtonContent *)&v5 setBackgroundColor:v4];
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    objc_super v5 = [(TVButtonContent *)self layer];
    [v5 setCornerRadius:a3];

    [(TVButtonContent *)self setNeedsLayout];
  }
}

- (void)setTextContentView:(id)a3
{
  objc_super v5 = (UILabel *)a3;
  textContentView = self->_textContentView;
  objc_super v7 = v5;
  if (textContentView != v5)
  {
    [(UILabel *)textContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_textContentView, a3);
    if (self->_textContentView) {
      -[TVButtonContent addSubview:](self, "addSubview:");
    }
  }
  [(TVButtonContent *)self _updateFocusStateWithCoordinator:0];
  [(TVButtonContent *)self setNeedsLayout];
}

- (void)setImageView:(id)a3
{
  objc_super v5 = (_TVImageView *)a3;
  p_imageView = &self->_imageView;
  imageView = self->_imageView;
  v8 = v5;
  if (imageView != v5)
  {
    [(_TVImageView *)imageView removeFromSuperview];
    objc_storeStrong((id *)&self->_imageView, a3);
    if (*p_imageView)
    {
      -[TVButtonContent addSubview:](self, "addSubview:");
      [(_TVImageView *)*p_imageView setUserInteractionEnabled:0];
    }
  }
  [(TVButtonContent *)self _updateFocusStateWithCoordinator:0];
  [(TVButtonContent *)self setNeedsLayout];
}

- (void)setAccessoryView:(id)a3
{
  objc_super v5 = (_TVImageView *)a3;
  accessoryView = self->_accessoryView;
  objc_super v7 = v5;
  if (accessoryView != v5)
  {
    [(_TVImageView *)accessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_accessoryView, a3);
    if (self->_accessoryView)
    {
      -[TVButtonContent addSubview:](self, "addSubview:");
      [(_TVImageView *)v7 setUserInteractionEnabled:0];
    }
  }
  [(TVButtonContent *)self _updateFocusStateWithCoordinator:0];
  [(TVButtonContent *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIView *)self tv_itemWidth];
  double v56 = v4;
  [(UIView *)self tv_itemHeight];
  double v55 = v5;
  [(UIView *)self tv_minWidth];
  double v54 = v6;
  [(UIView *)self tv_minHeight];
  double v53 = v7;
  [(UIView *)self tv_maxWidth];
  double v9 = v8;
  [(UIView *)self tv_maxHeight];
  double v11 = v10;
  [(UIView *)self tv_padding];
  double v51 = v13;
  double v52 = v12;
  double v15 = v14;
  double v50 = v16;
  v17 = [(TVButtonContent *)self accessoryView];
  objc_msgSend(v17, "tv_margin");
  double v47 = v19;
  double v48 = v18;

  v20 = [(TVButtonContent *)self imageView];
  double v21 = *MEMORY[0x263F001B0];
  double v22 = *(double *)(MEMORY[0x263F001B0] + 8);
  objc_msgSend(v20, "sizeThatFits:", *MEMORY[0x263F001B0], v22);
  double v49 = v23;

  [(TVButtonContent *)self _imageMarginFromText];
  double v25 = v24;
  v26 = [(TVButtonContent *)self textContentView];
  objc_msgSend(v26, "sizeThatFits:", v21, v22);
  double v28 = v27;
  double v30 = v29;

  v31 = [(TVButtonContent *)self accessoryView];
  objc_msgSend(v31, "sizeThatFits:", v21, v22);
  double v33 = v32;

  v34 = [(TVButtonContent *)self accessoryView];

  if (v34)
  {
    v35 = [(TVButtonContent *)self accessoryView];
    uint64_t v36 = objc_msgSend(v35, "tv_alignment");

    if (v36 == 1) {
      double v37 = v15;
    }
    else {
      double v37 = v50;
    }
    double v38 = v49 + v25 + v28 + fmax(v47 + v48 + v33 + v37, fmax(v15, v50)) * 2.0;
  }
  else
  {
    double v38 = v50 + v15 + v49 + v25 + v28;
  }
  double v39 = v51 + v52 + v30;
  double v40 = 20.0;
  if (v53 != 0.0) {
    double v40 = v53;
  }
  if (v38 <= v9 || v9 <= 0.0) {
    double v42 = v38;
  }
  else {
    double v42 = v9;
  }
  if (v38 >= v54) {
    double v43 = v42;
  }
  else {
    double v43 = v54;
  }
  if (v39 <= v11 || v11 <= 0.0) {
    double v45 = v51 + v52 + v30;
  }
  else {
    double v45 = v11;
  }
  if (v39 >= v40) {
    double v46 = v45;
  }
  else {
    double v46 = v40;
  }
  if (v56 > 0.0) {
    double v43 = v56;
  }
  if (v55 > 0.0) {
    double v46 = v55;
  }
  result.height = v46;
  result.width = v43;
  return result;
}

- (void)layoutSubviews
{
  v115.receiver = self;
  v115.super_class = (Class)TVButtonContent;
  [(_UIFloatingContentView *)&v115 layoutSubviews];
  [(TVButtonContent *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self tv_padding];
  double v12 = v11;
  double v14 = v13;
  CGFloat v101 = v10;
  CGFloat v102 = v6;
  double v111 = v10 - (v15 + v16);
  double v112 = v6 + v15;
  v17 = [(TVButtonContent *)self textContentView];
  uint64_t v18 = objc_msgSend(v17, "tv_alignment");

  double v19 = [(TVButtonContent *)self accessoryView];
  uint64_t v20 = objc_msgSend(v19, "tv_alignment");

  double v21 = [(TVButtonContent *)self accessoryView];

  double v22 = (double *)MEMORY[0x263F001B0];
  CGFloat v108 = v8;
  if (v21)
  {
    double v23 = [(TVButtonContent *)self accessoryView];
    objc_msgSend(v23, "sizeThatFits:", *v22, v22[1]);
    double v25 = v24;
    double v27 = v26;

    double v28 = [(TVButtonContent *)self accessoryView];
    objc_msgSend(v28, "tv_margin");
    double v30 = v29;
    double v32 = v31;

    if (v20 == 1)
    {
      double v33 = v12 + v30;
    }
    else
    {
      v116.origin.double x = v4;
      v116.size.height = v101;
      v116.origin.y = v102;
      v116.size.width = v8;
      double v33 = CGRectGetWidth(v116) - v14 - v25 - v32;
    }
    double v35 = v32 + v25 + v30;
    double v36 = v12 + v35;
    double v37 = v14 + v35;
    unint64_t v38 = v18 & 0xFFFFFFFFFFFFFFFDLL;
    if (v20 == 1) {
      double v39 = v36;
    }
    else {
      double v39 = v37;
    }
    double v40 = fmax(v39, fmax(v12, v14));
    double v41 = fmax(v36, v12);
    if (v20 != 1) {
      double v41 = v12;
    }
    double v42 = fmax(v37, v14);
    if (v20 == 1) {
      double v42 = v14;
    }
    double v43 = v41 + v42;
    if (v38 == 1) {
      double v12 = v41;
    }
    else {
      double v12 = v40;
    }
    if (v38 == 1) {
      double v34 = v43;
    }
    else {
      double v34 = v40 + v40;
    }
    v44 = [(TVButtonContent *)self accessoryView];
    objc_msgSend(v44, "setFrame:", v33, v112 + floor((v111 - v27) * 0.5), v25, v27);

    double v8 = v108;
  }
  else
  {
    double v34 = v12 + v14;
  }
  double v109 = v8 - v34;
  double v45 = [(TVButtonContent *)self imageView];
  if (v45)
  {
    double v46 = [(TVButtonContent *)self textContentView];
    if (v46) {
      int v47 = ![(TVButtonContent *)self imageTrailsTextContent];
    }
    else {
      int v47 = 1;
    }
  }
  else
  {
    int v47 = 1;
  }
  double v99 = v4;
  double v105 = v4 + v12;

  [(TVButtonContent *)self _imageMarginFromText];
  double v110 = v48;
  CGFloat v49 = *MEMORY[0x263F001A8];
  CGFloat v50 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v51 = [(TVButtonContent *)self textContentView];
  objc_msgSend(v51, "tv_alignmentInsetsForExpectedWidth:", 0.0);
  double v106 = v52;
  double v103 = v53;

  double v54 = [(TVButtonContent *)self imageView];
  double v55 = *v22;
  double v56 = v22[1];
  objc_msgSend(v54, "sizeThatFits:", *v22, v56);
  CGFloat v58 = v57;
  CGFloat v60 = v59;

  v117.origin.double x = v49;
  v117.origin.y = v50;
  v117.size.width = v58;
  v117.size.height = v60;
  CGFloat v61 = v112 + floor((v111 - CGRectGetHeight(v117)) * 0.5);
  v62 = [(TVButtonContent *)self textContentView];
  objc_msgSend(v62, "sizeThatFits:", v55, v56);
  CGFloat v64 = v63;
  CGFloat v66 = v65;

  v118.origin.double x = v49;
  v118.origin.y = v50;
  v118.size.width = v64;
  v118.size.height = v66;
  double Width = CGRectGetWidth(v118);
  v119.origin.double x = v49;
  CGFloat v68 = v61;
  v119.origin.y = v61;
  double rect = v58;
  v119.size.width = v58;
  CGFloat v104 = v60;
  v119.size.height = v60;
  v120.size.width = fmin(Width, v109 - (v110 + CGRectGetWidth(v119)));
  CGFloat v69 = v49;
  v120.origin.double x = v49;
  v120.origin.y = v50;
  double v70 = v120.size.width;
  double v113 = v66;
  v120.size.height = v66;
  CGFloat Height = CGRectGetHeight(v120);
  double v73 = v111;
  double v72 = v112;
  double v74 = v112 + floor((v111 - (Height - (v106 + v103))) * 0.5) - v106;
  double v107 = v74;
  if (v18 == 3)
  {
    double v81 = v105;
    double v82 = v109;
    double v83 = CGRectGetWidth(*(CGRect *)(&v72 - 1));
    v122.origin.double x = v69;
    v122.origin.y = v74;
    v122.size.width = v70;
    v122.size.height = v113;
    double v84 = v105 + v83 - CGRectGetWidth(v122);
    if (v47)
    {
      double x = v84 + 0.0;
      v123.origin.double x = v69;
      double v77 = v68;
      v123.origin.y = v68;
      v123.size.width = rect;
      double v76 = v104;
      v123.size.height = v104;
      double v85 = -(v110 + CGRectGetWidth(v123));
    }
    else
    {
      v127.origin.double x = v69;
      double v77 = v68;
      v127.origin.y = v68;
      v127.size.width = rect;
      double v76 = v104;
      v127.size.height = v104;
      v128.origin.double x = v84 - (v110 + CGRectGetWidth(v127));
      v128.origin.y = v74;
      double x = v128.origin.x;
      v128.size.width = v70;
      v128.size.height = v113;
      double v85 = v110 + CGRectGetWidth(v128);
    }
    double v80 = x + v85;
  }
  else if (v18 == 1)
  {
    double v75 = 0.0;
    double v76 = v60;
    double v77 = v68;
    if (v47)
    {
      v121.origin.double x = v69;
      v121.origin.y = v68;
      v121.size.width = v58;
      v121.size.height = v104;
      double v75 = v110 + CGRectGetWidth(v121);
    }
    double x = v105 + v75;
    double v79 = v110 + v70;
    if (v47) {
      double v79 = 0.0;
    }
    double v80 = v105 + v79;
  }
  else
  {
    v124.origin.double x = v69;
    v124.origin.y = v74;
    v124.size.width = v70;
    v124.size.height = v113;
    double v86 = CGRectGetWidth(v124);
    v125.origin.double x = v69;
    double v77 = v68;
    v125.origin.y = v68;
    v125.size.width = rect;
    double v76 = v104;
    v125.size.height = v104;
    double v87 = v105 + floor((v109 - (v110 + v86 + CGRectGetWidth(v125))) * 0.5);
    if (v47)
    {
      v126.origin.double x = v69;
      v126.origin.y = v68;
      v126.size.width = rect;
      v126.size.height = v104;
      double x = v87 + v110 + CGRectGetWidth(v126);
      double v88 = 0.0;
    }
    else
    {
      v129.origin.double x = v87 + 0.0;
      v129.origin.y = v74;
      v129.size.width = v70;
      v129.size.height = v113;
      double v88 = v110 + CGRectGetWidth(v129);
      double x = v87 + 0.0;
    }
    double v80 = v87 + v88;
  }
  if ([(TVButtonContent *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    CGFloat v89 = _TVMLRectWithFlippedOriginRelativeToBoundingRect(x, v107, v70, v113, v100, v102, v108, v101);
    double v91 = v90;
    double v113 = v92;
    double v70 = v93;
    double x = v89;
    double v80 = _TVMLRectWithFlippedOriginRelativeToBoundingRect(v80, v77, rect, v76, v100, v102, v108, v101);
    double v77 = v94;
    double rect = v95;
    double v76 = v96;
  }
  else
  {
    double v91 = v107;
  }
  v97 = [(TVButtonContent *)self textContentView];
  objc_msgSend(v97, "setFrame:", x, v91, v70, v113);

  v98 = [(TVButtonContent *)self imageView];
  objc_msgSend(v98, "setFrame:", v80, v77, rect, v76);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(TVButtonContent *)self traitCollection];
    if ([v5 userInterfaceStyle])
    {
      [v4 userInterfaceStyle];
      double v6 = [(TVButtonContent *)self traitCollection];
      [v6 userInterfaceStyle];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)TVButtonContent;
  [(_UIFloatingContentView *)&v7 traitCollectionDidChange:v4];
}

- (double)_imageMarginFromText
{
  uint64_t v3 = [(TVButtonContent *)self imageView];
  double v4 = 0.0;
  if (v3)
  {
    double v5 = (void *)v3;
    double v6 = [(TVButtonContent *)self textContentView];

    if (v6)
    {
      BOOL v7 = [(TVButtonContent *)self imageTrailsTextContent];
      double v8 = [(TVButtonContent *)self imageView];
      objc_msgSend(v8, "tv_margin");
      double v10 = v9;
      double v12 = v11;

      double v13 = [(TVButtonContent *)self textContentView];
      objc_msgSend(v13, "tv_margin");
      double v15 = v14;
      double v17 = v16;

      double v18 = fmax(v17, v10);
      double v19 = fmax(v12, v15);
      if (v7) {
        return v18;
      }
      else {
        return v19;
      }
    }
  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TVButtonContent;
  -[UIView setHighlighted:](&v5, sel_setHighlighted_);
  [(TVButtonContent *)self setSelected:v3 animated:0];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
}

- (void)_setFocused:(BOOL)a3 animationCoordinator:(id)a4
{
  if (self->_focused != a3)
  {
    self->_focused = a3;
    [(TVButtonContent *)self _updateFocusStateWithCoordinator:a4];
  }
}

- (void)_updateFloaingViewFocusState:(BOOL)a3 coordinator:(id)a4
{
  if (a3) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = 0;
  }
  [(_UIFloatingContentView *)self setControlState:v4 withAnimationCoordinator:a4];
}

- (void)_updateFocusStateWithCoordinator:(id)a3
{
  BOOL v5 = [(TVButtonContent *)self isFocused];
  if (v5) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = 0;
  }
  [(TVButtonContent *)self _updateBackgroundColorForState:v6];
  BOOL v7 = [(TVButtonContent *)self textContentView];
  [v7 setHighlighted:v5];

  double v8 = [(TVButtonContent *)self textContentView];
  [v8 setMarqueeEnabled:v5];

  double v9 = [(TVButtonContent *)self textContentView];
  [v9 setMarqueeRunning:v5];

  if (v5)
  {
    double v10 = 0.2;
  }
  else
  {
    double v11 = [(TVButtonContent *)self textContentView];
    [v11 setLineBreakMode:4];

    double v10 = 1.0;
  }
  double v12 = [(TVButtonContent *)self imageView];
  [v12 setSelected:v5 animated:0];

  double v13 = [(TVButtonContent *)self accessoryView];
  [v13 setSelected:v5 animated:0];

  double v14 = 0.37;
  v15[1] = 3221225472;
  v15[0] = MEMORY[0x263EF8330];
  v15[2] = __52__TVButtonContent__updateFocusStateWithCoordinator___block_invoke;
  v15[3] = &unk_264BA6A60;
  if (!a3) {
    double v14 = 0.0;
  }
  v15[4] = self;
  *(double *)&v15[5] = v10;
  objc_msgSend(MEMORY[0x263F1CB60], "animateWithDuration:delay:options:animations:completion:", 327684, v15, 0, v14);
}

void __52__TVButtonContent__updateFocusStateWithCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textContentView];
  [v2 setAlpha:*(double *)(a1 + 40)];

  BOOL v3 = [*(id *)(a1 + 32) imageView];
  [v3 setAlpha:*(double *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) accessoryView];
  [v4 setAlpha:*(double *)(a1 + 40)];
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (BOOL)blurEnabled
{
  return self->_blurEnabled;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (double)focusSizeIncrease
{
  return self->_focusSizeIncrease;
}

- (void)setFocusSizeIncrease:(double)a3
{
  self->_focusSizeIncrease = a3;
}

- (BOOL)imageTrailsTextContent
{
  return self->_imageTrailsTextContent;
}

- (void)setImageTrailsTextContent:(BOOL)a3
{
  self->_imageTrailsTextContent = a3;
}

- (_TVImageView)imageView
{
  return self->_imageView;
}

- (UILabel)textContentView
{
  return self->_textContentView;
}

- (_TVImageView)accessoryView
{
  return self->_accessoryView;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_textContentView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->__backgroundColor, 0);
}

@end
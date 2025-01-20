@interface PLCropOverlayPreviewBottomBar
- (PLCropOverlayPreviewBottomBar)initWithCoder:(id)a3;
- (PLCropOverlayPreviewBottomBar)initWithFrame:(CGRect)a3;
- (UIButton)cancelButton;
- (UIButton)doneButton;
- (UIButton)fileResizingButton;
- (UIButton)playbackButton;
- (int64_t)backgroundStyle;
- (void)_commonPLCropOverlayEditPhotoBottomBarInitialization;
- (void)_updateBackgroundStyle;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation PLCropOverlayPreviewBottomBar

- (UIButton)fileResizingButton
{
  return self->_fileResizingButton;
}

- (UIButton)playbackButton
{
  return self->_playbackButton;
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)_updateBackgroundStyle
{
  if (self->_backgroundStyle == 1) {
    uint64_t v3 = [MEMORY[0x1E4F428B8] clearColor];
  }
  else {
    uint64_t v3 = [MEMORY[0x1E4F428B8] colorWithWhite:0.101960786 alpha:0.75];
  }
  [(PLCropOverlayPreviewBottomBar *)self setBackgroundColor:v3];
}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __61__PLCropOverlayPreviewBottomBar_setBackgroundStyle_animated___block_invoke;
    v4[3] = &unk_1E63D2660;
    v4[4] = self;
    if (a4) {
      [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:0.3];
    }
    else {
      [(PLCropOverlayPreviewBottomBar *)self _updateBackgroundStyle];
    }
  }
}

uint64_t __61__PLCropOverlayPreviewBottomBar_setBackgroundStyle_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackgroundStyle];
}

- (void)setBackgroundStyle:(int64_t)a3
{
}

- (void)layoutSubviews
{
  v95.receiver = self;
  v95.super_class = (Class)PLCropOverlayPreviewBottomBar;
  [(PLCropOverlayPreviewBottomBar *)&v95 layoutSubviews];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F42FF0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PLCropOverlayPreviewBottomBar semanticContentAttribute](self, "semanticContentAttribute"));
  [(PLCropOverlayPreviewBottomBar *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(PLCropOverlayPreviewBottomBar *)self safeAreaInsets];
  double v93 = v7 + v12;
  double v94 = v5 + v13;
  double v91 = v11 - (v12 + v15);
  double v92 = v9 - (v13 + v14);
  [(UIButton *)self->_cancelButton sizeToFit];
  [(UIButton *)self->_cancelButton bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(UILabel *)[(UIButton *)self->_cancelButton titleLabel] frame];
  CGFloat v25 = v24;
  CGFloat rect = v26;
  CGFloat v80 = v28;
  CGFloat v82 = v27;
  -[UILabel textRectForBounds:limitedToNumberOfLines:]([(UIButton *)self->_cancelButton titleLabel], "textRectForBounds:limitedToNumberOfLines:", 1, v17, v19, v21, v23);
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v85 = v35;
  double v87 = v23;
  double v88 = v21;
  double v37 = v93;
  double v36 = v94;
  double v39 = v91;
  double v38 = v92;
  if (v3)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v36);
    v96.origin.x = v17;
    v96.origin.y = v19;
    v96.size.width = v21;
    v96.size.height = v23;
    double v41 = MaxX - CGRectGetWidth(v96) + -13.0;
  }
  else
  {
    CGFloat v42 = CGRectGetMinX(*(CGRect *)&v36) + 13.0;
    v97.origin.x = v25;
    v97.origin.y = rect;
    v97.size.height = v80;
    v97.size.width = v82;
    CGFloat v43 = v42 - CGRectGetMinX(v97);
    v98.origin.x = v30;
    v98.origin.y = v32;
    v98.size.width = v34;
    v98.size.height = v85;
    double v41 = v43 - CGRectGetMinX(v98);
  }
  double recta = v41;
  v99.origin.x = v94;
  v99.origin.y = v93;
  v99.size.width = v92;
  v99.size.height = v91;
  CGFloat v44 = CGRectGetMaxY(v99) + -32.0;
  v100.origin.x = v30;
  v100.origin.y = v32;
  v100.size.width = v34;
  v100.size.height = v85;
  double v86 = v44 - CGRectGetHeight(v100);
  [(UIButton *)self->_cancelButton setFrame:recta];
  [(UIButton *)self->_playbackButton sizeToFit];
  [(UIButton *)self->_playbackButton bounds];
  UIRectCenteredIntegralRectScale();
  [(UIButton *)self->_playbackButton setFrame:0];
  [(UIButton *)self->_doneButton sizeToFit];
  [(UIButton *)self->_doneButton bounds];
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  [(UILabel *)[(UIButton *)self->_doneButton titleLabel] frame];
  CGFloat v81 = v54;
  CGFloat v83 = v53;
  CGFloat v56 = v55;
  CGFloat v79 = v57;
  -[UILabel textRectForBounds:limitedToNumberOfLines:]([(UIButton *)self->_doneButton titleLabel], "textRectForBounds:limitedToNumberOfLines:", 1, v46, v48, v50, v52);
  CGFloat v59 = v58;
  CGFloat v61 = v60;
  CGFloat v63 = v62;
  CGFloat v65 = v64;
  double v67 = v93;
  double v66 = v94;
  double v69 = v91;
  double v68 = v92;
  if (v3)
  {
    double v70 = CGRectGetMinX(*(CGRect *)&v66) + 13.0;
    double v84 = recta;
    double v87 = v52;
    double v88 = v50;
    double recta = v70;
  }
  else
  {
    CGFloat v71 = CGRectGetMaxX(*(CGRect *)&v66) + -13.0;
    v101.size.width = v81;
    v101.origin.x = v83;
    v101.origin.y = v56;
    v101.size.height = v79;
    CGFloat v72 = v71 - CGRectGetMinX(v101);
    v102.origin.x = v59;
    v102.origin.y = v61;
    v102.size.width = v63;
    v102.size.height = v65;
    double v70 = v72 - CGRectGetMaxX(v102);
    double v84 = v70;
  }
  double v73 = v52;
  CGFloat v74 = v65;
  CGFloat v75 = v63;
  v103.origin.y = v93;
  v103.origin.x = v94;
  v103.size.height = v91;
  v103.size.width = v92;
  CGFloat v76 = CGRectGetMaxY(v103) + -32.0;
  v104.origin.x = v59;
  v104.origin.y = v61;
  v104.size.width = v75;
  v104.size.height = v74;
  double v77 = v76 - CGRectGetHeight(v104);
  -[UIButton setFrame:](self->_doneButton, "setFrame:", v70, v77, v50, v73);
  if (v3) {
    double v78 = v77;
  }
  else {
    double v78 = v86;
  }
  -[UIButton setFrame:](self->_fileResizingButton, "setFrame:", v88 + recta + 13.0, v78, v84 + -13.0 - (v88 + recta + 13.0), v87);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayPreviewBottomBar;
  [(PLCropOverlayPreviewBottomBar *)&v3 dealloc];
}

- (PLCropOverlayPreviewBottomBar)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayPreviewBottomBar;
  objc_super v3 = [(PLCropOverlayPreviewBottomBar *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(PLCropOverlayPreviewBottomBar *)v3 _commonPLCropOverlayEditPhotoBottomBarInitialization];
  }
  return v4;
}

- (PLCropOverlayPreviewBottomBar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayPreviewBottomBar;
  objc_super v3 = -[PLCropOverlayPreviewBottomBar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(PLCropOverlayPreviewBottomBar *)v3 _commonPLCropOverlayEditPhotoBottomBarInitialization];
  }
  return v4;
}

- (void)_commonPLCropOverlayEditPhotoBottomBarInitialization
{
  self->_backgroundStyle = 0;
  uint64_t v3 = objc_msgSend((id)-[PLCropOverlayPreviewBottomBar traitCollection](self, "traitCollection"), "userInterfaceIdiom");
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F42A30], "fontWithDescriptor:size:", objc_msgSend(MEMORY[0x1E4F42A38], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E4F43870]), 18.0);
  if (v3 == 6) {
    double v5 = objc_msgSend(MEMORY[0x1E4F427E0], "buttonWithConfiguration:primaryAction:", objc_msgSend(MEMORY[0x1E4F427E8], "borderlessButtonConfiguration"), 0);
  }
  else {
    double v5 = (void *)[MEMORY[0x1E4F427E0] buttonWithType:0];
  }
  objc_super v6 = v5;
  self->_cancelButton = v6;
  -[UIButton setTitleColor:forState:](v6, "setTitleColor:forState:", [MEMORY[0x1E4F428B8] whiteColor], 0);
  [(UIButton *)self->_cancelButton setExclusiveTouch:1];
  [(UILabel *)[(UIButton *)self->_cancelButton titleLabel] setFont:v4];
  [(UIButton *)self->_cancelButton setAccessibilityIdentifier:@"Cancel"];
  [(PLCropOverlayPreviewBottomBar *)self addSubview:self->_cancelButton];
  double v7 = (UIButton *)(id)[MEMORY[0x1E4F427E0] buttonWithType:0];
  self->_playbackButton = v7;
  [(UIButton *)v7 setExclusiveTouch:1];
  [(UIButton *)self->_playbackButton setAccessibilityIdentifier:@"Playback"];
  [(PLCropOverlayPreviewBottomBar *)self addSubview:self->_playbackButton];
  if (v3 == 6) {
    double v8 = objc_msgSend(MEMORY[0x1E4F427E0], "buttonWithConfiguration:primaryAction:", objc_msgSend(MEMORY[0x1E4F427E8], "borderlessButtonConfiguration"), 0);
  }
  else {
    double v8 = (void *)[MEMORY[0x1E4F427E0] buttonWithType:0];
  }
  double v9 = v8;
  self->_doneButton = v9;
  [(UIButton *)v9 setExclusiveTouch:1];
  -[UIButton setTitleColor:forState:](self->_doneButton, "setTitleColor:forState:", [MEMORY[0x1E4F428B8] whiteColor], 0);
  [(UILabel *)[(UIButton *)self->_doneButton titleLabel] setFont:v4];
  [(UIButton *)self->_doneButton setAccessibilityIdentifier:@"Done"];
  [(PLCropOverlayPreviewBottomBar *)self addSubview:self->_doneButton];
  double v10 = (UIButton *)(id)[MEMORY[0x1E4F427E0] buttonWithType:1];
  self->_fileResizingButton = v10;
  [(UIButton *)v10 setExclusiveTouch:1];
  -[UIButton setTitleColor:forState:](self->_fileResizingButton, "setTitleColor:forState:", [MEMORY[0x1E4F428B8] whiteColor], 0);
  [(UILabel *)[(UIButton *)self->_fileResizingButton titleLabel] setFont:v4];
  [(UILabel *)[(UIButton *)self->_fileResizingButton titleLabel] setAdjustsFontSizeToFitWidth:1];
  [(UIButton *)self->_fileResizingButton setHidden:1];
  [(UIButton *)self->_fileResizingButton setAccessibilityIdentifier:@"FileSize"];
  [(PLCropOverlayPreviewBottomBar *)self addSubview:self->_fileResizingButton];
  [(PLCropOverlayPreviewBottomBar *)self _updateBackgroundStyle];
}

@end
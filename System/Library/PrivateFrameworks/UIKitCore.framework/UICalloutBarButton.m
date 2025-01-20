@interface UICalloutBarButton
+ (Class)_visualProviderClassForIdiom:(int64_t)a3;
+ (id)buttonWithImage:(id)a3 action:(SEL)a4 type:(int)a5 inView:(id)a6 visualStyle:(id)a7;
+ (id)buttonWithTitle:(id)a3 action:(SEL)a4 type:(int)a5 inView:(id)a6 visualStyle:(id)a7;
+ (id)buttonWithTitle:(id)a3 image:(id)a4 action:(SEL)a5 type:(int)a6 inView:(id)a7 visualStyle:(id)a8;
+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5 action:(SEL)a6 type:(int)a7 inView:(id)a8 visualStyle:(id)a9;
+ (id)symbolConfigurationForScale:(double)a3;
- (BOOL)dontDismiss;
- (BOOL)forceFlash;
- (BOOL)isSecurePasteButton;
- (CGRect)adjustRectForPosition:(CGRect)a3;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (SEL)action;
- (UITextReplacement)textReplacement;
- (_UICalloutBarVisualStyle)visualStyle;
- (double)_scaleFactorForImage;
- (double)additionalContentHeight;
- (double)buttonHorizontalPadding;
- (double)contentScale;
- (double)contentWidth;
- (double)cornerRadius;
- (double)dividerOffset;
- (double)imageVerticalAdjust;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int)type;
- (int64_t)page;
- (unsigned)_secureName;
- (void)_commonSetupWithAction:(SEL)a3 type:(int)a4 visualStyle:(id)a5;
- (void)cancelFlash;
- (void)configureForLeftPosition:(int)a3;
- (void)configureForMiddlePosition;
- (void)configureForRightPosition:(int)a3;
- (void)configureForSingle:(int)a3;
- (void)configureForVerticalPosition:(int)a3;
- (void)configureSecurePasteButtonWithWidth:(double)a3 height:(double)a4;
- (void)dealloc;
- (void)fadeAndSendActionWithAuthenticationMessage:(id)a3;
- (void)flash:(id)a3 forEvent:(id)a4;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)removeFromSuperview;
- (void)setContentScale:(double)a3;
- (void)setDividerOffset:(double)a3;
- (void)setDontDismiss:(BOOL)a3;
- (void)setForceFlash:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageVerticalAdjust:(double)a3;
- (void)setPage:(int64_t)a3;
- (void)setTextReplacement:(id)a3;
- (void)setVisualStyle:(id)a3;
- (void)setupWithImage:(id)a3 action:(SEL)a4 type:(int)a5 visualStyle:(id)a6;
- (void)setupWithTitle:(id)a3 action:(SEL)a4 type:(int)a5 visualStyle:(id)a6;
- (void)setupWithTitle:(id)a3 image:(id)a4 action:(SEL)a5 type:(int)a6 visualStyle:(id)a7;
- (void)setupWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5 action:(SEL)a6 type:(int)a7 visualStyle:(id)a8;
- (void)touchDown;
@end

@implementation UICalloutBarButton

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5 action:(SEL)a6 type:(int)a7 inView:(id)a8 visualStyle:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  id v15 = a9;
  id v16 = a8;
  id v17 = a4;
  id v18 = a3;
  v19 = +[UIButton buttonWithType:0];
  [v19 setupWithTitle:v18 subtitle:v17 maxWidth:a6 action:v10 type:v15 visualStyle:a5];

  [v16 addSubview:v19];
  return v19;
}

+ (id)buttonWithTitle:(id)a3 action:(SEL)a4 type:(int)a5 inView:(id)a6 visualStyle:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  v14 = +[UIButton buttonWithType:0];
  [v14 setupWithTitle:v13 action:a4 type:v8 visualStyle:v11];

  [v12 addSubview:v14];
  return v14;
}

+ (id)buttonWithImage:(id)a3 action:(SEL)a4 type:(int)a5 inView:(id)a6 visualStyle:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  v14 = +[UIButton buttonWithType:0];
  [v14 setupWithImage:v13 action:a4 type:v8 visualStyle:v11];

  [v12 addSubview:v14];
  return v14;
}

+ (id)buttonWithTitle:(id)a3 image:(id)a4 action:(SEL)a5 type:(int)a6 inView:(id)a7 visualStyle:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  id v13 = a8;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  id v17 = +[UIButton buttonWithType:0];
  [v17 setupWithTitle:v16 image:v15 action:a5 type:v9 visualStyle:v13];

  [v14 addSubview:v17];
  return v17;
}

- (void)_commonSetupWithAction:(SEL)a3 type:(int)a4 visualStyle:(id)a5
{
  objc_storeStrong((id *)&self->m_visualStyle, a5);
  id v9 = a5;
  if (a3) {
    uint64_t v10 = a3;
  }
  else {
    uint64_t v10 = 0;
  }
  self->m_action = v10;
  self->m_type = a4;
  self->m_contentScale = 1.0;
  self->m_additionalContentHeight = 0.0;
  [(UIView *)self setHidden:1];
  [(UIButton *)self setAutosizesToFit:0];
  [(UIView *)self setExclusiveTouch:1];
  [(UIControl *)self addTarget:self action:sel_flash_forEvent_ forControlEvents:64];
  [(UIControl *)self addTarget:self action:sel_touchDown forControlEvents:1];
  id v11 = +[UIColor colorWithWhite:0.85 alpha:1.0];

  [(UIButton *)self setTitleColor:v11 forState:2];
  id v12 = [(UIButton *)self titleLabel];
  [v12 setClipsToBounds:0];

  [(UIControl *)self setPointerInteractionEnabled:1];
}

- (void)setupWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5 action:(SEL)a6 type:(int)a7 visualStyle:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  v75[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  [(UICalloutBarButton *)self _commonSetupWithAction:a6 type:v9 visualStyle:a8];
  self->m_isText = 0;
  id v16 = [(id)UIApp preferredContentSizeCategory];
  _UISSlotContentSizeCategoryFromContentSizeCategory(v16);
  UISCalloutBarFontSize();
  double v18 = v17;

  uint64_t v19 = [off_1E52D39B8 systemFontOfSize:v18];
  v20 = [(id)UIApp preferredContentSizeCategory];
  _UISSlotContentSizeCategoryFromContentSizeCategory(v20);
  UISCalloutBarFontSize();
  double v22 = v21;

  uint64_t v23 = [off_1E52D39B8 systemFontOfSize:v22];
  objc_msgSend(@"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcd", "_legacy_sizeWithFont:", v19);
  double v26 = v25;
  if (v24 < a5) {
    a5 = v24;
  }
  objc_msgSend(v14, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v19, 0, a5, 3.40282347e38);
  double v28 = v27;
  double v30 = v29;
  if ([v15 length])
  {
    objc_msgSend(v15, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v23, 0, a5, 3.40282347e38);
    double v32 = v31;
    double v34 = v33;
  }
  else
  {
    double v32 = *MEMORY[0x1E4F1DB30];
    double v34 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v67 = (void *)v23;
  if (v28 >= v32) {
    double v35 = v28;
  }
  else {
    double v35 = v32;
  }
  double v36 = v35 + 34.0;
  BOOL v37 = v35 <= 16.0;
  double v38 = 50.0;
  if (!v37) {
    double v38 = v36;
  }
  self->m_contentWidth = v38;
  self->m_additionalContentHeight = fmax(v30 + v34 + 8.0 + -36.0, 0.0);
  v66 = objc_opt_new();
  v39 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 17.0, 4.0, v28, v30);
  v69 = v14;
  [(UILabel *)v39 setText:v14];
  [(UILabel *)v39 setNumberOfLines:0];
  v40 = +[UIColor clearColor];
  [(UIView *)v39 setBackgroundColor:v40];

  v41 = +[UIColor whiteColor];
  [(UILabel *)v39 setTextColor:v41];

  v68 = (void *)v19;
  [(UILabel *)v39 setFont:v19];
  [(UILabel *)v39 setLineBreakMode:0];
  [(UIView *)v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self addSubview:v39];
  if (![v15 length] && v30 < v26 + v26)
  {
    [(UIView *)v39 frame];
    -[UILabel setFrame:](v39, "setFrame:");
  }
  v42 = (void *)MEMORY[0x1E4F5B268];
  v74[0] = @"padding";
  v74[1] = @"width";
  v75[0] = &unk_1ED3F1DB8;
  v43 = [NSNumber numberWithDouble:v28 + 2.0];
  v75[1] = v43;
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];
  v45 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, v39, 0);
  v46 = [v42 constraintsWithVisualFormat:@"|-(padding)-[titleLabel(<=width)]" options:0 metrics:v44 views:v45];
  [v66 addObjectsFromArray:v46];

  v47 = (void *)MEMORY[0x1E4F5B268];
  v72[0] = @"padding";
  v48 = NSNumber;
  [(UIView *)v39 frame];
  v50 = [v48 numberWithDouble:v49];
  v72[1] = @"height";
  v73[0] = v50;
  v51 = [NSNumber numberWithDouble:v30];
  v73[1] = v51;
  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
  v53 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, v39, 0);
  v54 = [v47 constraintsWithVisualFormat:@"V:|-(padding)-[titleLabel(<=height)]" options:0 metrics:v52 views:v53];
  [v66 addObjectsFromArray:v54];

  if ([v15 length])
  {
    v55 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 17.0, v30 + 4.0, v32, v34);
    [(UILabel *)v55 setText:v15];
    [(UILabel *)v55 setNumberOfLines:0];
    v56 = +[UIColor clearColor];
    [(UIView *)v55 setBackgroundColor:v56];

    v57 = +[UIColor whiteColor];
    [(UILabel *)v55 setTextColor:v57];

    [(UILabel *)v55 setFont:v67];
    [(UILabel *)v55 setLineBreakMode:0];
    [(UIView *)v55 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self addSubview:v55];
    v58 = (void *)MEMORY[0x1E4F5B268];
    v70[0] = @"padding";
    v70[1] = @"width";
    v71[0] = &unk_1ED3F1DB8;
    v59 = [NSNumber numberWithDouble:v32 + 2.0];
    v71[1] = v59;
    v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
    v61 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v55, 0);
    v62 = [v58 constraintsWithVisualFormat:@"|-padding-[label(<=width)]" options:0 metrics:v60 views:v61];
    [v66 addObjectsFromArray:v62];

    v63 = (void *)MEMORY[0x1E4F5B268];
    v64 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelLabe.isa, v39, v55, 0);
    v65 = [v63 constraintsWithVisualFormat:@"V:[titleLabel]-0-[label]" options:0 metrics:0 views:v64];
    [v66 addObjectsFromArray:v65];
  }
  [MEMORY[0x1E4F5B268] activateConstraints:v66];
}

- (void)setupWithTitle:(id)a3 action:(SEL)a4 type:(int)a5 visualStyle:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  [(UICalloutBarButton *)self _commonSetupWithAction:a4 type:v7 visualStyle:a6];
  self->m_isText = 1;
  id v11 = [(id)UIApp preferredContentSizeCategory];
  _UISSlotContentSizeCategoryFromContentSizeCategory(v11);
  UISCalloutBarFontSize();
  double v13 = v12;

  id v22 = [off_1E52D39B8 systemFontOfSize:v13];
  objc_msgSend(v10, "_legacy_sizeWithFont:", v22);
  double v15 = v14 + 34.0;
  BOOL v16 = v14 < 16.0;
  double v17 = 50.0;
  if (!v16) {
    double v17 = v15;
  }
  self->m_contentWidth = v17;
  [(UIButton *)self setTitle:v10 forState:0];

  double v18 = [(UIButton *)self titleLabel];
  uint64_t v19 = +[UIColor whiteColor];
  [v18 setTextColor:v19];

  [v18 setFont:v22];
  [v18 setTextAlignment:1];
  if (sel_paste_ == a4)
  {
    v20 = [MEMORY[0x1E4F1C9C8] now];
    m_appearanceDate = self->m_appearanceDate;
    self->m_appearanceDate = v20;
  }
}

+ (id)symbolConfigurationForScale:(double)a3
{
  v3 = [(id)UIApp preferredContentSizeCategory];
  _UISSlotContentSizeCategoryFromContentSizeCategory(v3);
  UISCalloutBarFontSize();
  double v5 = v4;

  v6 = [off_1E52D39B8 systemFontOfSize:v5];
  uint64_t v7 = +[UIImageSymbolConfiguration configurationWithFont:v6 scale:2];

  return v7;
}

- (void)setupWithImage:(id)a3 action:(SEL)a4 type:(int)a5 visualStyle:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  [(UICalloutBarButton *)self _commonSetupWithAction:a4 type:v7 visualStyle:a6];
  self->m_isText = 0;
  [(UIButton *)self setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  id v11 = +[UIColor whiteColor];
  double v12 = [v10 _flatImageWithColor:v11];
  [(UIButton *)self setImage:v12 forState:0];

  id v23 = +[UICalloutBarButton symbolConfigurationForScale:1.0];
  [(UIButton *)self setPreferredSymbolConfiguration:v23 forImageInState:0];
  double v13 = +[UIColor whiteColor];
  [(UIButton *)self setTintColor:v13];

  [(UIButton *)self _effectiveSizeForImage:v10];
  double v15 = v14;

  double v16 = 16.0;
  if (v15 >= 16.0) {
    double v16 = v15;
  }
  double v17 = 34.0;
  if (v7 == 3) {
    double v17 = 14.0;
  }
  self->m_contentWidth = v17 + v16;
  [(UIButton *)self setAdjustsImageWhenHighlighted:0];
  double v18 = [(id)UIApp preferredContentSizeCategory];
  _UISSlotContentSizeCategoryFromContentSizeCategory(v18);
  UISCalloutBarFontSize();
  double v20 = v19;

  double v21 = [off_1E52D39B8 systemFontOfSize:v20];
  id v22 = [(UIButton *)self titleLabel];
  [v22 setFont:v21];
}

- (void)setupWithTitle:(id)a3 image:(id)a4 action:(SEL)a5 type:(int)a6 visualStyle:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a4;
  id v13 = a3;
  [(UICalloutBarButton *)self _commonSetupWithAction:a5 type:v8 visualStyle:a7];
  double v14 = [(id)UIApp preferredContentSizeCategory];
  _UISSlotContentSizeCategoryFromContentSizeCategory(v14);
  UISCalloutBarFontSize();
  double v16 = v15;

  id v27 = [off_1E52D39B8 systemFontOfSize:v16];
  objc_msgSend(v13, "_legacy_sizeWithFont:", v27);
  if (v17 < 16.0) {
    double v17 = 16.0;
  }
  self->m_contentWidth = v17;
  [(UIButton *)self setTitle:v13 forState:0];

  double v18 = [(UIButton *)self titleLabel];
  double v19 = +[UIColor whiteColor];
  [v18 setTextColor:v19];

  [v18 setFont:v27];
  [v18 setTextAlignment:1];
  [(UIButton *)self setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  double v20 = +[UIColor whiteColor];
  [(UIButton *)self setTintColor:v20];

  [(UIButton *)self setImage:v12 forState:0];
  double v21 = +[UIImageSymbolConfiguration configurationWithFont:v27 scale:2];
  [(UIButton *)self setPreferredSymbolConfiguration:v21 forImageInState:0];
  self->m_contentWidth = self->m_contentWidth + 5.0;
  if ([(UIView *)self effectiveUserInterfaceLayoutDirection] == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v22 = -5.0;
  }
  else {
    double v22 = 5.0;
  }
  -[UIButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, -v22, 0.0);
  [(UIButton *)self _effectiveSizeForImage:v12];
  double v24 = v23;

  double v25 = v24 + self->m_contentWidth;
  if (v25 < 16.0) {
    double v25 = 16.0;
  }
  double v26 = 34.0;
  if (v8 == 3) {
    double v26 = 14.0;
  }
  self->m_contentWidth = v26 + v25;
  [(UIButton *)self setAdjustsImageWhenHighlighted:0];
}

- (void)dealloc
{
  [(UICalloutBarButton *)self cancelFlash];
  v3.receiver = self;
  v3.super_class = (Class)UICalloutBarButton;
  [(UIButton *)&v3 dealloc];
}

- (void)removeFromSuperview
{
  [(UICalloutBarButton *)self cancelFlash];
  [(UIView *)self _setInteractionTintColor:0];
  v3.receiver = self;
  v3.super_class = (Class)UICalloutBarButton;
  [(UIView *)&v3 removeFromSuperview];
}

- (double)buttonHorizontalPadding
{
  v2 = [(_UICalloutBarVisualStyle *)self->m_visualStyle buttonMetrics];
  [v2 horizontalPadding];
  double v4 = v3;

  return v4;
}

- (double)cornerRadius
{
  v2 = [(_UICalloutBarVisualStyle *)self->m_visualStyle barMetrics];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (CGRect)adjustRectForPosition:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self _currentScreenScale];
  double v9 = 1.0 / v8;
  int m_position = self->m_position;
  if (m_position != 1)
  {
    if (m_position) {
      goto LABEL_5;
    }
    double v9 = v9 + 0.0;
  }
  double x = x + v9;
LABEL_5:
  double v11 = x + 5.0;
  if (!self->m_padLeft) {
    double v11 = x;
  }
  if (self->m_padRight) {
    double v11 = v11 + -5.0;
  }
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UICalloutBarButton;
  -[UIButton titleRectForContentRect:](&v14, sel_titleRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UICalloutBarButton adjustRectForPosition:](self, "adjustRectForPosition:");
  double v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(UICalloutBarButton *)self buttonHorizontalPadding];
  if (self->m_contentScale >= 0.642857143 || (CGFloat v13 = 8.0, self->m_position == 4)) {
    CGFloat v13 = -2.0;
  }
  v15.origin.double x = v12 + v5;
  v15.origin.CGFloat y = v7;
  v15.size.CGFloat width = v9;
  v15.size.CGFloat height = v11;
  return CGRectInset(v15, v13, 0.0);
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UICalloutBarButton;
  -[UIButton imageRectForContentRect:](&v9, sel_imageRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UICalloutBarButton adjustRectForPosition:](self, "adjustRectForPosition:");
  double v8 = v7 + self->m_imageVerticalAdjust;
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v8;
  result.origin.double x = v4;
  return result;
}

- (void)configureSecurePasteButtonWithWidth:(double)a3 height:(double)a4
{
  if (self->m_action) {
    SEL m_action = self->m_action;
  }
  else {
    SEL m_action = 0;
  }
  double v8 = [MEMORY[0x1E4FB3418] variantForSelector:m_action];
  objc_super v9 = v8;
  if (v8)
  {
    double v10 = [v8 localizedStringForLocalization:0];
    [(UIButton *)self setTitle:v10];

    id WeakRetained = objc_loadWeakRetained((id *)&self->m_securePasteButtonSlotView);
    if (WeakRetained)
    {
      double v12 = (_UISlotView *)objc_loadWeakRetained((id *)&self->m_securePasteButtonSlotView);
    }
    else
    {
      double v12 = objc_alloc_init(_UISlotView);
      objc_storeWeak((id *)&self->m_securePasteButtonSlotView, v12);
    }
    -[UIButton contentRectForBounds:](self, "contentRectForBounds:", 0.0, 0.0, a3, a4);
    -[UICalloutBarButton titleRectForContentRect:](self, "titleRectForContentRect:");
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = (void *)MEMORY[0x1E4F881E0];
    uint64_t v20 = [v9 secureName];
    if (self->m_position == 4) {
      double v21 = NAN;
    }
    else {
      double v21 = v18;
    }
    double v22 = objc_msgSend(v19, "calloutBarPasteButtonTagWithSecureName:size:titleOrigin:titleWidth:contentScaleLevel:", v20, (unint64_t)(self->m_contentScale * 10.0), a3, a4, v14, v16, v21);
    objc_initWeak(&location, self);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke;
    v31[3] = &unk_1E52DDC40;
    id v23 = v22;
    id v32 = v23;
    [(_UISlotView *)v12 _setSlotStyleResolver:v31];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    id v27 = __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_2;
    double v28 = &unk_1E52DDCB8;
    id v24 = v23;
    id v29 = v24;
    objc_copyWeak(&v30, &location);
    [(_UISlotView *)v12 _setSlotAnyContentProvider:&v25];
    -[_UISlotView _overlayView:centerInView:](v12, "_overlayView:centerInView:", self, self, v25, v26, v27, v28);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&location);
  }
}

uint64_t __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolvedStyleForStyle:a2];
}

void __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_3;
  block[3] = &unk_1E52DDC90;
  v16[1] = a2;
  id v13 = v7;
  id v14 = *(id *)(a1 + 32);
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  objc_copyWeak(v16, (id *)(a1 + 40));
  dispatch_async(v9, block);

  objc_destroyWeak(v16);
}

void __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_3(uint64_t a1)
{
  v2 = +[_UIConcretePasteboard _remoteContentForLayerContextWithId:*(void *)(a1 + 64) slotStyle:*(void *)(a1 + 32) pasteButtonTag:*(void *)(a1 + 40)];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_4;
    block[3] = &unk_1E52DDC68;
    id v5 = *(id *)(a1 + 48);
    id v4 = v2;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v6);
  }
}

void __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_4(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v2 = +[UIColor clearColor];
    [WeakRetained setTitleColor:v2 forState:0];
  }
}

- (unsigned)_secureName
{
  if (self->m_action) {
    SEL m_action = self->m_action;
  }
  else {
    SEL m_action = 0;
  }
  double v3 = [MEMORY[0x1E4FB3418] variantForSelector:m_action];
  id v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 secureName];
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

- (void)configureForSingle:(int)a3
{
  self->int m_position = 3;
  self->m_single = 1;
  self->m_padLeft = a3 == 3;
  self->m_padRight = a3 == 4;
  [(UIButton *)self setNeedsLayout];
}

- (void)configureForLeftPosition:(int)a3
{
  self->int m_position = 0;
  self->m_single = 0;
  self->m_padLeft = a3 == 3;
  self->m_padRight = 0;
  [(UIButton *)self setNeedsLayout];
}

- (void)configureForMiddlePosition
{
  self->int m_position = 1;
  self->m_single = 0;
  self->m_padLeft = 0;
  self->m_padRight = 0;
  [(UIButton *)self setNeedsLayout];
}

- (void)configureForRightPosition:(int)a3
{
  self->int m_position = 2;
  self->m_single = 0;
  self->m_padLeft = 0;
  self->m_padRight = a3 == 4;
  [(UIButton *)self setNeedsLayout];
}

- (void)configureForVerticalPosition:(int)a3
{
  self->int m_position = 4;
  self->m_single = 0;
  self->m_padLeft = a3 == 3;
  self->m_padRight = 0;
  [(UIButton *)self setNeedsLayout];
}

- (BOOL)isSecurePasteButton
{
  SEL m_action = (char *)self->m_action;
  if (m_action)
  {
    if (sel_paste_ != m_action && sel_pasteAndMatchStyle_ != m_action && sel_pasteAndGo_ != m_action) {
      return m_action == sel_pasteAndSearch_;
    }
    return 1;
  }
  if (sel_paste_) {
    BOOL v5 = sel_pasteAndMatchStyle_ == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || sel_pasteAndGo_ == 0) {
    return 1;
  }
  SEL m_action = 0;
  return m_action == sel_pasteAndSearch_;
}

- (void)setContentScale:(double)a3
{
  if (self->m_contentScale != a3)
  {
    self->m_contentScale = a3;
    id v4 = [(id)UIApp preferredContentSizeCategory];
    _UISSlotContentSizeCategoryFromContentSizeCategory(v4);
    UISCalloutBarFontSize();
    double v6 = v5;

    id v7 = [off_1E52D39B8 systemFontOfSize:v6];
    id v8 = [(UIButton *)self titleLabel];
    [v8 setFont:v7];

    id v10 = +[UICalloutBarButton symbolConfigurationForScale:self->m_contentScale];
    objc_super v9 = [(UIButton *)self imageView];
    [v9 setPreferredSymbolConfiguration:v10];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || ![(UICalloutBarButton *)self forceFlash])
  {
    double v5 = +[UICalloutBar sharedCalloutBar];
    v6.receiver = self;
    v6.super_class = (Class)UICalloutBarButton;
    [(UIButton *)&v6 setHighlighted:v3];
    [v5 buttonHighlighted:self highlighted:v3];
  }
}

- (void)fadeAndSendActionWithAuthenticationMessage:(id)a3
{
  id v4 = a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("CalloutBar", &_MergedGlobals_19_3);
  objc_super v6 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FadeAndSendAction", "", buf, 2u);
    }
  }

  [(UICalloutBarButton *)self cancelFlash];
  +[UIPasteboard _attemptAuthenticationWithMessage:v4];

  objc_super v9 = +[UICalloutBar sharedCalloutBar];
  [v9 performSelector:sel_buttonPressed_ withObject:self];

  unint64_t v10 = __UILogGetCategoryCachedImpl("CalloutBar", &qword_1EB25D840);
  id v11 = *(id *)(v10 + 8);
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(*(os_log_t *)(v10 + 8), self);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)id v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v11, OS_SIGNPOST_INTERVAL_END, v13, "FadeAndSendAction", "", v14, 2u);
    }
  }
}

- (void)cancelFlash
{
  if ([(UICalloutBarButton *)self forceFlash])
  {
    [(id)UIApp endIgnoringInteractionEvents];
    [(UICalloutBarButton *)self setForceFlash:0];
  }
}

- (void)flash:(id)a3 forEvent:(id)a4
{
  id v5 = a4;
  [(UICalloutBarButton *)self setHighlighted:1];
  [(UICalloutBarButton *)self setForceFlash:1];
  [(id)UIApp beginIgnoringInteractionEvents];
  if ([(UICalloutBarButton *)self isSecurePasteButton])
  {
    objc_super v6 = [v5 _authenticationMessage];
    [(UICalloutBarButton *)self performSelector:sel_fadeAndSendActionWithAuthenticationMessage_ withObject:v6 afterDelay:0.1];
  }
  else
  {
    [(UICalloutBarButton *)self performSelector:sel_fadeAndSendActionWithAuthenticationMessage_ withObject:0 afterDelay:0.1];
  }
  os_signpost_id_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("CalloutBar", &flash_forEvent____s_category) + 8);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)os_signpost_id_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Flash", "", v8, 2u);
  }
}

- (void)touchDown
{
  if (self->m_action == sel_paste_) {
    _UIPasteboardAnalyticsReportEvent(@"CalloutBar", self->m_appearanceDate);
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  objc_super v6 = +[UICalloutBar sharedCalloutBar];
  uint64_t v7 = [v6 indexOfButton:self];

  [(UIView *)self bounds];
  CGRect v17 = CGRectInset(v16, -1.0, 0.0);
  double x = v17.origin.x;
  double y = v17.origin.y;
  double width = v17.size.width;
  double height = v17.size.height;
  os_signpost_id_t v12 = [NSNumber numberWithInteger:v7];
  os_signpost_id_t v13 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v12, x, y, width, height);

  return v13;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = [[UITargetedPreview alloc] initWithView:self];
  [(UIView *)self frame];
  CGRect v17 = CGRectInset(v16, 2.0, 2.0);
  double x = v17.origin.x;
  double y = v17.origin.y;
  double width = v17.size.width;
  double height = v17.size.height;
  [(UICalloutBarButton *)self cornerRadius];
  id v11 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v10 + -2.0);
  os_signpost_id_t v12 = +[UIPointerEffect effectWithPreview:v5];
  os_signpost_id_t v13 = +[UIPointerStyle styleWithEffect:v12 shape:v11];

  return v13;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_super v9 = [v7 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [v7 identifier];
    uint64_t v12 = [v11 integerValue];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__UICalloutBarButton_pointerInteraction_willEnterRegion_animator___block_invoke;
    v13[3] = &unk_1E52D9CD0;
    v13[4] = self;
    v13[5] = v12;
    [v8 addAnimations:v13];
  }
}

void __66__UICalloutBarButton_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  id v2 = +[UICalloutBar sharedCalloutBar];
  [v2 buttonHovered:*(void *)(a1 + 32) index:*(void *)(a1 + 40) hovered:1];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_super v9 = [v7 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [v7 identifier];
    uint64_t v12 = [v11 integerValue];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__UICalloutBarButton_pointerInteraction_willExitRegion_animator___block_invoke;
    v13[3] = &unk_1E52D9CD0;
    v13[4] = self;
    v13[5] = v12;
    [v8 addAnimations:v13];
  }
}

void __65__UICalloutBarButton_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  id v2 = +[UICalloutBar sharedCalloutBar];
  [v2 buttonHovered:*(void *)(a1 + 32) index:*(void *)(a1 + 40) hovered:0];
}

- (SEL)action
{
  if (self->m_action) {
    return self->m_action;
  }
  else {
    return 0;
  }
}

- (double)contentWidth
{
  return self->m_contentWidth;
}

- (double)contentScale
{
  return self->m_contentScale;
}

- (double)additionalContentHeight
{
  return self->m_additionalContentHeight;
}

- (int)type
{
  return self->m_type;
}

- (_UICalloutBarVisualStyle)visualStyle
{
  return self->m_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
}

- (UITextReplacement)textReplacement
{
  return self->m_textReplacement;
}

- (void)setTextReplacement:(id)a3
{
}

- (BOOL)forceFlash
{
  return self->forceFlash;
}

- (void)setForceFlash:(BOOL)a3
{
  self->forceFlash = a3;
}

- (int64_t)page
{
  return self->m_page;
}

- (void)setPage:(int64_t)a3
{
  self->m_page = a3;
}

- (double)dividerOffset
{
  return self->m_dividerOffset;
}

- (void)setDividerOffset:(double)a3
{
  self->m_dividerOffset = a3;
}

- (double)imageVerticalAdjust
{
  return self->m_imageVerticalAdjust;
}

- (void)setImageVerticalAdjust:(double)a3
{
  self->m_imageVerticalAdjust = a3;
}

- (BOOL)dontDismiss
{
  return self->m_dontDismiss;
}

- (void)setDontDismiss:(BOOL)a3
{
  self->m_dontDismiss = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_visualStyle, 0);
  objc_destroyWeak((id *)&self->m_securePasteButtonSlotView);
  objc_storeStrong((id *)&self->m_appearanceDate, 0);
  objc_storeStrong((id *)&self->m_textReplacement, 0);
}

- (double)_scaleFactorForImage
{
  id v2 = [(id)UIApp preferredContentSizeCategory];
  BOOL v3 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v2];

  id v4 = [v3 preferredContentSizeCategory];
  id v5 = v4;
  if ((unint64_t)_UISSlotContentSizeCategoryFromContentSizeCategory(v4) >= 9)
  {
    id v5 = UISGetFontContentSizeCategory();
  }
  objc_super v6 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v5];

  double v7 = _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection(v6);
  return v7;
}

@end
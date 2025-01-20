@interface SFTabOverviewItemContentView
+ (void)initialize;
- (BOOL)allowsBorrowedContentTopBackdropUnderlap;
- (BOOL)allowsSnapshotTopBackdropUnderlap;
- (BOOL)canBecomeFocused;
- (BOOL)enableDelegateLayoutNotification;
- (BOOL)isRecording;
- (BOOL)isUnread;
- (BOOL)minYMatchesTopBarMaxYWhenZoomed;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)attachedViewReferenceRect;
- (NSArray)shareParticipants;
- (NSString)title;
- (SFTabOverviewItemContentView)initWithFrame:(CGRect)a3;
- (SFTabOverviewItemContentViewDelegate)delegate;
- (TabIconAndTitleView)titleView;
- (TabSnapshotImageView)snapshotView;
- (UIButton)closeButton;
- (UIEdgeInsets)titlePadding;
- (UIImage)icon;
- (UIImage)snapshotImage;
- (UIView)attachedView;
- (UIView)borrowedContentView;
- (UIView)dimmingView;
- (UIView)headerBackgroundView;
- (UIView)participantsBackgroundView;
- (UIView)placeholderView;
- (UIView)recordingIndicatorView;
- (UIView)snapshotClipperView;
- (_SFBarTheme)topBarTheme;
- (double)cornerRadius;
- (double)shadowOpacity;
- (double)titleHeight;
- (double)titleRevealPercent;
- (double)visibleTopBackdropHeight;
- (id)_headerBackgroundColor;
- (id)focusEffect;
- (int64_t)effectiveHeaderMode;
- (unint64_t)mediaStateIcon;
- (void)_updateContentSizeCategory;
- (void)layoutSubviews;
- (void)setAllowsBorrowedContentTopBackdropUnderlap:(BOOL)a3;
- (void)setAllowsSnapshotTopBackdropUnderlap:(BOOL)a3;
- (void)setAttachedView:(id)a3;
- (void)setAttachedViewReferenceRect:(CGRect)a3;
- (void)setBorrowedContentView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setEnableDelegateLayoutNotification:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setMinYMatchesTopBarMaxYWhenZoomed:(BOOL)a3;
- (void)setRecording:(BOOL)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShareParticipants:(id)a3;
- (void)setSnapshotImage:(id)a3;
- (void)setSnapshotView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleRevealPercent:(double)a3;
- (void)setTopBarTheme:(id)a3;
- (void)setUnread:(BOOL)a3;
- (void)setVisibleTopBackdropHeight:(double)a3;
@end

@implementation SFTabOverviewItemContentView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v2 = *MEMORY[0x1E4FB27A8];
    v3 = [MEMORY[0x1E4F28F08] mainQueue];
    id v4 = (id)[v5 addObserverForName:v2 object:0 queue:v3 usingBlock:&__block_literal_global_38];
  }
}

void __42__SFTabOverviewItemContentView_initialize__block_invoke()
{
  v0 = (void *)cachedTitleFont;
  cachedTitleFont = 0;

  cachedTitleViewHeight = 0;
}

- (SFTabOverviewItemContentView)initWithFrame:(CGRect)a3
{
  v73[10] = *MEMORY[0x1E4F143B8];
  v71.receiver = self;
  v71.super_class = (Class)SFTabOverviewItemContentView;
  id v3 = -[SFTabOverviewItemContentView initWithFrame:](&v71, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v5 = (void *)*((void *)v3 + 60);
    *((void *)v3 + 60) = v4;

    [*((id *)v3 + 60) setClipsToBounds:1];
    v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [*((id *)v3 + 60) setBackgroundColor:v6];

    [v3 addSubview:*((void *)v3 + 60)];
    v7 = [[TabSnapshotImageView alloc] initWithImage:0];
    v8 = (void *)*((void *)v3 + 66);
    *((void *)v3 + 66) = v7;

    if (tabSnapshotHasTransparentBorderPadding())
    {
      objc_msgSend(*((id *)v3 + 66), "setCropInsets:", 0.0, 1.0, 0.0, 1.0);
      objc_msgSend(*((id *)v3 + 66), "setImagePosition:", 0.5, 0.0);
    }
    [*((id *)v3 + 60) addSubview:*((void *)v3 + 66)];
    id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
    v10 = (void *)placeholderImage_image;
    if (!placeholderImage_image)
    {
      v11 = (void *)MEMORY[0x1E4FB1818];
      v12 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2928] scale:3];
      uint64_t v13 = [v11 systemImageNamed:@"safari" withConfiguration:v12];
      v14 = (void *)placeholderImage_image;
      placeholderImage_image = v13;

      v10 = (void *)placeholderImage_image;
    }
    id v15 = v10;
    uint64_t v16 = [v9 initWithImage:v15];
    v17 = (void *)*((void *)v3 + 57);
    *((void *)v3 + 57) = v16;

    [*((id *)v3 + 57) setContentMode:4];
    v18 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [*((id *)v3 + 57) setTintColor:v18];

    [*((id *)v3 + 60) addSubview:*((void *)v3 + 57)];
    id v19 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v20 = (void *)*((void *)v3 + 54);
    *((void *)v3 + 54) = v19;

    [*((id *)v3 + 60) addSubview:*((void *)v3 + 54)];
    id v21 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v22 = (void *)*((void *)v3 + 56);
    *((void *)v3 + 56) = v21;

    v23 = +[TabThumbnailCloseButton backgroundColor];
    [*((id *)v3 + 56) setBackgroundColor:v23];

    [*((id *)v3 + 56) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v3 + 60) addSubview:*((void *)v3 + 56)];
    id v24 = objc_alloc_init(MEMORY[0x1E4F781D0]);
    v25 = (void *)*((void *)v3 + 55);
    *((void *)v3 + 55) = v24;

    [*((id *)v3 + 55) setAlignment:0];
    [*((id *)v3 + 55) setAvatarDiameter:30.0];
    [*((id *)v3 + 55) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v3 + 56) addSubview:*((void *)v3 + 55)];
    v26 = objc_alloc_init(TabThumbnailRecordingIndicator);
    v27 = (void *)*((void *)v3 + 59);
    *((void *)v3 + 59) = v26;

    [*((id *)v3 + 59) setAlpha:0.0];
    [*((id *)v3 + 59) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v3 + 60) addSubview:*((void *)v3 + 59)];
    id v28 = -[TabIconAndTitleView initWithAlignment:]([TabIconAndTitleView alloc], 0);
    v29 = (void *)*((void *)v3 + 61);
    *((void *)v3 + 61) = v28;

    -[TabIconAndTitleView setNumberOfLines:](*((void *)v3 + 61), 0);
    v30 = [MEMORY[0x1E4FB1618] labelColor];
    -[TabIconAndTitleView setTextColor:](*((void *)v3 + 61), (uint64_t)v30);

    [*((id *)v3 + 61) setInsetsLayoutMarginsFromSafeArea:0];
    [v3 addSubview:*((void *)v3 + 61)];
    v31 = objc_alloc_init(TabThumbnailCloseButton);
    v32 = (void *)*((void *)v3 + 52);
    *((void *)v3 + 52) = v31;

    [*((id *)v3 + 52) setAlpha:0.0];
    [*((id *)v3 + 52) setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    [*((id *)v3 + 52) setImage:v33];

    [v3 addSubview:*((void *)v3 + 52)];
    v58 = (void *)MEMORY[0x1E4F28DC8];
    v70 = [*((id *)v3 + 52) centerXAnchor];
    v69 = [v3 trailingAnchor];
    double v34 = *MEMORY[0x1E4F787F0];
    v68 = [v70 constraintEqualToAnchor:v69 constant:-*MEMORY[0x1E4F787F0]];
    v73[0] = v68;
    v67 = [*((id *)v3 + 52) centerYAnchor];
    v66 = [v3 topAnchor];
    v65 = [v67 constraintEqualToAnchor:v66 constant:v34];
    v73[1] = v65;
    v64 = [*((id *)v3 + 59) centerXAnchor];
    v63 = [v3 leadingAnchor];
    v62 = [v64 constraintEqualToAnchor:v63 constant:v34];
    v73[2] = v62;
    v61 = [*((id *)v3 + 59) centerYAnchor];
    v60 = [v3 topAnchor];
    v59 = [v61 constraintEqualToAnchor:v60 constant:v34];
    v73[3] = v59;
    v57 = [*((id *)v3 + 56) leadingAnchor];
    v56 = [*((id *)v3 + 60) leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v73[4] = v55;
    v54 = [*((id *)v3 + 56) trailingAnchor];
    v53 = [*((id *)v3 + 60) trailingAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v73[5] = v52;
    v51 = [*((id *)v3 + 56) bottomAnchor];
    v50 = [*((id *)v3 + 60) bottomAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v73[6] = v49;
    v48 = [*((id *)v3 + 55) centerXAnchor];
    v35 = [*((id *)v3 + 56) centerXAnchor];
    v36 = [v48 constraintEqualToAnchor:v35];
    v73[7] = v36;
    v37 = [*((id *)v3 + 55) topAnchor];
    v38 = [*((id *)v3 + 56) topAnchor];
    v39 = [v37 constraintEqualToAnchor:v38 constant:5.0];
    v73[8] = v39;
    v40 = [*((id *)v3 + 55) bottomAnchor];
    v41 = [*((id *)v3 + 56) bottomAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:-7.0];
    v73[9] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:10];
    [v58 activateConstraints:v43];

    uint64_t v72 = objc_opt_class();
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    id v45 = (id)[v3 registerForTraitChanges:v44 withTarget:v3 action:sel__updateContentSizeCategory];

    [v3 _updateContentSizeCategory];
    id v46 = v3;
  }

  return (SFTabOverviewItemContentView *)v3;
}

- (void)layoutSubviews
{
  v102.receiver = self;
  v102.super_class = (Class)SFTabOverviewItemContentView;
  [(SFTabOverviewItemContentView *)&v102 layoutSubviews];
  id v3 = [(UIView *)self->_snapshotClipperView superview];

  if (!v3)
  {
    [(SFTabOverviewItemContentView *)self insertSubview:self->_snapshotClipperView belowSubview:self->_closeButton];
    [(UIView *)self->_snapshotClipperView setAlpha:1.0];
  }
  [(SFTabOverviewItemContentView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(SFTabOverviewItemContentView *)self titlePadding];
  double v13 = v12;
  double v97 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v103.origin.CGFloat x = v5;
  v103.origin.CGFloat y = v7;
  v103.size.width = v9;
  v103.size.height = v11;
  double v20 = v13 + CGRectGetMaxY(v103) - self->_titleHeight - v17;
  v104.origin.CGFloat x = v5;
  v104.origin.CGFloat y = v7;
  v104.size.width = v9;
  v104.size.height = v11;
  -[TabIconAndTitleView setFrame:](self->_titleView, "setFrame:", v15, v20, CGRectGetWidth(v104) - v15 - v19, self->_titleHeight);
  v105.origin.CGFloat x = v5;
  v105.origin.CGFloat y = v7;
  v105.size.width = v9;
  v105.size.height = v11;
  double Height = CGRectGetHeight(v105);
  double titleRevealPercent = self->_titleRevealPercent;
  [(SFTabOverviewItemContentView *)self titleHeight];
  double v24 = Height - titleRevealPercent * (v17 + v97 + v23);
  double v98 = 0.0;
  if (self->_minYMatchesTopBarMaxYWhenZoomed) {
    double v98 = -fmax(self->_visibleTopBackdropHeight, 0.0);
  }
  v106.origin.CGFloat x = v5;
  v106.origin.CGFloat y = v7;
  v106.size.width = v9;
  v106.size.height = v11;
  CGFloat rect_24 = v9;
  double Width = CGRectGetWidth(v106);
  CGFloat rect = v5;
  double v26 = v24 + fmax(self->_visibleTopBackdropHeight, 0.0);
  -[UIView setFrame:](self->_snapshotClipperView, "setFrame:", 0.0, v98, Width, v26);
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __46__SFTabOverviewItemContentView_layoutSubviews__block_invoke;
  v101[3] = &unk_1E6D7B8F0;
  v101[4] = self;
  v101[5] = 0;
  *(double *)&v101[6] = v98;
  *(double *)&v101[7] = Width;
  double rect_8 = v26;
  double rect_16 = Width;
  *(double *)&v101[8] = v26;
  *(double *)&v101[9] = v24;
  v27 = (void (**)(void, void))MEMORY[0x1E4E42950](v101);
  ((void (**)(void, BOOL))v27)[2](v27, self->_allowsSnapshotTopBackdropUnderlap);
  -[TabSnapshotImageView setFrame:](self->_snapshotView, "setFrame:");
  v27[2](v27, 0);
  -[UIView setFrame:](self->_placeholderView, "setFrame:");
  [(UIView *)self->_borrowedContentView bounds];
  double v28 = v11;
  CGFloat v29 = v7;
  CGFloat x = v107.origin.x;
  CGFloat y = v107.origin.y;
  CGFloat v32 = v107.size.width;
  CGFloat v33 = v107.size.height;
  if (CGRectGetWidth(v107) != 0.0)
  {
    CGFloat v34 = ((double (*)(void, BOOL))v27[2])(v27, self->_allowsBorrowedContentTopBackdropUnderlap);
    CGFloat v91 = v35;
    CGFloat v88 = v36;
    CGFloat v89 = x;
    CGFloat v37 = v28;
    CGFloat v38 = v35;
    CGFloat v40 = v39;
    CGFloat v90 = v39;
    v108.origin.CGFloat x = rect;
    v108.origin.CGFloat y = v29;
    v108.size.width = rect_24;
    v108.size.height = v37;
    double v41 = CGRectGetWidth(v108);
    v109.origin.CGFloat x = x;
    v109.origin.CGFloat y = y;
    v109.size.width = v32;
    v109.size.height = v33;
    double v42 = v41 / CGRectGetWidth(v109);
    v110.origin.CGFloat x = v34;
    v110.origin.CGFloat y = v38;
    v110.size.width = v88;
    v110.size.height = v40;
    double MinX = CGRectGetMinX(v110);
    v44 = [(UIView *)self->_borrowedContentView layer];
    [v44 anchorPoint];
    double v46 = v45;
    v111.origin.CGFloat x = v89;
    v111.origin.CGFloat y = y;
    v111.size.width = v32;
    v111.size.height = v33;
    double recta = MinX + v46 * CGRectGetWidth(v111) * v42;
    v112.origin.CGFloat y = v91;
    v112.origin.CGFloat x = v34;
    v112.size.width = v88;
    v112.size.height = v90;
    double MinY = CGRectGetMinY(v112);
    v48 = [(UIView *)self->_borrowedContentView layer];
    [v48 anchorPoint];
    double v50 = v49;
    v113.origin.CGFloat x = v89;
    v113.origin.CGFloat y = y;
    v113.size.width = v32;
    v113.size.height = v33;
    double v51 = MinY + v50 * CGRectGetHeight(v113) * v42;
    v52 = [(UIView *)self->_borrowedContentView layer];
    objc_msgSend(v52, "setPosition:", recta, v51);
  }
  v114.origin.CGFloat y = v98;
  v114.origin.CGFloat x = 0.0;
  v114.size.height = rect_8;
  v114.size.width = rect_16;
  double v53 = CGRectGetWidth(v114);
  [(SFTabOverviewItemContentView *)self visibleTopBackdropHeight];
  -[UIView setFrame:](self->_headerBackgroundView, "setFrame:", 0.0, 0.0, v53, v54);
  v55 = [(SFTabOverviewItemContentView *)self _headerBackgroundColor];
  [(UIView *)self->_headerBackgroundView setBackgroundColor:v55];

  v56 = [(TabSnapshotImageView *)self->_snapshotView image];
  v57 = v56;
  if (v56)
  {
    [v56 capInsets];
    if (v61 == *(double *)(MEMORY[0x1E4FB2848] + 8)
      && v58 == *MEMORY[0x1E4FB2848]
      && v60 == *(double *)(MEMORY[0x1E4FB2848] + 24)
      && v59 == *(double *)(MEMORY[0x1E4FB2848] + 16))
    {
      [v57 size];
      if (v62 > 0.0)
      {
        [v57 size];
        [v57 scale];
        if (tabSnapshotHasTransparentBorderPadding()) {
          _SFOnePixel();
        }
        _SFCeilingFloatToPixels();
        -[TabSnapshotImageView setImagePosition:](self->_snapshotView, "setImagePosition:", 0.5, v63);
      }
    }
  }
  v64 = [(SFTabOverviewItemContentView *)self window];
  [v64 bounds];
  double v66 = v65;
  double v68 = v67;

  if (self->_attachedView && v66 > 0.0 && v68 > 0.0)
  {
    UIRectGetCenter();
    double v70 = v69 / v66;
    double v72 = v71 / v68;
    v115.origin.CGFloat x = 0.0;
    v115.origin.CGFloat y = v98;
    v115.size.width = rect_16;
    v115.size.height = rect_8;
    CGFloat v73 = CGRectGetWidth(v115) * v70;
    v116.origin.CGFloat x = 0.0;
    v116.origin.CGFloat y = v98;
    v116.size.width = rect_16;
    v116.size.height = rect_8;
    double v74 = CGRectGetHeight(v116);
    [(SFTabOverviewItemContentView *)self visibleTopBackdropHeight];
    double v76 = -(v75 - (v72 + -1.0 + 1.0) * v74);
    v77 = [(UIView *)self->_attachedView superview];
    objc_msgSend(v77, "convertPoint:fromView:", self, v73, v76);
    _SFRoundPointToPixels();
    -[UIView setCenter:](self->_attachedView, "setCenter:");

    v78 = [(UIView *)self->_attachedView superview];
    -[SFTabOverviewItemContentView convertRect:toView:](self, "convertRect:toView:", v78, 0.0, v98, rect_16, rect_8);
    CGFloat v79 = CGRectGetWidth(v117) / v66;

    CGAffineTransformMakeScale(&v100, v79, v79);
    attachedView = self->_attachedView;
    CGAffineTransform v99 = v100;
    [(UIView *)attachedView setTransform:&v99];
  }
  [(TabThumbnailCloseButton *)self->_closeButton bounds];
  CGFloat v81 = v118.origin.x;
  CGFloat v82 = v118.origin.y;
  CGFloat v83 = v118.size.width;
  CGFloat v84 = v118.size.height;
  double v85 = fmin(CGRectGetWidth(v118) + -60.0, 0.0) * 0.5;
  v119.origin.CGFloat x = v81;
  v119.origin.CGFloat y = v82;
  v119.size.width = v83;
  v119.size.height = v84;
  double v86 = fmin(CGRectGetHeight(v119) + -60.0, 0.0) * 0.5;
  -[TabThumbnailCloseButton _setTouchInsets:](self->_closeButton, "_setTouchInsets:", v86, v85, v86, v85);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_enableDelegateLayoutNotification && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained contentViewDidLayOutSubviews:self];
  }
}

double __46__SFTabOverviewItemContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  return 0.0;
}

- (void)_updateContentSizeCategory
{
  id v15 = [(SFTabOverviewItemContentView *)self traitCollection];
  uint64_t v3 = cachedTitleFont;
  if (!cachedTitleFont)
  {
    double v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8] compatibleWithTraitCollection:v15];
    CGFloat v5 = objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v4, "symbolicTraits") | 2);

    uint64_t v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];
    CGFloat v7 = (void *)cachedTitleFont;
    cachedTitleFont = v6;

    uint64_t v3 = cachedTitleFont;
  }
  -[TabIconAndTitleView setTitleFont:]((uint64_t)self->_titleView, v3);
  double v8 = [v15 preferredContentSizeCategory];
  self->_contentSizeIsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (self->_contentSizeIsAccessibilityCategory) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  -[TabIconAndTitleView titleFont]((id *)&self->_titleView->super.super.super.isa);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!titleHeightForFont_sizingLabel)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    double v12 = (void *)titleHeightForFont_sizingLabel;
    titleHeightForFont_sizingLabel = (uint64_t)v11;

    [(id)titleHeightForFont_sizingLabel setText:@"x\nx"];
  }
  double v13 = *(double *)&cachedTitleViewHeight;
  if (*(double *)&cachedTitleViewHeight == 0.0)
  {
    [(id)titleHeightForFont_sizingLabel setFont:v10];
    [(id)titleHeightForFont_sizingLabel setNumberOfLines:v9];
    objc_msgSend((id)titleHeightForFont_sizingLabel, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v13 = *(double *)&v14;
    cachedTitleViewdouble Height = v14;
  }

  self->_titledouble Height = v13;
  [(SFTabOverviewItemContentView *)self setNeedsLayout];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SFTabOverviewItemContentView;
  if (-[SFTabOverviewItemContentView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    char v8 = 1;
  }
  else
  {
    closeButton = self->_closeButton;
    -[SFTabOverviewItemContentView convertPoint:toView:](self, "convertPoint:toView:", closeButton, x, y);
    char v8 = -[TabThumbnailCloseButton pointInside:withEvent:](closeButton, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_enableDelegateLayoutNotification = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setAttachedView:(id)a3
{
  CGFloat v5 = (UIView *)a3;
  p_attachedView = &self->_attachedView;
  attachedView = self->_attachedView;
  char v8 = v5;
  if (attachedView != v5)
  {
    if ([(UIView *)attachedView isDescendantOfView:self]) {
      [(UIView *)*p_attachedView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_attachedView, a3);
    if (*p_attachedView)
    {
      if (![(UIView *)*p_attachedView translatesAutoresizingMaskIntoConstraints])
      {
        [(UIView *)*p_attachedView removeFromSuperview];
        [(UIView *)*p_attachedView setTranslatesAutoresizingMaskIntoConstraints:1];
      }
      if ([(UIView *)*p_attachedView isHidden])
      {
        [(UIView *)*p_attachedView setHidden:0];
        [(SFTabOverviewItemContentView *)self addSubview:*p_attachedView];
      }
      [(SFTabOverviewItemContentView *)self setNeedsLayout];
    }
  }
}

- (void)setAttachedViewReferenceRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_attachedViewReferenceRect = &self->_attachedViewReferenceRect;
  if (!CGRectEqualToRect(a3, self->_attachedViewReferenceRect))
  {
    p_attachedViewReferenceRect->origin.double x = x;
    p_attachedViewReferenceRect->origin.double y = y;
    p_attachedViewReferenceRect->size.double width = width;
    p_attachedViewReferenceRect->size.double height = height;
    attachedView = self->_attachedView;
    if (attachedView)
    {
      -[UIView ss_setUntransformedFrame:](attachedView, "ss_setUntransformedFrame:", x, y, width, height);
      [(SFTabOverviewItemContentView *)self setNeedsLayout];
    }
  }
}

- (void)setTopBarTheme:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_topBarTheme, a3);
    CGFloat v5 = [(SFTabOverviewItemContentView *)self _headerBackgroundColor];
    [(UIView *)self->_headerBackgroundView setBackgroundColor:v5];
  }
}

- (NSString)title
{
  return (NSString *)-[TabIconAndTitleView title]((id *)&self->_titleView->super.super.super.isa);
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  double v4 = -[TabIconAndTitleView title]((id *)&self->_titleView->super.super.super.isa);
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    -[TabIconAndTitleView setTitle:]((id *)&self->_titleView->super.super.super.isa, v6);
    [(SFTabOverviewItemContentView *)self setNeedsLayout];
  }
}

- (UIImage)icon
{
  return (UIImage *)-[TabIconAndTitleView icon]((id *)&self->_titleView->super.super.super.isa);
}

- (void)setIcon:(id)a3
{
  id v6 = a3;
  double v4 = -[TabIconAndTitleView icon]((id *)&self->_titleView->super.super.super.isa);
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    -[TabIconAndTitleView setIcon:]((id *)&self->_titleView->super.super.super.isa, v6);
    [(SFTabOverviewItemContentView *)self setNeedsLayout];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_double cornerRadius = a3;
    -[SFTabOverviewItemContentView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
    double cornerRadius = self->_cornerRadius;
    snapshotClipperView = self->_snapshotClipperView;
    [(UIView *)snapshotClipperView _setContinuousCornerRadius:cornerRadius];
  }
}

- (void)setTitleRevealPercent:(double)a3
{
  if (self->_titleRevealPercent != a3)
  {
    self->_double titleRevealPercent = a3;
    [(SFTabOverviewItemContentView *)self setNeedsLayout];
  }
}

- (void)setVisibleTopBackdropHeight:(double)a3
{
  if (self->_visibleTopBackdropHeight != a3)
  {
    self->_visibleTopBackdropdouble Height = a3;
    [(SFTabOverviewItemContentView *)self setNeedsLayout];
  }
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50__SFTabOverviewItemContentView_setMediaStateIcon___block_invoke;
    v3[3] = &unk_1E6D785E8;
    v3[4] = self;
    v3[5] = a3;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v3 completion:0];
  }
}

uint64_t __50__SFTabOverviewItemContentView_setMediaStateIcon___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 472) setMediaStateIcon:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = 0.0;
  if (*(void *)(v2 + 520)) {
    double v3 = 1.0;
  }
  double v4 = *(void **)(v2 + 472);
  return [v4 setAlpha:v3];
}

- (BOOL)isUnread
{
  return -[TabIconAndTitleView showsUnreadIndicator]((BOOL)self->_titleView);
}

- (void)setUnread:(BOOL)a3
{
}

- (NSArray)shareParticipants
{
  return (NSArray *)[(SFAvatarStackView *)self->_participantsView shareParticipants];
}

- (void)setShareParticipants:(id)a3
{
  id v4 = a3;
  char v5 = [(SFTabOverviewItemContentView *)self shareParticipants];
  char v6 = [v5 isEqualToArray:v4];

  if ((v6 & 1) == 0)
  {
    [(SFAvatarStackView *)self->_participantsView setShareParticipants:v4];
    [(SFTabOverviewItemContentView *)self setNeedsLayout];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__SFTabOverviewItemContentView_setShareParticipants___block_invoke;
    v7[3] = &unk_1E6D77E20;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:2 animations:v7 completion:0];
  }
}

uint64_t __53__SFTabOverviewItemContentView_setShareParticipants___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (UIEdgeInsets)titlePadding
{
  double v2 = 4.0;
  double v3 = 0.0;
  double v4 = 10.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setBorrowedContentView:(id)a3
{
  char v6 = (UIView *)a3;
  double v5 = self->_borrowedContentView;
  if (self->_borrowedContentView != v6
    || (([(UIView *)v6 isDescendantOfView:self] ^ (self->_borrowedContentView == 0)) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_borrowedContentView, a3);
    if ([(UIView *)v5 isDescendantOfView:self]) {
      [(UIView *)v5 removeFromSuperview];
    }
    if (v6) {
      [(UIView *)self->_snapshotClipperView insertSubview:v6 aboveSubview:self->_headerBackgroundView];
    }
    [(SFTabOverviewItemContentView *)self setNeedsLayout];
  }
}

- (UIView)borrowedContentView
{
  if ([(UIView *)self->_borrowedContentView isDescendantOfView:self] != (self->_borrowedContentView == 0)) {
    borrowedContentView = self->_borrowedContentView;
  }
  else {
    borrowedContentView = 0;
  }
  return borrowedContentView;
}

- (void)setSnapshotImage:(id)a3
{
  id v7 = a3;
  double v4 = [(TabSnapshotImageView *)self->_snapshotView image];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    [(TabSnapshotImageView *)self->_snapshotView setImage:v7];
    [(UIView *)self->_placeholderView setHidden:v7 != 0];
    if (v7) {
      int64_t v6 = objc_msgSend(v7, "sf_tabSnapshotEffectsVersion") != 1;
    }
    else {
      int64_t v6 = 2;
    }
    self->_preferredHeaderMode = v6;
    [(SFTabOverviewItemContentView *)self setNeedsLayout];
  }
  MEMORY[0x1F4181820]();
}

- (UIImage)snapshotImage
{
  return (UIImage *)[(TabSnapshotImageView *)self->_snapshotView image];
}

- (int64_t)effectiveHeaderMode
{
  int64_t result = (int64_t)self->_topBarTheme;
  if (result)
  {
    if (self->_contentSizeIsAccessibilityCategory) {
      return 2;
    }
    double v4 = [(id)result preferredBarTintColor];

    if (v4)
    {
      return 2;
    }
    else if ([(_SFBarTheme *)self->_topBarTheme tintStyle] == 2 && !self->_preferredHeaderMode)
    {
      return 1;
    }
    else
    {
      uint64_t v5 = [(_SFBarTheme *)self->_topBarTheme tintStyle];
      if (self->_preferredHeaderMode) {
        BOOL v6 = 0;
      }
      else {
        BOOL v6 = v5 == 3;
      }
      if (v6) {
        return 1;
      }
      else {
        return self->_preferredHeaderMode;
      }
    }
  }
  return result;
}

- (id)_headerBackgroundColor
{
  double v3 = [(SFTabOverviewItemContentView *)self effectiveHeaderMode];
  if (!v3)
  {
    double v3 = [MEMORY[0x1E4FB1618] clearColor];
    goto LABEL_13;
  }
  if (v3 == (void *)1)
  {
    int v6 = [(_SFBarTheme *)self->_topBarTheme backdropIsDark];
    id v7 = (void *)MEMORY[0x1E4FB1618];
    if (v6)
    {
      double v8 = 0.2;
      double v9 = 0.7;
    }
    else
    {
      double v9 = 0.7;
      double v8 = 1.0;
    }
    goto LABEL_12;
  }
  if (v3 != (void *)2) {
    goto LABEL_13;
  }
  double v4 = [(_SFBarTheme *)self->_topBarTheme preferredBarTintColor];

  topBarTheme = self->_topBarTheme;
  if (v4)
  {
    double v3 = [(_SFBarTheme *)topBarTheme preferredBarTintColor];
    goto LABEL_13;
  }
  int v10 = [(_SFBarTheme *)topBarTheme backdropIsDark];
  id v7 = (void *)MEMORY[0x1E4FB1618];
  if (v10)
  {
    double v8 = 0.14;
    double v9 = 1.0;
LABEL_12:
    double v3 = [v7 colorWithWhite:v8 alpha:v9];
    goto LABEL_13;
  }
  double v3 = [MEMORY[0x1E4FB1618] whiteColor];
LABEL_13:
  return v3;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)focusEffect
{
  double v2 = (void *)MEMORY[0x1E4FB1788];
  [(TabSnapshotImageView *)self->_snapshotView frame];
  uint64_t v3 = *MEMORY[0x1E4F39EA8];
  return (id)objc_msgSend(v2, "effectWithRoundedRect:cornerRadius:curve:", v3);
}

- (UIView)attachedView
{
  return self->_attachedView;
}

- (CGRect)attachedViewReferenceRect
{
  double x = self->_attachedViewReferenceRect.origin.x;
  double y = self->_attachedViewReferenceRect.origin.y;
  double width = self->_attachedViewReferenceRect.size.width;
  double height = self->_attachedViewReferenceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIButton)closeButton
{
  return &self->_closeButton->super;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (TabSnapshotImageView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (double)titleHeight
{
  return self->_titleHeight;
}

- (SFTabOverviewItemContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFTabOverviewItemContentViewDelegate *)WeakRetained;
}

- (BOOL)enableDelegateLayoutNotification
{
  return self->_enableDelegateLayoutNotification;
}

- (void)setEnableDelegateLayoutNotification:(BOOL)a3
{
  self->_enableDelegateLayoutNotification = a3;
}

- (TabIconAndTitleView)titleView
{
  return self->_titleView;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacitdouble y = a3;
}

- (_SFBarTheme)topBarTheme
{
  return self->_topBarTheme;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (BOOL)minYMatchesTopBarMaxYWhenZoomed
{
  return self->_minYMatchesTopBarMaxYWhenZoomed;
}

- (void)setMinYMatchesTopBarMaxYWhenZoomed:(BOOL)a3
{
  self->_minYMatchesTopBarMaxYWhenZoomed = a3;
}

- (double)visibleTopBackdropHeight
{
  return self->_visibleTopBackdropHeight;
}

- (double)titleRevealPercent
{
  return self->_titleRevealPercent;
}

- (BOOL)allowsSnapshotTopBackdropUnderlap
{
  return self->_allowsSnapshotTopBackdropUnderlap;
}

- (void)setAllowsSnapshotTopBackdropUnderlap:(BOOL)a3
{
  self->_allowsSnapshotTopBackdropUnderlap = a3;
}

- (BOOL)allowsBorrowedContentTopBackdropUnderlap
{
  return self->_allowsBorrowedContentTopBackdropUnderlap;
}

- (void)setAllowsBorrowedContentTopBackdropUnderlap:(BOOL)a3
{
  self->_allowsBorrowedContentTopBackdropUnderlap = a3;
}

- (UIView)snapshotClipperView
{
  return self->_snapshotClipperView;
}

- (UIView)recordingIndicatorView
{
  return &self->_recordingIndicatorView->super;
}

- (UIView)headerBackgroundView
{
  return self->_headerBackgroundView;
}

- (UIView)participantsBackgroundView
{
  return self->_participantsBackgroundView;
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_topBarTheme, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_attachedView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_snapshotClipperView, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorView, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_participantsBackgroundView, 0);
  objc_storeStrong((id *)&self->_participantsView, 0);
  objc_storeStrong((id *)&self->_headerBackgroundView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_borrowedContentView, 0);
}

@end
@interface VUIFamilyMemberCell
+ (double)maxMonogramHeight;
+ (id)_monogramViewForFamilyMemberCell:(id)a3;
+ (void)configureVUIFamilyMemberCell:(id)a3 withFamilyMember:(id)a4 metricsOnly:(BOOL)a5;
- (CGSize)_iOS_layoutSubviewsWithSize:(CGSize)a3 computationOnly:(BOOL)a4;
- (CGSize)monogramSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVImageLayout)monogramImageLayout;
- (VUIFamilyMember)familyMember;
- (VUIFamilyMemberCell)initWithFrame:(CGRect)a3;
- (VUILabel)nameLabel;
- (VUISeparatorView)bottomSeparatorView;
- (VUIVideosImageView)chevronImageView;
- (_TVImageView)familyMemberImageView;
- (_TVMonogramView)monogramView;
- (void)configureMonogramImageLayoutForWindowWidth:(double)a3;
- (void)familyMember:(id)a3 photoRequestDidCompleteWithImage:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBottomSeparatorView:(id)a3;
- (void)setChevronImageView:(id)a3;
- (void)setFamilyMember:(id)a3;
- (void)setFamilyMemberImageView:(id)a3;
- (void)setMonogramImageLayout:(id)a3;
- (void)setMonogramView:(id)a3;
- (void)setNameLabel:(id)a3;
@end

@implementation VUIFamilyMemberCell

+ (void)configureVUIFamilyMemberCell:(id)a3 withFamilyMember:(id)a4 metricsOnly:(BOOL)a5
{
  id v22 = a3;
  id v7 = a4;
  [v22 setFamilyMember:v7];
  v8 = [v7 memberImage];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FA9CE0]);
    [v9 setImage:v8];
    [v22 setFamilyMemberImageView:v9];
  }
  if (!a5) {
    [v7 setDelegate:v22];
  }
  v10 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v10 setTextStyle:13];
  v11 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  [(VUITextLayout *)v10 setColor:v11];

  v12 = [MEMORY[0x1E4FB1618] whiteColor];
  [(VUITextLayout *)v10 setHighlightOrSelectedColor:v12];

  -[VUITextLayout setAlignment:](v10, "setAlignment:", 2 * ([v22 effectiveUserInterfaceLayoutDirection] == 1));
  [(VUITextLayout *)v10 setFontWeight:0];
  id v13 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  v14 = [v7 firstName];
  [v13 setGivenName:v14];

  v15 = [v7 lastName];
  [v13 setFamilyName:v15];

  id v16 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  [v16 setStyle:2];
  v17 = [v16 stringFromPersonNameComponents:v13];
  v18 = [v22 nameLabel];
  v19 = +[VUILabel labelWithString:v17 textLayout:v10 existingLabel:v18];

  [v22 setNameLabel:v19];
  v20 = +[VUIFamilyMemberCell _monogramViewForFamilyMemberCell:v22];
  v21 = [v7 memberImage];

  if (!v21) {
    [v22 setMonogramView:v20];
  }
}

- (VUIFamilyMemberCell)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)VUIFamilyMemberCell;
  v3 = -[VUIFamilyMemberCell initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[VUIFamilyMemberCell maxMonogramHeight];
    double v5 = v4;
    v6 = objc_opt_new();
    objc_msgSend(v6, "setImageSize:", v5, v5);
    [v6 setAcceptsFocus:1];
    monogramImageLayout = v3->_monogramImageLayout;
    v3->_monogramImageLayout = (TVImageLayout *)v6;
    id v8 = v6;

    id v9 = objc_alloc_init(VUISeparatorView);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v9;

    v11 = [(VUIFamilyMemberCell *)v3 contentView];
    [v11 addSubview:v3->_bottomSeparatorView];

    v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
    id v13 = [VUIVideosImageView alloc];
    uint64_t v14 = -[VUIVideosImageView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    chevronImageView = v3->_chevronImageView;
    v3->_chevronImageView = (VUIVideosImageView *)v14;

    id v16 = v3->_chevronImageView;
    v17 = [MEMORY[0x1E4FB1618] lightGrayColor];
    v18 = [v12 imageWithTintColor:v17 renderingMode:1];
    [(VUIVideosImageView *)v16 setImage:v18];

    v19 = v3->_chevronImageView;
    v20 = [MEMORY[0x1E4FB1618] whiteColor];
    v21 = [v12 imageWithTintColor:v20 renderingMode:1];
    [(VUIVideosImageView *)v19 setHighlightOrSelectedImage:v21];

    id v22 = [(VUIFamilyMemberCell *)v3 contentView];
    [v22 addSubview:v3->_chevronImageView];

    v23 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [(VUIListCollectionViewCell *)v3 setBackgroundColor:v23];

    v24 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");

    [(VUIListCollectionViewCell *)v3 setHighlightedBackgroundColor:v24];
  }
  return v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)VUIFamilyMemberCell;
  [(VUIListCollectionViewCell *)&v4 prepareForReuse];
  v3 = [(VUIFamilyMemberCell *)self familyMember];
  [v3 setDelegate:0];

  [(VUIFamilyMemberCell *)self setFamilyMember:0];
  [(VUIFamilyMemberCell *)self setFamilyMemberImageView:0];
  [(VUIFamilyMemberCell *)self setMonogramView:0];
  [(VUIFamilyMemberCell *)self setNameLabel:0];
  [(VUIFamilyMemberCell *)self setChevronImageView:0];
  [(VUIFamilyMemberCell *)self setBottomSeparatorView:0];
}

- (void)setNameLabel:(id)a3
{
  double v5 = (VUILabel *)a3;
  nameLabel = self->_nameLabel;
  if (nameLabel != v5)
  {
    v10 = v5;
    [(VUILabel *)nameLabel removeFromSuperview];
    if (v10)
    {
      id v7 = [(VUIFamilyMemberCell *)self contentView];
      char v8 = [(VUILabel *)v10 isDescendantOfView:v7];

      if ((v8 & 1) == 0)
      {
        id v9 = [(VUIFamilyMemberCell *)self contentView];
        [v9 addSubview:v10];
      }
    }
    objc_storeStrong((id *)&self->_nameLabel, a3);
    [(VUIFamilyMemberCell *)self setNeedsLayout];
    double v5 = v10;
  }
}

- (void)setFamilyMemberImageView:(id)a3
{
  double v5 = (_TVImageView *)a3;
  familyMemberImageView = self->_familyMemberImageView;
  if (familyMemberImageView != v5)
  {
    v10 = v5;
    [(_TVImageView *)familyMemberImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_familyMemberImageView, a3);
    if (v10)
    {
      id v7 = [(VUIFamilyMemberCell *)self contentView];
      char v8 = [(_TVImageView *)v10 isDescendantOfView:v7];

      if ((v8 & 1) == 0)
      {
        id v9 = [(VUIFamilyMemberCell *)self contentView];
        [v9 addSubview:self->_familyMemberImageView];
      }
    }
    [(VUIFamilyMemberCell *)self setNeedsLayout];
    double v5 = v10;
  }
}

- (void)setMonogramView:(id)a3
{
  double v5 = (_TVMonogramView *)a3;
  monogramView = self->_monogramView;
  if (monogramView != v5)
  {
    v10 = v5;
    [(_TVMonogramView *)monogramView removeFromSuperview];
    if (v10)
    {
      id v7 = [(VUIFamilyMemberCell *)self contentView];
      char v8 = [(_TVMonogramView *)v10 isDescendantOfView:v7];

      if ((v8 & 1) == 0)
      {
        id v9 = [(VUIFamilyMemberCell *)self contentView];
        [v9 addSubview:v10];
      }
    }
    objc_storeStrong((id *)&self->_monogramView, a3);
    [(VUIFamilyMemberCell *)self setNeedsLayout];
    double v5 = v10;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIFamilyMemberCell _iOS_layoutSubviewsWithSize:computationOnly:](self, "_iOS_layoutSubviewsWithSize:computationOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VUIFamilyMemberCell;
  [(VUIFamilyMemberCell *)&v5 layoutSubviews];
  [(VUIFamilyMemberCell *)self bounds];
  -[VUIFamilyMemberCell _iOS_layoutSubviewsWithSize:computationOnly:](self, "_iOS_layoutSubviewsWithSize:computationOnly:", 0, v3, v4);
}

- (void)familyMember:(id)a3 photoRequestDidCompleteWithImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v10 = __69__VUIFamilyMemberCell_familyMember_photoRequestDidCompleteWithImage___block_invoke;
    v11 = &unk_1E6DF5490;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    char v8 = v9;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v10((uint64_t)v8);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v8);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __69__VUIFamilyMemberCell_familyMember_photoRequestDidCompleteWithImage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_alloc_init(MEMORY[0x1E4FA9CE0]);
  [v2 setImage:*(void *)(a1 + 32)];
  if (v2)
  {
    double v3 = [WeakRetained monogramView];

    if (v3) {
      [WeakRetained setMonogramView:0];
    }
  }
  [WeakRetained setFamilyMemberImageView:v2];
}

+ (double)maxMonogramHeight
{
  return 72.0;
}

- (CGSize)monogramSize
{
  [(TVImageLayout *)self->_monogramImageLayout decoratorSize];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)_monogramViewForFamilyMemberCell:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  v24 = [v3 colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.0];
  objc_super v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.780392 green:0.780392 blue:0.8 alpha:0.8];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA9CB0]) initWithStyle:0];
  [v6 setUnfocusedBgColor:v5];
  [v6 setFocusedBgColor:v24];
  id v7 = [v4 monogramImageLayout];
  [v7 decoratorSize];
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA9CF0]), "initWithFrame:configuration:", v6, 0.0, 0.0, v9, v11);
  [v12 setControlState:0 animated:0];
  [v6 focusedSizeIncrease];
  objc_msgSend(v12, "setFocusedSizeIncrease:");
  id v13 = [v4 monogramImageLayout];
  objc_msgSend(v12, "tv_setLayout:", v13);

  [v12 setFocusedStateEnabled:1];
  uint64_t v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:21.0 weight:*MEMORY[0x1E4FB09C8]];
  v15 = [v14 fontDescriptor];

  id v16 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v15 size:21.0];
  id v17 = objc_alloc(MEMORY[0x1E4FA9CE8]);
  v18 = [v4 familyMember];
  v19 = [v18 firstName];
  v20 = [v4 familyMember];

  v21 = [v20 lastName];
  id v22 = (void *)[v17 initWithFirstName:v19 lastName:v21 imageURL:0 font:v16];

  [v22 setCornerRadius:v9 * 0.5];
  objc_msgSend(v22, "setSize:", v9, v11);
  [v6 focusedSizeIncrease];
  objc_msgSend(v22, "setUpscaleAdjustment:");
  [v22 setFillColor:v5];
  [v12 setMonogramDescription:v22];

  return v12;
}

- (void)configureMonogramImageLayoutForWindowWidth:(double)a3
{
  +[VUIFamilyMemberCell maxMonogramHeight];
  double v5 = v4;
  id v6 = objc_opt_new();
  objc_msgSend(v6, "setImageSize:", v5, v5);
  [v6 setAcceptsFocus:1];
  monogramImageLayout = self->_monogramImageLayout;
  self->_monogramImageLayout = (TVImageLayout *)v6;
}

- (CGSize)_iOS_layoutSubviewsWithSize:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = a3.width == *MEMORY[0x1E4F1DB30] && a3.height == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v94 = a3.height;
  if (!v6)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClassForWindowWidth:", a3.width);
    if ((unint64_t)(v9 - 3) >= 3) {
      double v10 = 50.0;
    }
    else {
      double v10 = 72.0;
    }
    double v11 = 66.0;
    if ((unint64_t)(v9 - 3) < 3) {
      double v11 = 96.0;
    }
    double v94 = v11;
    double v13 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:", width);
    double rect_24 = v16;
    double v77 = v17;
    uint64_t v18 = [(VUIFamilyMemberCell *)self effectiveUserInterfaceLayoutDirection];
    [(VUIFamilyMemberCell *)self bounds];
    monogramView = self->_monogramView;
    double rect_8 = v15;
    double rect_16 = v15;
    double v79 = v13;
    double v80 = v14;
    double v89 = v12;
    if (monogramView)
    {
      v20 = monogramView;
      double v89 = 0.0;
      double rect_16 = v10;
      double v80 = v10;
      double v79 = rect_24;
    }
    familyMemberImageView = self->_familyMemberImageView;
    if (familyMemberImageView)
    {
      id v22 = familyMemberImageView;

      CGFloat v23 = 0.0;
      CGFloat v24 = v10;
      CGFloat v25 = rect_24;
      monogramView = v22;
      double v72 = v10;
      double v73 = v10;
      double v87 = 0.0;
      double v71 = rect_24;
      double v26 = rect_8;
    }
    else
    {
      double v26 = v15;
      double v10 = rect_16;
      CGFloat v25 = v79;
      CGFloat v24 = v80;
      CGFloat v23 = v89;
      double v72 = v14;
      double v73 = rect_8;
      double v87 = v12;
      double v71 = v13;
    }
    bottomSeparatorView = self->_bottomSeparatorView;
    double v75 = v12;
    double v76 = v26;
    double v28 = v14;
    double v78 = v13;
    double v74 = v13;
    CGFloat v81 = v23;
    CGFloat v83 = v24;
    CGFloat rect = v25;
    double v88 = v12;
    if (bottomSeparatorView)
    {
      -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", width - rect_24, 1.79769313e308);
      double v30 = v29;
      double v76 = v31;
      if (monogramView)
      {
        v96.origin.x = rect;
        v96.origin.y = v81;
        v96.size.double width = v83;
        v96.size.double height = v10;
        double v74 = CGRectGetMaxX(v96) + 12.0;
        v97.origin.x = rect;
        v97.origin.y = v81;
        v97.size.double width = v83;
        v97.size.double height = v10;
        double v30 = v30 - (CGRectGetWidth(v97) + 12.0);
      }
      else
      {
        double v74 = rect_24;
      }
      [(VUISeparatorView *)self->_bottomSeparatorView lineHeight];
      double v75 = height - v32;
      double v28 = v30;
      CGFloat v23 = v81;
      CGFloat v24 = v83;
      CGFloat v25 = rect;
    }
    CGFloat v69 = v10;
    double v70 = v28;
    chevronImageView = self->_chevronImageView;
    double v34 = rect_8;
    double v85 = v12;
    double v86 = v14;
    double v35 = v78;
    if (chevronImageView)
    {
      v36 = [(VUIVideosImageView *)chevronImageView image];
      [v36 size];
      double v38 = v37;
      double v34 = v39;

      if (v18 == 1)
      {
        VUIRectWithFlippedOriginRelativeToBoundingRect();
        double v35 = v40;
        double v85 = v41;
        double v86 = v42;
        double v34 = v43;
      }
      else
      {
        double v85 = (height - v34) * 0.5;
        double v86 = v38;
        double v35 = width - v77 - v38;
      }
      CGFloat v23 = v81;
      CGFloat v24 = v83;
      CGFloat v25 = rect;
    }
    double v84 = v34;
    if (self->_nameLabel)
    {
      double v14 = width - rect_24 - v77;
      if (monogramView)
      {
        double v82 = v35;
        if (v18 == 1)
        {
          v98.origin.x = v35;
          v98.origin.y = v85;
          CGFloat v44 = v86;
          CGFloat v45 = v23;
          v98.size.double width = v86;
          v98.size.double height = v34;
          double MaxX = CGRectGetMaxX(v98);
          CGFloat v47 = v69;
        }
        else
        {
          v99.origin.x = v25;
          v99.origin.y = v23;
          CGFloat v45 = v23;
          v99.size.double width = v24;
          CGFloat v47 = v69;
          v99.size.double height = v69;
          double MaxX = CGRectGetMaxX(v99);
          CGFloat v44 = v86;
        }
        double rect_24 = MaxX + 12.0;
        v100.origin.x = rect;
        v100.origin.y = v45;
        v100.size.double width = v24;
        v100.size.double height = v47;
        double v14 = v14 - (CGRectGetWidth(v100) + 12.0);
        double v48 = v89;
        double v35 = v82;
      }
      else
      {
        double v48 = v89;
        CGFloat v44 = v86;
      }
      if (self->_chevronImageView)
      {
        v101.origin.x = v35;
        v101.origin.y = v85;
        v101.size.double width = v44;
        v101.size.double height = v34;
        double v14 = v14 - (CGRectGetWidth(v101) + 12.0);
      }
      -[VUILabel topMarginWithBaselineMargin:](self->_nameLabel, "topMarginWithBaselineMargin:", 32.0, *(void *)&v69);
      double v51 = v50;
      -[VUILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", v14, 1.79769313e308);
      double v49 = v52;
      [(VUILabel *)self->_nameLabel bottomMarginWithBaselineMargin:16.0];
      double v54 = v53;
      v102.origin.x = rect_24;
      v102.origin.y = v51;
      v102.size.double width = v14;
      v102.size.double height = v49;
      double v55 = v54 + v51 + CGRectGetHeight(v102);
      double v56 = v94;
      if (v94 < v55) {
        double v56 = v55;
      }
      double v94 = v56;
      double v88 = (v56 - v49) * 0.5;
    }
    else
    {
      double rect_24 = v78;
      double v48 = v89;
      double v49 = rect_8;
    }
    double v58 = v72;
    double v57 = v73;
    if (self->_familyMemberImageView)
    {
      double v87 = (v94 - v73) * 0.5;
      if (v18 == 1)
      {
        VUIRectWithFlippedOriginRelativeToBoundingRect();
        double v87 = v60;
        double v58 = v61;
        double v57 = v62;
        if (a4) {
          goto LABEL_49;
        }
        goto LABEL_46;
      }
    }
    else if (self->_monogramView)
    {
      double v48 = (v94 - rect_16) * 0.5;
      if (v18 == 1)
      {
        VUIRectWithFlippedOriginRelativeToBoundingRect();
        double v79 = v63;
        double v80 = v64;
        double v48 = v65;
        double rect_16 = v66;
      }
    }
    double v59 = v71;
    if (a4)
    {
LABEL_49:

      goto LABEL_50;
    }
LABEL_46:
    -[_TVImageView setFrame:](self->_familyMemberImageView, "setFrame:", v59, v87, v58, v57, *(void *)&v69);
    if (!self->_familyMemberImageView) {
      -[_TVMonogramView setFrame:](self->_monogramView, "setFrame:", v79, v48, v80, rect_16);
    }
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v74, v75, v70, v76);
    -[VUILabel setFrame:](self->_nameLabel, "setFrame:", rect_24, v88, v14, v49);
    -[VUIVideosImageView setFrame:](self->_chevronImageView, "setFrame:", v35, v85, v86, v84);
    goto LABEL_49;
  }
LABEL_50:
  double v67 = width;
  double v68 = v94;
  result.double height = v68;
  result.double width = v67;
  return result;
}

- (VUIFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
}

- (VUILabel)nameLabel
{
  return self->_nameLabel;
}

- (TVImageLayout)monogramImageLayout
{
  return self->_monogramImageLayout;
}

- (void)setMonogramImageLayout:(id)a3
{
}

- (_TVMonogramView)monogramView
{
  return self->_monogramView;
}

- (_TVImageView)familyMemberImageView
{
  return self->_familyMemberImageView;
}

- (VUIVideosImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (void)setBottomSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_familyMemberImageView, 0);
  objc_storeStrong((id *)&self->_monogramView, 0);
  objc_storeStrong((id *)&self->_monogramImageLayout, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end
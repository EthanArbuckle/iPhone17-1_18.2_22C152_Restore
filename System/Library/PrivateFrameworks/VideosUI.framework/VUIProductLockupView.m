@interface VUIProductLockupView
+ (VUIProductLockupView)productLockupViewWithMedia:(id)a3;
- (BOOL)contentDescriptionExpanded;
- (BOOL)didSetUpViews;
- (CGSize)_layoutForCategoryAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)_layoutForCompact:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)_layoutForStacked:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)_sizeOfDescriptionLabel:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FocusableTextView)descriptionTextView;
- (NSArray)badgeResources;
- (NSNumber)duration;
- (NSNumber)releaseYear;
- (NSString)availabilityText;
- (NSString)contentDescription;
- (NSString)genre;
- (NSString)subtitle;
- (UIImage)contentRatingImage;
- (UIImage)coverArtPlaceholderImage;
- (UIView)downloadView;
- (VUIImageProxy)coverArtImageProxy;
- (VUIImageView)coverArtImageView;
- (VUILabel)subtitleLabel;
- (VUILibraryProductLockupViewLayout)layout;
- (VUIMediaTagsView)mediaBadgeTagsView;
- (VUIMediaTagsView)mediaInfoTagsView;
- (VUIProductLockupView)initWithFrame:(CGRect)a3;
- (VUIProductLockupViewDelegate)delegate;
- (VUIRentalExpirationLabel)expirationLabel;
- (VUIRoundButton)leftButton;
- (VUISeparatorView)bottomSeparatorView;
- (VUISeparatorView)topSeparatorView;
- (double)_descriptionBottomMarginWithBaselineMargin:(double)a3;
- (double)_descriptionTopMarginWithBaselineMargin:(double)a3 otherFont:(id)a4;
- (id)_contentDescriptionAttributedString;
- (id)_contentDescriptionFont;
- (void)_updateSubtitleLabelForWindowWidth:(double)a3;
- (void)layoutSubviews;
- (void)rentalExpirationLabelNeedsRelayout:(id)a3;
- (void)setAvailabilityText:(id)a3;
- (void)setBadgeResources:(id)a3;
- (void)setBottomSeparatorView:(id)a3;
- (void)setContentDescription:(id)a3;
- (void)setContentDescriptionExpanded:(BOOL)a3;
- (void)setContentRatingImage:(id)a3;
- (void)setCoverArtImageProxy:(id)a3 placeholderImage:(id)a4;
- (void)setCoverArtImageView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionTextView:(id)a3;
- (void)setDidSetUpViews:(BOOL)a3;
- (void)setDownloadView:(id)a3;
- (void)setDuration:(id)a3;
- (void)setExpirationLabel:(id)a3;
- (void)setGenre:(id)a3;
- (void)setLayout:(id)a3;
- (void)setLeftButton:(id)a3;
- (void)setMediaBadgeTagsView:(id)a3;
- (void)setMediaInfoTagsView:(id)a3;
- (void)setReleaseYear:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTopSeparatorView:(id)a3;
- (void)updateWithMediaEntity:(id)a3;
@end

@implementation VUIProductLockupView

+ (VUIProductLockupView)productLockupViewWithMedia:(id)a3
{
  id v3 = a3;
  v4 = [VUIProductLockupView alloc];
  v5 = -[VUIProductLockupView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(VUIProductLockupView *)v5 updateWithMediaEntity:v3];

  return v5;
}

- (VUIProductLockupView)initWithFrame:(CGRect)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VUIProductLockupView;
  id v3 = -[VUIProductLockupView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [VUISeparatorView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[VUISeparatorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    topSeparatorView = v3->_topSeparatorView;
    v3->_topSeparatorView = (VUISeparatorView *)v9;

    [(VUIProductLockupView *)v3 addSubview:v3->_topSeparatorView];
    v11 = -[VUISeparatorView initWithFrame:]([VUISeparatorView alloc], "initWithFrame:", v5, v6, v7, v8);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v11;

    [(VUIProductLockupView *)v3 addSubview:v3->_bottomSeparatorView];
    objc_initWeak(&location, v3);
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __38__VUIProductLockupView_initWithFrame___block_invoke;
    v16[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v17, &location);
    id v14 = (id)[(VUIProductLockupView *)v3 registerForTraitChanges:v13 withHandler:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __38__VUIProductLockupView_initWithFrame___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  double v5 = [v4 preferredContentSizeCategory];

  double v6 = [WeakRetained traitCollection];
  double v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7)
  {
    double v8 = [WeakRetained descriptionTextView];
    uint64_t v9 = [WeakRetained _contentDescriptionAttributedString];
    [v8 setDescriptionText:v9];
  }
  v10 = [WeakRetained descriptionTextView];
  if ([WeakRetained contentDescriptionExpanded])
  {
    [v10 setMaximumNumberOfLines:0];
  }
  else
  {
    v11 = [WeakRetained layout];
    v12 = [WeakRetained traitCollection];
    objc_msgSend(v10, "setMaximumNumberOfLines:", (int)objc_msgSend(v11, "contentDescriptionNumberOfLinesForTraitCollection:", v12));
  }
}

- (void)updateWithMediaEntity:(id)a3
{
  id v111 = a3;
  id v4 = [v111 type];
  double v5 = +[VUIMediaEntityType movie];
  if (v4 == v5)
  {
    BOOL v10 = 1;
  }
  else
  {
    double v6 = [v111 type];
    double v7 = +[VUIMediaEntityType movieRental];
    if (v6 == v7)
    {
      BOOL v10 = 1;
    }
    else
    {
      double v8 = [v111 type];
      uint64_t v9 = +[VUIMediaEntityType homeVideo];
      BOOL v10 = v8 == v9;
    }
  }

  v11 = [v111 HLSResolution];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v111 resolution];
  }
  id v14 = v13;

  v15 = [v111 HLSColorCapability];
  v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [v111 colorCapability];
  }
  v18 = v17;

  objc_super v19 = [v111 HLSAudioCapability];
  v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [v111 audioCapability];
  }
  v22 = v21;

  uint64_t v23 = [v14 unsignedIntegerValue];
  v108 = v18;
  char v24 = [v18 unsignedIntegerValue];
  v107 = v22;
  char v25 = [v22 unsignedIntegerValue];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v110 = v26;
  if ((unint64_t)(v23 - 1) >= 2)
  {
    v28 = v26;
    if (v23 != 3) {
      goto LABEL_21;
    }
    v27 = VUIImageResourceMapMediaBadge4k;
  }
  else
  {
    v27 = VUIImageResourceMapMediaBadgeHD;
  }
  v29 = objc_alloc_init(VUIProductBadgeResource);
  [(VUIProductBadgeResource *)v29 setName:*v27];
  v28 = v110;
  [v110 addObject:v29];

LABEL_21:
  if (!SSDeviceIsHDRCapable()) {
    goto LABEL_27;
  }
  if ((v24 & 2) != 0)
  {
    v30 = VUIImageResourceMapMediaBadgeDolbyVision;
  }
  else
  {
    if ((v24 & 1) == 0) {
      goto LABEL_27;
    }
    v30 = VUIImageResourceMapMediaBadgeHDR;
  }
  v31 = objc_alloc_init(VUIProductBadgeResource);
  [(VUIProductBadgeResource *)v31 setName:*v30];
  [v28 addObject:v31];

LABEL_27:
  if (v25)
  {
    v32 = objc_alloc_init(VUIProductBadgeResource);
    [(VUIProductBadgeResource *)v32 setName:@"dolby-atmos"];
    [v28 addObject:v32];
  }
  v33 = [VUILibraryProductLockupLayout alloc];
  v34 = [v111 type];
  v109 = v14;
  if (v10)
  {
    v35 = [(VUILibraryProductLockupLayout *)v33 initWithLayoutType:0 entityType:v34];
    [(VUIProductLockupView *)self setLayout:v35];

    v36 = [v111 contentDescription];
    [(VUIProductLockupView *)self setContentDescription:v36];

    v37 = [v111 type];
    uint64_t v38 = +[VUIMediaEntityType movieRental];
    if (v37 == (VUIProductBadgeResource *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [v111 extrasURL];
      v41 = [v40 absoluteString];
      uint64_t v42 = [v41 length];

      if (!v42)
      {
LABEL_39:
        v51 = [VUIRoundButton alloc];
        v50 = -[VUIRoundButton initWithFrame:](v51, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v52 = +[VUIImageResourceMap imageForResourceName:@"button-play"];
        [(VUIRoundButton *)v50 setButtonImage:v52];
        id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v54 = [(VUILibraryProductLockupViewLayout *)self->_layout playLabelTextLayout];
        v55 = +[VUILocalizationManager sharedInstance];
        v56 = [v55 localizedStringForKey:@"PLAY"];
        v57 = +[VUILabel labelWithString:v56 textLayout:v54 existingLabel:0];

        [v53 addObject:v57];
        v58 = [v111 rentalExpirationDate];
        if (v58)
        {
          v59 = +[VUIRentalExpirationLabel labelWithExpirationDate:v58 textLayout:0 existingLabel:0 locStringPrefix:@"EXPIRATION_IN"];
          expirationLabel = self->_expirationLabel;
          self->_expirationLabel = v59;

          [(VUIRentalExpirationLabel *)self->_expirationLabel setDelegate:self];
          [v53 addObject:self->_expirationLabel];
        }
        v61 = (void *)[v53 copy];
        [(VUIRoundButton *)v50 setTextLabels:v61];

        [(VUIProductLockupView *)self setLeftButton:v50];
        goto LABEL_42;
      }
      v37 = objc_alloc_init(VUIProductBadgeResource);
      [(VUIProductBadgeResource *)v37 setName:@"itunes-extras-badge"];
      [(VUIProductBadgeResource *)v37 setTemplated:0];
      [v28 addObject:v37];
    }

    goto LABEL_39;
  }
  v43 = [(VUILibraryProductLockupLayout *)v33 initWithLayoutType:1 entityType:v34];
  [(VUIProductLockupView *)self setLayout:v43];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v44 = [v111 seasonNumber];

    if (v44)
    {
      v45 = NSString;
      v46 = +[VUILocalizationManager sharedInstance];
      v47 = [v46 localizedStringForKey:@"SEASON_%@"];
      v48 = [v111 seasonNumber];
      v49 = [v45 stringWithValidatedFormat:v47, @"%@", 0, v48 validFormatSpecifiers error];

      [(VUIProductLockupView *)self setSubtitle:v49];
    }
  }
  v50 = [v111 contentDescription];
  [(VUIProductLockupView *)self setContentDescription:v50];
LABEL_42:

  v62 = [(VUIProductLockupView *)self traitCollection];
  v63 = +[VUIUtilities placeholderImageResourceName:](VUIUtilities, "placeholderImageResourceName:", [v62 userInterfaceStyle]);
  uint64_t v64 = +[VUIImageResourceMap imageForResourceName:v63];

  uint64_t v65 = +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:v111 imageType:0];
  v66 = [(VUIProductLockupView *)self coverArtImageView];
  if (v66)
  {
    id v67 = [(VUIProductLockupView *)self coverArtImageView];
  }
  else
  {
    id v67 = objc_alloc_init(MEMORY[0x1E4FB3CE0]);
  }
  v68 = v67;

  [v68 setUserInteractionEnabled:0];
  [v68 setPlaceholderImage:v64];
  v69 = [(VUIProductLockupView *)self layout];
  [v69 coverArtImageSize];
  double v71 = v70;
  double v73 = v72;

  v74 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v74 scale];
  double v76 = v71 * v75;
  v77 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v77 scale];
  double v79 = v73 * v78;

  +[VUIUtilities imageCornerRadiusWithStyle:0];
  double v81 = v80;
  v105 = (void *)v65;
  v106 = (void *)v64;
  if (v65)
  {
    v82 = (void *)MEMORY[0x1E4FB3CC8];
    v83 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageBorderColor");
    v84 = objc_msgSend(v82, "decoratorWithOutlineColor:outlineWidths:", v83, 1.0, 1.0, 1.0, 1.0);

    id v85 = objc_alloc(MEMORY[0x1E4FB3CD0]);
    v86 = [v111 mediaLibrary];
    v87 = (void *)[v85 initWithObject:v65 imageLoader:v86 groupType:0];

    objc_msgSend(v84, "setScaleToSize:", v76, v79);
    [MEMORY[0x1E4FB3C70] radiiFromRadius:v81];
    objc_msgSend(v84, "setCornerRadii:");
    [v87 setDecorator:v84];
    [v68 setImageProxy:v87];
    [v68 setCornerRadius:4.0];
    goto LABEL_47;
  }
  SEL v101 = NSSelectorFromString(&cfstr_Artworkurl.isa);
  if (objc_opt_respondsToSelector())
  {
    v84 = ((void (*)(id, SEL))[v111 methodForSelector:v101])(v111, v101);
    if (![v84 length]) {
      goto LABEL_48;
    }
    v87 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3D10]), "initWithSrc:size:", v84, v76, v79);
    v102 = +[VUIUtilities placeholderImageResourceName:0];
    [v87 setPlaceholderSrc:v102];

    [MEMORY[0x1E4FB3C70] radiiFromRadius:v81];
    objc_msgSend(v87, "setBorderRadii:");
    [v87 setExtension:@"jpeg"];
    v103 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageBorderColor");
    [v87 setBackgroundColor:v103];

    uint64_t v104 = [MEMORY[0x1E4FB3CC0] makeImageViewWithDescriptor:v87 existingView:v68];

    v68 = (void *)v104;
LABEL_47:

LABEL_48:
  }
  [(VUIProductLockupView *)self setCoverArtImageView:v68];
  v88 = [[VUIMediaTagsViewLayout alloc] initWithType:8];
  v89 = [VUIMediaTagsView alloc];
  double v90 = *MEMORY[0x1E4F1DB28];
  double v91 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v92 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v93 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v94 = -[VUIMediaTagsView initWithFrame:layout:](v89, "initWithFrame:layout:", v88, *MEMORY[0x1E4F1DB28], v91, v92, v93);
  v95 = [[VUIMediaTagsViewHelper alloc] initWithVUIMediaEntity:v111];
  [(VUIMediaTagsViewHelper *)v95 addSeperatorKey:@"·"];
  v96 = [(VUIMediaTagsViewHelper *)v95 tagsViewDictionary];
  [(VUIMediaTagsView *)v94 updateWithMetadata:v96];

  [(VUIProductLockupView *)self setMediaInfoTagsView:v94];
  v97 = [[VUIMediaTagsViewLayout alloc] initWithType:7];
  v98 = -[VUIMediaTagsView initWithFrame:layout:]([VUIMediaTagsView alloc], "initWithFrame:layout:", v97, v90, v91, v92, v93);
  v99 = [[VUIMediaTagsViewHelper alloc] initWithVUIMediaEntity:v111];
  [(VUIMediaTagsViewHelper *)v99 addSeperatorKey:@"·"];
  v100 = [(VUIMediaTagsViewHelper *)v99 tagsViewDictionary];
  [(VUIMediaTagsView *)v98 updateWithMetadata:v100];

  [(VUIProductLockupView *)self setMediaBadgeTagsView:v98];
}

- (void)setCoverArtImageView:(id)a3
{
  double v5 = (VUIImageView *)a3;
  coverArtImageView = self->_coverArtImageView;
  double v7 = v5;
  if (coverArtImageView != v5)
  {
    [(VUIImageView *)coverArtImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_coverArtImageView, a3);
    if (self->_coverArtImageView) {
      -[VUIProductLockupView addSubview:](self, "addSubview:");
    }
  }
}

- (void)setCoverArtImageProxy:(id)a3 placeholderImage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(VUIImageView *)self->_coverArtImageView imageProxy];
  id v20 = v7;
  id v10 = v9;
  if (v10 == v20)
  {
  }
  else
  {
    id v11 = v10;
    v12 = v20;
    if (!v20) {
      goto LABEL_14;
    }
    id v11 = v10;
    v12 = v20;
    if (!v10) {
      goto LABEL_14;
    }
    int v13 = [v20 isEqual:v10];

    if (!v13) {
      goto LABEL_15;
    }
  }
  id v14 = [(VUIImageView *)self->_coverArtImageView placeholderImage];
  id v11 = v8;
  id v15 = v14;
  if (v15 == v11)
  {

    goto LABEL_17;
  }
  v12 = v15;
  if (!v11 || !v15)
  {

LABEL_14:
LABEL_15:

    goto LABEL_16;
  }
  char v16 = [v11 isEqual:v15];

  if ((v16 & 1) == 0)
  {
LABEL_16:
    [(VUIImageView *)self->_coverArtImageView removeFromSuperview];
    id v17 = objc_alloc(MEMORY[0x1E4FB3CE0]);
    v18 = (VUIImageView *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    coverArtImageView = self->_coverArtImageView;
    self->_coverArtImageView = v18;

    [(VUIImageProxy *)self->_coverArtImageProxy cancel];
    objc_storeStrong((id *)&self->_coverArtImageProxy, a3);
    objc_storeStrong((id *)&self->_coverArtPlaceholderImage, a4);
    [(VUIImageView *)self->_coverArtImageView setImageProxy:v20];
    [(VUIImageView *)self->_coverArtImageView setPlaceholderImage:v8];
    [(VUIProductLockupView *)self addSubview:self->_coverArtImageView];
  }
LABEL_17:
}

- (void)setMediaInfoTagsView:(id)a3
{
  double v5 = (VUIMediaTagsView *)a3;
  mediaInfoTagsView = self->_mediaInfoTagsView;
  id v7 = v5;
  if (mediaInfoTagsView != v5)
  {
    [(VUIMediaTagsView *)mediaInfoTagsView removeFromSuperview];
    objc_storeStrong((id *)&self->_mediaInfoTagsView, a3);
    if (self->_mediaInfoTagsView) {
      -[VUIProductLockupView addSubview:](self, "addSubview:");
    }
  }
}

- (void)setMediaBadgeTagsView:(id)a3
{
  double v5 = (VUIMediaTagsView *)a3;
  mediaBadgeTagsView = self->_mediaBadgeTagsView;
  id v7 = v5;
  if (mediaBadgeTagsView != v5)
  {
    [(VUIMediaTagsView *)mediaBadgeTagsView removeFromSuperview];
    objc_storeStrong((id *)&self->_mediaBadgeTagsView, a3);
    if (self->_mediaBadgeTagsView) {
      -[VUIProductLockupView addSubview:](self, "addSubview:");
    }
  }
}

- (void)setSubtitle:(id)a3
{
  p_subtitle = &self->_subtitle;
  id v11 = a3;
  if (!-[NSString isEqualToString:](*p_subtitle, "isEqualToString:"))
  {
    [(VUILabel *)self->_subtitleLabel removeFromSuperview];
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = 0;

    objc_storeStrong((id *)&self->_subtitle, a3);
    if ([(NSString *)*p_subtitle length])
    {
      layout = self->_layout;
      [(VUIProductLockupView *)self bounds];
      id v8 = [(VUILibraryProductLockupViewLayout *)layout subtitleTextLayoutForWindowWidth:CGRectGetWidth(v13)];
      uint64_t v9 = +[VUILabel labelWithString:*p_subtitle textLayout:v8 existingLabel:self->_subtitleLabel];
      id v10 = self->_subtitleLabel;
      self->_subtitleLabel = v9;

      [(VUIProductLockupView *)self addSubview:self->_subtitleLabel];
    }
  }
}

- (void)setContentDescription:(id)a3
{
  id v5 = a3;
  if (![(NSString *)self->_contentDescription isEqualToString:v5])
  {
    [(FocusableTextView *)self->_descriptionTextView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentDescription, a3);
    if ([(NSString *)self->_contentDescription length])
    {
      layout = self->_layout;
      id v7 = [(VUIProductLockupView *)self traitCollection];
      id v8 = [(VUILibraryProductLockupViewLayout *)layout descriptionTextLayoutForTraitCollection:v7 isExpanded:[(VUIProductLockupView *)self contentDescriptionExpanded]];

      uint64_t v9 = [(VUIProductLockupView *)self _contentDescriptionAttributedString];
      id v10 = +[FocusableTextView textViewWithAttributedString:v9 textLayout:v8 existingTextView:self->_descriptionTextView];
      descriptionTextView = self->_descriptionTextView;
      self->_descriptionTextView = v10;

      objc_initWeak(&location, self);
      v12 = self->_descriptionTextView;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __46__VUIProductLockupView_setContentDescription___block_invoke;
      char v16 = &unk_1E6DFA850;
      objc_copyWeak(&v17, &location);
      [(FocusableTextView *)v12 setSelectionHandler:&v13];
      -[VUIProductLockupView addSubview:](self, "addSubview:", self->_descriptionTextView, v13, v14, v15, v16);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __46__VUIProductLockupView_setContentDescription___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setContentDescriptionExpanded:1];
  v1 = [WeakRetained descriptionTextView];
  [v1 setMaximumNumberOfLines:0];

  [WeakRetained setNeedsLayout];
  v2 = [WeakRetained delegate];
  [v2 contentDescriptionExpanded];
}

- (void)setLeftButton:(id)a3
{
  id v5 = (VUIRoundButton *)a3;
  leftButton = self->_leftButton;
  id v7 = v5;
  if (leftButton != v5)
  {
    [(VUIRoundButton *)leftButton removeFromSuperview];
    objc_storeStrong((id *)&self->_leftButton, a3);
    if (self->_leftButton) {
      -[VUIProductLockupView addSubview:](self, "addSubview:");
    }
  }
}

- (void)setDownloadView:(id)a3
{
  id v5 = (UIView *)a3;
  downloadView = self->_downloadView;
  id v7 = v5;
  if (downloadView != v5)
  {
    [(UIView *)downloadView removeFromSuperview];
    objc_storeStrong((id *)&self->_downloadView, a3);
    if (self->_downloadView) {
      -[VUIProductLockupView addSubview:](self, "addSubview:");
    }
  }
}

- (void)layoutSubviews
{
  [(VUIProductLockupView *)self bounds];
  double Width = CGRectGetWidth(v6);
  [(VUIProductLockupView *)self bounds];
  double Height = CGRectGetHeight(v7);
  -[VUIProductLockupView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, Height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIProductLockupView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)rentalExpirationLabelNeedsRelayout:(id)a3
{
  [a3 sizeToFit];
  [(VUIProductLockupView *)self setNeedsLayout];
}

- (void)_updateSubtitleLabelForWindowWidth:(double)a3
{
  layout = self->_layout;
  [(VUIProductLockupView *)self bounds];
  id v6 = [(VUILibraryProductLockupViewLayout *)layout subtitleTextLayoutForWindowWidth:CGRectGetWidth(v8)];
  id v5 = +[VUILabel labelWithString:self->_subtitle textLayout:v6 existingLabel:self->_subtitleLabel];
}

- (id)_contentDescriptionAttributedString
{
  v23[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(VUIProductLockupView *)self contentDescription];

  if (v3)
  {
    double v4 = [(VUIProductLockupView *)self _contentDescriptionFont];
    id v5 = [(VUIProductLockupView *)self contentDescription];
    id v6 = [MEMORY[0x1E4F73A10] parser];
    uint64_t v7 = *MEMORY[0x1E4FB06F8];
    uint64_t v8 = *MEMORY[0x1E4FB0700];
    v22[0] = *MEMORY[0x1E4FB06F8];
    v22[1] = v8;
    v23[0] = v4;
    uint64_t v9 = [MEMORY[0x1E4FB1618] systemGrayColor];
    v23[1] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

    id v11 = [MEMORY[0x1E4F73A10] displayDelegateWithDefaultAttributes:v10];
    [v6 setDelegate:v11];
    id v19 = 0;
    v12 = [v6 attributedStringForHTMLString:v5 error:&v19];
    id v13 = v19;
    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
      v20[1] = v8;
      v21[0] = v4;
      v20[0] = v7;
      id v15 = [MEMORY[0x1E4FB1618] systemGrayColor];
      v21[1] = v15;
      char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      uint64_t v17 = [v14 initWithString:v5 attributes:v16];

      v12 = (void *)v17;
    }
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (CGSize)_sizeOfDescriptionLabel:(double)a3
{
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:");
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(VUIProductLockupView *)self layout];
  if ([v9 layoutTypeForWindowWidth:a3])
  {
    id v10 = [(VUIProductLockupView *)self traitCollection];
    int v11 = [v10 isAXEnabled];

    if (!v11)
    {
      v12 = [(VUIProductLockupView *)self layout];
      [v12 coverArtImageSize];
      double v14 = a3 - v13;
      id v15 = [(VUIProductLockupView *)self layout];
      [v15 coverArtImageRightMarginForWindowWidth:a3];
      double v17 = v14 - v16 - v8;

      goto LABEL_6;
    }
  }
  else
  {
  }
  double v17 = a3 - v6;
LABEL_6:
  descriptionTextView = self->_descriptionTextView;
  -[VUIBaseView sizeThatFits:](descriptionTextView, "sizeThatFits:", v17 - v8, 1.79769313e308);
  result.height = v20;
  result.width = v19;
  return result;
}

- (double)_descriptionTopMarginWithBaselineMargin:(double)a3 otherFont:(id)a4
{
  id v6 = a4;
  double v7 = [(VUIProductLockupView *)self _contentDescriptionFont];
  double v8 = [(VUIProductLockupView *)self traitCollection];
  if (v6) {
    [v7 topMarginToFont:v6 withBaselineMargin:v8 traitCollection:a3];
  }
  else {
    [v7 topMarginWithBaselineMargin:v8 traitCollection:a3];
  }
  double v10 = v9;

  return v10;
}

- (double)_descriptionBottomMarginWithBaselineMargin:(double)a3
{
  double v5 = [(VUIProductLockupView *)self _contentDescriptionFont];
  id v6 = [(VUIProductLockupView *)self traitCollection];
  [v5 bottomMarginWithBaselineMargin:v6 traitCollection:a3];
  double v8 = v7;

  return v8;
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:", a3.width);
    double v9 = v8;
    double v11 = width - (v8 + v10);
    -[VUIBaseView sizeThatFits:](self->_topSeparatorView, "sizeThatFits:", v11, 1.79769313e308);
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v9, 0.0, v12, v13);
    -[VUIBaseView sizeThatFits:](self->_bottomSeparatorView, "sizeThatFits:", v11, 1.79769313e308);
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v9, height - v14, v15, v14);
    [(VUIProductLockupView *)self _updateSubtitleLabelForWindowWidth:width];
  }
  double v16 = [(VUIProductLockupView *)self traitCollection];
  int v17 = [v16 isAXEnabled];

  if (v17)
  {
    -[VUIProductLockupView _layoutForCategoryAccessibility:metricsOnly:](self, "_layoutForCategoryAccessibility:metricsOnly:", v4, width, height);
  }
  else
  {
    double v20 = [(VUIProductLockupView *)self layout];
    uint64_t v21 = [v20 layoutTypeForWindowWidth:width];

    if (v21)
    {
      -[VUIProductLockupView _layoutForStacked:metricsOnly:](self, "_layoutForStacked:metricsOnly:", v4, width, height);
    }
    else
    {
      -[VUIProductLockupView _layoutForCompact:metricsOnly:](self, "_layoutForCompact:metricsOnly:", v4, width, height);
    }
  }
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (CGSize)_layoutForCategoryAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double width = a3.width;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:", a3.width, a3.height);
  double v8 = v7;
  double v10 = v9;
  +[VUIViewSpacer spacerB];
  double v12 = v11;
  [(VUILibraryProductLockupViewLayout *)self->_layout coverArtImageSize];
  double v49 = v13;
  double v56 = v14;
  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width - (v8 + v10), 1.79769313e308);
  double v47 = v15;
  double v17 = v16;
  [(VUIProductLockupView *)self _sizeOfDescriptionLabel:width];
  double v51 = v18;
  double v55 = v19;
  -[UIView sizeThatFits:](self->_downloadView, "sizeThatFits:", width, 1.79769313e308);
  double v52 = v20;
  double v54 = v21;
  -[VUIRoundButton sizeThatFits:](self->_leftButton, "sizeThatFits:", width, 1.79769313e308);
  double v50 = v22;
  double v53 = v23;
  char v24 = [(VUIProductLockupView *)self _contentDescriptionFont];
  [(VUILibraryProductLockupViewLayout *)self->_layout contentDescriptionTopMarginForWindowWidth:width];
  double v26 = v25;
  v27 = [(VUIProductLockupView *)self traitCollection];
  [v24 topMarginWithBaselineMargin:v27 traitCollection:v26];

  -[VUIBaseView sizeThatFits:](self->_mediaInfoTagsView, "sizeThatFits:", width, 1.79769313e308);
  double v48 = v28;
  double v30 = v29;
  -[VUIBaseView sizeThatFits:](self->_mediaBadgeTagsView, "sizeThatFits:", width, 1.79769313e308);
  double v33 = v32;
  if (!a4)
  {
    double v34 = v31;
    -[VUIImageView setFrame:](self->_coverArtImageView, "setFrame:", v8, v12, v49, v56);
    double v35 = v12 + v56;
    subtitleLabel = self->_subtitleLabel;
    if (subtitleLabel)
    {
      -[VUILabel setFrame:](subtitleLabel, "setFrame:", v8, v35, v47, v17);
      VUIRoundValue();
    }
    else
    {
      +[VUIViewSpacer spacerA];
    }
    double v38 = v35 + v37;
    -[VUIMediaTagsView setFrame:](self->_mediaInfoTagsView, "setFrame:", v8, v38, v48, v30);
    -[VUIMediaTagsView setFrame:](self->_mediaBadgeTagsView, "setFrame:", v8, v30 + v38, v34, v33);
    -[FocusableTextView setFrame:](self->_descriptionTextView, "setFrame:", v8, v33 + v30 + v38, v51, v55);
    double v39 = v55 + v33 + v30 + v38;
    leftButton = self->_leftButton;
    [(VUILibraryProductLockupViewLayout *)self->_layout buttonModuleTopMarginForWindowWidth:width];
    -[VUIRoundButton setFrame:](leftButton, "setFrame:", v8, v39 + v41, v50, v53);
    downloadView = self->_downloadView;
    [(VUILibraryProductLockupViewLayout *)self->_layout buttonModuleTopMarginForWindowWidth:width];
    -[UIView setFrame:](downloadView, "setFrame:", v8, v53 + v39 + v43, v52, v54);
  }
  if (v17 <= 0.0) {
    +[VUIViewSpacer spacerA];
  }
  VUIRoundValue();
  double v45 = v44;
  double v46 = width;
  result.double height = v45;
  result.double width = v46;
  return result;
}

- (CGSize)_layoutForCompact:(CGSize)a3 metricsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double width = a3.width;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:", a3.width, a3.height);
  double v8 = v7;
  double v10 = v9;
  [(VUILibraryProductLockupViewLayout *)self->_layout coverArtImageSize];
  double v12 = v11;
  double v132 = v13;
  +[VUIViewSpacer spacerB];
  double v125 = v14;
  [(VUIProductLockupView *)self _sizeOfDescriptionLabel:width];
  double v118 = v15;
  double v128 = v16;
  double v17 = [(VUILabel *)self->_subtitleLabel font];
  [(VUILibraryProductLockupViewLayout *)self->_layout subtitleTopMarginForWindowWidth:width];
  double v19 = v18;
  double v20 = [(VUIProductLockupView *)self traitCollection];
  [v17 topMarginWithBaselineMargin:v20 traitCollection:v19];
  double v114 = v21;

  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width, 1.79769313e308);
  double rect = v22;
  double v24 = v23;
  double v25 = [(VUIProductLockupView *)self _contentDescriptionFont];
  [(VUILibraryProductLockupViewLayout *)self->_layout contentDescriptionTopMarginForWindowWidth:width];
  double v27 = v26;
  double v28 = [(VUIProductLockupView *)self traitCollection];
  [v25 topMarginWithBaselineMargin:v28 traitCollection:v27];
  double v131 = v29;

  double v30 = [(VUIProductLockupView *)self _contentDescriptionFont];
  [(VUILibraryProductLockupViewLayout *)self->_layout contentDescriptionBottomMarginForWindowWidth:width];
  double v32 = v31;
  double v33 = [(VUIProductLockupView *)self traitCollection];
  [v30 bottomMarginWithBaselineMargin:v33 traitCollection:v32];
  double v127 = v34;

  -[VUIBaseView sizeThatFits:](self->_mediaInfoTagsView, "sizeThatFits:", width, 1.79769313e308);
  double v36 = v35;
  CGFloat v130 = v37;
  -[VUIBaseView sizeThatFits:](self->_mediaBadgeTagsView, "sizeThatFits:", width, 1.79769313e308);
  double v116 = v38;
  double v129 = v39;
  [(VUILibraryProductLockupViewLayout *)self->_layout metadataTopMargin];
  double v41 = v40;
  uint64_t v42 = [(VUIProductLockupView *)self traitCollection];
  +[VUIUtilities scaleContentSizeValue:v42 forTraitCollection:v41];
  double v126 = v43;

  double v112 = v10;
  -[VUIRoundButton sizeThatFits:](self->_leftButton, "sizeThatFits:", width - v8 - v10, 1.79769313e308);
  double v120 = v44;
  double v123 = v45;
  -[UIView sizeThatFits:](self->_downloadView, "sizeThatFits:", width - v8 - v10, 1.79769313e308);
  if (!v4)
  {
    double v105 = v46;
    CGFloat v106 = v36;
    CGFloat v124 = v8;
    double v109 = v47;
    CGFloat v113 = v24;
    double v49 = *MEMORY[0x1E4F1DB28];
    double v48 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v51 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v50 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    [(VUIProductLockupView *)self frame];
    double v52 = CGRectGetMidX(v134) + v12 * -0.5;
    v135.origin.x = v52;
    v135.origin.double y = v125;
    v135.size.double width = v12;
    v135.size.double height = v132;
    double MaxY = CGRectGetMaxY(v135);
    double v121 = v50;
    CGFloat v110 = v48;
    CGFloat v111 = v49;
    double v108 = v12;
    if (self->_subtitleLabel)
    {
      v136.origin.x = v52;
      v136.origin.double y = v125;
      v136.size.double width = v12;
      v136.size.double height = v132;
      v137.origin.double y = v114 + CGRectGetMaxY(v136);
      CGFloat v54 = v124;
      v137.origin.x = v124;
      double y = v137.origin.y;
      v137.size.double width = rect;
      v137.size.double height = v113;
      CGRectGetMaxY(v137);
      double v55 = v126;
      VUIRoundValue();
      double v57 = v56;
      double v102 = v124;
      double v103 = v113;
    }
    else
    {
      double v55 = v126;
      double v57 = v126 + MaxY;
      double v103 = v50;
      double y = v48;
      double rect = v51;
      double v102 = v49;
      CGFloat v54 = v124;
    }
    CGFloat v58 = v106;
    if (self->_mediaInfoTagsView)
    {
      v138.origin.x = v54;
      v138.origin.double y = v57;
      v138.size.double width = v106;
      v138.size.double height = v130;
      CGRectGetMaxY(v138);
      VUIRoundValue();
      double v60 = v59;
      CGFloat v61 = v54;
      CGFloat v62 = v130;
      double v100 = v106;
      double v101 = v130;
      double v98 = v54;
      double v99 = v57;
      CGFloat v64 = v110;
      CGFloat v63 = v111;
    }
    else
    {
      double v60 = v55 + v57;
      CGFloat v61 = v52;
      double v57 = v125;
      CGFloat v58 = v108;
      CGFloat v62 = v132;
      double v100 = v51;
      double v101 = v50;
      CGFloat v64 = v110;
      CGFloat v63 = v111;
      double v98 = v111;
      double v99 = v110;
    }
    double v115 = v52;
    double v65 = v51;
    double v66 = v64;
    CGFloat v67 = v63;
    if (self->_mediaBadgeTagsView)
    {
      CGFloat v61 = v54;
      double v65 = v116;
      CGFloat v58 = v116;
      double v57 = v55 + v60;
      CGFloat v62 = v129;
      double v50 = v129;
      double v66 = v55 + v60;
      CGFloat v67 = v54;
    }
    double v95 = v67;
    double v96 = v66;
    double v97 = v65;
    double v107 = v50;
    if (self->_descriptionTextView)
    {
      double v68 = v57;
      CGFloat v69 = v58;
      double v70 = v131 + CGRectGetMaxY(*(CGRect *)&v61);
      CGFloat v62 = v128;
      double v121 = v128;
      CGFloat v58 = v118;
      double v117 = v118;
      CGFloat v71 = v124;
      double v72 = v124;
      CGFloat v61 = v124;
      double v57 = v70;
    }
    else
    {
      double v117 = v51;
      double v70 = v64;
      double v72 = v63;
      CGFloat v71 = v124;
    }
    double v73 = v57;
    CGFloat v74 = v58;
    double v75 = v127 + CGRectGetMaxY(*(CGRect *)&v61);
    uint64_t v76 = [(VUILibraryProductLockupViewLayout *)self->_layout downloadButtonPosition];
    double v77 = v71;
    if (v76 == 5)
    {
      v139.origin.double y = v110;
      v139.origin.x = v111;
      v139.size.double width = v105;
      v139.size.double height = v109;
      double v77 = width - v112 - CGRectGetWidth(v139);
    }
    double v119 = v77;
    VUIRoundValue();
    double v79 = v78;
    if ([(VUIProductLockupView *)self effectiveUserInterfaceLayoutDirection] == 1)
    {
      [(VUIProductLockupView *)self bounds];
      descriptionTextView = self->_descriptionTextView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[FocusableTextView setFrame:](descriptionTextView, "setFrame:");
      mediaBadgeTagsView = self->_mediaBadgeTagsView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIMediaTagsView setFrame:](mediaBadgeTagsView, "setFrame:");
      mediaInfoTagsView = self->_mediaInfoTagsView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIMediaTagsView setFrame:](mediaInfoTagsView, "setFrame:");
      subtitleLabel = self->_subtitleLabel;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUILabel setFrame:](subtitleLabel, "setFrame:");
      downloadView = self->_downloadView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[UIView setFrame:](downloadView, "setFrame:");
      coverArtImageView = self->_coverArtImageView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIImageView setFrame:](coverArtImageView, "setFrame:");
      leftButton = self->_leftButton;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v91 = leftButton;
    }
    else
    {
      -[FocusableTextView setFrame:](self->_descriptionTextView, "setFrame:", v72, v70, v117, v121);
      -[VUIMediaTagsView setFrame:](self->_mediaBadgeTagsView, "setFrame:", v95, v96, v97, v107);
      -[VUIMediaTagsView setFrame:](self->_mediaInfoTagsView, "setFrame:", v98, v99, v100, v101);
      -[VUILabel setFrame:](self->_subtitleLabel, "setFrame:", v102, y, rect, v103);
      -[UIView setFrame:](self->_downloadView, "setFrame:", v119, v79, v105, v109);
      -[VUIImageView setFrame:](self->_coverArtImageView, "setFrame:", v115, v125, v108, v132);
      double v91 = self->_leftButton;
      double v88 = v75;
      double v89 = v120;
      double v87 = v124;
      double v90 = v123;
    }
    -[VUIRoundButton setFrame:](v91, "setFrame:", v87, v88, v89, v90, *(void *)&v95, *(void *)&v96, *(void *)&v97);
  }
  +[VUIViewSpacer spacerB];
  +[VUIViewSpacer spacerB];
  VUIRoundValue();
  double v93 = v92;
  double v94 = width;
  result.double height = v93;
  result.double width = v94;
  return result;
}

- (CGSize)_layoutForStacked:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double width = a3.width;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:", a3.width, a3.height);
  double v8 = v7;
  double v10 = v9;
  +[VUIViewSpacer spacerB];
  double v126 = v11;
  [(VUILibraryProductLockupViewLayout *)self->_layout coverArtImageSize];
  double v13 = v12;
  CGFloat v15 = v14;
  [(VUILibraryProductLockupViewLayout *)self->_layout coverArtImageRightMarginForWindowWidth:width];
  double v128 = v8;
  double v107 = v10;
  double v127 = v13;
  double v123 = v16;
  double v17 = v8 + v10 + v13 + v16;
  double v18 = [(VUILabel *)self->_subtitleLabel font];
  double v19 = [(VUIProductLockupView *)self traitCollection];
  [v18 topMarginWithBaselineMargin:v19 traitCollection:30.0];
  CGFloat v21 = v20;

  double v22 = [(VUILabel *)self->_subtitleLabel font];
  double v23 = [(VUIProductLockupView *)self traitCollection];
  [v22 bottomMarginWithBaselineMargin:v23 traitCollection:16.0];
  double v110 = v24;

  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width - v17, 1.79769313e308);
  CGFloat v111 = v25;
  CGFloat v109 = v26;
  [(VUIProductLockupView *)self _sizeOfDescriptionLabel:width];
  double v28 = v27;
  double v30 = v29;
  [(VUILibraryProductLockupViewLayout *)self->_layout contentDescriptionTopMarginForWindowWidth:width];
  double v32 = v31;
  double v33 = [(VUILabel *)self->_subtitleLabel font];
  [(VUIProductLockupView *)self _descriptionTopMarginWithBaselineMargin:v33 otherFont:v32];
  double v35 = v34;

  [(VUILibraryProductLockupViewLayout *)self->_layout contentDescriptionBottomMarginForWindowWidth:width];
  -[VUIProductLockupView _descriptionBottomMarginWithBaselineMargin:](self, "_descriptionBottomMarginWithBaselineMargin:");
  -[VUIBaseView sizeThatFits:](self->_mediaInfoTagsView, "sizeThatFits:", width, 1.79769313e308);
  double rect = v36;
  double v122 = v37;
  -[VUIBaseView sizeThatFits:](self->_mediaBadgeTagsView, "sizeThatFits:", width, 1.79769313e308);
  double v118 = v38;
  double v121 = v39;
  -[UIView sizeThatFits:](self->_downloadView, "sizeThatFits:", v17, 1.79769313e308);
  double v115 = v40;
  double v125 = v41;
  -[VUIRoundButton sizeThatFits:](self->_leftButton, "sizeThatFits:", v17, 1.79769313e308);
  double v124 = v43;
  if (!a4)
  {
    double v92 = v28;
    double v97 = v42;
    double v44 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v113 = *MEMORY[0x1E4F1DB28];
    double v46 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v45 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v108 = v30;
    double v114 = v35;
    double v106 = width;
    double v116 = v44;
    double v117 = v46;
    if ([(VUILibraryProductLockupViewLayout *)self->_layout type] == 1)
    {
      double v47 = v45;
      CGFloat v48 = v46;
      CGFloat v49 = v44;
      double v50 = v113;
      CGFloat v51 = v127;
      if (self->_subtitleLabel)
      {
        double v50 = v128;
        v130.origin.x = v128;
        v130.origin.double y = v21;
        CGFloat v48 = v111;
        v130.size.double width = v111;
        CGFloat v45 = v109;
        v130.size.double height = v109;
        double v126 = v110 + CGRectGetMaxY(v130);
        CGFloat v49 = v21;
      }
    }
    else
    {
      double v47 = v45;
      CGFloat v48 = v46;
      CGFloat v49 = v44;
      double v50 = v113;
      CGFloat v51 = v127;
    }
    double v98 = v50;
    double v99 = v49;
    double v100 = v48;
    double v101 = v45;
    v131.origin.x = v128;
    v131.origin.double y = v126;
    v131.size.double width = v51;
    v131.size.double height = v15;
    CGFloat MinY = CGRectGetMinY(v131);
    double v53 = v128;
    double v54 = v126;
    CGFloat v55 = v51;
    CGFloat v56 = v51;
    CGFloat v57 = v15;
    double v112 = v47;
    double v58 = v47;
    CGFloat v60 = v116;
    double v59 = v117;
    double v61 = v113;
    double v62 = v113;
    if (self->_mediaInfoTagsView)
    {
      double v63 = v128;
      double v64 = v126;
      CGFloat v65 = v15;
      double v53 = v123 + CGRectGetMaxX(*(CGRect *)(&v55 - 2));
      double v54 = MinY;
      double v59 = rect;
      CGFloat v56 = rect;
      double v58 = v122;
      CGFloat v57 = v122;
      CGFloat v60 = MinY;
      double v62 = v53;
    }
    double recta = v15;
    double v104 = v59;
    double v105 = v58;
    double v102 = v62;
    double v103 = v60;
    if (self->_mediaBadgeTagsView)
    {
      v132.size.double width = v127;
      v132.origin.x = v128;
      v132.origin.double y = v126;
      v132.size.double height = v15;
      CGFloat v66 = v54;
      CGFloat v67 = v56;
      double v68 = v123 + CGRectGetMaxX(v132);
      v133.origin.x = v53;
      v133.origin.double y = v66;
      v133.size.double width = v67;
      v133.size.double height = v57;
      CGFloat v57 = v121;
      double v95 = v68;
      double v96 = v121;
      double v54 = v114 + CGRectGetMaxY(v133);
      double v53 = v68;
      double v94 = v54;
      CGFloat v56 = v118;
    }
    else
    {
      double v95 = v113;
      double v96 = v112;
      double v118 = v117;
      double v94 = v116;
    }
    if (self->_descriptionTextView)
    {
      v134.size.double width = v127;
      v134.origin.x = v128;
      v134.origin.double y = v126;
      v134.size.double height = v15;
      CGFloat v69 = v54;
      CGFloat v70 = v56;
      double v71 = v123 + CGRectGetMaxX(v134);
      v135.origin.x = v53;
      v135.origin.double y = v69;
      v135.size.double width = v70;
      v135.size.double height = v57;
      CGFloat v57 = v108;
      double v112 = v108;
      double v113 = v71;
      double v54 = v114 + CGRectGetMaxY(v135);
      CGFloat v56 = v92;
      double v117 = v92;
      double v53 = v71;
      double v93 = v54;
      double v72 = v116;
    }
    else
    {
      double v72 = v116;
      double v93 = v116;
    }
    v136.origin.x = v53;
    v136.origin.double y = v54;
    v136.size.double width = v56;
    v136.size.double height = v57;
    CGRectGetMaxY(v136);
    VUIRoundValue();
    double v74 = v73;
    double v75 = v72;
    double v76 = v61;
    double v77 = v61;
    double width = v106;
    if (self->_downloadView)
    {
      if ([(VUILibraryProductLockupViewLayout *)self->_layout downloadButtonPosition] == 5)
      {
        v137.origin.x = v76;
        v137.origin.double y = v72;
        v137.size.double width = v115;
        v137.size.double height = v125;
        double v77 = v106 - v107 - CGRectGetWidth(v137);
      }
      else
      {
        v138.origin.x = v128;
        v138.origin.double y = v126;
        v138.size.double width = v127;
        v138.size.double height = recta;
        double v77 = v123 + CGRectGetMaxX(v138);
      }
      double v75 = v74;
    }
    if (self->_leftButton)
    {
      v139.origin.x = v128;
      v139.origin.double y = v126;
      v139.size.double width = v127;
      v139.size.double height = recta;
      double v76 = v123 + CGRectGetMaxX(v139);
      double v72 = v74;
    }
    if ([(VUIProductLockupView *)self effectiveUserInterfaceLayoutDirection] == 1)
    {
      [(VUIProductLockupView *)self bounds];
      leftButton = self->_leftButton;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIRoundButton setFrame:](leftButton, "setFrame:");
      descriptionTextView = self->_descriptionTextView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[FocusableTextView setFrame:](descriptionTextView, "setFrame:");
      downloadView = self->_downloadView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[UIView setFrame:](downloadView, "setFrame:");
      coverArtImageView = self->_coverArtImageView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIImageView setFrame:](coverArtImageView, "setFrame:");
      subtitleLabel = self->_subtitleLabel;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUILabel setFrame:](subtitleLabel, "setFrame:");
      mediaBadgeTagsView = self->_mediaBadgeTagsView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIMediaTagsView setFrame:](mediaBadgeTagsView, "setFrame:");
      mediaInfoTagsView = self->_mediaInfoTagsView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
    }
    else
    {
      -[VUIRoundButton setFrame:](self->_leftButton, "setFrame:", v76, v72, v97, v124);
      -[FocusableTextView setFrame:](self->_descriptionTextView, "setFrame:", v113, v93, v117, v112);
      -[UIView setFrame:](self->_downloadView, "setFrame:", v77, v75, v115, v125);
      -[VUIImageView setFrame:](self->_coverArtImageView, "setFrame:", v128, v126, v127, recta);
      -[VUILabel setFrame:](self->_subtitleLabel, "setFrame:", v98, v99, v100, v101);
      -[VUIMediaTagsView setFrame:](self->_mediaBadgeTagsView, "setFrame:", v95, v94, v118, v96);
      mediaInfoTagsView = self->_mediaInfoTagsView;
      double v87 = v104;
      double v88 = v105;
      double v85 = v102;
      double v86 = v103;
    }
    -[VUIMediaTagsView setFrame:](mediaInfoTagsView, "setFrame:", v85, v86, v87, v88);
  }
  if ([(VUILibraryProductLockupViewLayout *)self->_layout type] == 1 && self->_subtitleLabel)
  {
    +[VUIViewSpacer spacerB];
  }
  else
  {
    +[VUIViewSpacer spacerB];
    +[VUIViewSpacer spacerB];
  }
  if (self->_downloadView || self->_leftButton) {
    +[VUIViewSpacer spacerB];
  }
  VUIRoundValue();
  double v90 = v89;
  double v91 = width;
  result.double height = v90;
  result.double width = v91;
  return result;
}

- (id)_contentDescriptionFont
{
  double v3 = (void *)MEMORY[0x1E4FB1F48];
  [(VUIProductLockupView *)self bounds];
  uint64_t v4 = objc_msgSend(v3, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v9));
  double v5 = [(VUIProductLockupView *)self layout];
  id v6 = [v5 contentDescriptionFontForSizeClass:v4];

  return v6;
}

- (VUILibraryProductLockupViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (VUIImageProxy)coverArtImageProxy
{
  return self->_coverArtImageProxy;
}

- (UIImage)coverArtPlaceholderImage
{
  return self->_coverArtPlaceholderImage;
}

- (VUIRoundButton)leftButton
{
  return self->_leftButton;
}

- (UIView)downloadView
{
  return self->_downloadView;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSNumber)releaseYear
{
  return self->_releaseYear;
}

- (void)setReleaseYear:(id)a3
{
}

- (NSString)availabilityText
{
  return self->_availabilityText;
}

- (void)setAvailabilityText:(id)a3
{
}

- (NSArray)badgeResources
{
  return self->_badgeResources;
}

- (void)setBadgeResources:(id)a3
{
}

- (VUIProductLockupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIProductLockupViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void)setTopSeparatorView:(id)a3
{
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (void)setBottomSeparatorView:(id)a3
{
}

- (VUIImageView)coverArtImageView
{
  return self->_coverArtImageView;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (FocusableTextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
}

- (BOOL)contentDescriptionExpanded
{
  return self->_contentDescriptionExpanded;
}

- (void)setContentDescriptionExpanded:(BOOL)a3
{
  self->_contentDescriptionExpanded = a3;
}

- (BOOL)didSetUpViews
{
  return self->_didSetUpViews;
}

- (void)setDidSetUpViews:(BOOL)a3
{
  self->_didSetUpViews = a3;
}

- (VUIRentalExpirationLabel)expirationLabel
{
  return self->_expirationLabel;
}

- (void)setExpirationLabel:(id)a3
{
}

- (UIImage)contentRatingImage
{
  return self->_contentRatingImage;
}

- (void)setContentRatingImage:(id)a3
{
}

- (VUIMediaTagsView)mediaInfoTagsView
{
  return self->_mediaInfoTagsView;
}

- (VUIMediaTagsView)mediaBadgeTagsView
{
  return self->_mediaBadgeTagsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaBadgeTagsView, 0);
  objc_storeStrong((id *)&self->_mediaInfoTagsView, 0);
  objc_storeStrong((id *)&self->_contentRatingImage, 0);
  objc_storeStrong((id *)&self->_expirationLabel, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_coverArtImageView, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_badgeResources, 0);
  objc_storeStrong((id *)&self->_availabilityText, 0);
  objc_storeStrong((id *)&self->_releaseYear, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_downloadView, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_coverArtPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_coverArtImageProxy, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
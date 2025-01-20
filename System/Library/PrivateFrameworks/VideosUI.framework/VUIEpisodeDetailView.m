@interface VUIEpisodeDetailView
+ (CGSize)_episodeFrameImageSizeForDetailView:(id)a3 withViewSize:(CGSize)a4;
+ (void)configureEpisodeDetailView:(id)a3 withMedia:(id)a4 viewSize:(CGSize)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIFont)contentDescriptionFont;
- (VUIEpisodeDetailView)initWithFrame:(CGRect)a3;
- (VUIEpisodeDetailViewDelegate)episodeViewDelegate;
- (VUIFocusableTextView)contentDescriptionView;
- (VUILabel)dotSeparatorLabel;
- (VUILabel)episodeNumberLabel;
- (VUILabel)episodeTitleLabel;
- (VUILabel)releaseDateLabel;
- (VUILabel)seasonNumberLabel;
- (VUILibraryEpisodeFrameView)imageFrameView;
- (VUIMediaItem)mediaItem;
- (VUIMediaTagsView)mediaBadgeTagsView;
- (double)_descriptionBottomMarginWithBaselineMargin:(double)a3;
- (double)_descriptionTopMarginWithBaselineMargin:(double)a3 otherFont:(id)a4;
- (double)_seasonMargin;
- (void)_configureDotSeparator;
- (void)_configureViewElementsForAX;
- (void)didTapButtonForEpisodeFrameView:(id)a3;
- (void)layoutSubviews;
- (void)setContentDescriptionFont:(id)a3;
- (void)setContentDescriptionView:(id)a3;
- (void)setDotSeparatorLabel:(id)a3;
- (void)setEpisodeNumberLabel:(id)a3;
- (void)setEpisodeTitleLabel:(id)a3;
- (void)setEpisodeViewDelegate:(id)a3;
- (void)setImageFrameView:(id)a3;
- (void)setMediaBadgeTagsView:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setReleaseDateLabel:(id)a3;
- (void)setSeasonNumberLabel:(id)a3;
- (void)updateProgress;
@end

@implementation VUIEpisodeDetailView

+ (CGSize)_episodeFrameImageSizeForDetailView:(id)a3 withViewSize:(CGSize)a4
{
  double width = a4.width;
  if (+[VUIUtilities isIpadInterface]) {
    double v5 = width + -48.0;
  }
  else {
    double v5 = width;
  }
  +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778, v5, 0.0);
  result.height = v7;
  result.double width = v6;
  return result;
}

+ (void)configureEpisodeDetailView:(id)a3 withMedia:(id)a4 viewSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v70 = a3;
  id v9 = a4;
  [v70 setMediaItem:v9];
  v10 = [v70 imageFrameView];
  if (v10)
  {
    v11 = [v70 imageFrameView];
  }
  else
  {
    v11 = -[VUILibraryEpisodeFrameView initWithFrame:]([VUILibraryEpisodeFrameView alloc], "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v12 = v11;

  objc_msgSend(a1, "_episodeFrameImageSizeForDetailView:withViewSize:", v70, width, height);
  +[VUILibraryEpisodeFrameView configureEpisodeFrameView:withMedia:layout:imageSize:](VUILibraryEpisodeFrameView, "configureEpisodeFrameView:withMedia:layout:imageSize:", v12, v9, 1);
  v69 = v12;
  [v70 setImageFrameView:v12];
  v13 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v13 setTextStyle:+[VUIUtilities isIpadInterface] ^ 1];
  [(VUITextLayout *)v13 setFontWeight:10];
  v14 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  [(VUITextLayout *)v13 setColor:v14];

  [(VUITextLayout *)v13 setNumberOfLines:2];
  v15 = [v9 title];
  v16 = [v70 episodeTitleLabel];
  v17 = +[VUILabel labelWithString:v15 textLayout:v13 existingLabel:v16];
  [v70 setEpisodeTitleLabel:v17];

  v18 = objc_alloc_init(VUITextLayout);
  if (+[VUIUtilities isIpadInterface]) {
    uint64_t v19 = 15;
  }
  else {
    uint64_t v19 = 17;
  }
  [(VUITextLayout *)v18 setTextStyle:v19];
  [(VUITextLayout *)v18 setFontWeight:10];
  v20 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
  [(VUITextLayout *)v18 setColor:v20];

  [(VUITextLayout *)v18 setNumberOfLines:1];
  uint64_t v21 = [v9 seasonNumber];
  v22 = (void *)v21;
  v23 = &unk_1F3F3D310;
  if (v21) {
    v23 = (void *)v21;
  }
  id v24 = v23;

  v25 = NSString;
  v26 = +[VUILocalizationManager sharedInstance];
  v27 = [v26 localizedStringForKey:@"SEASON_%@"];
  v28 = [v25 stringWithValidatedFormat:v27, @"%@", 0, v24 validFormatSpecifiers error];

  uint64_t v29 = [v28 localizedUppercaseString];

  v30 = [v70 seasonNumberLabel];
  v68 = (void *)v29;
  v31 = +[VUILabel labelWithString:v29 textLayout:v18 existingLabel:v30];
  [v70 setSeasonNumberLabel:v31];

  v32 = objc_alloc_init(VUITextLayout);
  if (+[VUIUtilities isIpadInterface]) {
    uint64_t v33 = 15;
  }
  else {
    uint64_t v33 = 17;
  }
  [(VUITextLayout *)v32 setTextStyle:v33];
  [(VUITextLayout *)v32 setFontWeight:10];
  v34 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
  [(VUITextLayout *)v32 setColor:v34];

  [(VUITextLayout *)v32 setNumberOfLines:1];
  v35 = NSString;
  v36 = +[VUILocalizationManager sharedInstance];
  v37 = [v36 localizedStringForKey:@"EPISODE_%@"];
  v38 = [v9 episodeNumber];
  v39 = [v35 stringWithValidatedFormat:v37, @"%@", 0, v38 validFormatSpecifiers error];
  uint64_t v40 = [v39 localizedUppercaseString];

  v41 = [v70 episodeNumberLabel];
  v67 = (void *)v40;
  v42 = +[VUILabel labelWithString:v40 textLayout:v32 existingLabel:v41];
  [v70 setEpisodeNumberLabel:v42];

  v43 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v43 setTextStyle:21];
  [(VUITextLayout *)v43 setFontWeight:0];
  v44 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  [(VUITextLayout *)v43 setColor:v44];

  [(VUITextLayout *)v43 setNumberOfLines:1];
  v45 = [v9 releaseDate];
  if (v45)
  {
    v46 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v45 dateStyle:2 timeStyle:0];
    v47 = [v70 releaseDateLabel];
    v48 = +[VUILabel labelWithString:v46 textLayout:v43 existingLabel:v47];
    [v70 setReleaseDateLabel:v48];
  }
  v49 = [v9 contentDescription];
  uint64_t v50 = [v49 length];

  if (v50)
  {
    v51 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v51 setTextStyle:21];
    [(VUITextLayout *)v51 setFontWeight:0];
    v52 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
    [(VUITextLayout *)v51 setColor:v52];

    v53 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    [(VUITextLayout *)v51 setSeeMoreTextColor:v53];

    [(VUITextLayout *)v51 setNumberOfLines:0];
    v54 = [v9 contentDescription];
    v55 = [v70 contentDescriptionView];
    v56 = +[VUIFocusableTextView textViewWithString:v54 textLayout:v51 existingTextView:v55];

    uint64_t v57 = [v9 contentDescription];
    v58 = (void *)v57;
    if (v57) {
      v59 = (__CFString *)v57;
    }
    else {
      v59 = &stru_1F3E921E0;
    }
    v60 = [(VUITextLayout *)v51 attributedStringWithString:v59];

    [v56 setDescriptionText:v60];
    v61 = objc_msgSend(MEMORY[0x1E4FB08E0], "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", -[VUITextLayout textStyle](v51, "textStyle"), 0, 0, 0.0);
    [v70 setContentDescriptionFont:v61];

    [v70 setContentDescriptionView:v56];
  }
  v62 = [[VUIMediaTagsViewLayout alloc] initWithType:7];
  v63 = [VUIMediaTagsView alloc];
  v64 = -[VUIMediaTagsView initWithFrame:layout:](v63, "initWithFrame:layout:", v62, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v65 = [[VUIMediaTagsViewHelper alloc] initWithVUIMediaItem:v9];
  v66 = [(VUIMediaTagsViewHelper *)v65 tagsViewDictionary];
  [(VUIMediaTagsView *)v64 updateWithMetadata:v66];

  [v70 setMediaBadgeTagsView:v64];
}

- (VUIEpisodeDetailView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIEpisodeDetailView;
  v3 = -[VUIEpisodeDetailView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [(VUIEpisodeDetailView *)v3 setBackgroundColor:v4];

    [(VUIEpisodeDetailView *)v3 setShowsVerticalScrollIndicator:0];
    [(VUIEpisodeDetailView *)v3 setShowsHorizontalScrollIndicator:0];
    [(VUIEpisodeDetailView *)v3 setAlwaysBounceVertical:1];
  }
  return v3;
}

- (void)setImageFrameView:(id)a3
{
  double v5 = (VUILibraryEpisodeFrameView *)a3;
  p_imageFrameView = &self->_imageFrameView;
  imageFrameView = self->_imageFrameView;
  if (imageFrameView != v5)
  {
    v8 = v5;
    [(VUILibraryEpisodeFrameView *)imageFrameView removeFromSuperview];
    [(VUILibraryEpisodeFrameView *)*p_imageFrameView setDelegate:0];
    objc_storeStrong((id *)&self->_imageFrameView, a3);
    if (*p_imageFrameView)
    {
      [(VUILibraryEpisodeFrameView *)*p_imageFrameView setDelegate:self];
      [(VUIEpisodeDetailView *)self addSubview:*p_imageFrameView];
    }
    [(VUIEpisodeDetailView *)self setNeedsLayout];
    double v5 = v8;
  }
}

- (void)setEpisodeTitleLabel:(id)a3
{
  double v5 = (VUILabel *)a3;
  episodeTitleLabel = self->_episodeTitleLabel;
  if (episodeTitleLabel != v5)
  {
    double v7 = v5;
    [(VUILabel *)episodeTitleLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_episodeTitleLabel, a3);
    if (self->_episodeTitleLabel) {
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
    }
    [(VUIEpisodeDetailView *)self setNeedsLayout];
    double v5 = v7;
  }
}

- (void)setSeasonNumberLabel:(id)a3
{
  double v5 = (VUILabel *)a3;
  seasonNumberLabel = self->_seasonNumberLabel;
  if (seasonNumberLabel != v5)
  {
    double v7 = v5;
    [(VUILabel *)seasonNumberLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_seasonNumberLabel, a3);
    if (self->_seasonNumberLabel)
    {
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
      [(VUIEpisodeDetailView *)self _configureDotSeparator];
    }
    [(VUIEpisodeDetailView *)self setNeedsLayout];
    double v5 = v7;
  }
}

- (void)setEpisodeNumberLabel:(id)a3
{
  double v5 = (VUILabel *)a3;
  episodeNumberLabel = self->_episodeNumberLabel;
  if (episodeNumberLabel != v5)
  {
    double v7 = v5;
    [(VUILabel *)episodeNumberLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_episodeNumberLabel, a3);
    if (self->_episodeNumberLabel)
    {
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
      [(VUIEpisodeDetailView *)self _configureDotSeparator];
    }
    [(VUIEpisodeDetailView *)self setNeedsLayout];
    double v5 = v7;
  }
}

- (void)setReleaseDateLabel:(id)a3
{
  double v5 = (VUILabel *)a3;
  releaseDateLabel = self->_releaseDateLabel;
  if (releaseDateLabel != v5)
  {
    double v7 = v5;
    [(VUILabel *)releaseDateLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_releaseDateLabel, a3);
    if (self->_releaseDateLabel) {
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
    }
    [(VUIEpisodeDetailView *)self setNeedsLayout];
    double v5 = v7;
  }
}

- (void)setMediaBadgeTagsView:(id)a3
{
  double v5 = (VUIMediaTagsView *)a3;
  mediaBadgeTagsView = self->_mediaBadgeTagsView;
  double v7 = v5;
  if (mediaBadgeTagsView != v5)
  {
    [(VUIMediaTagsView *)mediaBadgeTagsView removeFromSuperview];
    objc_storeStrong((id *)&self->_mediaBadgeTagsView, a3);
    if (self->_mediaBadgeTagsView) {
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
    }
  }
}

- (void)setContentDescriptionView:(id)a3
{
  double v5 = (VUIFocusableTextView *)a3;
  p_contentDescriptionView = &self->_contentDescriptionView;
  contentDescriptionView = self->_contentDescriptionView;
  if (contentDescriptionView != v5)
  {
    [(VUIFocusableTextView *)contentDescriptionView removeFromSuperview];
    [(TVFocusableTextView *)*p_contentDescriptionView setSelectionHandler:0];
    objc_storeStrong((id *)&self->_contentDescriptionView, a3);
    if (*p_contentDescriptionView)
    {
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
      objc_initWeak(&location, self);
      v8 = *p_contentDescriptionView;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      v11 = __50__VUIEpisodeDetailView_setContentDescriptionView___block_invoke;
      v12 = &unk_1E6DFA850;
      objc_copyWeak(&v13, &location);
      [(TVFocusableTextView *)v8 setSelectionHandler:&v9];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    [(VUIEpisodeDetailView *)self setNeedsLayout];
  }
}

void __50__VUIEpisodeDetailView_setContentDescriptionView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained contentDescriptionView];
  [v1 setMaximumNumberOfLines:0];

  [WeakRetained bounds];
  objc_msgSend(WeakRetained, "sizeThatFits:", v2, v3);
  objc_msgSend(WeakRetained, "setContentSize:");
  [WeakRetained setNeedsLayout];
}

- (void)layoutSubviews
{
  v173.receiver = self;
  v173.super_class = (Class)VUIEpisodeDetailView;
  [(VUIEpisodeDetailView *)&v173 layoutSubviews];
  [(VUIEpisodeDetailView *)self _configureViewElementsForAX];
  double v3 = [(VUIEpisodeDetailView *)self traitCollection];
  int v4 = [v3 isAXEnabled];

  [(VUIEpisodeDetailView *)self safeAreaInsets];
  double v6 = v5;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v8 = v7;
  double v10 = v9;
  [(VUIEpisodeDetailView *)self bounds];
  +[VUIEpisodeDetailView _episodeFrameImageSizeForDetailView:withViewSize:](VUIEpisodeDetailView, "_episodeFrameImageSizeForDetailView:withViewSize:", self, v11, v12);
  double v171 = v13;
  double v15 = v14;
  BOOL v16 = +[VUIUtilities isIpadInterface];
  if (v16) {
    double v17 = 24.0;
  }
  else {
    double v17 = v6;
  }
  CGFloat rect = v17;
  if (v16) {
    double v18 = 24.0;
  }
  else {
    double v18 = 0.0;
  }
  if (v16) {
    double v19 = 24.0;
  }
  else {
    double v19 = v10;
  }
  if (v16) {
    double v20 = 24.0;
  }
  else {
    double v20 = v8;
  }
  seasonNumberLabel = self->_seasonNumberLabel;
  [(VUIEpisodeDetailView *)self _seasonMargin];
  -[VUILabel topMarginWithBaselineMargin:](seasonNumberLabel, "topMarginWithBaselineMargin:");
  double v23 = v22;
  episodeNumberLabel = self->_episodeNumberLabel;
  [(VUIEpisodeDetailView *)self _seasonMargin];
  -[VUILabel topMarginWithBaselineMargin:](episodeNumberLabel, "topMarginWithBaselineMargin:");
  double rect_8 = v25;
  mediaBadgeTagsView = self->_mediaBadgeTagsView;
  [(VUIEpisodeDetailView *)self bounds];
  -[VUIBaseView sizeThatFits:](mediaBadgeTagsView, "sizeThatFits:", CGRectGetWidth(v174), 1.79769313e308);
  CGFloat v142 = v27;
  double v172 = v28;
  uint64_t v29 = self->_seasonNumberLabel;
  [(VUIEpisodeDetailView *)self bounds];
  double v30 = v20 + v19;
  -[VUILabel sizeThatFits:](v29, "sizeThatFits:", CGRectGetWidth(v175) - v30, 1.79769313e308);
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  v35 = self->_episodeNumberLabel;
  [(VUIEpisodeDetailView *)self bounds];
  -[VUILabel sizeThatFits:](v35, "sizeThatFits:", CGRectGetWidth(v176) - v30, 1.79769313e308);
  double rect_24 = v36;
  double rect_16 = v37;
  dotSeparatorLabel = self->_dotSeparatorLabel;
  [(VUIEpisodeDetailView *)self bounds];
  double v160 = v30;
  CGFloat v39 = CGRectGetWidth(v177) - v30;
  CGFloat v40 = v15;
  -[VUILabel sizeThatFits:](dotSeparatorLabel, "sizeThatFits:", v39, 1.79769313e308);
  double v42 = v41;
  double v44 = v43;
  v178.origin.x = rect;
  CGFloat v162 = v18;
  v178.origin.y = v18;
  v178.size.double width = v171;
  v178.size.double height = v40;
  double v169 = v23;
  double v45 = v23 + CGRectGetMaxY(v178);
  v179.origin.x = v20;
  v179.origin.y = v45;
  v179.size.double width = v32;
  v179.size.double height = v34;
  CGFloat MaxX = CGRectGetMaxX(v179);
  v180.origin.x = v20;
  v180.origin.y = v45;
  v180.size.double width = v32;
  v180.size.double height = v34;
  double v47 = CGRectGetMidY(v180) + v44 * -0.5;
  CGFloat v145 = v32;
  CGFloat v147 = v40;
  CGFloat v143 = v34;
  double v158 = v42;
  double v159 = v44;
  double v156 = MaxX;
  double v157 = v45;
  double v155 = v47;
  if (v4)
  {
    v181.origin.x = v20;
    v181.origin.y = v45;
    v181.size.double width = v32;
    v181.size.double height = v34;
    double v48 = v169 + CGRectGetMaxY(v181);
    CGFloat v49 = v20;
  }
  else
  {
    CGFloat v50 = MaxX;
    double v51 = v42;
    double v52 = v44;
    CGFloat v49 = CGRectGetMaxX(*(CGRect *)(&v47 - 1));
    v182.origin.y = v162;
    v182.origin.x = rect;
    v182.size.double width = v171;
    v182.size.double height = v40;
    double v48 = rect_8 + CGRectGetMaxY(v182);
  }
  episodeTitleLabel = self->_episodeTitleLabel;
  [(VUIEpisodeDetailView *)self bounds];
  -[VUILabel sizeThatFits:](episodeTitleLabel, "sizeThatFits:", CGRectGetWidth(v183) - v160, 1.79769313e308);
  double v55 = v54;
  CGFloat v57 = v56;
  v58 = self->_episodeTitleLabel;
  v59 = self->_episodeNumberLabel;
  BOOL v60 = +[VUIUtilities isIpadInterface];
  double v61 = 32.0;
  if (v60) {
    double v61 = 40.0;
  }
  [(VUILabel *)v58 topMarginToLabel:v59 withBaselineMargin:v61];
  double v63 = v62;
  double v153 = v48;
  double v154 = v49;
  v184.origin.x = v49;
  v184.origin.y = v48;
  v184.size.double width = rect_24;
  v184.size.double height = rect_16;
  CGFloat v64 = v63 + CGRectGetMaxY(v184);
  releaseDateLabel = self->_releaseDateLabel;
  [(VUIEpisodeDetailView *)self bounds];
  -[VUILabel sizeThatFits:](releaseDateLabel, "sizeThatFits:", CGRectGetWidth(v185) - v160, 1.79769313e308);
  CGFloat v67 = v66;
  CGFloat v69 = v68;
  [(VUILabel *)self->_releaseDateLabel topMarginToLabel:self->_episodeTitleLabel withBaselineMargin:28.0];
  double v71 = v70;
  v186.origin.x = v20;
  v186.origin.y = v64;
  v186.size.double width = v55;
  v186.size.double height = v57;
  double v72 = v71 + CGRectGetMaxY(v186);
  [(VUILabel *)self->_episodeTitleLabel bottomMarginWithBaselineMargin:28.0];
  double v74 = v73 - v172;
  v187.origin.x = v20;
  v187.origin.y = v72;
  double v170 = v67;
  v187.size.double width = v67;
  v187.size.double height = v69;
  double v75 = CGRectGetMaxX(v187) + 5.0;
  v188.origin.x = v20;
  double v151 = v57;
  double v152 = v64;
  v188.origin.y = v64;
  v188.size.double width = v55;
  v188.size.double height = v57;
  double MaxY = CGRectGetMaxY(v188);
  v77 = self->_releaseDateLabel;
  BOOL v78 = v77 == 0;
  BOOL v79 = v77 != 0;
  if (v78) {
    int v80 = 0;
  }
  else {
    int v80 = v4;
  }
  if ((v79 & ~v4) != 0) {
    double v81 = v75;
  }
  else {
    double v81 = v20;
  }
  if (v80 == 1)
  {
    v189.origin.x = v20;
    v189.origin.y = v72;
    v189.size.double width = v170;
    v189.size.double height = v69;
    double MaxY = CGRectGetMaxY(v189);
    double rect_8a = v20;
  }
  else
  {
    double rect_8a = v81;
  }
  double v82 = v142;
  double v83 = v72;
  double v84 = v74 + MaxY;
  contentDescriptionView = self->_contentDescriptionView;
  [(VUIEpisodeDetailView *)self bounds];
  -[TVFocusableTextView sizeThatFits:](contentDescriptionView, "sizeThatFits:", CGRectGetWidth(v190) - v160, 1.79769313e308);
  double v141 = v86;
  double v161 = v87;
  v88 = [(VUILabel *)self->_releaseDateLabel font];
  [(VUIEpisodeDetailView *)self _descriptionTopMarginWithBaselineMargin:v88 otherFont:28.0];
  double v90 = v89;

  v191.origin.x = v20;
  v191.origin.y = v72;
  v191.size.double width = v170;
  v191.size.double height = v69;
  double v91 = CGRectGetMaxY(v191);
  if (!self->_releaseDateLabel || (double v92 = v90 + v91, v4) && self->_mediaBadgeTagsView)
  {
    [(VUIEpisodeDetailView *)self _descriptionTopMarginWithBaselineMargin:0 otherFont:28.0];
    double v94 = v93;
    v192.origin.x = rect_8a;
    v192.origin.y = v84;
    v192.size.double width = v142;
    v192.size.double height = v172;
    double v92 = v94 + CGRectGetMaxY(v192);
  }
  double v149 = v84;
  double v150 = v69;
  if ([(VUIEpisodeDetailView *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    [(VUIEpisodeDetailView *)self bounds];
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v96 = v95;
    double v163 = v97;
    double v171 = v98;
    double v148 = v99;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v140 = v100;
    double v157 = v101;
    double v144 = v103;
    double v146 = v102;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v155 = v105;
    double v156 = v104;
    double v158 = v106;
    double v159 = v107;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v153 = v109;
    double v154 = v108;
    double rect_24 = v110;
    double rect_16 = v111;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v139 = v112;
    double v151 = v114;
    double v152 = v113;
    double v116 = v115;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v137 = v118;
    double v138 = v117;
    double v170 = v119;
    double v150 = v120;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double rect_8a = v121;
    double v149 = v122;
    double v172 = v123;
    double v82 = v124;
    double v126 = v144;
    double v125 = v146;
    double v55 = v116;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v20 = v127;
    double v128 = v96;
    double v92 = v129;
    double v130 = v163;
    double v132 = v131;
    double v134 = v133;
    double v135 = v148;
  }
  else
  {
    double v138 = v20;
    double v139 = v20;
    double v140 = v20;
    double v125 = v145;
    double v135 = v147;
    double v130 = v162;
    double v128 = rect;
    double v126 = v143;
    double v137 = v83;
    double v134 = v161;
    double v132 = v141;
  }
  -[VUILibraryEpisodeFrameView setFrame:](self->_imageFrameView, "setFrame:", v128, v130, v171, v135);
  -[VUILabel setFrame:](self->_seasonNumberLabel, "setFrame:", v140, v157, v125, v126);
  -[VUILabel setFrame:](self->_dotSeparatorLabel, "setFrame:", v156, v155, v158, v159);
  -[VUILabel setFrame:](self->_episodeNumberLabel, "setFrame:", v154, v153, rect_24, rect_16);
  -[VUILabel setFrame:](self->_episodeTitleLabel, "setFrame:", v139, v152, v55, v151);
  -[VUILabel setFrame:](self->_releaseDateLabel, "setFrame:", v138, v137, v170, v150);
  -[VUIMediaTagsView setFrame:](self->_mediaBadgeTagsView, "setFrame:", rect_8a, v149, v82, v172);
  -[TVFocusableTextView setFrame:](self->_contentDescriptionView, "setFrame:", v20, v92, v132, v134);
  [(VUIEpisodeDetailView *)self bounds];
  double Width = CGRectGetWidth(v193);
  v194.origin.x = v20;
  v194.origin.y = v92;
  v194.size.double width = v132;
  v194.size.double height = v134;
  -[VUIEpisodeDetailView setContentSize:](self, "setContentSize:", Width, CGRectGetMaxY(v194));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v7 = v6;
  double v9 = v8;
  +[VUIEpisodeDetailView _episodeFrameImageSizeForDetailView:withViewSize:](VUIEpisodeDetailView, "_episodeFrameImageSizeForDetailView:withViewSize:", self, width, height);
  double v11 = v10 + 0.0;
  seasonNumberLabel = self->_seasonNumberLabel;
  [(VUIEpisodeDetailView *)self _seasonMargin];
  -[VUILabel topMarginWithBaselineMargin:](seasonNumberLabel, "topMarginWithBaselineMargin:");
  double v14 = v11 + v13;
  double v15 = width - (v7 + v9);
  -[VUILabel sizeThatFits:](self->_seasonNumberLabel, "sizeThatFits:", v15, 1.79769313e308);
  double v17 = v14 + v16;
  double v18 = [(VUIEpisodeDetailView *)self traitCollection];
  int v19 = [v18 isAXEnabled];

  if (v19)
  {
    episodeNumberLabel = self->_episodeNumberLabel;
    [(VUIEpisodeDetailView *)self _seasonMargin];
    -[VUILabel topMarginWithBaselineMargin:](episodeNumberLabel, "topMarginWithBaselineMargin:");
    double v22 = v17 + v21;
    -[VUILabel sizeThatFits:](self->_episodeNumberLabel, "sizeThatFits:", v15, 1.79769313e308);
    double v17 = v22 + v23;
  }
  episodeTitleLabel = self->_episodeTitleLabel;
  double v25 = self->_seasonNumberLabel;
  BOOL v26 = +[VUIUtilities isIpadInterface];
  double v27 = 32.0;
  if (v26) {
    double v27 = 40.0;
  }
  [(VUILabel *)episodeTitleLabel topMarginToLabel:v25 withBaselineMargin:v27];
  double v29 = v17 + v28;
  -[VUILabel sizeThatFits:](self->_episodeTitleLabel, "sizeThatFits:", v15, 1.79769313e308);
  double v31 = v29 + v30;
  [(VUILabel *)self->_releaseDateLabel topMarginToLabel:self->_episodeTitleLabel withBaselineMargin:28.0];
  double v33 = v31 + v32;
  -[VUILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", v15, 1.79769313e308);
  double v35 = v33 + v34;
  double v36 = [(VUILabel *)self->_releaseDateLabel font];
  [(VUIEpisodeDetailView *)self _descriptionTopMarginWithBaselineMargin:v36 otherFont:28.0];
  double v38 = v35 + v37;

  -[TVFocusableTextView sizeThatFits:](self->_contentDescriptionView, "sizeThatFits:", v15, 1.79769313e308);
  double v40 = v38 + v39;
  if (+[VUIUtilities isIpadInterface]) {
    double v41 = v40 + 48.0;
  }
  else {
    double v41 = v40;
  }
  double v42 = width;
  result.double height = v41;
  result.double width = v42;
  return result;
}

- (void)updateProgress
{
  id v4 = [(VUIEpisodeDetailView *)self imageFrameView];
  double v3 = [(VUIEpisodeDetailView *)self mediaItem];
  [v4 updateProgress:v3];
}

- (void)_configureDotSeparator
{
  if (self->_seasonNumberLabel && self->_episodeNumberLabel)
  {
    id v7 = [NSString stringWithFormat:@" %@ ", @"·"];
    double v3 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v3 setTextStyle:22];
    id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
    [(VUITextLayout *)v3 setColor:v4];

    [(VUITextLayout *)v3 setNumberOfLines:1];
    double v5 = +[VUILabel labelWithString:v7 textLayout:v3 existingLabel:self->_dotSeparatorLabel];
    dotSeparatorLabel = self->_dotSeparatorLabel;
    self->_dotSeparatorLabel = v5;

    [(VUIEpisodeDetailView *)self addSubview:self->_dotSeparatorLabel];
  }
}

- (double)_descriptionTopMarginWithBaselineMargin:(double)a3 otherFont:(id)a4
{
  id v6 = a4;
  id v7 = [(VUIEpisodeDetailView *)self contentDescriptionFont];
  double v8 = [(VUIEpisodeDetailView *)self traitCollection];
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
  double v5 = [(VUIEpisodeDetailView *)self contentDescriptionFont];
  id v6 = [(VUIEpisodeDetailView *)self traitCollection];
  [v5 bottomMarginWithBaselineMargin:v6 traitCollection:a3];
  double v8 = v7;

  return v8;
}

- (void)didTapButtonForEpisodeFrameView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_episodeViewDelegate);
  [WeakRetained didTapPlay];
}

- (void)_configureViewElementsForAX
{
  double v3 = [(VUIEpisodeDetailView *)self traitCollection];
  uint64_t v4 = [v3 isAXEnabled];

  id v5 = [(VUIEpisodeDetailView *)self dotSeparatorLabel];
  [v5 setHidden:v4];
}

- (double)_seasonMargin
{
  double v2 = [(VUIEpisodeDetailView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double result = 15.0;
  if (!v3) {
    double result = 20.0;
  }
  if (v3 == 1) {
    return 24.0;
  }
  return result;
}

- (VUIEpisodeDetailViewDelegate)episodeViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_episodeViewDelegate);
  return (VUIEpisodeDetailViewDelegate *)WeakRetained;
}

- (void)setEpisodeViewDelegate:(id)a3
{
}

- (VUILibraryEpisodeFrameView)imageFrameView
{
  return self->_imageFrameView;
}

- (VUILabel)episodeTitleLabel
{
  return self->_episodeTitleLabel;
}

- (VUILabel)seasonNumberLabel
{
  return self->_seasonNumberLabel;
}

- (VUILabel)episodeNumberLabel
{
  return self->_episodeNumberLabel;
}

- (VUILabel)releaseDateLabel
{
  return self->_releaseDateLabel;
}

- (VUILabel)dotSeparatorLabel
{
  return self->_dotSeparatorLabel;
}

- (void)setDotSeparatorLabel:(id)a3
{
}

- (VUIFocusableTextView)contentDescriptionView
{
  return self->_contentDescriptionView;
}

- (UIFont)contentDescriptionFont
{
  return self->_contentDescriptionFont;
}

- (void)setContentDescriptionFont:(id)a3
{
}

- (VUIMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (VUIMediaTagsView)mediaBadgeTagsView
{
  return self->_mediaBadgeTagsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaBadgeTagsView, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_contentDescriptionFont, 0);
  objc_storeStrong((id *)&self->_contentDescriptionView, 0);
  objc_storeStrong((id *)&self->_dotSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_releaseDateLabel, 0);
  objc_storeStrong((id *)&self->_episodeNumberLabel, 0);
  objc_storeStrong((id *)&self->_seasonNumberLabel, 0);
  objc_storeStrong((id *)&self->_episodeTitleLabel, 0);
  objc_storeStrong((id *)&self->_imageFrameView, 0);
  objc_destroyWeak((id *)&self->_episodeViewDelegate);
}

@end
@interface EpisodeAvailableCell
+ (double)defaultHeight;
- (BOOL)separatorHidden;
- (CGSize)intrinsicContentSize;
- (EpisodeAvailableCell)initWithFrame:(CGRect)a3;
- (EpisodeAvailableCellDelegate)delegate;
- (EpisodeListAvailableStyle)style;
- (EpisodePropertySource)episodePropertySource;
- (MTButtonWithTouchInsets)playButton;
- (UIImageView)artworkView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)separatorView;
- (void)_fetchImageWithSize:(CGSize)a3 imageKeyWithFallbackKeys:(id)a4 completion:(id)a5;
- (void)applyImage:(id)a3 fromSource:(id)a4;
- (void)ensureInstalledSubviews:(id)a3;
- (void)layoutSubviews;
- (void)loadArtworkImage;
- (void)playButtonTapped:(id)a3;
- (void)prepareForReuse;
- (void)reloadValues;
- (void)setDelegate:(id)a3;
- (void)setEpisodePropertySource:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EpisodeAvailableCell

- (EpisodeAvailableCell)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)EpisodeAvailableCell;
  v3 = -[EpisodeAvailableCell initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[EpisodeListAvailableStyle defaultStyle];
    style = v3->_style;
    v3->_style = (EpisodeListAvailableStyle *)v4;

    uint64_t v6 = [(EpisodeListAvailableStyle *)v3->_style cell_newArtworkView];
    artworkView = v3->_artworkView;
    v3->_artworkView = (UIImageView *)v6;

    uint64_t v8 = [(EpisodeListAvailableStyle *)v3->_style cell_newPlayButton];
    playButton = v3->_playButton;
    v3->_playButton = (MTButtonWithTouchInsets *)v8;

    uint64_t v10 = [(EpisodeListAvailableStyle *)v3->_style cell_newTitleLabel];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v10;

    uint64_t v12 = [(EpisodeListAvailableStyle *)v3->_style cell_newSubtitleLabel];
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v12;

    uint64_t v14 = [(EpisodeListAvailableStyle *)v3->_style cell_newHorizontalSeparatorView];
    separatorView = v3->_separatorView;
    v3->_separatorView = (UIView *)v14;

    [(UIView *)v3->_separatorView setHidden:1];
    [(MTButtonWithTouchInsets *)v3->_playButton addTarget:v3 action:"playButtonTapped:" forControlEvents:64];
    v19[0] = v3->_artworkView;
    v19[1] = v3->_playButton;
    v19[2] = v3->_titleLabel;
    v19[3] = v3->_subtitleLabel;
    v19[4] = v3->_separatorView;
    v16 = +[NSArray arrayWithObjects:v19 count:5];
    [(EpisodeAvailableCell *)v3 ensureInstalledSubviews:v16];
  }
  return v3;
}

- (void)setEpisodePropertySource:(id)a3
{
  v5 = (EpisodePropertySource *)a3;
  p_episodePropertySource = &self->_episodePropertySource;
  if (self->_episodePropertySource != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_episodePropertySource, a3);
    p_episodePropertySource = (EpisodePropertySource **)[(EpisodeAvailableCell *)self reloadValues];
    v5 = v7;
  }

  _objc_release_x1(p_episodePropertySource, v5);
}

- (void)playButtonTapped:(id)a3
{
  id v4 = [(EpisodeAvailableCell *)self delegate];
  [v4 handlePlayActionForEpisodeAvailableCell:self];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(EpisodeAvailableCell *)self isHighlighted] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)EpisodeAvailableCell;
    [(EpisodeAvailableCell *)&v6 setHighlighted:v3];
    if ([(EpisodeAvailableCell *)self isHighlighted]) {
      +[UIColor cellSelectedBackgroundColor];
    }
    else {
    v5 = +[UIColor backgroundColor];
    }
    [(EpisodeAvailableCell *)self setBackgroundColor:v5];
  }
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)EpisodeAvailableCell;
  [(EpisodeAvailableCell *)&v7 prepareForReuse];
  episodePropertySource = self->_episodePropertySource;
  self->_episodePropertySource = 0;

  id v4 = [(EpisodeAvailableCell *)self artworkView];
  [v4 setImage:0];

  v5 = [(EpisodeAvailableCell *)self titleLabel];
  [v5 setText:&stru_10002D2B8];

  objc_super v6 = [(EpisodeAvailableCell *)self subtitleLabel];
  [v6 setText:&stru_10002D2B8];

  [(EpisodeAvailableCell *)self setSeparatorHidden:0];
}

- (void)setSeparatorHidden:(BOOL)a3
{
  if (self->_separatorHidden != a3)
  {
    self->_separatorHidden = a3;
    [(EpisodeAvailableCell *)self invalidateIntrinsicContentSize];
    [(EpisodeAvailableCell *)self setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EpisodeAvailableCell;
  [(EpisodeAvailableCell *)&v4 traitCollectionDidChange:a3];
  [(EpisodeAvailableCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  *(void *)&rect.size.height = self;
  v106 = EpisodeAvailableCell;
  [(CGFloat *)(objc_super *)&rect.size.height layoutSubviews];
  id v3 = [(EpisodeAvailableCell *)self effectiveUserInterfaceLayoutDirection];
  objc_super v4 = [(EpisodeAvailableCell *)self separatorView];
  v5 = [(EpisodeAvailableCell *)self artworkView];
  objc_super v6 = [(EpisodeAvailableCell *)self playButton];
  objc_super v7 = [(EpisodeAvailableCell *)self titleLabel];
  uint64_t v8 = [(EpisodeAvailableCell *)self subtitleLabel];
  v9 = [(EpisodeAvailableCell *)self style];
  [(EpisodeAvailableCell *)self bounds];
  double v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  objc_super v18 = [v9 cell_topAndBottomPadding];
  [v18 currentConstant];
  rect.size.width = v19;

  [v9 defaultMarginH];
  double v101 = v20;
  v107.origin.CGFloat x = v11;
  v107.origin.CGFloat y = v13;
  v107.size.width = v15;
  v107.size.height = v17;
  double MaxY = CGRectGetMaxY(v107);
  v21 = +[UIScreen mainScreen];
  [v21 scale];
  double v94 = v22;

  v108.origin.CGFloat x = v11;
  v108.origin.CGFloat y = v13;
  v108.size.width = v15;
  v108.size.height = v17;
  double Width = CGRectGetWidth(v108);
  v23 = +[UIScreen mainScreen];
  [v23 scale];
  double v92 = v24;

  [v5 frame];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [v9 defaultMarginH];
  double v32 = v31;
  rect.origin.CGFloat y = v28;
  double v102 = v17;
  if (v3 == (id)1)
  {
    v109.origin.CGFloat x = v11;
    v109.origin.CGFloat y = v13;
    v109.size.width = v15;
    v109.size.height = v17;
    double MaxX = CGRectGetMaxX(v109);
    v110.origin.CGFloat x = v26;
    v110.origin.CGFloat y = rect.size.width;
    v110.size.width = v28;
    v110.size.height = v30;
    double v34 = MaxX - CGRectGetWidth(v110) - v32;
  }
  else
  {
    double v34 = v11 + v31;
  }
  CGFloat v35 = v30;
  [v6 frame];
  CGFloat v37 = v36;
  [v6 frame];
  CGFloat v39 = v38;
  [v9 defaultMarginH];
  double v41 = v40;
  if (v3 == (id)1)
  {
    double v42 = v11 + v40;
  }
  else
  {
    v111.origin.CGFloat x = v11;
    v111.origin.CGFloat y = v13;
    v111.size.width = v15;
    v111.size.height = v102;
    double v43 = CGRectGetMaxX(v111);
    v112.origin.CGFloat x = 0.0;
    v112.origin.CGFloat y = 0.0;
    v112.size.width = v37;
    v112.size.height = v39;
    double v42 = v43 - CGRectGetWidth(v112) - v41;
  }
  rect.origin.CGFloat x = v42;
  double v44 = v39;
  CGFloat v45 = v34;
  v113.origin.CGFloat x = v34;
  v113.origin.CGFloat y = rect.size.width;
  v113.size.width = rect.origin.y;
  v113.size.height = v35;
  double Height = CGRectGetHeight(v113);
  v114.origin.CGFloat y = 0.0;
  v114.origin.CGFloat x = rect.origin.x;
  v114.size.width = v37;
  v114.size.height = v39;
  double v47 = rect.size.width + (Height - CGRectGetHeight(v114)) * 0.5;
  double v99 = v47;
  double v96 = v37;
  double v104 = v34;
  CGFloat v91 = v35;
  if (v3 == (id)1)
  {
    v115.origin.CGFloat x = rect.origin.x;
    v115.origin.CGFloat y = v47;
    v115.size.width = v37;
    v115.size.height = v44;
    double v48 = CGRectGetMaxX(v115);
    [v9 cell_playButtonToContentSpacing];
    double v50 = v48 + v49;
    v116.origin.CGFloat x = v45;
    v116.origin.CGFloat y = rect.size.width;
    v116.size.width = rect.origin.y;
    v116.size.height = v35;
    double MinX = CGRectGetMinX(v116);
    [v9 cell_artworkToContentSpacing];
  }
  else
  {
    v117.origin.CGFloat x = v34;
    v117.origin.CGFloat y = rect.size.width;
    v117.size.width = rect.origin.y;
    v117.size.height = v35;
    double v53 = CGRectGetMaxX(v117);
    [v9 cell_artworkToContentSpacing];
    double v50 = v53 + v54;
    v118.origin.CGFloat x = rect.origin.x;
    v118.origin.CGFloat y = v47;
    v118.size.width = v37;
    v118.size.height = v44;
    double MinX = CGRectGetMinX(v118);
    [v9 cell_playButtonToContentSpacing];
  }
  CGFloat v55 = MinX - v52 - v50;
  double v95 = MaxY - 1.0 / v94;
  double v98 = 1.0 / v92;
  [v7 sizeThatFits:v55, v102];
  CGFloat v57 = v56;
  CGFloat v59 = v58;
  double v90 = v55;
  [v8 sizeThatFits:v55, v102];
  double v61 = v60;
  v119.origin.CGFloat x = v50;
  v119.origin.CGFloat y = rect.size.width;
  v119.size.width = v57;
  double v93 = v57;
  v119.size.height = v59;
  double v89 = v59;
  double v62 = v50;
  double v63 = CGRectGetMaxY(v119);
  v64 = [v7 font];
  [v64 descender];
  double v66 = v63 - v65;
  v67 = [v9 cell_titleBL_To_subtitleBL];
  [v67 currentConstant];
  double v69 = v66 + v68;
  v70 = [v8 font];
  [v70 descender];
  double v103 = v61;
  double v88 = v69 + v71 - v61;

  v120.origin.CGFloat x = v62;
  v120.origin.CGFloat y = rect.size.width;
  v120.size.width = v57;
  v120.size.height = v59;
  v128.origin.CGFloat x = v62;
  v128.origin.CGFloat y = v88;
  v128.size.width = v55;
  v128.size.height = v61;
  CGRect v121 = CGRectUnion(v120, v128);
  CGFloat x = v121.origin.x;
  CGFloat v86 = v121.size.height;
  CGFloat y = v121.origin.y;
  CGFloat v73 = v121.size.width;
  v74 = [v7 font];
  [v74 ascender];
  double v76 = -v75;

  v122.origin.CGFloat x = v104;
  v122.origin.CGFloat y = rect.size.width;
  v122.size.width = rect.origin.y;
  v122.size.height = v91;
  double v77 = CGRectGetHeight(v122);
  v123.origin.CGFloat x = x;
  v123.size.height = v86;
  v123.origin.CGFloat y = y;
  v123.size.width = v73;
  double v78 = (v77 - CGRectGetHeight(v123)) * 0.5;
  if (v78 <= v76) {
    double v78 = v76;
  }
  CGFloat v79 = rect.size.width + v78;
  double v80 = v88 + v78;
  [v5 setFrame:v104];
  [v7 setFrame:v62, v79, v93, v89];
  [v8 setFrame:v62, v80, v90, v103];
  [v4 setFrame:v101, v95, Width, v98];
  [v4 setHidden:[self separatorHidden]];
  v124.size.height = v44;
  v124.origin.CGFloat x = rect.origin.x;
  v124.origin.CGFloat y = v99;
  v124.size.width = v96;
  double MinY = CGRectGetMinY(v124);
  v125.origin.CGFloat x = v104;
  v125.origin.CGFloat y = rect.size.width;
  v125.size.width = rect.origin.y;
  v125.size.height = v91;
  double v82 = -fmax(MinY - CGRectGetMinY(v125), 0.0);
  v126.origin.CGFloat x = v104;
  v126.origin.CGFloat y = rect.size.width;
  v126.size.width = rect.origin.y;
  v126.size.height = v91;
  double v83 = CGRectGetMaxY(v126);
  v127.origin.CGFloat x = rect.origin.x;
  v127.origin.CGFloat y = v99;
  v127.size.width = v96;
  v127.size.height = v44;
  double v84 = -fmax(v83 - CGRectGetMaxY(v127), 0.0);
  [v9 cell_playButtonToContentSpacing];
  [v6 setTouchInsets:v82, -v85, v84, -v85];
  [v6 setFrame:CGPointMake(rect.origin.x, v99, v96, v44)];
}

- (void)ensureInstalledSubviews:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        double v10 = [v9 superview];

        if (v10 != self) {
          [(EpisodeAvailableCell *)self addSubview:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

+ (double)defaultHeight
{
  v2 = +[EpisodeListAvailableStyle defaultStyle];
  id v3 = [v2 cell_topAndBottomPadding];
  [v3 currentConstant];
  double v5 = v4;

  [v2 cell_artworkDimension];
  double v7 = v6 + v5 * 2.0;

  return v7;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(EpisodeAvailableCell *)self artworkView];
  [v2 frame];
  double v4 = v3;

  double v5 = 0.0;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadValues
{
  id v7 = [(EpisodeAvailableCell *)self episodePropertySource];
  double v3 = [v7 title];
  double v4 = [(EpisodeAvailableCell *)self titleLabel];
  [v4 setText:v3];

  double v5 = [v7 localizedDurationAndPodcastTitleString];
  double v6 = [(EpisodeAvailableCell *)self subtitleLabel];
  [v6 setText:v5];

  [(EpisodeAvailableCell *)self loadArtworkImage];
  [(EpisodeAvailableCell *)self setNeedsLayout];
  [(EpisodeAvailableCell *)self invalidateIntrinsicContentSize];
}

- (void)applyImage:(id)a3 fromSource:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017B08;
  block[3] = &unk_10002CA80;
  block[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)loadArtworkImage
{
  double v3 = [(EpisodeAvailableCell *)self episodePropertySource];
  double v4 = [v3 podcastUuid];
  double v5 = [v3 preloadedImageWithSize:0x50uLL, 0x50uLL];
  if (v5)
  {
    [(EpisodeAvailableCell *)self applyImage:v5 fromSource:v3];
  }
  else
  {
    id v6 = +[NSMutableArray array];
    if ([v4 length]) {
      [v6 addObject:v4];
    }
    id v7 = [(EpisodeAvailableCell *)self artworkView];
    id v8 = [v7 image];

    if (!v8) {
      [v6 addObject:kMTLibraryDefaultImageKey];
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100017D20;
    v9[3] = &unk_10002CA58;
    v9[4] = self;
    id v10 = v3;
    -[EpisodeAvailableCell _fetchImageWithSize:imageKeyWithFallbackKeys:completion:](self, "_fetchImageWithSize:imageKeyWithFallbackKeys:completion:", v6, v9, (double)0x50uLL, (double)0x50uLL);
  }
}

- (void)_fetchImageWithSize:(CGSize)a3 imageKeyWithFallbackKeys:(id)a4 completion:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ([v9 count])
    {
      id v11 = [v9 firstObject];
      if ([v11 length])
      {
        objc_initWeak(&location, self);
        long long v12 = +[PUIObjCArtworkProvider shared];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100017EE0;
        v14[3] = &unk_10002CAD0;
        objc_copyWeak(v17, &location);
        id v16 = v10;
        id v13 = v12;
        id v15 = v13;
        v17[1] = *(id *)&width;
        v17[2] = *(id *)&height;
        [v13 artworkPathForShow:v11 size:v14 completionHandler:width, height];

        objc_destroyWeak(v17);
        objc_destroyWeak(&location);
      }
      else
      {
        (*((void (**)(id, void))v10 + 2))(v10, 0);
      }
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (EpisodeAvailableCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EpisodeAvailableCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EpisodePropertySource)episodePropertySource
{
  return self->_episodePropertySource;
}

- (BOOL)separatorHidden
{
  return self->_separatorHidden;
}

- (EpisodeListAvailableStyle)style
{
  return self->_style;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (UIImageView)artworkView
{
  return self->_artworkView;
}

- (MTButtonWithTouchInsets)playButton
{
  return self->_playButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_episodePropertySource, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
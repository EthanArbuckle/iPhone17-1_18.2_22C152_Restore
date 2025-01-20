@interface ICNoteBrowseFolderThumbnailView
- (BOOL)allowsCompactSizeMetrics;
- (BOOL)hasDropShadow;
- (BOOL)isCompact;
- (ICFolder)folder;
- (ICNoteBrowseFolderThumbnailView)initWithCoder:(id)a3;
- (ICNoteBrowseFolderThumbnailView)initWithFrame:(CGRect)a3;
- (ICNoteResultsThumbnailView)thumbnailView0;
- (ICNoteResultsThumbnailView)thumbnailView1;
- (ICNoteResultsThumbnailView)thumbnailView2;
- (ICNoteResultsThumbnailView)thumbnailView3;
- (NSArray)thumbnailViews;
- (UIImageView)emptyFolderImageView;
- (UIStackView)horizontalStackView0;
- (UIStackView)horizontalStackView1;
- (UIStackView)verticalStackView;
- (UIView)contentView;
- (double)cornerRadius;
- (void)commonInit;
- (void)setAllowsCompactSizeMetrics:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContentView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setEmptyFolderImageView:(id)a3;
- (void)setFolder:(id)a3;
- (void)setHasDropShadow:(BOOL)a3;
- (void)setHorizontalStackView0:(id)a3;
- (void)setHorizontalStackView1:(id)a3;
- (void)setThumbnailView0:(id)a3;
- (void)setThumbnailView1:(id)a3;
- (void)setThumbnailView2:(id)a3;
- (void)setThumbnailView3:(id)a3;
- (void)setThumbnailViews:(id)a3;
- (void)setVerticalStackView:(id)a3;
- (void)updateThumbnails;
@end

@implementation ICNoteBrowseFolderThumbnailView

- (ICNoteBrowseFolderThumbnailView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseFolderThumbnailView;
  v3 = [(ICNoteBrowseFolderThumbnailView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICNoteBrowseFolderThumbnailView *)v3 commonInit];
  }
  return v4;
}

- (ICNoteBrowseFolderThumbnailView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseFolderThumbnailView;
  v3 = -[ICNoteBrowseFolderThumbnailView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ICNoteBrowseFolderThumbnailView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  self->_allowsCompactSizeMetrics = 1;
  v3 = (UIView *)objc_alloc_init((Class)UIView);
  contentView = self->_contentView;
  self->_contentView = v3;

  v5 = +[UIColor systemGray4Color];
  [(UIView *)self->_contentView setBackgroundColor:v5];

  [(ICNoteBrowseFolderThumbnailView *)self addSubview:self->_contentView];
  [(UIView *)self->_contentView ic_addAnchorsToFillSuperview];
  [(ICNoteBrowseFolderThumbnailView *)self bounds];
  double MidX = CGRectGetMidX(v64);
  [(ICNoteBrowseFolderThumbnailView *)self bounds];
  double MidY = CGRectGetMidY(v65);
  v8 = -[ICNoteResultsThumbnailView initWithFrame:]([ICNoteResultsThumbnailView alloc], "initWithFrame:", 0.0, 0.0, MidX, MidY);
  thumbnailView0 = self->_thumbnailView0;
  self->_thumbnailView0 = v8;

  [(ICNoteResultsThumbnailView *)self->_thumbnailView0 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = -[ICNoteResultsThumbnailView initWithFrame:]([ICNoteResultsThumbnailView alloc], "initWithFrame:", 0.0, 0.0, MidX, MidY);
  thumbnailView1 = self->_thumbnailView1;
  self->_thumbnailView1 = v10;

  [(ICNoteResultsThumbnailView *)self->_thumbnailView1 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = -[ICNoteResultsThumbnailView initWithFrame:]([ICNoteResultsThumbnailView alloc], "initWithFrame:", 0.0, 0.0, MidX, MidY);
  thumbnailView2 = self->_thumbnailView2;
  self->_thumbnailView2 = v12;

  [(ICNoteResultsThumbnailView *)self->_thumbnailView2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = -[ICNoteResultsThumbnailView initWithFrame:]([ICNoteResultsThumbnailView alloc], "initWithFrame:", 0.0, 0.0, MidX, MidY);
  thumbnailView3 = self->_thumbnailView3;
  self->_thumbnailView3 = v14;

  [(ICNoteResultsThumbnailView *)self->_thumbnailView3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = self->_thumbnailView1;
  v63[0] = self->_thumbnailView0;
  v63[1] = v16;
  v17 = self->_thumbnailView3;
  v63[2] = self->_thumbnailView2;
  v63[3] = v17;
  v18 = +[NSArray arrayWithObjects:v63 count:4];
  thumbnailViews = self->_thumbnailViews;
  self->_thumbnailViews = v18;

  id v20 = objc_alloc((Class)UIStackView);
  v21 = self->_thumbnailView1;
  v62[0] = self->_thumbnailView0;
  v62[1] = v21;
  v22 = +[NSArray arrayWithObjects:v62 count:2];
  v23 = (UIStackView *)[v20 initWithArrangedSubviews:v22];
  horizontalStackView0 = self->_horizontalStackView0;
  self->_horizontalStackView0 = v23;

  [(UIStackView *)self->_horizontalStackView0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_horizontalStackView0 setAxis:0];
  [(UIStackView *)self->_horizontalStackView0 setDistribution:1];
  id v25 = objc_alloc((Class)UIStackView);
  v26 = self->_thumbnailView3;
  v61[0] = self->_thumbnailView2;
  v61[1] = v26;
  v27 = +[NSArray arrayWithObjects:v61 count:2];
  v28 = (UIStackView *)[v25 initWithArrangedSubviews:v27];
  horizontalStackView1 = self->_horizontalStackView1;
  self->_horizontalStackView1 = v28;

  [(UIStackView *)self->_horizontalStackView1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_horizontalStackView1 setAxis:0];
  [(UIStackView *)self->_horizontalStackView1 setDistribution:1];
  id v30 = objc_alloc((Class)UIStackView);
  v31 = self->_horizontalStackView1;
  v60[0] = self->_horizontalStackView0;
  v60[1] = v31;
  v32 = +[NSArray arrayWithObjects:v60 count:2];
  v33 = (UIStackView *)[v30 initWithArrangedSubviews:v32];
  verticalStackView = self->_verticalStackView;
  self->_verticalStackView = v33;

  [(UIStackView *)self->_verticalStackView setLayoutMarginsRelativeArrangement:1];
  [(UIStackView *)self->_verticalStackView setAxis:1];
  [(UIStackView *)self->_verticalStackView setDistribution:1];
  [(UIView *)self->_contentView addSubview:self->_verticalStackView];
  [(UIStackView *)self->_verticalStackView ic_addAnchorsToFillSuperview];
  unsigned int v35 = +[UIDevice ic_isVision];
  if (v35) {
    uint64_t v36 = 3;
  }
  else {
    uint64_t v36 = 1;
  }
  v37 = &UIFontTextStyleTitle1;
  if (!v35) {
    v37 = &UIFontTextStyleBody;
  }
  v57 = +[UIImage ic_systemImageNamed:@"folder" textStyle:*v37 scale:v36];
  v38 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v57];
  emptyFolderImageView = self->_emptyFolderImageView;
  self->_emptyFolderImageView = v38;

  v40 = +[UIColor tertiaryLabelColor];
  [(UIImageView *)self->_emptyFolderImageView setTintColor:v40];

  v41 = +[UIColor clearColor];
  [(UIImageView *)self->_emptyFolderImageView setBackgroundColor:v41];

  [(UIImageView *)self->_emptyFolderImageView setContentMode:1];
  [(UIImageView *)self->_emptyFolderImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentView addSubview:self->_emptyFolderImageView];
  v56 = [(UIImageView *)self->_emptyFolderImageView centerXAnchor];
  v55 = [(UIView *)self->_contentView centerXAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v59[0] = v54;
  v53 = [(UIImageView *)self->_emptyFolderImageView centerYAnchor];
  v42 = [(UIView *)self->_contentView centerYAnchor];
  v43 = [v53 constraintEqualToAnchor:v42];
  v59[1] = v43;
  v44 = [(UIImageView *)self->_emptyFolderImageView heightAnchor];
  v45 = [(UIView *)self->_contentView heightAnchor];
  v46 = [v44 constraintEqualToAnchor:v45 multiplier:0.5];
  v59[2] = v46;
  v47 = [(UIImageView *)self->_emptyFolderImageView widthAnchor];
  v48 = [(UIImageView *)self->_emptyFolderImageView heightAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  v59[3] = v49;
  v50 = +[NSArray arrayWithObjects:v59 count:4];
  +[NSLayoutConstraint activateConstraints:v50];

  [(ICNoteBrowseFolderThumbnailView *)self setHasDropShadow:1];
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  v51 = +[NSArray arrayWithObjects:v58 count:2];
  id v52 = [(ICNoteBrowseFolderThumbnailView *)self registerForTraitChanges:v51 withAction:"updateThumbnails"];
}

- (void)setFolder:(id)a3
{
  objc_storeWeak((id *)&self->_folder, a3);

  [(ICNoteBrowseFolderThumbnailView *)self updateThumbnails];
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteBrowseFolderThumbnailView *)self contentView];
  [v5 setBackgroundColor:v4];
}

- (void)setHasDropShadow:(BOOL)a3
{
  self->_hasDropShadow = a3;
  if ([(ICNoteBrowseFolderThumbnailView *)self hasDropShadow])
  {
    [(ICNoteBrowseFolderThumbnailView *)self ic_applyShadow];
  }
  else
  {
    [(ICNoteBrowseFolderThumbnailView *)self ic_removeShadow];
  }
}

- (BOOL)isCompact
{
  v3 = [(ICNoteBrowseFolderThumbnailView *)self traitCollection];
  if (objc_msgSend(v3, "ic_hasCompactSize")) {
    BOOL v4 = [(ICNoteBrowseFolderThumbnailView *)self allowsCompactSizeMetrics];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)updateThumbnails
{
  v3 = [(ICNoteBrowseFolderThumbnailView *)self folder];
  uint64_t v4 = [v3 visibleNotesInFolder];
  id v5 = (void *)v4;
  objc_super v6 = &__NSArray0__struct;
  if (v4) {
    objc_super v6 = (void *)v4;
  }
  id v7 = v6;

  v8 = [(ICNoteBrowseFolderThumbnailView *)self thumbnailViews];
  v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472;
  id v30 = sub_100107CC4;
  v31 = &unk_10062A2A0;
  id v9 = v7;
  id v32 = v9;
  v33 = self;
  [v8 enumerateObjectsUsingBlock:&v28];

  v10 = [(ICNoteBrowseFolderThumbnailView *)self folder];
  v11 = [v10 systemImageName];
  unsigned int v12 = +[UIDevice ic_isVision];
  v13 = &UIFontTextStyleTitle1;
  if (!v12) {
    v13 = &UIFontTextStyleBody;
  }
  v14 = +[UIImage ic_systemImageNamed:v11 textStyle:*v13 scale:3];
  v15 = [(ICNoteBrowseFolderThumbnailView *)self emptyFolderImageView];
  [v15 setImage:v14];

  BOOL v16 = [v9 count] != 0;
  v17 = [(ICNoteBrowseFolderThumbnailView *)self emptyFolderImageView];
  [v17 setHidden:v16];

  unsigned __int8 v18 = +[UIDevice ic_isVision];
  double v19 = 16.0;
  if ((v18 & 1) == 0)
  {
    unsigned int v20 = [(ICNoteBrowseFolderThumbnailView *)self isCompact];
    double v19 = 12.0;
    if (v20) {
      double v19 = 8.0;
    }
  }
  [(ICNoteBrowseFolderThumbnailView *)self setCornerRadius:v19];
  v21 = [(ICNoteBrowseFolderThumbnailView *)self contentView];
  [(ICNoteBrowseFolderThumbnailView *)self cornerRadius];
  [v21 ic_applyRoundedCornersWithRadius:];

  double v22 = 12.0;
  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    if ([(ICNoteBrowseFolderThumbnailView *)self isCompact]) {
      double v22 = 4.0;
    }
    else {
      double v22 = 8.0;
    }
  }
  v23 = [(ICNoteBrowseFolderThumbnailView *)self verticalStackView];
  [v23 setDirectionalLayoutMargins:v22, v22, v22, v22];

  if ([(ICNoteBrowseFolderThumbnailView *)self isCompact]) {
    double v24 = 2.0;
  }
  else {
    double v24 = 4.0;
  }
  id v25 = [(ICNoteBrowseFolderThumbnailView *)self verticalStackView];
  [v25 setSpacing:v24];

  v26 = [(ICNoteBrowseFolderThumbnailView *)self horizontalStackView0];
  [v26 setSpacing:v24];

  v27 = [(ICNoteBrowseFolderThumbnailView *)self horizontalStackView1];
  [v27 setSpacing:v24];
}

- (ICFolder)folder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folder);

  return (ICFolder *)WeakRetained;
}

- (BOOL)hasDropShadow
{
  return self->_hasDropShadow;
}

- (BOOL)allowsCompactSizeMetrics
{
  return self->_allowsCompactSizeMetrics;
}

- (void)setAllowsCompactSizeMetrics:(BOOL)a3
{
  self->_allowsCompactSizeMetrics = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIImageView)emptyFolderImageView
{
  return self->_emptyFolderImageView;
}

- (void)setEmptyFolderImageView:(id)a3
{
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
}

- (UIStackView)horizontalStackView0
{
  return self->_horizontalStackView0;
}

- (void)setHorizontalStackView0:(id)a3
{
}

- (UIStackView)horizontalStackView1
{
  return self->_horizontalStackView1;
}

- (void)setHorizontalStackView1:(id)a3
{
}

- (ICNoteResultsThumbnailView)thumbnailView0
{
  return self->_thumbnailView0;
}

- (void)setThumbnailView0:(id)a3
{
}

- (ICNoteResultsThumbnailView)thumbnailView1
{
  return self->_thumbnailView1;
}

- (void)setThumbnailView1:(id)a3
{
}

- (ICNoteResultsThumbnailView)thumbnailView2
{
  return self->_thumbnailView2;
}

- (void)setThumbnailView2:(id)a3
{
}

- (ICNoteResultsThumbnailView)thumbnailView3
{
  return self->_thumbnailView3;
}

- (void)setThumbnailView3:(id)a3
{
}

- (NSArray)thumbnailViews
{
  return self->_thumbnailViews;
}

- (void)setThumbnailViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailViews, 0);
  objc_storeStrong((id *)&self->_thumbnailView3, 0);
  objc_storeStrong((id *)&self->_thumbnailView2, 0);
  objc_storeStrong((id *)&self->_thumbnailView1, 0);
  objc_storeStrong((id *)&self->_thumbnailView0, 0);
  objc_storeStrong((id *)&self->_horizontalStackView1, 0);
  objc_storeStrong((id *)&self->_horizontalStackView0, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_emptyFolderImageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_destroyWeak((id *)&self->_folder);
}

@end
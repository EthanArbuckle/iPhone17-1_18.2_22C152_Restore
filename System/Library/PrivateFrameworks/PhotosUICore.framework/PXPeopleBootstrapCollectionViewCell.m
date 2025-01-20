@interface PXPeopleBootstrapCollectionViewCell
+ (id)cloudBadgeImage;
- (BOOL)_isRTL;
- (BOOL)confirmed;
- (BOOL)isMergeCandidate;
- (BOOL)isVerified;
- (CGSize)checkmarkImageSize;
- (PXPeopleBootstrapCollectionViewCell)initWithFrame:(CGRect)a3;
- (PXPersonImageRequest)imageRequest;
- (UIImage)image;
- (UIImageView)badgeView;
- (UIImageView)imageView;
- (UIView)selectedCheckmarkView;
- (UIView)unselectedCheckmarkView;
- (unint64_t)presentationStatus;
- (void)_updateCellSizing;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setConfirmed:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3 contentsRect:(CGRect)a4;
- (void)setImageRequest:(id)a3;
- (void)setIsMergeCandidate:(BOOL)a3;
- (void)setIsVerified:(BOOL)a3;
- (void)setPresentationStatus:(unint64_t)a3;
@end

@implementation PXPeopleBootstrapCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_unselectedCheckmarkView, 0);
  objc_storeStrong((id *)&self->_selectedCheckmarkView, 0);
  objc_storeStrong((id *)&self->_imageRequest, 0);
}

- (CGSize)checkmarkImageSize
{
  double width = self->_checkmarkImageSize.width;
  double height = self->_checkmarkImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)badgeView
{
  return self->_badgeView;
}

- (UIView)unselectedCheckmarkView
{
  return self->_unselectedCheckmarkView;
}

- (UIView)selectedCheckmarkView
{
  return self->_selectedCheckmarkView;
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (BOOL)isMergeCandidate
{
  return self->_isMergeCandidate;
}

- (void)setImageRequest:(id)a3
{
}

- (PXPersonImageRequest)imageRequest
{
  return self->_imageRequest;
}

- (unint64_t)presentationStatus
{
  return self->_presentationStatus;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (void)_updateCellSizing
{
  v3 = [(PXPeopleBootstrapCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  CGFloat v54 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v53 = [(PXPeopleBootstrapCollectionViewCell *)self imageView];
  objc_msgSend(v53, "setFrame:", v5, v7, v9, v11);
  CGFloat v12 = *MEMORY[0x1E4F1DB28];
  CGFloat v51 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v13 = [(PXPeopleBootstrapCollectionViewCell *)self badgeView];
  v14 = [v13 image];
  [v14 size];
  CGFloat v16 = v15;
  double v50 = v17;
  v18 = +[PXPeopleUISettings sharedInstance];
  int v19 = [v18 displayBootstrapSuggestionType];

  v20 = [(PXPeopleBootstrapCollectionViewCell *)self traitCollection];
  [v20 displayScale];
  double v22 = v21;

  v57.origin.x = v5;
  v57.origin.y = v7;
  v57.size.double width = v9;
  v57.size.double height = v11;
  double v23 = CGRectGetMaxY(v57) - self->_checkmarkImageSize.height + -5.0;
  v58.origin.x = v5;
  CGFloat v55 = v7;
  v58.origin.y = v7;
  v58.size.double width = v9;
  v58.size.double height = v11;
  double MaxY = CGRectGetMaxY(v58);
  CGFloat v49 = v12;
  v59.origin.x = v12;
  v59.size.double width = v16;
  v59.origin.y = v51;
  v59.size.double height = v50;
  double Height = CGRectGetHeight(v59);
  +[PXPeopleFaceCropManager roundedCornerRadiusForTargetSize:displayScale:](PXPeopleFaceCropManager, "roundedCornerRadiusForTargetSize:displayScale:", v9, v11, v22);
  double v26 = v25;
  v27 = [(PXPeopleBootstrapCollectionViewCell *)self layer];
  [v27 setCornerRadius:v26];

  BOOL v28 = [(PXPeopleBootstrapCollectionViewCell *)self _isRTL];
  double v29 = 5.0;
  if (!v28)
  {
    v60.origin.x = v54;
    v60.origin.y = v55;
    v60.size.double width = v9;
    v60.size.double height = v11;
    double v29 = CGRectGetMaxX(v60) - self->_checkmarkImageSize.width + -5.0;
  }
  double v30 = MaxY + -5.0;
  [(PXPeopleBootstrapCollectionViewCell *)self checkmarkImageSize];
  double v32 = v31;
  double v34 = v33;
  v35 = [(PXPeopleBootstrapCollectionViewCell *)self selectedCheckmarkView];
  objc_msgSend(v35, "setFrame:", v29, v23, v32, v34);

  v36 = [(PXPeopleBootstrapCollectionViewCell *)self unselectedCheckmarkView];
  objc_msgSend(v36, "setFrame:", v29, v23, v32, v34);

  if (v19)
  {
    if ([(PXPeopleBootstrapCollectionViewCell *)self isMergeCandidate]
      && [(PXPeopleBootstrapCollectionViewCell *)self isVerified])
    {
      v37 = [MEMORY[0x1E4FB1618] blueColor];
    }
    else
    {
      if ([(PXPeopleBootstrapCollectionViewCell *)self isMergeCandidate]) {
        [MEMORY[0x1E4FB1618] orangeColor];
      }
      else {
      v37 = [MEMORY[0x1E4FB1618] greenColor];
      }
    }
    id v38 = v37;
    uint64_t v39 = [v38 CGColor];

    v40 = [(PXPeopleBootstrapCollectionViewCell *)self layer];
    [v40 setBorderColor:v39];

    v41 = [(PXPeopleBootstrapCollectionViewCell *)self layer];
    [v41 setBorderWidth:2.0];
  }
  CGFloat v42 = v54;
  CGFloat v43 = v55;
  double v44 = v9;
  double v45 = v11;
  if (v28)
  {
    double v46 = CGRectGetMinX(*(CGRect *)&v42) + 5.0;
    double v47 = v16;
  }
  else
  {
    CGFloat v48 = CGRectGetMaxX(*(CGRect *)&v42) + -5.0;
    v61.origin.x = v49;
    double v47 = v16;
    v61.origin.y = v30 - Height;
    v61.size.double width = v16;
    v61.size.double height = v50;
    double v46 = v48 - CGRectGetWidth(v61);
  }
  objc_msgSend(v13, "setFrame:", v46, v30 - Height, v47, v50);
}

- (BOOL)_isRTL
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == 1;

  return v3;
}

- (void)setConfirmed:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = !a3;
  double v6 = [(PXPeopleBootstrapCollectionViewCell *)self selectedCheckmarkView];
  [v6 setHidden:v5];

  id v7 = [(PXPeopleBootstrapCollectionViewCell *)self unselectedCheckmarkView];
  [v7 setHidden:v3];
}

- (void)setIsVerified:(BOOL)a3
{
  if (self->_isVerified != a3)
  {
    self->_isVerified = a3;
    [(PXPeopleBootstrapCollectionViewCell *)self _updateCellSizing];
  }
}

- (void)setIsMergeCandidate:(BOOL)a3
{
  if (self->_isMergeCandidate != a3)
  {
    self->_isMergeCandidate = a3;
    [(PXPeopleBootstrapCollectionViewCell *)self _updateCellSizing];
  }
}

- (void)setPresentationStatus:(unint64_t)a3
{
  if (self->_presentationStatus != a3)
  {
    self->_presentationStatus = a3;
    BOOL v5 = [(PXPeopleBootstrapCollectionViewCell *)self badgeView];
    id v14 = v5;
    if (a3 == 3)
    {
      id v7 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
      double v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.circle.fill"];
      double v9 = [v8 imageWithSymbolConfiguration:v7];

      double v10 = [MEMORY[0x1E4FB1618] systemGray2Color];
      [v14 setTintColor:v10];

      [v14 setImage:v9];
      [v14 setHidden:0];
      [(PXPeopleBootstrapCollectionViewCell *)self _updateCellSizing];
    }
    else if (a3 == 1)
    {
      double v6 = +[PXPeopleBootstrapCollectionViewCell cloudBadgeImage];
      [v14 setImage:v6];

      [v14 setHidden:0];
      [(PXPeopleBootstrapCollectionViewCell *)self _updateCellSizing];
    }
    else
    {
      [v5 setHidden:1];
    }
    uint64_t v11 = [v14 isHidden] ^ 1;
    CGFloat v12 = [(PXPeopleBootstrapCollectionViewCell *)self selectedCheckmarkView];
    [v12 setHidden:v11];

    v13 = [(PXPeopleBootstrapCollectionViewCell *)self unselectedCheckmarkView];
    [v13 setHidden:v11];
  }
}

- (UIImage)image
{
  v2 = [(PXPeopleBootstrapCollectionViewCell *)self imageView];
  BOOL v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3 contentsRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (a3) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 3;
  }
  id v10 = a3;
  id v12 = [(PXPeopleBootstrapCollectionViewCell *)self imageView];
  [v12 setImage:v10];

  uint64_t v11 = [v12 layer];
  objc_msgSend(v11, "setContentsRect:", x, y, width, height);

  [(PXPeopleBootstrapCollectionViewCell *)self setPresentationStatus:v9];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapCollectionViewCell;
  [(PXPeopleBootstrapCollectionViewCell *)&v4 prepareForReuse];
  [(PXPeopleBootstrapCollectionViewCell *)self setImageRequest:0];
  [(PXPeopleBootstrapCollectionViewCell *)self setIsMergeCandidate:0];
  [(PXPeopleBootstrapCollectionViewCell *)self setIsVerified:0];
  BOOL v3 = [(PXPeopleBootstrapCollectionViewCell *)self imageView];
  [v3 setImage:0];

  [(PXPeopleBootstrapCollectionViewCell *)self setPresentationStatus:0];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapCollectionViewCell;
  -[PXPeopleBootstrapCollectionViewCell setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PXPeopleBootstrapCollectionViewCell *)self _updateCellSizing];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleBootstrapCollectionViewCell;
  [(PXPeopleBootstrapCollectionViewCell *)&v3 layoutSubviews];
  [(PXPeopleBootstrapCollectionViewCell *)self _updateCellSizing];
}

- (PXPeopleBootstrapCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v32.receiver = self;
  v32.super_class = (Class)PXPeopleBootstrapCollectionViewCell;
  BOOL v5 = -[PXPeopleBootstrapCollectionViewCell initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  double v6 = v5;
  if (v5)
  {
    id v7 = [(PXPeopleBootstrapCollectionViewCell *)v5 contentView];
    v6->_presentationStatus = 0;
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", 0.0, 0.0, width, height);
    imageView = v6->_imageView;
    v6->_imageView = (UIImageView *)v8;

    [(UIImageView *)v6->_imageView setContentMode:1];
    [(UIImageView *)v6->_imageView setAccessibilityIgnoresInvertColors:1];
    id v10 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    [(UIImageView *)v6->_imageView setBackgroundColor:v10];

    [v7 addSubview:v6->_imageView];
    uint64_t v11 = (void *)MEMORY[0x1E4FB1EB0];
    id v12 = [MEMORY[0x1E4FB1618] systemBlueColor];
    uint64_t v13 = objc_msgSend(v11, "px_circularGlyphViewWithName:backgroundColor:", @"checkmark.circle", v12);
    selectedCheckmarkView = v6->_selectedCheckmarkView;
    v6->_selectedCheckmarkView = (UIView *)v13;

    [(UIView *)v6->_selectedCheckmarkView setHidden:1];
    [(UIView *)v6->_selectedCheckmarkView setUserInteractionEnabled:0];
    [(UIView *)v6->_selectedCheckmarkView setAccessibilityIgnoresInvertColors:1];
    double v15 = (void *)MEMORY[0x1E4FB1EB0];
    CGFloat v16 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v17 = objc_msgSend(v15, "px_circularGlyphViewWithName:backgroundColor:", @"circle", v16);
    unselectedCheckmarkView = v6->_unselectedCheckmarkView;
    v6->_unselectedCheckmarkView = (UIView *)v17;

    [(UIView *)v6->_unselectedCheckmarkView setHidden:1];
    [(UIView *)v6->_unselectedCheckmarkView setUserInteractionEnabled:0];
    [(UIView *)v6->_unselectedCheckmarkView setAccessibilityIgnoresInvertColors:1];
    [(UIView *)v6->_selectedCheckmarkView frame];
    p_double width = &v6->_checkmarkImageSize.width;
    v6->_checkmarkImageSize.double width = v20;
    v6->_checkmarkImageSize.double height = v21;
    [v7 addSubview:v6->_selectedCheckmarkView];
    [v7 addSubview:v6->_unselectedCheckmarkView];
    double v22 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    badgeView = v6->_badgeView;
    v6->_badgeView = v22;

    v24 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
    [(UIImageView *)v6->_badgeView setSymbolConfiguration:v24];

    double v25 = +[PXPeopleBootstrapCollectionViewCell cloudBadgeImage];
    [(UIImageView *)v6->_badgeView setImage:v25];

    [v7 addSubview:v6->_badgeView];
    [(UIImageView *)v6->_badgeView setHidden:1];
    [(UIImageView *)v6->_badgeView setUserInteractionEnabled:0];
    [(UIImageView *)v6->_badgeView setAccessibilityIgnoresInvertColors:1];
    [(PXPeopleBootstrapCollectionViewCell *)v6 setClipsToBounds:1];
    v33.origin.double x = 0.0;
    v33.origin.double y = 0.0;
    v33.size.double width = width;
    v33.size.double height = height;
    double v26 = CGRectGetMaxY(v33) - v6->_checkmarkImageSize.height + -5.0;
    if ([(PXPeopleBootstrapCollectionViewCell *)v6 _isRTL])
    {
      double v27 = *p_width;
      double v28 = 5.0;
    }
    else
    {
      v34.origin.double x = 0.0;
      v34.origin.double y = 0.0;
      v34.size.double width = width;
      v34.size.double height = height;
      CGFloat MaxX = CGRectGetMaxX(v34);
      double v27 = *p_width;
      double v28 = MaxX - *p_width + -5.0;
    }
    double v30 = v6->_checkmarkImageSize.height;
    -[UIView setFrame:](v6->_selectedCheckmarkView, "setFrame:", v28, v26, v27, v30);
    -[UIView setFrame:](v6->_unselectedCheckmarkView, "setFrame:", v28, v26, v27, v30);
  }
  return v6;
}

+ (id)cloudBadgeImage
{
  if (cloudBadgeImage_onceToken_296066 != -1) {
    dispatch_once(&cloudBadgeImage_onceToken_296066, &__block_literal_global_296067);
  }
  v2 = (void *)cloudBadgeImage_image_296068;
  return v2;
}

void __54__PXPeopleBootstrapCollectionViewCell_cloudBadgeImage__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4FB1818], "px_systemImageNamed:", @"icloud.fill");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v1 = objc_msgSend(v3, "px_tintedImageWithColor:", v0);
  v2 = (void *)cloudBadgeImage_image_296068;
  cloudBadgeImage_image_296068 = v1;
}

@end
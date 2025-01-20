@interface PXPeopleRecoCollectionViewCell
- (BOOL)hasImageSet;
- (PXPeopleRecoCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImageView)checkView;
- (UIImageView)faceView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setImage:(id)a3 contentsRect:(CGRect)a4;
- (void)setIsRejected:(BOOL)a3;
@end

@implementation PXPeopleRecoCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkView, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
}

- (UIImageView)checkView
{
  return self->_checkView;
}

- (UIImageView)faceView
{
  return self->_faceView;
}

- (BOOL)hasImageSet
{
  v2 = [(PXPeopleRecoCollectionViewCell *)self faceView];
  v3 = [v2 image];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setImage:(id)a3 contentsRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  id v11 = [(PXPeopleRecoCollectionViewCell *)self faceView];
  v10 = [v11 layer];
  objc_msgSend(v10, "setContentsRect:", x, y, width, height);

  [v11 setImage:v9];
}

- (void)setIsRejected:(BOOL)a3
{
  if (a3)
  {
    id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle"];
    v5 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
    objc_msgSend(v4, "px_tintedCircularImageWithColor:backgroundColor:", v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = [(PXPeopleRecoCollectionViewCell *)self checkView];
  [v7 setHidden:0];
  [v7 setImage:v8];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleRecoCollectionViewCell;
  [(PXPeopleRecoCollectionViewCell *)&v12 layoutSubviews];
  [(PXPeopleRecoCollectionViewCell *)self frame];
  double v4 = v3;
  double v6 = v5;
  v7 = [(PXPeopleRecoCollectionViewCell *)self traitCollection];
  [v7 displayScale];
  +[PXPeopleFaceCropManager roundedCornerRadiusForTargetSize:displayScale:](PXPeopleFaceCropManager, "roundedCornerRadiusForTargetSize:displayScale:", v4, v6, v8);
  double v10 = v9;
  id v11 = [(PXPeopleRecoCollectionViewCell *)self layer];
  [v11 setCornerRadius:v10];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleRecoCollectionViewCell;
  [(PXPeopleRecoCollectionViewCell *)&v5 prepareForReuse];
  double v3 = [(PXPeopleRecoCollectionViewCell *)self checkView];
  [v3 setHidden:1];

  double v4 = [(PXPeopleRecoCollectionViewCell *)self faceView];
  [v4 setImage:0];
}

- (PXPeopleRecoCollectionViewCell)initWithFrame:(CGRect)a3
{
  v41[8] = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)PXPeopleRecoCollectionViewCell;
  double v3 = -[PXPeopleRecoCollectionViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PXPeopleRecoCollectionViewCell *)v3 setClipsToBounds:1];
    objc_super v5 = [MEMORY[0x1E4FB1618] systemGray4Color];
    [(PXPeopleRecoCollectionViewCell *)v4 setBackgroundColor:v5];

    double v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    [(UIImageView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXPeopleRecoCollectionViewCell *)v4 addSubview:v6];
    faceView = v4->_faceView;
    v4->_faceView = v6;
    double v8 = v6;

    double v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    double v10 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIImageView *)v9 setTintColor:v10];

    [(UIImageView *)v9 setHidden:1];
    [(UIImageView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXPeopleRecoCollectionViewCell *)v4 addSubview:v9];
    checkView = v4->_checkView;
    v4->_checkView = v9;
    objc_super v12 = v9;

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v39 = [(UIImageView *)v8 leadingAnchor];
    v38 = [(PXPeopleRecoCollectionViewCell *)v4 leadingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v41[0] = v37;
    v36 = [(UIImageView *)v8 trailingAnchor];
    v35 = [(PXPeopleRecoCollectionViewCell *)v4 trailingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v41[1] = v34;
    v24 = v8;
    v33 = [(UIImageView *)v8 topAnchor];
    v32 = [(PXPeopleRecoCollectionViewCell *)v4 topAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v41[2] = v31;
    v30 = [(UIImageView *)v8 bottomAnchor];
    v29 = [(PXPeopleRecoCollectionViewCell *)v4 bottomAnchor];
    v27 = [v30 constraintEqualToAnchor:v29];
    v41[3] = v27;
    v26 = [(UIImageView *)v12 heightAnchor];
    v25 = [v26 constraintEqualToConstant:22.0];
    v41[4] = v25;
    v23 = [(UIImageView *)v12 heightAnchor];
    v22 = [(UIImageView *)v12 widthAnchor];
    v13 = [v23 constraintEqualToAnchor:v22];
    v41[5] = v13;
    v14 = [(UIImageView *)v12 trailingAnchor];
    v15 = [(PXPeopleRecoCollectionViewCell *)v4 trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:-7.0];
    v41[6] = v16;
    v17 = [(UIImageView *)v12 bottomAnchor];
    v18 = [(PXPeopleRecoCollectionViewCell *)v4 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:-7.0];
    v41[7] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:8];
    [v28 activateConstraints:v20];
  }
  return v4;
}

@end
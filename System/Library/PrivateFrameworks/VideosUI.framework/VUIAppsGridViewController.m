@interface VUIAppsGridViewController
- (CGSize)iconSize;
- (Class)_collectionViewClass;
- (NSArray)apps;
- (VUIAppsGridViewController)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)layoutSubviews;
- (void)setApps:(id)a3;
- (void)setIconSize:(CGSize)a3;
- (void)setTitle:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation VUIAppsGridViewController

- (VUIAppsGridViewController)init
{
  v23.receiver = self;
  v23.super_class = (Class)VUIAppsGridViewController;
  v2 = [(VUIAppsGridViewController *)&v23 init];
  v3 = v2;
  if (v2)
  {
    v2->_iconSize = (CGSize)vdupq_n_s64(0x404E000000000000uLL);
    v4 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E4FB15C0]);
    layout = v3->_layout;
    v3->_layout = v4;

    [(UICollectionViewFlowLayout *)v3->_layout setScrollDirection:0];
    id v6 = objc_alloc([(VUIAppsGridViewController *)v3 _collectionViewClass]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v3->_layout, *MEMORY[0x1E4F1DB28], v8, v9, v10);
    collectionView = v3->_collectionView;
    v3->_collectionView = (UICollectionView *)v11;

    [(UICollectionView *)v3->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UICollectionView *)v3->_collectionView setDataSource:v3];
    [(UICollectionView *)v3->_collectionView setDelegate:v3];
    [(UICollectionView *)v3->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"cell"];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v13;

    v15 = [(VUIAppsGridViewController *)v3 view];
    [v15 addSubview:v3->_collectionView];

    v16 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v17 = [v16 userInterfaceIdiom];

    if (v17 == 2)
    {
      v18 = [(VUIAppsGridViewController *)v3 view];
      [v18 addSubview:v3->_titleLabel];

      int64x2_t v19 = (int64x2_t)xmmword_1E38FD8F0;
    }
    else
    {
      v20 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v21 = [v20 userInterfaceIdiom];

      if (v21 != 6)
      {
LABEL_7:
        [(VUIAppsGridViewController *)v3 layoutSubviews];
        return v3;
      }
      int64x2_t v19 = vdupq_n_s64(0x4054000000000000uLL);
    }
    v3->_iconSize = (CGSize)v19;
    goto LABEL_7;
  }
  return v3;
}

- (void)setApps:(id)a3
{
  if (self->_apps != a3)
  {
    v4 = (NSArray *)[a3 copy];
    apps = self->_apps;
    self->_apps = v4;

    collectionView = self->_collectionView;
    [(UICollectionView *)collectionView reloadData];
  }
}

- (void)setIconSize:(CGSize)a3
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  self->_iconSize = a3;
  if (a3.width != width || a3.height != height)
  {
    [(VUIAppsGridViewController *)self layoutSubviews];
    collectionView = self->_collectionView;
    [(UICollectionView *)collectionView reloadData];
  }
}

- (void)layoutSubviews
{
  p_iconSize = &self->_iconSize;
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  id v64 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
  +[VUIAppCell contentInsets];
  double v8 = v6 + v7;
  double v11 = v10 + v9;
  v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if (v13 == 6 || v13 == 0)
  {
    v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 nativeBounds];
    double v17 = v16 * 0.19;

    v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v18 scale];
    double v20 = v17 / v19;

    if (v13 == 6) {
      double v21 = 10.0;
    }
    else {
      double v21 = 20.0;
    }
    double width = v8 + p_iconSize->width;
    double v22 = v11 + p_iconSize->height + 16.0;
    double v23 = 27.0;
    double v24 = 12.0;
    double v25 = 74.0;
    double v26 = 27.0;
  }
  else
  {
    v27 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v28 = [v27 userInterfaceIdiom];

    if (v28 == 2)
    {
      double width = v8 + p_iconSize->width;
      double v22 = v11 + p_iconSize->height + 33.0;
      uint64_t v29 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];

      double v21 = 0.0;
      double v20 = 124.0;
      double v25 = 68.0;
      double v26 = 83.0;
      double v23 = 58.0;
      double v24 = 50.0;
      id v64 = (id)v29;
    }
    else
    {
      double v21 = 20.0;
      double v22 = height + 20.0;
      double v20 = 108.0;
      double v26 = 74.0;
      double v23 = 50.0;
      double v24 = 35.0;
      double v25 = 74.0;
    }
  }
  -[UICollectionViewFlowLayout setItemSize:](self->_layout, "setItemSize:", width, v22);
  [(UICollectionViewFlowLayout *)self->_layout setMinimumInteritemSpacing:v23];
  [(UICollectionViewFlowLayout *)self->_layout setMinimumLineSpacing:v24];
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v21, v26, v26, v26);
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setFont:v64];
  titleLabel = self->_titleLabel;
  v31 = +[VUILocalizationManager sharedInstance];
  v32 = [v31 localizedStringForKey:@"ACCESS_SEE_ALL_TITLE"];
  [(UILabel *)titleLabel setText:v32];

  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setMinimumScaleFactor:0.8];
  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  v33 = [(VUIAppsGridViewController *)self view];
  v34 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v35 = [v34 userInterfaceIdiom];

  if (v35 == 2)
  {
    v36 = self->_titleLabel;
    v37 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v36 setTextColor:v37];

    [(UICollectionView *)self->_collectionView setBackgroundColor:0];
    [v33 setBackgroundColor:0];
  }
  else
  {
    collectionView = self->_collectionView;
    v39 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [(UICollectionView *)collectionView setBackgroundColor:v39];

    v40 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [v33 setBackgroundColor:v40];
  }
  v41 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v42 = [v41 userInterfaceIdiom];

  if (v42 == 2)
  {
    v43 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
    v44 = [v33 topAnchor];
    v45 = [v43 constraintEqualToAnchor:v44 constant:v20];
    [v45 setActive:1];

    v46 = [(UILabel *)self->_titleLabel centerXAnchor];
    v47 = [v33 centerXAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    [v48 setActive:1];

    v49 = [(UICollectionView *)self->_collectionView topAnchor];
    v50 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
    v51 = [v49 constraintEqualToAnchor:v50 constant:v25];
    [v51 setActive:1];
  }
  else
  {
    v52 = [(UICollectionView *)self->_collectionView topAnchor];
    v53 = [v33 topAnchor];
    v54 = [v52 constraintEqualToAnchor:v53 constant:20.0];
    [v54 setActive:1];

    v49 = [(VUIAppsGridViewController *)self navigationItem];
    v50 = +[VUILocalizationManager sharedInstance];
    v51 = [v50 localizedStringForKey:@"ACCESS_SEE_ALL_TITLE"];
    [v49 setTitle:v51];
  }

  v55 = [(UICollectionView *)self->_collectionView bottomAnchor];
  v56 = [v33 bottomAnchor];
  v57 = [v55 constraintEqualToAnchor:v56 constant:0.0];
  [v57 setActive:1];

  v58 = [(UICollectionView *)self->_collectionView leadingAnchor];
  v59 = [v33 leadingAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  [v60 setActive:1];

  v61 = [(UICollectionView *)self->_collectionView trailingAnchor];
  v62 = [v33 trailingAnchor];
  v63 = [v61 constraintEqualToAnchor:v62];
  [v63 setActive:1];
}

- (Class)_collectionViewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIAppsGridViewController;
  [(VUIAppsGridViewController *)&v4 viewDidAppear:a3];
  [(UICollectionView *)self->_collectionView flashScrollIndicators];
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUIAppsGridViewController;
  id v4 = a3;
  [(VUIAppsGridViewController *)&v5 setTitle:v4];
  -[UILabel setText:](self->_titleLabel, "setText:", v4, v5.receiver, v5.super_class);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return [(NSArray *)self->_apps count];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = -[NSArray objectAtIndexedSubscript:](self->_apps, "objectAtIndexedSubscript:", [v6 row]);
  double v9 = [v7 dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:v6];

  objc_msgSend(v9, "setIconSize:", self->_iconSize.width, self->_iconSize.height);
  double v10 = [v8 objectForKeyedSubscript:@"appIcon"];
  [v10 size];
  double v11 = objc_msgSend(v10, "vui_iconImageOfSize:");

  [v9 setImage:v11];
  v12 = [v8 objectForKeyedSubscript:@"appName"];
  [v9 setTitle:v12];

  return v9;
}

- (NSArray)apps
{
  return self->_apps;
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
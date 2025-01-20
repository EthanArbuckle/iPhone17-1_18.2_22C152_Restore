@interface SUIKSearchResultCollectionViewSectionHeader
- (SUIKSearchResultCollectionViewSectionHeader)init;
- (SUIKSearchResultCollectionViewSectionHeader)initWithCoder:(id)a3;
- (SUIKSearchResultCollectionViewSectionHeader)initWithFrame:(CGRect)a3;
- (UIImageView)categoryImageView;
- (void)_commonInit;
- (void)applyLayoutAttributes:(id)a3;
- (void)prepareForReuse;
- (void)setCategoryImage:(id)a3;
- (void)setCategoryImageView:(id)a3;
@end

@implementation SUIKSearchResultCollectionViewSectionHeader

- (SUIKSearchResultCollectionViewSectionHeader)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUIKSearchResultCollectionViewSectionHeader;
  v2 = [(SUIKSearchResultCollectionViewSectionHeader *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SUIKSearchResultCollectionViewSectionHeader *)v2 _commonInit];
  }
  return v3;
}

- (SUIKSearchResultCollectionViewSectionHeader)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUIKSearchResultCollectionViewSectionHeader;
  v3 = -[SUIKSearchResultCollectionViewSectionHeader initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SUIKSearchResultCollectionViewSectionHeader *)v3 _commonInit];
  }
  return v4;
}

- (SUIKSearchResultCollectionViewSectionHeader)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUIKSearchResultCollectionViewSectionHeader;
  v3 = [(SUIKSearchResultCollectionViewSectionHeader *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(SUIKSearchResultCollectionViewSectionHeader *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  if (_commonInit_onceToken != -1) {
    dispatch_once(&_commonInit_onceToken, &__block_literal_global_29);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SUIKSearchResultCollectionViewSectionHeader *)self setCategoryImageView:v4];

  objc_super v5 = [(SUIKSearchResultCollectionViewSectionHeader *)self categoryImageView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v6 = [(SUIKSearchResultCollectionViewSectionHeader *)self categoryImageView];
  [(SUIKSearchResultCollectionViewSectionHeader *)self addSubview:v6];

  id v31 = [MEMORY[0x1E4F1CA48] array];
  v7 = [(SUIKSearchResultCollectionViewSectionHeader *)self categoryImageView];
  v8 = [v7 leadingAnchor];
  v9 = [(SUIKSearchResultCollectionViewSectionHeader *)self leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v31 addObject:v10];

  v11 = [(SUIKSearchResultCollectionViewSectionHeader *)self categoryImageView];
  v12 = [v11 trailingAnchor];
  v13 = [(SUIKSearchResultCollectionViewSectionHeader *)self trailingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [v31 addObject:v14];

  v15 = [(SUIKSearchResultCollectionViewSectionHeader *)self categoryImageView];
  v16 = [v15 topAnchor];
  v17 = [(SUIKSearchResultCollectionViewSectionHeader *)self topAnchor];
  v18 = [v16 constraintEqualToSystemSpacingBelowAnchor:v17 multiplier:1.0];
  [v31 addObject:v18];

  v19 = [(SUIKSearchResultCollectionViewSectionHeader *)self bottomAnchor];
  v20 = [(SUIKSearchResultCollectionViewSectionHeader *)self categoryImageView];
  v21 = [v20 bottomAnchor];
  v22 = [v19 constraintEqualToSystemSpacingBelowAnchor:v21 multiplier:1.0];
  [v31 addObject:v22];

  v23 = [v31 lastObject];
  LODWORD(v24) = 1148829696;
  [v23 setPriority:v24];

  v25 = [(SUIKSearchResultCollectionViewSectionHeader *)self categoryImageView];
  v26 = [v25 heightAnchor];
  v27 = [v26 constraintEqualToConstant:*(double *)&_commonInit_iconSize_1];
  [v31 addObject:v27];

  v28 = [(SUIKSearchResultCollectionViewSectionHeader *)self categoryImageView];
  v29 = [v28 widthAnchor];
  v30 = [v29 constraintEqualToConstant:*(double *)&_commonInit_iconSize_0];
  [v31 addObject:v30];

  [MEMORY[0x1E4F28DC8] activateConstraints:v31];
}

uint64_t __58__SUIKSearchResultCollectionViewSectionHeader__commonInit__block_invoke()
{
  v0 = PSBlankIconImage();
  [v0 size];
  _commonInit_iconSize_0 = v1;
  _commonInit_iconSize_1 = v2;

  uint64_t v3 = [MEMORY[0x1E4F42B58] subtitleCellConfiguration];
  uint64_t v4 = _commonInit_cellConfig;
  _commonInit_cellConfig = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SUIKSearchResultCollectionViewSectionHeader;
  [(SUIKSearchResultCollectionViewSectionHeader *)&v4 prepareForReuse];
  uint64_t v3 = [(SUIKSearchResultCollectionViewSectionHeader *)self categoryImageView];
  [v3 setImage:0];
}

- (void)setCategoryImage:(id)a3
{
  id v4 = a3;
  id v5 = [(SUIKSearchResultCollectionViewSectionHeader *)self categoryImageView];
  [v5 setImage:v4];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUIKSearchResultCollectionViewSectionHeader;
  [(SUIKSearchResultCollectionViewSectionHeader *)&v7 applyLayoutAttributes:v4];
  if (_os_feature_enabled_impl())
  {
    double v5 = (double)[v4 zIndex];
    objc_super v6 = [(SUIKSearchResultCollectionViewSectionHeader *)self layer];
    [v6 setZPosition:v5];
  }
}

- (UIImageView)categoryImageView
{
  return self->_categoryImageView;
}

- (void)setCategoryImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
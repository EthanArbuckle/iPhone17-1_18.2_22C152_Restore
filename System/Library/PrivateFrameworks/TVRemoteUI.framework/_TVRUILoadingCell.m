@interface _TVRUILoadingCell
- (UIActivityIndicatorView)activityIndicatorView;
- (_TVRUILoadingCell)initWithFrame:(CGRect)a3;
- (void)animate;
- (void)configureHierarchy;
@end

@implementation _TVRUILoadingCell

- (_TVRUILoadingCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVRUILoadingCell;
  v3 = -[_TVRUILoadingCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVRUILoadingCell *)v3 configureHierarchy];
  }
  return v4;
}

- (void)configureHierarchy
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v3 = [(_TVRUILoadingCell *)self contentView];
  id v4 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v5 = objc_alloc_init(MEMORY[0x263F828E0]);
  objc_super v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v5 setFont:v6];

  v7 = [MEMORY[0x263F825C8] lightTextColor];
  [v5 setTextColor:v7];

  [v5 setAdjustsFontForContentSizeCategory:1];
  v48 = self;
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"TVRUILoading" value:&stru_26DB4CAE0 table:@"Localizable"];
  [v5 setText:v9];

  v10 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v3 addSubview:v4];
  [v4 addSubview:v5];
  [v4 addSubview:v10];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v54[0] = v4;
  v54[1] = v5;
  v54[2] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:3];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v50;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v49 + 1) + 8 * v15++) setTranslatesAutoresizingMaskIntoConstraints:0];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v13);
  }

  v36 = (void *)MEMORY[0x263F08938];
  v47 = [v5 leadingAnchor];
  v46 = [v4 leadingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v53[0] = v45;
  v44 = [v5 centerYAnchor];
  v43 = [v4 centerYAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v53[1] = v42;
  v41 = [(UIActivityIndicatorView *)v10 leadingAnchor];
  v40 = [v5 trailingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40 constant:10.0];
  v53[2] = v39;
  v37 = [(UIActivityIndicatorView *)v10 centerYAnchor];
  v35 = [v4 centerYAnchor];
  v33 = [v37 constraintEqualToAnchor:v35];
  v53[3] = v33;
  v31 = [(UIActivityIndicatorView *)v10 trailingAnchor];
  v30 = [v4 trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v53[4] = v29;
  v28 = [v4 topAnchor];
  [v3 topAnchor];
  v16 = v38 = v10;
  v17 = [v28 constraintEqualToAnchor:v16];
  v53[5] = v17;
  v18 = [v4 bottomAnchor];
  v19 = [v3 bottomAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v53[6] = v20;
  uint64_t v21 = [v4 centerXAnchor];
  v22 = v3;
  v34 = v3;
  v23 = (void *)v21;
  [v22 centerXAnchor];
  v24 = v32 = v5;
  v25 = [v23 constraintEqualToAnchor:v24];
  v53[7] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:8];
  [v36 activateConstraints:v26];

  activityIndicatorView = v48->_activityIndicatorView;
  v48->_activityIndicatorView = v38;
}

- (void)animate
{
  id v2 = [(_TVRUILoadingCell *)self activityIndicatorView];
  [v2 startAnimating];
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void).cxx_destruct
{
}

@end
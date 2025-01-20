@interface RUIBarButtonItem
+ (id)tapToRadarButton;
- (NSString)itemType;
- (UIBarButtonItem)barButtonItem;
- (id)_createBarButtonItemWithTitle:(id)a3 style:(int64_t)a4;
- (id)_labelColor;
- (id)action;
- (void)_buttonPressed:(id)a3;
- (void)setAction:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)updateBackButtonColors;
@end

@implementation RUIBarButtonItem

+ (id)tapToRadarButton
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(RUIBarButtonItem);
  v5[0] = @"type";
  v5[1] = @"parentBar";
  v6[0] = @"tapToRadarBarItem";
  v6[1] = @"navigationBar";
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  [(RUIElement *)v2 setAttributes:v3];

  return v2;
}

- (void)_buttonPressed:(id)a3
{
  action = (void (**)(void))self->_action;
  if (action) {
    action[2]();
  }
}

- (UIBarButtonItem)barButtonItem
{
  barButtonItem = self->_barButtonItem;
  if (barButtonItem) {
    goto LABEL_39;
  }
  v4 = [(RUIElement *)self attributes];

  if (!v4)
  {
    v11 = 0;
    goto LABEL_40;
  }
  v5 = [(RUIElement *)self attributes];
  v6 = [v5 objectForKey:@"style"];

  double v81 = -1.0;
  v7 = [(RUIBarButtonItem *)self itemType];
  int v8 = [v7 isEqualToString:@"editBarItem"];

  if (v8)
  {
    v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:2 target:self action:sel__buttonPressed_];
    v10 = 0;
  }
  else
  {
    v12 = [(RUIBarButtonItem *)self itemType];
    int v13 = [v12 isEqualToString:@"nextBarItem"];

    if (v13)
    {
      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v14 localizedStringForKey:@"NEXT" value:&stru_26C545B50 table:@"Localizable"];
    }
    else
    {
      v14 = [(RUIElement *)self attributes];
      [v14 objectForKey:@"label"];
    v10 = };

    v9 = 0;
  }
  v15 = [(RUIBarButtonItem *)self itemType];
  char v16 = [v15 isEqualToString:@"closeButtonBarItem"];

  v17 = [(RUIElement *)self attributes];
  v18 = [v17 objectForKeyedSubscript:@"barButtonType"];
  [v18 isEqualToString:@"cancel"];

  if ((v16 & 1) == 0)
  {
    if (([v6 isEqualToString:@"blue"] & 1) != 0
      || [v6 isEqualToString:@"done"])
    {
      uint64_t v21 = 2;
    }
    else
    {
      uint64_t v21 = 0;
    }
    v22 = [(RUIBarButtonItem *)self itemType];
    int v23 = [v22 isEqualToString:@"titleBarItem"];

    if (v23)
    {
      id v19 = objc_alloc_init(MEMORY[0x263F82BF8]);
      [v19 setAxis:0];
      [v19 setAlignment:3];
      [v19 setDistribution:3];
      v24 = [(RUIElement *)self style];
      [v24 navBarLabelSpacingWithImage];
      double v26 = v25;

      if (v26 == 0.0)
      {
        [v19 setSpacing:8.0];
      }
      else
      {
        v27 = [(RUIElement *)self style];
        [v27 navBarLabelSpacingWithImage];
        objc_msgSend(v19, "setSpacing:");
      }
      id v51 = objc_alloc_init(MEMORY[0x263F828E0]);
      [v51 setText:v10];
      v52 = [(RUIElement *)self style];
      v53 = [v52 navBarButtonLabelFont];

      if (v53)
      {
        v54 = [(RUIElement *)self style];
        v55 = [v54 navBarButtonLabelFont];
        [v51 setFont:v55];
      }
      else
      {
        v54 = [MEMORY[0x263F81708] systemFontOfSize:19.0 weight:*MEMORY[0x263F81828]];
        [v51 setFont:v54];
      }

      v56 = [(RUIBarButtonItem *)self _labelColor];

      if (v56)
      {
        v57 = [(RUIBarButtonItem *)self _labelColor];
        [v51 setTextColor:v57];
      }
      v58 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      imageView = self->_imageView;
      self->_imageView = v58;

      v60 = [(RUIElement *)self attributes];
      v61 = [v60 objectForKey:@"imageWidth"];
      if (![v61 length])
      {
        [(RUIElement *)self attributes];
        v62 = v78 = v10;
        [v62 objectForKey:@"imageHeight"];
        v80 = v9;
        v64 = v63 = v6;
        uint64_t v76 = [v64 length];

        v6 = v63;
        v9 = v80;

        v10 = v78;
        if (v76) {
          goto LABEL_34;
        }
        [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
        v70 = [(UIImageView *)self->_imageView heightAnchor];
        v71 = [v70 constraintEqualToConstant:25.0];
        [v71 setActive:1];

        v9 = v80;
        v60 = [(UIImageView *)self->_imageView widthAnchor];
        v61 = [v60 constraintEqualToConstant:25.0];
        [v61 setActive:1];
      }

LABEL_34:
      if ([(RUIElement *)self loadImage]) {
        [v19 addArrangedSubview:self->_imageView];
      }
      [v19 addArrangedSubview:v51];
      v20 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v19];

      goto LABEL_37;
    }
    v79 = v9;
    v28 = [(RUIBarButtonItem *)self itemType];
    int v29 = [v28 isEqualToString:@"backButtonBarItem"];

    if (!v29)
    {
      v42 = v6;
      v43 = [(RUIBarButtonItem *)self itemType];
      int v44 = [v43 isEqualToString:@"tapToRadarBarItem"];

      if (v44)
      {
        v45 = [MEMORY[0x263F824E8] buttonWithType:0];
        v46 = [MEMORY[0x263F086E0] bundleWithPath:@"/AppleInternal/Library/Bundles/RemoteUIInternal.bundle"];
        v47 = [MEMORY[0x263F82818] configurationWithPointSize:25.0];
        v48 = [MEMORY[0x263F827E8] imageNamed:@"tap.to.radar.circle" inBundle:v46 withConfiguration:v47];
        v49 = [v48 imageWithRenderingMode:2];

        [v45 setTitle:@"Tap-To-Radar" forState:0];
        [v45 setImage:v49 forState:0];
        [v45 addTarget:self action:sel__buttonPressed_ forControlEvents:64];
        v50 = (void *)[objc_alloc(MEMORY[0x263F825C8]) initWithDynamicProvider:&__block_literal_global_11];
        [v45 setTintColor:v50];

        v20 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v45];
      }
      else if ([v10 length])
      {
        v20 = [(RUIBarButtonItem *)self _createBarButtonItemWithTitle:v10 style:v21];

        v67 = [(RUIBarButtonItem *)self _labelColor];

        if (v67)
        {
          v68 = [(RUIBarButtonItem *)self _labelColor];
          [(UIBarButtonItem *)v20 setTintColor:v68];
        }
      }
      else
      {
        v20 = v79;
      }
      v6 = v42;
      goto LABEL_38;
    }
    uint64_t v30 = [(RUIElement *)self URLAttributeForImageName:@"image" getScale:&v81];
    v31 = (UIButton *)objc_alloc_init(MEMORY[0x263F824E8]);
    backButton = self->_backButton;
    self->_backButton = v31;

    v33 = [MEMORY[0x263F82818] configurationWithPointSize:25.0];
    v34 = [(RUIElement *)self attributes];
    v35 = [v34 objectForKey:@"systemImage"];

    uint64_t v36 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.backward" withConfiguration:v33];
    v37 = (void *)v36;
    v75 = (void *)v30;
    v77 = v6;
    if (v35)
    {
      v38 = [MEMORY[0x263F82818] configurationWithPointSize:30.0];

      v39 = [MEMORY[0x263F827E8] systemImageNamed:v35 withConfiguration:v38];

      if (![v35 isEqualToString:@"backButton"])
      {
LABEL_53:
        v72 = [MEMORY[0x263F82438] sharedApplication];
        uint64_t v73 = [v72 userInterfaceLayoutDirection];

        if (v73 == 1) {
          id v74 = (id)[v39 imageFlippedForRightToLeftLayoutDirection];
        }
        [(UIButton *)self->_backButton setImage:v39 forState:0];
        [(UIButton *)self->_backButton addTarget:self action:sel__buttonPressed_ forControlEvents:64];
        v20 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:self->_backButton];

        v6 = v77;
        goto LABEL_38;
      }
      uint64_t v40 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.backward.circle.fill" withConfiguration:v38];

      [(RUIBarButtonItem *)self updateBackButtonColors];
      v41 = [(UIButton *)self->_backButton layer];
      [v41 setCornerRadius:30.0];
      v39 = (void *)v40;
    }
    else
    {
      if (!v30)
      {
        v38 = v33;
        v39 = (void *)v36;
        goto LABEL_53;
      }
      v41 = +[RUIImageLoader sharedImageLoader];
      uint64_t v69 = [v41 imageForURL:v30 loadIfAbsent:1];
      v39 = [MEMORY[0x263F827E8] imageWithCGImage:v69 scale:0 orientation:v81];

      v38 = v33;
    }

    goto LABEL_53;
  }
  id v19 = [MEMORY[0x263F824E8] buttonWithType:7];
  [v19 addTarget:self action:sel__buttonPressed_ forControlEvents:64];
  v20 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v19];

LABEL_37:
LABEL_38:
  [(UIBarButtonItem *)v20 setEnabled:[(RUIElement *)self enabled]];
  v65 = self->_barButtonItem;
  self->_barButtonItem = v20;

  barButtonItem = self->_barButtonItem;
LABEL_39:
  v11 = barButtonItem;
LABEL_40:
  return v11;
}

id __33__RUIBarButtonItem_barButtonItem__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    id v2 = objc_alloc(MEMORY[0x263F825C8]);
    double v3 = 0.51372549;
    double v4 = 0.184313725;
    double v5 = 0.631372549;
  }
  else
  {
    id v2 = objc_alloc(MEMORY[0x263F825C8]);
    double v3 = 0.705882353;
    double v4 = 0.254901961;
    double v5 = 0.866666667;
  }
  v6 = (void *)[v2 initWithDisplayP3Red:v3 green:v4 blue:v5 alpha:1.0];
  return v6;
}

- (id)_createBarButtonItemWithTitle:(id)a3 style:(int64_t)a4
{
  v6 = (objc_class *)MEMORY[0x263F824A8];
  id v7 = a3;
  int v8 = (void *)[[v6 alloc] initWithTitle:v7 style:a4 target:self action:sel__buttonPressed_];

  return v8;
}

- (id)_labelColor
{
  double v3 = [(RUIElement *)self attributes];
  double v4 = [v3 objectForKeyedSubscript:@"labelColor"];

  if (v4)
  {
    double v5 = (void *)MEMORY[0x263F825C8];
    v6 = [(RUIElement *)self attributes];
    id v7 = [v6 objectForKey:@"labelColor"];
    int v8 = objc_msgSend(v5, "_remoteUI_colorWithString:", v7);
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (NSString)itemType
{
  id v2 = [(RUIElement *)self attributes];
  double v3 = [v2 objectForKeyedSubscript:@"type"];

  return (NSString *)v3;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)RUIBarButtonItem;
  -[RUIElement setEnabled:](&v5, sel_setEnabled_);
  [(UIBarButtonItem *)self->_barButtonItem setEnabled:v3];
}

- (void)updateBackButtonColors
{
  BOOL v3 = [MEMORY[0x263F82DA0] _currentTraitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  backButton = self->_backButton;
  if (v4 == 2)
  {
    v6 = [MEMORY[0x263F825C8] systemDarkGrayColor];
    [(UIButton *)backButton setTintColor:v6];

    id v7 = self->_backButton;
    [MEMORY[0x263F825C8] systemExtraLightGrayColor];
  }
  else
  {
    int v8 = [MEMORY[0x263F825C8] systemExtraLightGrayColor];
    [(UIButton *)backButton setTintColor:v8];

    id v7 = self->_backButton;
    [MEMORY[0x263F825C8] systemGrayColor];
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](v7, "setBackgroundColor:");
}

- (void)setImage:(id)a3
{
}

- (void)setImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(UIImageView *)self->_imageView heightAnchor];
  id v7 = [v6 constraintEqualToConstant:height];
  [v7 setActive:1];

  id v9 = [(UIImageView *)self->_imageView widthAnchor];
  int v8 = [v9 constraintEqualToConstant:width];
  [v8 setActive:1];
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
}

@end
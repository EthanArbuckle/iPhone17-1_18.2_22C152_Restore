@interface PRXCardBottomTray
- (BOOL)containsContents;
- (NSArray)actionButtons;
- (NSArray)buttonConstraints;
- (NSArray)titleConstraints;
- (NSString)title;
- (PRXCardBottomTray)initWithFrame:(CGRect)a3;
- (PRXCardBottomTrayDelegate)delegate;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIView)activityIndicator;
- (void)setActionButtons:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setButtonConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation PRXCardBottomTray

- (PRXCardBottomTray)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PRXCardBottomTray;
  v3 = -[PRXCardBottomTray initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PRXCardBottomTray *)v3 setAccessibilityIdentifier:@"PRXCardBottomTray"];
  v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  titleLabel = v3->_titleLabel;
  v3->_titleLabel = v4;

  [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [(UILabel *)v3->_titleLabel setTextColor:v6];

  [(UILabel *)v3->_titleLabel setTextAlignment:1];
  v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D278]];
  [(UILabel *)v3->_titleLabel setFont:v7];

  [(UILabel *)v3->_titleLabel setNumberOfLines:0];
  [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)v3->_titleLabel setMaximumContentSizeCategory:*MEMORY[0x263F1D180]];
  [(PRXCardBottomTray *)v3 addSubview:v3->_titleLabel];
  return v3;
}

- (void)updateConstraints
{
  v2 = self;
  v80[4] = *MEMORY[0x263EF8340];
  v3 = [(PRXCardBottomTray *)self activityIndicator];

  v4 = [(PRXCardBottomTray *)v2 actionButtons];
  uint64_t v5 = [v4 count];

  v6 = [(PRXCardBottomTray *)v2 title];

  if (!v3)
  {
    v7 = [(PRXCardBottomTray *)v2 titleConstraints];

    v65 = v2;
    if (!v7 && v6)
    {
      v8 = [(PRXCardBottomTray *)v2 titleLabel];
      objc_super v9 = [v8 bottomAnchor];
      if (v5)
      {
        v10 = [(PRXCardBottomTray *)v2 actionButtons];
        v11 = [v10 firstObject];
        v12 = [v11 topAnchor];
        v55 = [v9 constraintEqualToAnchor:v12 constant:-8.0];
      }
      else
      {
        v10 = [(PRXCardBottomTray *)v2 layoutMarginsGuide];
        v11 = [v10 bottomAnchor];
        v55 = [v9 constraintLessThanOrEqualToAnchor:v11];
      }

      v70 = [(PRXCardBottomTray *)v2 titleLabel];
      v66 = [v70 leadingAnchor];
      v68 = [(PRXCardBottomTray *)v2 layoutMarginsGuide];
      v63 = [v68 leadingAnchor];
      v61 = [v66 constraintEqualToAnchor:v63];
      v80[0] = v61;
      id obja = [(PRXCardBottomTray *)v2 titleLabel];
      v57 = [obja trailingAnchor];
      v13 = [(PRXCardBottomTray *)v2 layoutMarginsGuide];
      v14 = [v13 trailingAnchor];
      v15 = [v57 constraintEqualToAnchor:v14];
      v80[1] = v15;
      v16 = [(PRXCardBottomTray *)v2 titleLabel];
      v17 = [v16 topAnchor];
      v18 = [(PRXCardBottomTray *)v2 topAnchor];
      v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18 constant:20.0];
      v80[2] = v19;
      v80[3] = v55;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:4];
      [(PRXCardBottomTray *)v65 setTitleConstraints:v20];

      v2 = v65;
      v21 = (void *)MEMORY[0x263F08938];
      v22 = [(PRXCardBottomTray *)v65 titleConstraints];
      [v21 activateConstraints:v22];
    }
    v23 = [(PRXCardBottomTray *)v2 buttonConstraints];

    if (!v23 && v5)
    {
      v24 = [(PRXCardBottomTray *)v2 actionButtons];
      v25 = [v24 firstObject];

      v26 = [MEMORY[0x263EFF980] array];
      if (!v6)
      {
        if ([v25 proximityButtonType]) {
          double v27 = 20.0;
        }
        else {
          double v27 = 0.0;
        }
        v28 = [v25 topAnchor];
        v29 = [(PRXCardBottomTray *)v2 topAnchor];
        v30 = [v28 constraintGreaterThanOrEqualToAnchor:v29 constant:v27];
        [v26 addObject:v30];
      }
      v31 = [(PRXCardBottomTray *)v2 actionButtons];
      v32 = [v31 lastObject];

      if (v25 == v32 && [v25 proximityButtonType])
      {
        v35 = [(PRXCardBottomTray *)v2 layoutMarginsGuide];
        uint64_t v33 = [v35 bottomAnchor];

        double v34 = 0.0;
      }
      else
      {
        uint64_t v33 = [(PRXCardBottomTray *)v2 bottomAnchor];
        double v34 = -10.0;
      }
      v56 = v32;
      v36 = [v32 bottomAnchor];
      v54 = (void *)v33;
      v37 = [v36 constraintLessThanOrEqualToAnchor:v33 constant:v34];
      v64 = v26;
      [v26 addObject:v37];

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id obj = [(PRXCardBottomTray *)v2 actionButtons];
      uint64_t v67 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
      v58 = v25;
      id v38 = 0;
      if (v67)
      {
        uint64_t v62 = *(void *)v75;
        do
        {
          uint64_t v39 = 0;
          id v40 = v38;
          do
          {
            v72 = v40;
            if (*(void *)v75 != v62) {
              objc_enumerationMutation(obj);
            }
            v41 = *(void **)(*((void *)&v74 + 1) + 8 * v39);
            v69 = [v41 leadingAnchor];
            v71 = [(PRXCardBottomTray *)v2 layoutMarginsGuide];
            v42 = [v71 leadingAnchor];
            v43 = [v69 constraintEqualToAnchor:v42];
            v78[0] = v43;
            v44 = [v41 trailingAnchor];
            v45 = [(PRXCardBottomTray *)v2 layoutMarginsGuide];
            v46 = [v45 trailingAnchor];
            v47 = [v44 constraintEqualToAnchor:v46];
            v78[1] = v47;
            v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:2];
            [v64 addObjectsFromArray:v48];

            if (v72)
            {
              v49 = [v41 topAnchor];
              v50 = [v72 bottomAnchor];
              v51 = [v49 constraintEqualToAnchor:v50 constant:4.0];
              [v64 addObject:v51];
            }
            id v38 = v41;

            ++v39;
            id v40 = v38;
            v2 = v65;
          }
          while (v67 != v39);
          uint64_t v67 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
        }
        while (v67);
      }

      [(PRXCardBottomTray *)v2 setButtonConstraints:v64];
      v52 = (void *)MEMORY[0x263F08938];
      v53 = [(PRXCardBottomTray *)v2 buttonConstraints];
      [v52 activateConstraints:v53];
    }
  }
  v73.receiver = v2;
  v73.super_class = (Class)PRXCardBottomTray;
  [(PRXCardBottomTray *)&v73 updateConstraints];
}

- (void)setActionButtons:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v4 = (NSArray *)a3;
  actionButtons = self->_actionButtons;
  if (actionButtons != v4 && ![(NSArray *)actionButtons isEqualToArray:v4])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v6 = self->_actionButtons;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v8);
    }

    v11 = (NSArray *)[(NSArray *)v4 copy];
    v12 = self->_actionButtons;
    self->_actionButtons = v11;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v13 = self->_actionButtons;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0, (void)v26);
          [(PRXCardBottomTray *)self addSubview:v18];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v15);
    }

    v19 = [(PRXCardBottomTray *)self titleConstraints];

    if (v19)
    {
      v20 = (void *)MEMORY[0x263F08938];
      v21 = [(PRXCardBottomTray *)self titleConstraints];
      [v20 deactivateConstraints:v21];

      [(PRXCardBottomTray *)self setTitleConstraints:0];
    }
    v22 = [(PRXCardBottomTray *)self buttonConstraints];

    if (v22)
    {
      v23 = (void *)MEMORY[0x263F08938];
      v24 = [(PRXCardBottomTray *)self buttonConstraints];
      [v23 deactivateConstraints:v24];

      [(PRXCardBottomTray *)self setButtonConstraints:0];
    }
    [(PRXCardBottomTray *)self setNeedsUpdateConstraints];
    v25 = [(PRXCardBottomTray *)self delegate];
    [v25 didChangeContentsOfBottomTray:self];
  }
}

- (void)setActivityIndicator:(id)a3
{
  v44[5] = *MEMORY[0x263EF8340];
  uint64_t v5 = (UIView *)a3;
  p_activityIndicator = (id *)&self->_activityIndicator;
  activityIndicator = self->_activityIndicator;
  if (activityIndicator != v5)
  {
    [(UIView *)activityIndicator removeFromSuperview];
    objc_storeStrong((id *)&self->_activityIndicator, a3);
    id v8 = *p_activityIndicator;
    if (*p_activityIndicator)
    {
      [*p_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PRXCardBottomTray *)self addSubview:*p_activityIndicator];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        double v9 = 0.0;
      }
      else {
        double v9 = -14.0;
      }
      id v38 = [*p_activityIndicator centerXAnchor];
      v37 = [(PRXCardBottomTray *)self centerXAnchor];
      uint64_t v36 = [v38 constraintEqualToAnchor:v37];
      v44[0] = v36;
      double v34 = [*p_activityIndicator leadingAnchor];
      v35 = [(PRXCardBottomTray *)self layoutMarginsGuide];
      long long v33 = [v35 leadingAnchor];
      long long v32 = [v34 constraintGreaterThanOrEqualToAnchor:v33];
      v44[1] = v32;
      long long v30 = [*p_activityIndicator trailingAnchor];
      long long v31 = [(PRXCardBottomTray *)self layoutMarginsGuide];
      long long v29 = [v31 trailingAnchor];
      long long v28 = [v30 constraintLessThanOrEqualToAnchor:v29];
      v44[2] = v28;
      v10 = [*p_activityIndicator topAnchor];
      v11 = [(PRXCardBottomTray *)self topAnchor];
      v12 = [v10 constraintGreaterThanOrEqualToAnchor:v11 constant:20.0];
      v44[3] = v12;
      v13 = [*p_activityIndicator bottomAnchor];
      uint64_t v14 = [(PRXCardBottomTray *)self layoutMarginsGuide];
      [v14 bottomAnchor];
      v16 = uint64_t v15 = v5;
      v17 = [v13 constraintEqualToAnchor:v16 constant:v9];
      v44[4] = v17;
      long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:5];

      uint64_t v5 = v15;
      [MEMORY[0x263F08938] activateConstraints:v27];
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v18 = [(PRXCardBottomTray *)self actionButtons];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * i) setHidden:v8 != 0];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v20);
    }
    BOOL v23 = v8 != 0;

    v24 = [(PRXCardBottomTray *)self titleLabel];
    [v24 setHidden:v23];

    v25 = [(PRXCardBottomTray *)self imageView];
    [v25 setHidden:v23];

    [(PRXCardBottomTray *)self setNeedsUpdateConstraints];
    long long v26 = [(PRXCardBottomTray *)self delegate];
    [v26 didChangeContentsOfBottomTray:self];
  }
}

- (void)setImageView:(id)a3
{
  v35[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = (UIImageView *)a3;
  v6 = v5;
  p_imageView = (id *)&self->_imageView;
  if (self->_imageView != v5)
  {
    [(UIImageView *)v5 removeFromSuperview];
    objc_storeStrong((id *)&self->_imageView, a3);
    id v8 = *p_imageView;
    if (*p_imageView)
    {
      [*p_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PRXCardBottomTray *)self addSubview:*p_imageView];
      v25 = (void *)MEMORY[0x263F08938];
      long long v29 = [*p_imageView centerXAnchor];
      long long v28 = [(PRXCardBottomTray *)self centerXAnchor];
      long long v27 = [v29 constraintEqualToAnchor:v28];
      v35[0] = v27;
      long long v26 = [*p_imageView topAnchor];
      double v9 = [(PRXCardBottomTray *)self topAnchor];
      v10 = [v26 constraintGreaterThanOrEqualToAnchor:v9 constant:20.0];
      v35[1] = v10;
      v11 = [*p_imageView bottomAnchor];
      v12 = [(PRXCardBottomTray *)self layoutMarginsGuide];
      v13 = [v12 bottomAnchor];
      uint64_t v14 = [v11 constraintLessThanOrEqualToAnchor:v13 constant:-8.0];
      v35[2] = v14;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
      [v25 activateConstraints:v15];
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v16 = [(PRXCardBottomTray *)self actionButtons];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v20++) setHidden:v8 != 0];
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v18);
    }
    BOOL v21 = v8 != 0;

    v22 = [(PRXCardBottomTray *)self titleLabel];
    [v22 setHidden:v21];

    BOOL v23 = [(PRXCardBottomTray *)self activityIndicator];
    [v23 setHidden:v21];

    v24 = [(PRXCardBottomTray *)self delegate];
    [v24 didChangeContentsOfBottomTray:self];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSString *)[v4 copy];
  title = self->_title;
  self->_title = v5;

  uint64_t v7 = [(PRXCardBottomTray *)self titleLabel];
  [v7 setText:v4];

  id v8 = [(PRXCardBottomTray *)self titleConstraints];

  if (v8)
  {
    double v9 = (void *)MEMORY[0x263F08938];
    v10 = [(PRXCardBottomTray *)self titleConstraints];
    [v9 deactivateConstraints:v10];

    [(PRXCardBottomTray *)self setTitleConstraints:0];
  }
  v11 = [(PRXCardBottomTray *)self buttonConstraints];

  if (v11)
  {
    v12 = (void *)MEMORY[0x263F08938];
    v13 = [(PRXCardBottomTray *)self buttonConstraints];
    [v12 deactivateConstraints:v13];

    [(PRXCardBottomTray *)self setButtonConstraints:0];
  }
  [(PRXCardBottomTray *)self setNeedsUpdateConstraints];
  id v14 = [(PRXCardBottomTray *)self delegate];
  [v14 didChangeContentsOfBottomTray:self];
}

- (BOOL)containsContents
{
  id v4 = [(PRXCardBottomTray *)self title];
  if (v4)
  {
    v2 = [(PRXCardBottomTray *)self title];
    if ([v2 length])
    {
      BOOL v5 = 1;
      goto LABEL_9;
    }
  }
  v6 = [(PRXCardBottomTray *)self imageView];
  if (v6)
  {
  }
  else
  {
    uint64_t v7 = [(PRXCardBottomTray *)self actionButtons];
    if (![v7 count])
    {
      double v9 = [(PRXCardBottomTray *)self activityIndicator];
      BOOL v5 = v9 != 0;

      if (!v4) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  BOOL v5 = 1;
  if (v4) {
LABEL_9:
  }

LABEL_10:
  return v5;
}

- (NSArray)actionButtons
{
  return self->_actionButtons;
}

- (NSString)title
{
  return self->_title;
}

- (UIView)activityIndicator
{
  return self->_activityIndicator;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (PRXCardBottomTrayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRXCardBottomTrayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
}

- (NSArray)titleConstraints
{
  return self->_titleConstraints;
}

- (void)setTitleConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleConstraints, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionButtons, 0);
}

@end
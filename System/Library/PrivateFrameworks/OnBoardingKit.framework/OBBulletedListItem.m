@interface OBBulletedListItem
- (BOOL)shouldLayoutVertically;
- (NSArray)imageContainerSizeConstraints;
- (NSLayoutConstraint)bottomConstraintToImageContainer;
- (NSLayoutConstraint)bottomConstraintToStackView;
- (NSLayoutConstraint)stackViewLeadingConstraintHorizontal;
- (NSLayoutConstraint)stackViewLeadingConstraintVertical;
- (NSLayoutConstraint)topConstraintToImageContainer;
- (NSLayoutConstraint)topConstraintToStackView;
- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6;
- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6 linkButton:(id)a7;
- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6;
- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6 linkButton:(id)a7;
- (UIButton)accessoryButton;
- (UIImageView)imageView;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (UIView)imageContainer;
- (double)_combinedLabelHeight;
- (double)_horizontalMargins;
- (double)_imageTextPadding;
- (double)imageSizeForImage:(id)a3;
- (id)_descriptionFont;
- (id)_titleFont;
- (void)_updateImageViewLayout;
- (void)layoutSubviews;
- (void)setAccessoryButton:(id)a3;
- (void)setBottomConstraintToImageContainer:(id)a3;
- (void)setBottomConstraintToStackView:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setImageContainer:(id)a3;
- (void)setImageContainerSizeConstraints:(id)a3;
- (void)setImageView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewLeadingConstraintHorizontal:(id)a3;
- (void)setStackViewLeadingConstraintVertical:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopConstraintToImageContainer:(id)a3;
- (void)setTopConstraintToStackView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation OBBulletedListItem

- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6
{
  v10 = (void *)MEMORY[0x1E4FB1818];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 _systemImageNamed:a5];
  v15 = [MEMORY[0x1E4FB1830] configurationWithScale:-1];
  v16 = [v14 imageWithConfiguration:v15];

  v17 = [(OBBulletedListItem *)self initWithTitle:v13 description:v12 image:v16 tintColor:v11];
  return v17;
}

- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  id v12 = (void *)MEMORY[0x1E4FB1818];
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  v17 = [v12 _systemImageNamed:a5];
  v18 = [MEMORY[0x1E4FB1830] configurationWithScale:-1];
  v19 = [v17 imageWithConfiguration:v18];

  v20 = [(OBBulletedListItem *)self initWithTitle:v16 description:v15 image:v19 tintColor:v14 linkButton:v13];
  return v20;
}

- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  v126[9] = *MEMORY[0x1E4F143B8];
  unint64_t v12 = (unint64_t)a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12 | v13)
  {
    v125.receiver = self;
    v125.super_class = (Class)OBBulletedListItem;
    double v18 = *MEMORY[0x1E4F1DB28];
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v22 = -[OBBulletedListItem initWithFrame:](&v125, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v19, v20, v21);
    if (v22)
    {
      id v122 = v14;
      v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v14];
      [(OBBulletedListItem *)v22 setImageView:v23];

      v24 = [(OBBulletedListItem *)v22 imageView];
      [v24 setTintColor:v15];

      v25 = [(OBBulletedListItem *)v22 imageView];
      [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

      v26 = [(OBBulletedListItem *)v22 imageView];
      [v26 setContentMode:1];

      uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v18, v19, v20, v21);
      imageContainer = v22->_imageContainer;
      v22->_imageContainer = (UIView *)v27;

      [(UIView *)v22->_imageContainer setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)v22->_imageContainer addSubview:v22->_imageView];
      if ([(id)v12 length])
      {
        v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v18, v19, v20, v21);
        [(OBBulletedListItem *)v22 setTitleLabel:v29];

        v30 = [(OBBulletedListItem *)v22 titleLabel];
        [v30 setNumberOfLines:0];

        v31 = [(OBBulletedListItem *)v22 titleLabel];
        [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

        v32 = [(OBBulletedListItem *)v22 titleLabel];
        [v32 setText:v12];

        v33 = [(OBBulletedListItem *)v22 titleLabel];
        LODWORD(v34) = 1148846080;
        [v33 setContentHuggingPriority:1 forAxis:v34];
      }
      if ([(id)v13 length])
      {
        v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v18, v19, v20, v21);
        [(OBBulletedListItem *)v22 setDescriptionLabel:v35];

        v36 = [(OBBulletedListItem *)v22 descriptionLabel];
        [v36 setNumberOfLines:0];

        v37 = [(OBBulletedListItem *)v22 descriptionLabel];
        [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

        v38 = [(OBBulletedListItem *)v22 descriptionLabel];
        [v38 setText:v13];

        v39 = [MEMORY[0x1E4FB1618] colorWithRed:0.56 green:0.56 blue:0.58 alpha:1.0];
        v40 = [(OBBulletedListItem *)v22 descriptionLabel];
        [v40 setTextColor:v39];

        v41 = [(OBBulletedListItem *)v22 descriptionLabel];
        LODWORD(v42) = 1148846080;
        [v41 setContentHuggingPriority:1 forAxis:v42];
      }
      id v121 = v15;
      unint64_t v123 = v13;
      unint64_t v124 = v12;
      v43 = [(OBBulletedListItem *)v22 _titleFont];
      v44 = [(OBBulletedListItem *)v22 titleLabel];
      [v44 setFont:v43];

      v45 = [(OBBulletedListItem *)v22 _descriptionFont];
      v46 = [(OBBulletedListItem *)v22 descriptionLabel];
      [v46 setFont:v45];

      v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C60]), "initWithFrame:", v18, v19, v20, v21);
      [(OBBulletedListItem *)v22 setStackView:v47];

      v48 = [(OBBulletedListItem *)v22 stackView];
      [v48 setAxis:1];

      v49 = [(OBBulletedListItem *)v22 stackView];
      [v49 setAlignment:1];

      v50 = [(OBBulletedListItem *)v22 stackView];
      [v50 setTranslatesAutoresizingMaskIntoConstraints:0];

      v51 = [(OBBulletedListItem *)v22 stackView];
      v52 = [(OBBulletedListItem *)v22 titleLabel];
      [v51 addArrangedSubview:v52];

      v53 = [(OBBulletedListItem *)v22 stackView];
      v54 = [(OBBulletedListItem *)v22 descriptionLabel];
      [v53 addArrangedSubview:v54];

      id v120 = v16;
      if (v16)
      {
        objc_storeStrong((id *)&v22->_accessoryButton, a7);
        [(UIButton *)v22->_accessoryButton setTranslatesAutoresizingMaskIntoConstraints:0];
        v55 = [(OBBulletedListItem *)v22 stackView];
        v56 = [(OBBulletedListItem *)v22 accessoryButton];
        [v55 addArrangedSubview:v56];
      }
      [(OBBulletedListItem *)v22 addSubview:v22->_imageContainer];
      v57 = [(OBBulletedListItem *)v22 stackView];
      [(OBBulletedListItem *)v22 addSubview:v57];

      v58 = [(OBBulletedListItem *)v22 stackView];
      v59 = [(OBBulletedListItem *)v22 _titleFont];
      [v59 leading];
      objc_msgSend(v58, "setSpacing:");

      v60 = [(OBBulletedListItem *)v22 imageView];
      v61 = [v60 image];
      [(OBBulletedListItem *)v22 imageSizeForImage:v61];
      double v63 = v62;

      v64 = [(OBBulletedListItem *)v22 imageContainer];
      v65 = [v64 topAnchor];
      v66 = [(OBBulletedListItem *)v22 topAnchor];
      v67 = [v65 constraintEqualToAnchor:v66];
      [(OBBulletedListItem *)v22 setTopConstraintToImageContainer:v67];

      v68 = [(OBBulletedListItem *)v22 bottomAnchor];
      v69 = [(OBBulletedListItem *)v22 imageContainer];
      v70 = [v69 bottomAnchor];
      v71 = [v68 constraintEqualToAnchor:v70];
      [(OBBulletedListItem *)v22 setBottomConstraintToImageContainer:v71];

      v72 = [(OBBulletedListItem *)v22 stackView];
      v73 = [v72 topAnchor];
      v74 = [(OBBulletedListItem *)v22 topAnchor];
      v75 = [v73 constraintEqualToAnchor:v74];
      [(OBBulletedListItem *)v22 setTopConstraintToStackView:v75];

      v76 = [(OBBulletedListItem *)v22 bottomAnchor];
      v77 = [(OBBulletedListItem *)v22 stackView];
      v78 = [v77 bottomAnchor];
      v79 = [v76 constraintEqualToAnchor:v78];
      [(OBBulletedListItem *)v22 setBottomConstraintToStackView:v79];

      v105 = (void *)MEMORY[0x1E4F28DC8];
      v119 = [(OBBulletedListItem *)v22 imageView];
      v118 = [v119 widthAnchor];
      v117 = [v118 constraintEqualToConstant:v63];
      v126[0] = v117;
      v116 = [(OBBulletedListItem *)v22 imageView];
      v115 = [v116 heightAnchor];
      v114 = [v115 constraintEqualToConstant:v63];
      v126[1] = v114;
      v113 = [(OBBulletedListItem *)v22 imageView];
      v111 = [v113 centerXAnchor];
      v112 = [(OBBulletedListItem *)v22 imageContainer];
      v110 = [v112 centerXAnchor];
      v109 = [v111 constraintEqualToAnchor:v110];
      v126[2] = v109;
      v108 = [(OBBulletedListItem *)v22 imageView];
      v106 = [v108 centerYAnchor];
      v107 = [(OBBulletedListItem *)v22 imageContainer];
      v104 = [v107 centerYAnchor];
      v103 = [v106 constraintEqualToAnchor:v104];
      v126[3] = v103;
      v102 = [(OBBulletedListItem *)v22 imageView];
      v100 = [v102 topAnchor];
      v101 = [(OBBulletedListItem *)v22 imageContainer];
      v99 = [v101 topAnchor];
      v98 = [v100 constraintLessThanOrEqualToAnchor:v99];
      v126[4] = v98;
      v97 = [(OBBulletedListItem *)v22 imageView];
      v95 = [v97 bottomAnchor];
      v96 = [(OBBulletedListItem *)v22 imageContainer];
      v80 = [v96 bottomAnchor];
      v81 = [v95 constraintLessThanOrEqualToAnchor:v80];
      v126[5] = v81;
      v82 = [(OBBulletedListItem *)v22 stackView];
      v83 = [v82 trailingAnchor];
      v84 = [(OBBulletedListItem *)v22 trailingAnchor];
      [(OBBulletedListItem *)v22 trailingMargins];
      v86 = [v83 constraintEqualToAnchor:v84 constant:-v85];
      v126[6] = v86;
      v87 = [(OBBulletedListItem *)v22 topConstraintToStackView];
      v126[7] = v87;
      v88 = [(OBBulletedListItem *)v22 bottomConstraintToStackView];
      v126[8] = v88;
      v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:9];
      [v105 activateConstraints:v89];

      [(OBBulletedListItem *)v22 _updateImageViewLayout];
      v90 = [(OBBulletedListItem *)v22 accessoryButton];

      unint64_t v12 = v124;
      id v14 = v122;
      unint64_t v13 = v123;
      id v16 = v120;
      id v15 = v121;
      if (v90)
      {
        v91 = [(OBBulletedListItem *)v22 descriptionLabel];

        if (v91) {
          [(OBBulletedListItem *)v22 descriptionLabel];
        }
        else {
        v92 = [(OBBulletedListItem *)v22 titleLabel];
        }
        v93 = [(OBBulletedListItem *)v22 stackView];
        [v93 setCustomSpacing:v92 afterView:0.0];
      }
    }
    self = v22;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6
{
  return [(OBBulletedListItem *)self initWithTitle:a3 description:a4 image:a5 tintColor:a6 linkButton:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OBBulletedListItem;
  [(OBBulletedListItem *)&v8 traitCollectionDidChange:a3];
  [(OBBulletedListItem *)self _updateImageViewLayout];
  v4 = [(OBBulletedListItem *)self _titleFont];
  v5 = [(OBBulletedListItem *)self titleLabel];
  [v5 setFont:v4];

  v6 = [(OBBulletedListItem *)self _descriptionFont];
  v7 = [(OBBulletedListItem *)self descriptionLabel];
  [v7 setFont:v6];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)OBBulletedListItem;
  [(OBBulletedListItem *)&v18 layoutSubviews];
  v3 = [(OBBulletedListItem *)self imageView];
  v4 = [v3 image];
  [(OBBulletedListItem *)self imageSizeForImage:v4];
  double v6 = v5;

  [(OBBulletedListItem *)self _combinedLabelHeight];
  if (v6 <= v7)
  {
    int v9 = 0;
  }
  else
  {
    objc_super v8 = [(OBBulletedListItem *)self stackViewLeadingConstraintVertical];
    if ([v8 isActive])
    {
      int v9 = 0;
    }
    else
    {
      v10 = [(OBBulletedListItem *)self topConstraintToImageContainer];
      int v9 = [v10 isActive] ^ 1;
    }
  }
  [(OBBulletedListItem *)self _combinedLabelHeight];
  if (v6 <= v11)
  {
    unint64_t v13 = [(OBBulletedListItem *)self stackViewLeadingConstraintVertical];
    if ([v13 isActive])
    {
      int v12 = 0;
    }
    else
    {
      id v14 = [(OBBulletedListItem *)self topConstraintToStackView];
      int v12 = [v14 isActive] ^ 1;
    }
  }
  else
  {
    int v12 = 0;
  }
  id v15 = [(OBBulletedListItem *)self stackViewLeadingConstraintVertical];
  if ([v15 isActive])
  {
    id v16 = [(OBBulletedListItem *)self topConstraintToStackView];
    int v17 = [v16 isActive] ^ 1;
  }
  else
  {
    int v17 = 0;
  }

  if (((v9 | v12) & 1) != 0 || v17) {
    [(OBBulletedListItem *)self setNeedsUpdateConstraints];
  }
}

- (double)imageSizeForImage:(id)a3
{
  return 40.0;
}

- (BOOL)shouldLayoutVertically
{
  return +[OBViewUtilities shouldUseAccessibilityLayout];
}

- (NSArray)imageContainerSizeConstraints
{
  v13[2] = *MEMORY[0x1E4F143B8];
  imageContainerSizeConstraints = self->_imageContainerSizeConstraints;
  if (!imageContainerSizeConstraints)
  {
    v4 = [(OBBulletedListItem *)self imageContainer];
    double v5 = [v4 widthAnchor];
    double v6 = [v5 constraintEqualToConstant:40.0];
    v13[0] = v6;
    double v7 = [(OBBulletedListItem *)self imageContainer];
    objc_super v8 = [v7 heightAnchor];
    int v9 = [v8 constraintEqualToConstant:40.0];
    v13[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    double v11 = self->_imageContainerSizeConstraints;
    self->_imageContainerSizeConstraints = v10;

    imageContainerSizeConstraints = self->_imageContainerSizeConstraints;
  }
  return imageContainerSizeConstraints;
}

- (void)_updateImageViewLayout
{
  v57[6] = *MEMORY[0x1E4F143B8];
  v3 = [(OBBulletedListItem *)self imageContainer];
  [v3 removeFromSuperview];

  v4 = [(OBBulletedListItem *)self imageView];
  double v5 = [v4 image];
  [(OBBulletedListItem *)self imageSizeForImage:v5];
  double v7 = v6;

  if ([(OBBulletedListItem *)self shouldLayoutVertically])
  {
    objc_super v8 = [(OBBulletedListItem *)self stackView];
    int v9 = [(OBBulletedListItem *)self imageContainer];
    [v8 insertArrangedSubview:v9 atIndex:0];

    v10 = [(OBBulletedListItem *)self stackView];
    [(OBBulletedListItem *)self _imageTextPadding];
    double v12 = v11;
    unint64_t v13 = [(OBBulletedListItem *)self imageContainer];
    [v10 setCustomSpacing:v13 afterView:v12];

    id v14 = [(OBBulletedListItem *)self stackViewLeadingConstraintVertical];

    if (!v14)
    {
      id v15 = [(OBBulletedListItem *)self stackView];
      id v16 = [v15 leadingAnchor];
      int v17 = [(OBBulletedListItem *)self leadingAnchor];
      objc_super v18 = [v16 constraintEqualToAnchor:v17];
      [(OBBulletedListItem *)self setStackViewLeadingConstraintVertical:v18];
    }
    double v19 = [(OBBulletedListItem *)self stackViewLeadingConstraintHorizontal];
    [v19 setActive:0];

    double v20 = [(OBBulletedListItem *)self stackViewLeadingConstraintVertical];
    [v20 setActive:1];

    double v21 = (void *)MEMORY[0x1E4F28DC8];
    id v55 = [(OBBulletedListItem *)self imageContainerSizeConstraints];
    objc_msgSend(v21, "activateConstraints:");
  }
  else
  {
    v22 = [(OBBulletedListItem *)self imageContainer];
    [(OBBulletedListItem *)self addSubview:v22];

    v23 = [(OBBulletedListItem *)self stackViewLeadingConstraintHorizontal];

    if (!v23)
    {
      v24 = [(OBBulletedListItem *)self stackView];
      v25 = [v24 leadingAnchor];
      v26 = [(OBBulletedListItem *)self imageContainer];
      uint64_t v27 = [v26 trailingAnchor];
      [(OBBulletedListItem *)self _imageTextPadding];
      v28 = objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27);
      [(OBBulletedListItem *)self setStackViewLeadingConstraintHorizontal:v28];
    }
    v29 = (void *)MEMORY[0x1E4F28DC8];
    v30 = [(OBBulletedListItem *)self imageContainerSizeConstraints];
    [v29 deactivateConstraints:v30];

    v31 = [(OBBulletedListItem *)self stackViewLeadingConstraintHorizontal];
    [v31 setActive:1];

    v32 = [(OBBulletedListItem *)self stackViewLeadingConstraintVertical];
    [v32 setActive:0];

    v47 = (void *)MEMORY[0x1E4F28DC8];
    id v56 = [(OBBulletedListItem *)self topConstraintToImageContainer];
    v57[0] = v56;
    v54 = [(OBBulletedListItem *)self bottomConstraintToImageContainer];
    v57[1] = v54;
    v53 = [(OBBulletedListItem *)self imageContainer];
    v52 = [v53 widthAnchor];
    v51 = [v52 constraintEqualToConstant:v7];
    v57[2] = v51;
    v49 = [(OBBulletedListItem *)self leadingAnchor];
    v50 = [(OBBulletedListItem *)self imageContainer];
    v48 = [v50 leadingAnchor];
    [(OBBulletedListItem *)self leadingMargins];
    v46 = [v49 constraintEqualToAnchor:v48 constant:-v33];
    v57[3] = v46;
    v45 = [(OBBulletedListItem *)self imageContainer];
    double v34 = [v45 trailingAnchor];
    v35 = [(OBBulletedListItem *)self stackView];
    v36 = [v35 leadingAnchor];
    [(OBBulletedListItem *)self _imageTextPadding];
    v38 = [v34 constraintEqualToAnchor:v36 constant:-v37];
    v57[4] = v38;
    v39 = [(OBBulletedListItem *)self stackView];
    v40 = [v39 centerYAnchor];
    v41 = [(OBBulletedListItem *)self imageContainer];
    double v42 = [v41 centerYAnchor];
    v43 = [v40 constraintEqualToAnchor:v42];
    v57[5] = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:6];
    [v47 activateConstraints:v44];
  }
}

- (double)_horizontalMargins
{
  BOOL v2 = [(OBBulletedListItem *)self shouldLayoutVertically];
  double result = 0.0;
  if (!v2)
  {
    v4 = +[OBDevice currentDevice];
    unint64_t v5 = [v4 templateType];

    double result = 10.0;
    if (v5 <= 0xA) {
      return dbl_19BF4D1C0[v5];
    }
  }
  return result;
}

- (id)_descriptionFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
}

- (id)_titleFont
{
  v3 = [(OBBulletedListItem *)self descriptionLabel];

  if (v3)
  {
    v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];
    unint64_t v5 = [v4 fontDescriptorWithSymbolicTraits:2];

    double v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];
  }
  else
  {
    double v6 = [(OBBulletedListItem *)self _descriptionFont];
  }
  return v6;
}

- (void)updateConstraints
{
  v23.receiver = self;
  v23.super_class = (Class)OBBulletedListItem;
  [(OBBulletedListItem *)&v23 updateConstraints];
  v3 = [(OBBulletedListItem *)self topConstraintToStackView];
  [v3 setActive:0];

  v4 = [(OBBulletedListItem *)self bottomConstraintToStackView];
  [v4 setActive:0];

  unint64_t v5 = [(OBBulletedListItem *)self imageView];
  double v6 = [v5 image];
  [(OBBulletedListItem *)self imageSizeForImage:v6];
  double v8 = v7;

  int v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = [MEMORY[0x1E4F1CA48] array];
  [(OBBulletedListItem *)self _combinedLabelHeight];
  if (v8 <= v11
    || ([(OBBulletedListItem *)self stackViewLeadingConstraintVertical],
        double v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 isActive],
        v12,
        (v13 & 1) != 0))
  {
    id v14 = [(OBBulletedListItem *)self topConstraintToImageContainer];
    [v9 addObject:v14];

    id v15 = [(OBBulletedListItem *)self bottomConstraintToImageContainer];
    [v9 addObject:v15];

    id v16 = [(OBBulletedListItem *)self topConstraintToStackView];
    [v10 addObject:v16];

    uint64_t v17 = [(OBBulletedListItem *)self bottomConstraintToStackView];
  }
  else
  {
    objc_super v18 = [(OBBulletedListItem *)self topConstraintToStackView];
    [v9 addObject:v18];

    double v19 = [(OBBulletedListItem *)self bottomConstraintToStackView];
    [v9 addObject:v19];

    double v20 = [(OBBulletedListItem *)self imageContainerSizeConstraints];
    [v10 addObjectsFromArray:v20];

    double v21 = [(OBBulletedListItem *)self topConstraintToImageContainer];
    [v10 addObject:v21];

    uint64_t v17 = [(OBBulletedListItem *)self bottomConstraintToImageContainer];
  }
  v22 = (void *)v17;
  [v10 addObject:v17];

  [MEMORY[0x1E4F28DC8] deactivateConstraints:v9];
  [MEMORY[0x1E4F28DC8] activateConstraints:v10];
}

- (double)_combinedLabelHeight
{
  v3 = [(OBBulletedListItem *)self titleLabel];
  [(OBBulletedListItem *)self bounds];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", v4, 0.0);
  double v6 = v5;
  double v7 = [(OBBulletedListItem *)self descriptionLabel];
  [(OBBulletedListItem *)self bounds];
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", v8, 0.0);
  double v10 = v6 + v9;

  return v10;
}

- (double)_imageTextPadding
{
  return 14.0;
}

- (UIView)imageContainer
{
  return self->_imageContainer;
}

- (void)setImageContainer:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (NSLayoutConstraint)stackViewLeadingConstraintVertical
{
  return self->_stackViewLeadingConstraintVertical;
}

- (void)setStackViewLeadingConstraintVertical:(id)a3
{
}

- (NSLayoutConstraint)stackViewLeadingConstraintHorizontal
{
  return self->_stackViewLeadingConstraintHorizontal;
}

- (void)setStackViewLeadingConstraintHorizontal:(id)a3
{
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
}

- (void)setImageContainerSizeConstraints:(id)a3
{
}

- (NSLayoutConstraint)topConstraintToStackView
{
  return self->_topConstraintToStackView;
}

- (void)setTopConstraintToStackView:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraintToStackView
{
  return self->_bottomConstraintToStackView;
}

- (void)setBottomConstraintToStackView:(id)a3
{
}

- (NSLayoutConstraint)topConstraintToImageContainer
{
  return self->_topConstraintToImageContainer;
}

- (void)setTopConstraintToImageContainer:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraintToImageContainer
{
  return self->_bottomConstraintToImageContainer;
}

- (void)setBottomConstraintToImageContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraintToImageContainer, 0);
  objc_storeStrong((id *)&self->_topConstraintToImageContainer, 0);
  objc_storeStrong((id *)&self->_bottomConstraintToStackView, 0);
  objc_storeStrong((id *)&self->_topConstraintToStackView, 0);
  objc_storeStrong((id *)&self->_imageContainerSizeConstraints, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_stackViewLeadingConstraintHorizontal, 0);
  objc_storeStrong((id *)&self->_stackViewLeadingConstraintVertical, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageContainer, 0);
}

@end
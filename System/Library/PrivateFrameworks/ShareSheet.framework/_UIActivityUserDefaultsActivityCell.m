@interface _UIActivityUserDefaultsActivityCell
+ (id)bodyShortFont;
- (BOOL)isDisabled;
- (NSLayoutConstraint)imageViewLeadingConstraint;
- (NSLayoutConstraint)imageViewWidthConstraint;
- (NSLayoutConstraint)labelLeadingConstraint;
- (UIImageView)activityImageView;
- (UILabel)activityTitleLabel;
- (UIView)activityImageSlotView;
- (UIView)activityTitleView;
- (_UIActivityUserDefaultsActivityCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_UIUserDefaultsActivityProxy)activityProxy;
- (unint64_t)sequence;
- (void)_updateImageDarkening;
- (void)prepareForReuse;
- (void)setActivityImageSlotView:(id)a3;
- (void)setActivityImageView:(id)a3;
- (void)setActivityProxy:(id)a3;
- (void)setActivityTitleLabel:(id)a3;
- (void)setActivityTitleView:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setImageViewLeadingConstraint:(id)a3;
- (void)setImageViewWidthConstraint:(id)a3;
- (void)setLabelLeadingConstraint:(id)a3;
- (void)setSequence:(unint64_t)a3;
@end

@implementation _UIActivityUserDefaultsActivityCell

- (_UIActivityUserDefaultsActivityCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v96.receiver = self;
  v96.super_class = (Class)_UIActivityUserDefaultsActivityCell;
  v4 = [(_UIActivityUserDefaultsActivityCell *)&v96 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [v5 setBackgroundColor:v6];

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 setLineBreakMode:4];
    [v5 setAlpha:0.0];
    v7 = [(id)objc_opt_class() bodyShortFont];
    [v5 setFont:v7];

    [(_UIActivityUserDefaultsActivityCell *)v4 setActivityTitleLabel:v5];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [v8 setContentMode:1];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIActivityUserDefaultsActivityCell *)v4 setActivityImageView:v8];
    id v95 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v95 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIActivityUserDefaultsActivityCell *)v4 setActivityImageSlotView:v95];
    id v94 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v94 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIActivityUserDefaultsActivityCell *)v4 setActivityTitleView:v94];
    v9 = [(_UIActivityUserDefaultsActivityCell *)v4 contentView];
    [v9 setClipsToBounds:1];
    v10 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleLabel];
    [v9 addSubview:v10];

    v11 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageView];
    [v9 addSubview:v11];

    v12 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageSlotView];
    [v9 addSubview:v12];

    v13 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleView];
    [v9 addSubview:v13];

    v14 = [MEMORY[0x1E4F1CA48] array];
    v15 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageView];
    v16 = [v15 leadingAnchor];
    v17 = [v9 leadingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 constant:15.0];
    [v14 addObject:v18];

    v19 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleLabel];
    v20 = [v19 topAnchor];
    v21 = [v9 topAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:15.0];
    [v14 addObject:v22];

    v23 = [v9 bottomAnchor];
    v24 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleLabel];
    v25 = [v24 bottomAnchor];
    v26 = [v23 constraintEqualToAnchor:v25 constant:15.0];
    [v14 addObject:v26];

    v27 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleLabel];
    v28 = [v27 leadingAnchor];
    v29 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageView];
    v30 = [v29 trailingAnchor];
    v31 = [v28 constraintEqualToAnchor:v30 constant:16.0];
    [(_UIActivityUserDefaultsActivityCell *)v4 setLabelLeadingConstraint:v31];

    v32 = [(_UIActivityUserDefaultsActivityCell *)v4 labelLeadingConstraint];
    [v14 addObject:v32];

    v33 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleLabel];
    v34 = [v33 trailingAnchor];
    v35 = [v9 trailingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35 constant:-15.0];
    [v14 addObject:v36];

    v37 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageView];
    v38 = [v37 centerYAnchor];
    v39 = [v9 centerYAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [v14 addObject:v40];

    v41 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageView];
    v42 = [v41 widthAnchor];
    v43 = [v42 constraintEqualToConstant:29.0];
    [(_UIActivityUserDefaultsActivityCell *)v4 setImageViewWidthConstraint:v43];

    v44 = [(_UIActivityUserDefaultsActivityCell *)v4 imageViewWidthConstraint];
    [v14 addObject:v44];

    v45 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageView];
    v46 = [v45 heightAnchor];
    v47 = [v46 constraintEqualToConstant:29.0];
    [v14 addObject:v47];

    v48 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageSlotView];
    v49 = [v48 widthAnchor];
    v50 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageView];
    v51 = [v50 widthAnchor];
    v52 = [v49 constraintEqualToAnchor:v51];
    [v14 addObject:v52];

    v53 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageSlotView];
    v54 = [v53 heightAnchor];
    v55 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageView];
    v56 = [v55 heightAnchor];
    v57 = [v54 constraintEqualToAnchor:v56];
    [v14 addObject:v57];

    v58 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageSlotView];
    v59 = [v58 centerXAnchor];
    v60 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageView];
    v61 = [v60 centerXAnchor];
    v62 = [v59 constraintEqualToAnchor:v61];
    [v14 addObject:v62];

    v63 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageSlotView];
    v64 = [v63 centerYAnchor];
    v65 = [(_UIActivityUserDefaultsActivityCell *)v4 activityImageView];
    v66 = [v65 centerYAnchor];
    v67 = [v64 constraintEqualToAnchor:v66];
    [v14 addObject:v67];

    v68 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleView];
    v69 = [v68 widthAnchor];
    v70 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleLabel];
    v71 = [v70 widthAnchor];
    v72 = [v69 constraintEqualToAnchor:v71];
    [v14 addObject:v72];

    v73 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleView];
    v74 = [v73 heightAnchor];
    v75 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleLabel];
    v76 = [v75 heightAnchor];
    v77 = [v74 constraintEqualToAnchor:v76];
    [v14 addObject:v77];

    v78 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleView];
    v79 = [v78 centerYAnchor];
    v80 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleLabel];
    v81 = [v80 centerYAnchor];
    v82 = [v79 constraintEqualToAnchor:v81];
    [v14 addObject:v82];

    v83 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleView];
    v84 = [v83 centerXAnchor];
    v85 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleLabel];
    v86 = [v85 centerXAnchor];
    v87 = [v84 constraintEqualToAnchor:v86];
    [v14 addObject:v87];

    v88 = [(_UIActivityUserDefaultsActivityCell *)v4 activityTitleLabel];
    v89 = [v88 heightAnchor];
    uint64_t v90 = [v89 constraintGreaterThanOrEqualToConstant:0.0];
    titleLabelHeightAnchor = v4->_titleLabelHeightAnchor;
    v4->_titleLabelHeightAnchor = (NSLayoutConstraint *)v90;

    [(NSLayoutConstraint *)v4->_titleLabelHeightAnchor setActive:0];
    [v14 addObject:v4->_titleLabelHeightAnchor];
    [MEMORY[0x1E4F28DC8] activateConstraints:v14];
    v92 = v4;
  }
  return v4;
}

+ (id)bodyShortFont
{
  v2 = (void *)MEMORY[0x1E4FB1798];
  v3 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0x8000 options:0];
  v4 = [v2 fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (void)setActivityProxy:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_activityProxy, a3);
  titleLabelHeightAnchor = self->_titleLabelHeightAnchor;
  if (v12)
  {
    [(NSLayoutConstraint *)titleLabelHeightAnchor constant];
    double v7 = v6;
    id v8 = [v12 activityTitle];
    [v8 slotTextHeight];
    double v10 = v9 / _ShareSheetDeviceScreenScale();

    [(NSLayoutConstraint *)self->_titleLabelHeightAnchor setConstant:v10];
    [(NSLayoutConstraint *)self->_titleLabelHeightAnchor setActive:1];
    if (vabdd_f64(v7, v10) < 0.00000011920929) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v11 = [(NSLayoutConstraint *)titleLabelHeightAnchor isActive];
  [(NSLayoutConstraint *)self->_titleLabelHeightAnchor setActive:0];
  if (v11) {
LABEL_3:
  }
    [(_UIActivityUserDefaultsActivityCell *)self setNeedsLayout];
LABEL_4:
}

- (void)prepareForReuse
{
  v9.receiver = self;
  v9.super_class = (Class)_UIActivityUserDefaultsActivityCell;
  [(_UIActivityUserDefaultsActivityCell *)&v9 prepareForReuse];
  v3 = [(_UIActivityUserDefaultsActivityCell *)self activityImageSlotView];
  v4 = [v3 layer];
  [v4 setContents:0];

  id v5 = [(_UIActivityUserDefaultsActivityCell *)self activityTitleView];
  double v6 = [v5 layer];
  [v6 setContents:0];

  double v7 = [(_UIActivityUserDefaultsActivityCell *)self activityTitleLabel];
  [v7 setText:0];

  id v8 = [(_UIActivityUserDefaultsActivityCell *)self activityImageView];
  [v8 setImage:0];

  [(_UIActivityUserDefaultsActivityCell *)self setActivityProxy:0];
  [(_UIActivityUserDefaultsActivityCell *)self setDisabled:0];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(_UIActivityUserDefaultsActivityCell *)self _updateImageDarkening];
  }
}

- (void)_updateImageDarkening
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [(_UIActivityUserDefaultsActivityCell *)self activityImageSlotView];
  v4 = [v3 layer];
  id v5 = [v4 contents];

  id v6 = [(_UIActivityUserDefaultsActivityCell *)self activityImageSlotView];
  double v7 = [v6 layer];
  [v7 setContents:v5];

  if (([(_UIActivityUserDefaultsActivityCell *)self isHighlighted] & 1) != 0
    || [(_UIActivityUserDefaultsActivityCell *)self isDisabled])
  {
    id v6 = [MEMORY[0x1E4FB1618] grayColor];
    uint64_t v8 = [v6 CGColor];
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
    uint64_t v8 = 0;
  }
  double v10 = [(_UIActivityUserDefaultsActivityCell *)self activityImageSlotView];
  BOOL v11 = [v10 layer];
  [v11 setContentsMultiplyColor:v8];

  if (v9) {
  if (([(_UIActivityUserDefaultsActivityCell *)self isHighlighted] & 1) != 0
  }
    || [(_UIActivityUserDefaultsActivityCell *)self isDisabled])
  {
    id v12 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
    id v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
    objc_msgSend(v12, "setValue:forKey:", objc_msgSend(v13, "CGColor"), @"inputColor");

    v17[0] = v12;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  else
  {
    v14 = 0;
  }
  v15 = [(_UIActivityUserDefaultsActivityCell *)self activityImageView];
  v16 = [v15 layer];
  [v16 setFilters:v14];
}

- (unint64_t)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unint64_t)a3
{
  self->_sequence = a3;
}

- (UIImageView)activityImageView
{
  return self->_activityImageView;
}

- (void)setActivityImageView:(id)a3
{
}

- (UILabel)activityTitleLabel
{
  return self->_activityTitleLabel;
}

- (void)setActivityTitleLabel:(id)a3
{
}

- (UIView)activityImageSlotView
{
  return self->_activityImageSlotView;
}

- (void)setActivityImageSlotView:(id)a3
{
}

- (UIView)activityTitleView
{
  return self->_activityTitleView;
}

- (void)setActivityTitleView:(id)a3
{
}

- (_UIUserDefaultsActivityProxy)activityProxy
{
  return self->_activityProxy;
}

- (NSLayoutConstraint)imageViewWidthConstraint
{
  return self->_imageViewWidthConstraint;
}

- (void)setImageViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewLeadingConstraint
{
  return self->_imageViewLeadingConstraint;
}

- (void)setImageViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelLeadingConstraint
{
  return self->_labelLeadingConstraint;
}

- (void)setLabelLeadingConstraint:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_activityProxy, 0);
  objc_storeStrong((id *)&self->_activityTitleView, 0);
  objc_storeStrong((id *)&self->_activityImageSlotView, 0);
  objc_storeStrong((id *)&self->_activityTitleLabel, 0);
  objc_storeStrong((id *)&self->_activityImageView, 0);
  objc_storeStrong((id *)&self->_titleLabelHeightAnchor, 0);
}

@end
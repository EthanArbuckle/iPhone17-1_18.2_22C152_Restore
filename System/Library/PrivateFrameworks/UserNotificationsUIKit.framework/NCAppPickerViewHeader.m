@interface NCAppPickerViewHeader
+ (double)preferredHeightForWidth:(double)a3 supportsSortByAvgNumberOfNotifications:(BOOL)a4;
+ (id)_descriptionFont;
+ (id)_descriptionText;
+ (id)_orderingDescriptionFont;
+ (id)_orderingDescriptionText;
+ (id)_orderingWarningFont;
+ (id)_orderingWarningText;
+ (id)_titleFont;
+ (id)_titleText;
+ (id)reuseIdentifier;
- (NCAppPickerViewHeader)initWithFrame:(CGRect)a3;
- (void)configureSupportsSortByAvgNumberOfNotifications:(BOOL)a3;
@end

@implementation NCAppPickerViewHeader

- (NCAppPickerViewHeader)initWithFrame:(CGRect)a3
{
  v111.receiver = self;
  v111.super_class = (Class)NCAppPickerViewHeader;
  v3 = -[NCAppPickerViewHeader initWithFrame:](&v111, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v11 = v3->_titleLabel;
    v12 = [(id)objc_opt_class() _titleText];
    [(UILabel *)v11 setText:v12];

    v13 = v3->_titleLabel;
    v14 = [(id)objc_opt_class() _titleFont];
    [(UILabel *)v13 setFont:v14];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v15 = v3->_titleLabel;
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v15 setTextColor:v16];

    LODWORD(v17) = 0.5;
    [(UILabel *)v3->_titleLabel _setHyphenationFactor:v17];
    [(NCAppPickerViewHeader *)v3 addSubview:v3->_titleLabel];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v18;

    [(UILabel *)v3->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_descriptionLabel setNumberOfLines:0];
    v20 = v3->_descriptionLabel;
    v21 = [(id)objc_opt_class() _descriptionText];
    [(UILabel *)v20 setText:v21];

    v22 = v3->_descriptionLabel;
    v23 = [(id)objc_opt_class() _descriptionFont];
    [(UILabel *)v22 setFont:v23];

    [(UILabel *)v3->_descriptionLabel setTextAlignment:1];
    v24 = v3->_descriptionLabel;
    v25 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v24 setTextColor:v25];

    [(NCAppPickerViewHeader *)v3 addSubview:v3->_descriptionLabel];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    orderingDescriptionLabel = v3->_orderingDescriptionLabel;
    v3->_orderingDescriptionLabel = (UILabel *)v26;

    [(UILabel *)v3->_orderingDescriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_orderingDescriptionLabel setNumberOfLines:0];
    v28 = v3->_orderingDescriptionLabel;
    v29 = [(id)objc_opt_class() _orderingDescriptionText];
    [(UILabel *)v28 setText:v29];

    v30 = v3->_orderingDescriptionLabel;
    v31 = [(id)objc_opt_class() _orderingDescriptionFont];
    [(UILabel *)v30 setFont:v31];

    v32 = v3->_orderingDescriptionLabel;
    v33 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v32 setTextColor:v33];

    [(UILabel *)v3->_orderingDescriptionLabel setTextAlignment:1];
    [(NCAppPickerViewHeader *)v3 addSubview:v3->_orderingDescriptionLabel];
    uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
    orderingWarningContainer = v3->_orderingWarningContainer;
    v3->_orderingWarningContainer = (UIView *)v34;

    [(UIView *)v3->_orderingWarningContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = v3->_orderingWarningContainer;
    v37 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v38 = [v37 colorWithAlphaComponent:0.12];
    [(UIView *)v36 setBackgroundColor:v38];

    [(UIView *)v3->_orderingWarningContainer _setContinuousCornerRadius:12.0];
    [(NCAppPickerViewHeader *)v3 addSubview:v3->_orderingWarningContainer];
    uint64_t v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v5, v6, v7, v8);
    orderingWarningIconImageView = v3->_orderingWarningIconImageView;
    v3->_orderingWarningIconImageView = (UIImageView *)v39;

    [(UIImageView *)v3->_orderingWarningIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v110 = [MEMORY[0x1E4FB1830] configurationWithPointSize:20.0];
    v109 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.circle" withConfiguration:v110];
    [(UIImageView *)v3->_orderingWarningIconImageView setImage:v109];
    [(UIImageView *)v3->_orderingWarningIconImageView setContentMode:4];
    v41 = v3->_orderingWarningIconImageView;
    v42 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(UIImageView *)v41 setTintColor:v42];

    [(UIView *)v3->_orderingWarningContainer addSubview:v3->_orderingWarningIconImageView];
    uint64_t v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    orderingWarningLabel = v3->_orderingWarningLabel;
    v3->_orderingWarningLabel = (UILabel *)v43;

    [(UILabel *)v3->_orderingWarningLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_orderingWarningLabel setNumberOfLines:0];
    v45 = v3->_orderingWarningLabel;
    v46 = [(id)objc_opt_class() _orderingWarningFont];
    [(UILabel *)v45 setFont:v46];

    v47 = v3->_orderingWarningLabel;
    v48 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v47 setTextColor:v48];

    [(UIView *)v3->_orderingWarningContainer addSubview:v3->_orderingWarningLabel];
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v50 = [(UILabel *)v3->_titleLabel topAnchor];
    v51 = [(NCAppPickerViewHeader *)v3 topAnchor];
    v52 = [v50 constraintEqualToAnchor:v51 constant:2.0];
    [v49 addObject:v52];

    v53 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v54 = [(NCAppPickerViewHeader *)v3 leadingAnchor];
    v55 = [v53 constraintEqualToAnchor:v54 constant:16.0];
    [v49 addObject:v55];

    v56 = [(NCAppPickerViewHeader *)v3 trailingAnchor];
    v57 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v58 = [v56 constraintEqualToAnchor:v57 constant:16.0];
    [v49 addObject:v58];

    v59 = [(UILabel *)v3->_descriptionLabel topAnchor];
    v60 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v61 = [v59 constraintEqualToAnchor:v60 constant:8.0];
    [v49 addObject:v61];

    v62 = [(UILabel *)v3->_descriptionLabel leadingAnchor];
    v63 = [(NCAppPickerViewHeader *)v3 leadingAnchor];
    v64 = [v62 constraintEqualToAnchor:v63 constant:16.0];
    [v49 addObject:v64];

    v65 = [(NCAppPickerViewHeader *)v3 trailingAnchor];
    v66 = [(UILabel *)v3->_descriptionLabel trailingAnchor];
    v67 = [v65 constraintEqualToAnchor:v66 constant:16.0];
    [v49 addObject:v67];

    v68 = [(UILabel *)v3->_orderingDescriptionLabel topAnchor];
    v69 = [(UILabel *)v3->_descriptionLabel bottomAnchor];
    v70 = [v68 constraintEqualToAnchor:v69 constant:14.0];
    [v49 addObject:v70];

    v71 = [(UILabel *)v3->_orderingDescriptionLabel leadingAnchor];
    v72 = [(NCAppPickerViewHeader *)v3 leadingAnchor];
    v73 = [v71 constraintEqualToAnchor:v72];
    [v49 addObject:v73];

    v74 = [(NCAppPickerViewHeader *)v3 trailingAnchor];
    v75 = [(UILabel *)v3->_orderingDescriptionLabel trailingAnchor];
    v76 = [v74 constraintEqualToAnchor:v75];
    [v49 addObject:v76];

    v77 = [(UIView *)v3->_orderingWarningContainer topAnchor];
    v78 = [(UILabel *)v3->_orderingWarningLabel topAnchor];
    v79 = [v77 constraintEqualToAnchor:v78 constant:-12.0];
    [v49 addObject:v79];

    v80 = [(UIView *)v3->_orderingWarningContainer leadingAnchor];
    v81 = [(NCAppPickerViewHeader *)v3 leadingAnchor];
    v82 = [v80 constraintEqualToAnchor:v81];
    [v49 addObject:v82];

    v83 = [(NCAppPickerViewHeader *)v3 trailingAnchor];
    v84 = [(UIView *)v3->_orderingWarningContainer trailingAnchor];
    v85 = [v83 constraintEqualToAnchor:v84];
    [v49 addObject:v85];

    v86 = [(UILabel *)v3->_orderingWarningLabel bottomAnchor];
    v87 = [(UIView *)v3->_orderingWarningContainer bottomAnchor];
    v88 = [v86 constraintEqualToAnchor:v87 constant:-12.0];
    [v49 addObject:v88];

    v89 = [(NCAppPickerViewHeader *)v3 bottomAnchor];
    v90 = [(UIView *)v3->_orderingWarningContainer bottomAnchor];
    v91 = [v89 constraintEqualToAnchor:v90 constant:8.0];
    [v49 addObject:v91];

    v92 = [(UIImageView *)v3->_orderingWarningIconImageView centerYAnchor];
    v93 = [(UILabel *)v3->_orderingWarningLabel centerYAnchor];
    v94 = [v92 constraintEqualToAnchor:v93];
    [v49 addObject:v94];

    v95 = [(UIImageView *)v3->_orderingWarningIconImageView leadingAnchor];
    v96 = [(UIView *)v3->_orderingWarningContainer leadingAnchor];
    v97 = [v95 constraintEqualToAnchor:v96 constant:12.0];
    [v49 addObject:v97];

    v98 = [(UIImageView *)v3->_orderingWarningIconImageView heightAnchor];
    v99 = [v98 constraintEqualToConstant:24.0];
    [v49 addObject:v99];

    v100 = [(UIImageView *)v3->_orderingWarningIconImageView widthAnchor];
    v101 = [v100 constraintEqualToConstant:24.0];
    [v49 addObject:v101];

    v102 = [(UILabel *)v3->_orderingWarningLabel leadingAnchor];
    v103 = [(UIImageView *)v3->_orderingWarningIconImageView trailingAnchor];
    v104 = [v102 constraintEqualToAnchor:v103 constant:10.0];
    [v49 addObject:v104];

    v105 = [(UIView *)v3->_orderingWarningContainer trailingAnchor];
    v106 = [(UILabel *)v3->_orderingWarningLabel trailingAnchor];
    v107 = [v105 constraintEqualToAnchor:v106 constant:10.0];
    [v49 addObject:v107];

    [MEMORY[0x1E4F28DC8] activateConstraints:v49];
  }
  return v3;
}

- (void)configureSupportsSortByAvgNumberOfNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIView setHidden:](self->_orderingWarningContainer, "setHidden:");
  orderingWarningLabel = self->_orderingWarningLabel;
  if (v3)
  {
    double v6 = self->_orderingWarningLabel;
    [(UILabel *)v6 setText:0];
  }
  else
  {
    id v7 = [(id)objc_opt_class() _orderingWarningText];
    [(UILabel *)orderingWarningLabel setText:v7];
  }
}

+ (id)reuseIdentifier
{
  return @"NCAppPickerViewHeader";
}

+ (double)preferredHeightForWidth:(double)a3 supportsSortByAvgNumberOfNotifications:(BOOL)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (!preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FB0860]);
    double v8 = (void *)preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext;
    preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext = (uint64_t)v7;

    [(id)preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext setWantsNumberOfLineFragments:1];
  }
  double v9 = fmax(a3 + -32.0, 0.0);
  v10 = [(id)objc_opt_class() _titleText];
  uint64_t v30 = *MEMORY[0x1E4FB06F8];
  uint64_t v11 = v30;
  v12 = [a1 _titleFont];
  v31[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v13, preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext, v9, 0.0);
  CGRectGetHeight(v32);

  v14 = [(id)objc_opt_class() _descriptionText];
  uint64_t v28 = v11;
  v15 = [a1 _descriptionFont];
  v29 = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 1, v16, preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext, v9, 0.0);
  CGRectGetHeight(v33);

  double v17 = [(id)objc_opt_class() _orderingDescriptionText];
  uint64_t v26 = v11;
  uint64_t v18 = [a1 _orderingDescriptionFont];
  v27 = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  objc_msgSend(v17, "boundingRectWithSize:options:attributes:context:", 1, v19, preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext, v9, 0.0);
  CGRectGetHeight(v34);

  if (!a4)
  {
    v20 = [(id)objc_opt_class() _orderingWarningText];
    uint64_t v24 = v11;
    v21 = [a1 _orderingWarningFont];
    v25 = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    objc_msgSend(v20, "boundingRectWithSize:options:attributes:context:", 1, v22, preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext, fmax(a3 + -12.0 + -24.0 + -10.0 + -10.0, 0.0), 0.0);
    CGRectGetHeight(v35);
  }
  _NCMainScreenScale();
  UICeilToScale();
  return result;
}

+ (id)_titleText
{
  v2 = NCUserNotificationsUIKitFrameworkBundle();
  BOOL v3 = [v2 localizedStringForKey:@"NOTIFICATION_DIGEST_ONBOARDING_ADD_PICKER_TITLE" value:&stru_1F2F516F8 table:0];

  return v3;
}

+ (id)_titleFont
{
  v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2928]];
  BOOL v3 = [v2 fontDescriptorWithSymbolicTraits:2];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = v2;
  }
  double v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (id)_descriptionText
{
  v2 = NCUserNotificationsUIKitFrameworkBundle();
  BOOL v3 = [v2 localizedStringForKey:@"NOTIFICATION_DIGEST_ONBOARDING_ADD_PICKER_DESCRIPTION" value:&stru_1F2F516F8 table:0];

  return v3;
}

+ (id)_descriptionFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (id)_orderingDescriptionText
{
  v2 = NCUserNotificationsUIKitFrameworkBundle();
  BOOL v3 = [v2 localizedStringForKey:@"NOTIFICATION_DIGEST_SETTINGS_ORDERED_BY" value:&stru_1F2F516F8 table:0];

  return v3;
}

+ (id)_orderingDescriptionFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

+ (id)_orderingWarningText
{
  v2 = NCUserNotificationsUIKitFrameworkBundle();
  BOOL v3 = [v2 localizedStringForKey:@"NOTIFICATION_DIGEST_SETTINGS_NOT_ENOUGH_DATA" value:&stru_1F2F516F8 table:0];

  return v3;
}

+ (id)_orderingWarningFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderingWarningIconImageView, 0);
  objc_storeStrong((id *)&self->_orderingWarningLabel, 0);
  objc_storeStrong((id *)&self->_orderingWarningContainer, 0);
  objc_storeStrong((id *)&self->_orderingDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
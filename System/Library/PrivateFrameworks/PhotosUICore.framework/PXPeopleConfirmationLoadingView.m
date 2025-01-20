@interface PXPeopleConfirmationLoadingView
- (PXPeopleConfirmationLoadingView)init;
- (PXPeopleConfirmationLoadingView)initWithFrame:(CGRect)a3;
- (PXPeopleConfirmationLoadingView)initWithFrame:(CGRect)a3 person:(id)a4;
- (PXPeopleScalableAvatarView)avatarView;
- (PXPerson)person;
- (UIContentUnavailableView)contentLoadingView;
- (UILabel)noneFoundLabel;
- (int64_t)loadingState;
- (void)_updateViewVisibilityForLoadingStateInitial;
- (void)_updateViewVisibilityForLoadingStateLoading;
- (void)_updateViewVisibilityForLoadingStateNoneFound;
- (void)layoutSubviews;
- (void)setLoadingState:(int64_t)a3;
@end

@implementation PXPeopleConfirmationLoadingView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_noneFoundLabel, 0);
  objc_storeStrong((id *)&self->_contentLoadingView, 0);
}

- (PXPeopleScalableAvatarView)avatarView
{
  return self->_avatarView;
}

- (PXPerson)person
{
  return self->_person;
}

- (UILabel)noneFoundLabel
{
  return self->_noneFoundLabel;
}

- (UIContentUnavailableView)contentLoadingView
{
  return self->_contentLoadingView;
}

- (int64_t)loadingState
{
  return self->_loadingState;
}

- (void)_updateViewVisibilityForLoadingStateInitial
{
  v3 = [(PXPeopleConfirmationLoadingView *)self noneFoundLabel];
  [v3 setHidden:1];

  v4 = [(PXPeopleConfirmationLoadingView *)self contentLoadingView];
  [v4 setHidden:0];

  id v5 = [(PXPeopleConfirmationLoadingView *)self avatarView];
  [v5 setHidden:1];
}

- (void)_updateViewVisibilityForLoadingStateNoneFound
{
  v3 = [(PXPeopleConfirmationLoadingView *)self avatarView];
  [v3 setHidden:0];

  v4 = [(PXPeopleConfirmationLoadingView *)self noneFoundLabel];
  [v4 setHidden:0];

  id v5 = [(PXPeopleConfirmationLoadingView *)self contentLoadingView];
  [v5 setHidden:1];
}

- (void)_updateViewVisibilityForLoadingStateLoading
{
  v3 = [(PXPeopleConfirmationLoadingView *)self noneFoundLabel];
  [v3 setHidden:1];

  v4 = [(PXPeopleConfirmationLoadingView *)self contentLoadingView];
  [v4 setHidden:0];

  id v5 = [(PXPeopleConfirmationLoadingView *)self avatarView];
  [v5 setHidden:1];
}

- (void)setLoadingState:(int64_t)a3
{
  if (self->_loadingState != a3)
  {
    self->_loadingState = a3;
    if (a3)
    {
      if (a3 == 2)
      {
        [(PXPeopleConfirmationLoadingView *)self _updateViewVisibilityForLoadingStateNoneFound];
      }
      else if (a3 == 1)
      {
        [(PXPeopleConfirmationLoadingView *)self _updateViewVisibilityForLoadingStateLoading];
      }
    }
    else
    {
      [(PXPeopleConfirmationLoadingView *)self _updateViewVisibilityForLoadingStateInitial];
    }
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleConfirmationLoadingView;
  [(PXPeopleConfirmationLoadingView *)&v5 layoutSubviews];
  v3 = [(PXPeopleConfirmationLoadingView *)self person];
  v4 = [(PXPeopleConfirmationLoadingView *)self avatarView];
  [v4 setPerson:v3];
}

- (PXPeopleConfirmationLoadingView)initWithFrame:(CGRect)a3
{
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleConfirmationLoadingView.m", 170, @"%s is not available as initializer", "-[PXPeopleConfirmationLoadingView initWithFrame:]");

  abort();
}

- (PXPeopleConfirmationLoadingView)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleConfirmationLoadingView.m", 166, @"%s is not available as initializer", "-[PXPeopleConfirmationLoadingView init]");

  abort();
}

- (PXPeopleConfirmationLoadingView)initWithFrame:(CGRect)a3 person:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v82[13] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  v81.receiver = self;
  v81.super_class = (Class)PXPeopleConfirmationLoadingView;
  v12 = -[PXPeopleConfirmationLoadingView initWithFrame:](&v81, sel_initWithFrame_, x, y, width, height);
  if (!v12) {
    goto LABEL_8;
  }
  v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PXPeopleConfirmationLoadingView *)v12 setBackgroundColor:v13];

  v14 = [MEMORY[0x1E4FB1658] loadingConfiguration];
  v15 = PXLocalizedStringFromTable(@"PXPeopleConfirmationLoadingMessageText", @"PhotosUICore");
  [v14 setText:v15];

  v79 = v14;
  v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1670]) initWithConfiguration:v14];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setHidden:1];
  objc_storeStrong((id *)&v12->_contentLoadingView, v16);
  [(PXPeopleConfirmationLoadingView *)v12 addSubview:v16];
  v12->_loadingState = 0;
  objc_storeStrong((id *)&v12->_person, a4);
  v17 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
  [(PXPeopleScalableAvatarView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PXPeopleScalableAvatarView *)v17 setPerson:v11];
  objc_storeStrong((id *)&v12->_avatarView, v17);
  [(PXPeopleConfirmationLoadingView *)v12 addSubview:v17];
  v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  noneFoundLabel = v12->_noneFoundLabel;
  v12->_noneFoundLabel = v18;

  [(UILabel *)v12->_noneFoundLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v12->_noneFoundLabel setNumberOfLines:0];
  [(UILabel *)v12->_noneFoundLabel setTextAlignment:1];
  id v20 = v11;
  if (!v20)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    [v36 handleFailureInMethod:a2, v12, @"PXPeopleConfirmationLoadingView.m", 104, @"%@ should be an instance inheriting from %@, but it is nil", @"person", v38 object file lineNumber description];
LABEL_11:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    v39 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v39);
    v40 = objc_msgSend(v20, "px_descriptionForAssertionMessage");
    [v36 handleFailureInMethod:a2, v12, @"PXPeopleConfirmationLoadingView.m", 104, @"%@ should be an instance inheriting from %@, but it is %@", @"person", v38, v40 object file lineNumber description];

    goto LABEL_11;
  }
LABEL_4:
  v21 = objc_msgSend(v20, "px_localizedName");
  id v80 = v11;
  v77 = v21;
  v78 = v20;
  if ([v21 length])
  {
    v22 = PXLocalizedStringForPersonOrPetAndVisibility(v20, 0, @"PXPeopleConfirmationNoneFoundNamedMessage");
    v41 = v21;
    uint64_t v23 = PXStringWithValidatedFormat();
  }
  else
  {
    uint64_t v23 = PXLocalizedStringForPersonOrPetAndVisibility(v20, 0, @"PXPeopleConfirmationNoneFoundUnnamedMessage");
  }
  v56 = (void *)v23;
  -[UILabel setText:](v12->_noneFoundLabel, "setText:", v23, v41);
  [(UILabel *)v12->_noneFoundLabel setHidden:1];
  [(PXPeopleConfirmationLoadingView *)v12 addSubview:v12->_noneFoundLabel];
  v24 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)v12->_noneFoundLabel setFont:v24];

  [(UILabel *)v12->_noneFoundLabel setAdjustsFontForContentSizeCategory:1];
  id v25 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [(PXPeopleConfirmationLoadingView *)v12 addLayoutGuide:v25];
  v60 = (void *)MEMORY[0x1E4F28DC8];
  v76 = [v25 topAnchor];
  v75 = [(PXPeopleConfirmationLoadingView *)v12 topAnchor];
  [v76 constraintEqualToAnchor:v75];
  v74 = v73 = v25;
  v82[0] = v74;
  v72 = [v25 heightAnchor];
  v71 = [(PXPeopleConfirmationLoadingView *)v12 heightAnchor];
  v70 = [v72 constraintEqualToAnchor:v71 multiplier:0.27];
  v82[1] = v70;
  v69 = [(PXPeopleScalableAvatarView *)v17 topAnchor];
  v68 = [v25 bottomAnchor];
  v67 = [v69 constraintEqualToAnchor:v68];
  v82[2] = v67;
  v66 = [(PXPeopleScalableAvatarView *)v17 heightAnchor];
  v65 = [(PXPeopleConfirmationLoadingView *)v12 heightAnchor];
  v64 = [v66 constraintEqualToAnchor:v65 multiplier:0.25];
  v82[3] = v64;
  v63 = [(PXPeopleScalableAvatarView *)v17 widthAnchor];
  v62 = [(PXPeopleScalableAvatarView *)v17 heightAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v82[4] = v61;
  v59 = [(PXPeopleScalableAvatarView *)v17 centerXAnchor];
  v58 = [(PXPeopleConfirmationLoadingView *)v12 centerXAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v82[5] = v57;
  v55 = [(PXPeopleScalableAvatarView *)v17 bottomAnchor];
  v53 = [(UILabel *)v12->_noneFoundLabel firstBaselineAnchor];
  v51 = [v55 constraintEqualToAnchor:v53 constant:-28.0];
  v82[6] = v51;
  v50 = [(UILabel *)v12->_noneFoundLabel centerXAnchor];
  v49 = [(PXPeopleConfirmationLoadingView *)v12 centerXAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v82[7] = v48;
  v47 = [(UILabel *)v12->_noneFoundLabel widthAnchor];
  v46 = [v47 constraintEqualToConstant:325.0];
  v82[8] = v46;
  v45 = [v16 topAnchor];
  v44 = [(PXPeopleConfirmationLoadingView *)v12 topAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v82[9] = v43;
  v42 = [v16 trailingAnchor];
  v26 = [(PXPeopleConfirmationLoadingView *)v12 trailingAnchor];
  v27 = [v42 constraintEqualToAnchor:v26];
  v82[10] = v27;
  v28 = [v16 bottomAnchor];
  v29 = [(PXPeopleConfirmationLoadingView *)v12 bottomAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  v82[11] = v30;
  v31 = [v16 leadingAnchor];
  [(PXPeopleConfirmationLoadingView *)v12 leadingAnchor];
  v32 = v54 = v16;
  [v31 constraintEqualToAnchor:v32];
  v33 = v52 = v17;
  v82[12] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:13];
  [v60 activateConstraints:v34];

  id v11 = v80;
LABEL_8:

  return v12;
}

@end
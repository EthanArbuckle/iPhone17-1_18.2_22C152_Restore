@interface PXSharedLibraryRulePersonCell
- (PHPerson)imagePerson;
- (PXSharedLibraryRulePersonCell)initWithFrame:(CGRect)a3;
- (SEL)removeAction;
- (UIButton)minusButton;
- (UIImageView)faceImageView;
- (UIImageView)minusImageView;
- (UIImageView)plusImageView;
- (UILabel)nameLabel;
- (UILabel)subtitleLabel;
- (id)removeTarget;
- (void)_updateMinusButton;
- (void)prepareForReuse;
- (void)remove:(id)a3;
- (void)setImagePerson:(id)a3;
- (void)setRemoveAction:(SEL)a3;
- (void)setRemoveTarget:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXSharedLibraryRulePersonCell

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_removeTarget);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_minusButton, 0);
  objc_storeStrong((id *)&self->_minusImageView, 0);
  objc_storeStrong((id *)&self->_plusImageView, 0);
  objc_storeStrong((id *)&self->_faceImageView, 0);
}

- (void)setRemoveAction:(SEL)a3
{
  self->_removeAction = a3;
}

- (SEL)removeAction
{
  return self->_removeAction;
}

- (void)setRemoveTarget:(id)a3
{
}

- (id)removeTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_removeTarget);
  return WeakRetained;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (UIButton)minusButton
{
  return self->_minusButton;
}

- (UIImageView)minusImageView
{
  return self->_minusImageView;
}

- (UIImageView)plusImageView
{
  return self->_plusImageView;
}

- (UIImageView)faceImageView
{
  return self->_faceImageView;
}

- (void)remove:(id)a3
{
  v4 = [(PXSharedLibraryRulePersonCell *)self removeAction];
  if (v4)
  {
    v5 = v4;
    id v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    v6 = [(PXSharedLibraryRulePersonCell *)self removeTarget];
    [v7 sendAction:v5 to:v6 from:self forEvent:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryRulePersonCell;
  id v4 = a3;
  [(PXSharedLibraryRulePersonCell *)&v7 traitCollectionDidChange:v4];
  v5 = [(PXSharedLibraryRulePersonCell *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(PXSharedLibraryRulePersonCell *)self _updateMinusButton];
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PXSharedLibraryRulePersonCell;
  [(PXSharedLibraryRulePersonCell *)&v5 prepareForReuse];
  [(PXSharedLibraryRulePersonCell *)self setImagePerson:0];
  v3 = [(PXSharedLibraryRulePersonCell *)self plusImageView];
  [v3 setImage:0];

  id v4 = [(PXSharedLibraryRulePersonCell *)self faceImageView];
  [v4 setImage:0];
}

- (void)_updateMinusButton
{
  v3 = [(PXSharedLibraryRulePersonCell *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PXSharedLibraryRulePersonCell__updateMinusButton__block_invoke;
  v4[3] = &unk_1E5DD36F8;
  v4[4] = self;
  [v3 performAsCurrentTraitCollection:v4];
}

void __51__PXSharedLibraryRulePersonCell__updateMinusButton__block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v2 = [v4 CGColor];
  v3 = [*(id *)(*(void *)(a1 + 32) + 664) layer];
  [v3 setShadowColor:v2];
}

- (PHPerson)imagePerson
{
  uint64_t v2 = [(PXSharedLibraryRulePersonCell *)self faceImageView];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  id v4 = [v3 representedPerson];

  return (PHPerson *)v4;
}

- (void)setImagePerson:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PXSharedLibraryRulePersonCell *)self faceImageView];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  [v6 setRepresentedPerson:v4];
}

- (PXSharedLibraryRulePersonCell)initWithFrame:(CGRect)a3
{
  v105[2] = *MEMORY[0x1E4F143B8];
  v103.receiver = self;
  v103.super_class = (Class)PXSharedLibraryRulePersonCell;
  id v3 = -[PXSharedLibraryRulePersonCell initWithFrame:](&v103, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v99 = [(PXSharedLibraryRulePersonCell *)v3 contentView];
    objc_super v5 = objc_alloc_init(PXRoundImageView);
    faceImageView = v4->_faceImageView;
    v4->_faceImageView = &v5->super;

    objc_super v7 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
    [(UIImageView *)v4->_faceImageView setBackgroundColor:v7];

    [(UIImageView *)v4->_faceImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_faceImageView setContentMode:1];
    [v99 addSubview:v4->_faceImageView];
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    plusImageView = v4->_plusImageView;
    v4->_plusImageView = v8;

    [(UIImageView *)v4->_plusImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_plusImageView setContentMode:1];
    [v99 addSubview:v4->_plusImageView];
    objc_initWeak(&location, v4);
    v10 = (void *)MEMORY[0x1E4FB1618];
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __47__PXSharedLibraryRulePersonCell_initWithFrame___block_invoke;
    v100[3] = &unk_1E5DC25C8;
    objc_copyWeak(&v101, &location);
    uint64_t v11 = [v10 colorWithDynamicProvider:v100];
    v12 = (void *)MEMORY[0x1E4FB1830];
    v49 = (void *)v11;
    v105[0] = v11;
    v13 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    v105[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
    v97 = [v12 configurationWithPaletteColors:v14];

    v15 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
    v96 = [v15 configurationByApplyingConfiguration:v97];

    v16 = (void *)MEMORY[0x1E4FB14D0];
    v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle.fill"];
    uint64_t v18 = [v16 systemButtonWithImage:v17 target:v4 action:sel_remove_];
    minusButton = v4->_minusButton;
    v4->_minusButton = (UIButton *)v18;

    [(UIButton *)v4->_minusButton setPreferredSymbolConfiguration:v96 forImageInState:0];
    [(UIButton *)v4->_minusButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = [(UIButton *)v4->_minusButton layer];
    LODWORD(v21) = 1050253722;
    [v20 setShadowOpacity:v21];

    v22 = [(UIButton *)v4->_minusButton layer];
    objc_msgSend(v22, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

    v23 = [(UIButton *)v4->_minusButton layer];
    [v23 setShadowRadius:3.0];

    [(PXSharedLibraryRulePersonCell *)v4 _updateMinusButton];
    [v99 addSubview:v4->_minusButton];
    v95 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
    v24 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle"];
    v25 = [v24 imageWithSymbolConfiguration:v95];
    v26 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    v27 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v94 = objc_msgSend(v25, "px_tintedCircularImageWithColor:backgroundColor:", v26, v27);

    v28 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    minusImageView = v4->_minusImageView;
    v4->_minusImageView = v28;

    [(UIImageView *)v4->_minusImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_minusImageView setImage:v94];
    [(UIImageView *)v4->_minusImageView setHidden:1];
    [v99 addSubview:v4->_minusImageView];
    v98 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28D8], *MEMORY[0x1E4FB27C0], 0x8000);
    v30 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v30;

    [(UILabel *)v4->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_nameLabel setTextAlignment:1];
    v32 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v4->_nameLabel setTextColor:v32];

    [(UILabel *)v4->_nameLabel setNumberOfLines:2];
    [(UILabel *)v4->_nameLabel setFont:v98];
    LODWORD(v33) = 1144766464;
    [(UILabel *)v4->_nameLabel setContentCompressionResistancePriority:1 forAxis:v33];
    [v99 addSubview:v4->_nameLabel];
    v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v34;

    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_subtitleLabel setTextAlignment:1];
    v36 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v4->_subtitleLabel setTextColor:v36];

    [(UILabel *)v4->_subtitleLabel setFont:v98];
    LODWORD(v37) = 1144766464;
    [(UILabel *)v4->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v37];
    [v99 addSubview:v4->_subtitleLabel];
    v48 = (void *)MEMORY[0x1E4F28DC8];
    v93 = [(UIImageView *)v4->_faceImageView topAnchor];
    v92 = [(PXSharedLibraryRulePersonCell *)v4 topAnchor];
    v91 = [v93 constraintEqualToAnchor:v92];
    v104[0] = v91;
    v90 = [(UIImageView *)v4->_faceImageView leadingAnchor];
    v89 = [(PXSharedLibraryRulePersonCell *)v4 leadingAnchor];
    v88 = [v90 constraintEqualToAnchor:v89];
    v104[1] = v88;
    v87 = [(UIImageView *)v4->_faceImageView trailingAnchor];
    v86 = [(PXSharedLibraryRulePersonCell *)v4 trailingAnchor];
    v85 = [v87 constraintEqualToAnchor:v86];
    v104[2] = v85;
    v84 = [(UIImageView *)v4->_faceImageView bottomAnchor];
    v83 = [(PXSharedLibraryRulePersonCell *)v4 bottomAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v104[3] = v82;
    v81 = [(UIImageView *)v4->_plusImageView centerYAnchor];
    v80 = [(UIImageView *)v4->_faceImageView centerYAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v104[4] = v79;
    v78 = [(UIImageView *)v4->_plusImageView centerXAnchor];
    v77 = [(UIImageView *)v4->_faceImageView centerXAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v104[5] = v76;
    v75 = [(UIImageView *)v4->_plusImageView heightAnchor];
    v74 = [v75 constraintEqualToConstant:50.0];
    v104[6] = v74;
    v73 = [(UIImageView *)v4->_plusImageView heightAnchor];
    v72 = [v73 constraintEqualToConstant:50.0];
    v104[7] = v72;
    v71 = [(UIButton *)v4->_minusButton leadingAnchor];
    v70 = [(UIImageView *)v4->_faceImageView leadingAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v104[8] = v69;
    v68 = [(UIButton *)v4->_minusButton topAnchor];
    v67 = [(UIImageView *)v4->_faceImageView topAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v104[9] = v66;
    v65 = [(UIImageView *)v4->_minusImageView leadingAnchor];
    v64 = [(UIImageView *)v4->_faceImageView leadingAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v104[10] = v63;
    v62 = [(UIImageView *)v4->_minusImageView topAnchor];
    v61 = [(UIImageView *)v4->_faceImageView topAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v104[11] = v60;
    v59 = [(UILabel *)v4->_nameLabel topAnchor];
    v58 = [(UIImageView *)v4->_faceImageView bottomAnchor];
    v57 = [v59 constraintEqualToAnchor:v58 constant:5.0];
    v104[12] = v57;
    v56 = [(UILabel *)v4->_nameLabel leadingAnchor];
    v55 = [(UIImageView *)v4->_faceImageView leadingAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v104[13] = v54;
    v53 = [(UILabel *)v4->_nameLabel trailingAnchor];
    v52 = [(UIImageView *)v4->_faceImageView trailingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v104[14] = v51;
    v50 = [(UILabel *)v4->_subtitleLabel topAnchor];
    v38 = [(UILabel *)v4->_nameLabel bottomAnchor];
    v39 = [v50 constraintEqualToAnchor:v38];
    v104[15] = v39;
    v40 = [(UILabel *)v4->_subtitleLabel leadingAnchor];
    v41 = [(UIImageView *)v4->_faceImageView leadingAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v104[16] = v42;
    v43 = [(UILabel *)v4->_subtitleLabel trailingAnchor];
    v44 = [(UIImageView *)v4->_faceImageView trailingAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v104[17] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:18];
    [v48 activateConstraints:v46];

    objc_destroyWeak(&v101);
    objc_destroyWeak(&location);
  }
  return v4;
}

id __47__PXSharedLibraryRulePersonCell_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained tintColor];

  return v2;
}

@end
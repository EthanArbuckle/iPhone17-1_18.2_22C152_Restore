@interface TTRIPopupMenuTableViewCell
+ (Class)containerViewClass;
- (NUIContainerStackView)accessoriesStackView;
- (TTRIPopupMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIButton)menuButton;
- (UILabel)titleLabel;
- (id)buttonTitleAttributes;
- (id)titleFont;
- (void)setAccessoriesStackView:(id)a3;
- (void)setAccessoryTitle:(id)a3;
- (void)setMenuButton:(id)a3;
- (void)setPopupMenu:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TTRIPopupMenuTableViewCell

+ (Class)containerViewClass
{
  return (Class)objc_opt_class();
}

- (id)titleFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v3 = *MEMORY[0x1E4FB28C8];
  v4 = [(TTRIPopupMenuTableViewCell *)self traitCollection];
  v5 = [v2 preferredFontForTextStyle:v3 compatibleWithTraitCollection:v4];

  v6 = [v5 fontDescriptor];
  v7 = [v6 fontDescriptorWithDesign:*MEMORY[0x1E4FB0938]];

  v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:0.0];

  return v8;
}

- (id)buttonTitleAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4FB06F8];
  v2 = [(TTRIPopupMenuTableViewCell *)self titleFont];
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E4FB0700];
  uint64_t v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = [(TTRIPopupMenuTableViewCell *)self titleLabel];
  [v5 setText:v4];

  v6 = [(TTRIPopupMenuTableViewCell *)self titleLabel];
  [v6 sizeToFit];

  id v7 = [(NUITableViewContainerCell *)self containerView];
  [v7 invalidateIntrinsicContentSize];
}

- (void)setAccessoryTitle:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(TTRIPopupMenuTableViewCell *)self buttonTitleAttributes];
  id v10 = (id)[v6 initWithString:v5 attributes:v7];

  v8 = [(TTRIPopupMenuTableViewCell *)self menuButton];
  [v8 setAttributedTitle:v10 forState:0];

  v9 = [(TTRIPopupMenuTableViewCell *)self accessoriesStackView];
  [v9 invalidateIntrinsicContentSize];
}

- (void)setPopupMenu:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRIPopupMenuTableViewCell *)self menuButton];
  [v5 setMenu:v4];

  id v6 = [(TTRIPopupMenuTableViewCell *)self menuButton];
  [v6 setChangesSelectionAsPrimaryAction:1];

  id v7 = [(TTRIPopupMenuTableViewCell *)self menuButton];
  [v7 setHidden:0];

  id v8 = [(TTRIPopupMenuTableViewCell *)self menuButton];
  [(TTRIPopupMenuTableViewCell *)self _setPopupMenuButton:v8];
}

- (TTRIPopupMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)TTRIPopupMenuTableViewCell;
  id v4 = [(NUITableViewContainerCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    id v6 = [(NUITableViewContainerCell *)v4 containerView];
    [v6 setDistribution:4];

    id v7 = objc_alloc(MEMORY[0x1E4FB1930]);
    id v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v9 = [(TTRIPopupMenuTableViewCell *)v5 titleFont];
    [v8 setFont:v9];

    id v10 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v10 setTitleAlignment:3];
    objc_msgSend(v10, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    v12 = [v10 background];
    [v12 setBackgroundColor:v11];

    v13 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v10 primaryAction:0];
    [v13 setShowsMenuAsPrimaryAction:1];
    [v13 setContentHorizontalAlignment:2];
    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v13 setTintColor:v14];

    [v13 setHidden:1];
    [(TTRIPopupMenuTableViewCell *)v5 setMenuButton:v13];
    [(TTRIPopupMenuTableViewCell *)v5 setTitleLabel:v8];
    id v15 = objc_alloc(MEMORY[0x1E4F4BF00]);
    v25[0] = v13;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    v17 = (void *)[v15 initWithArrangedSubviews:v16];

    [v17 setSpacing:8.0];
    [v17 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];
    [(TTRIPopupMenuTableViewCell *)v5 setAccessoriesStackView:v17];
    v18 = [(TTRIPopupMenuTableViewCell *)v5 accessoriesStackView];
    [v18 setBaselineRelativeArrangement:1];

    v19 = [(NUITableViewContainerCell *)v5 containerView];
    [v19 setBaselineRelativeArrangement:1];

    LODWORD(v20) = 1148846080;
    objc_msgSend(v13, "setLayoutSize:withContentPriority:", *MEMORY[0x1E4F4BED8], *(double *)(MEMORY[0x1E4F4BED8] + 8), v20);
    v21 = [(NUITableViewContainerCell *)v5 containerView];
    [v21 addArrangedSubview:v8];

    v22 = [(NUITableViewContainerCell *)v5 containerView];
    [v22 addArrangedSubview:v17];

    -[TTRIPopupMenuTableViewCell setSeparatorInset:](v5, "setSeparatorInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }
  return v5;
}

- (NUIContainerStackView)accessoriesStackView
{
  return self->_accessoriesStackView;
}

- (void)setAccessoriesStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)menuButton
{
  return self->_menuButton;
}

- (void)setMenuButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_accessoriesStackView, 0);
}

@end
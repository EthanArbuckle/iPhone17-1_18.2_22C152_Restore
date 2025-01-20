@interface ICUnsupportedNoteView
- (BOOL)isActionDestructive;
- (ICUnsupportedNoteView)init;
- (ICUnsupportedNoteView)initWithReason:(unint64_t)a3;
- (UIButton)actionButton;
- (UILabel)summaryLabel;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (id)action;
- (id)didTapActionButton;
- (id)summary;
- (id)title;
- (unint64_t)reason;
- (void)createLayout;
- (void)setDidTapActionButton:(id)a3;
@end

@implementation ICUnsupportedNoteView

- (ICUnsupportedNoteView)init
{
  return [(ICUnsupportedNoteView *)self initWithReason:0];
}

- (ICUnsupportedNoteView)initWithReason:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICUnsupportedNoteView;
  v4 = -[ICUnsupportedNoteView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_reason = a3;
    [(ICUnsupportedNoteView *)v4 createLayout];
  }
  return v5;
}

- (UIStackView)stackView
{
  v11[2] = *MEMORY[0x263EF8340];
  stackView = self->_stackView;
  if (!stackView)
  {
    id v4 = objc_alloc(MEMORY[0x263F82BF8]);
    v5 = [(ICUnsupportedNoteView *)self titleLabel];
    v11[0] = v5;
    v6 = [(ICUnsupportedNoteView *)self summaryLabel];
    v11[1] = v6;
    objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    v8 = (UIStackView *)[v4 initWithArrangedSubviews:v7];
    v9 = self->_stackView;
    self->_stackView = v8;

    [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_stackView setAxis:1];
    [(UIStackView *)self->_stackView setAlignment:3];
    [(UIStackView *)self->_stackView setDistribution:3];
    [(UIStackView *)self->_stackView setSpacing:9.0];
    stackView = self->_stackView;
  }

  return stackView;
}

- (id)title
{
  unint64_t v3 = [(ICUnsupportedNoteView *)self reason];
  if (v3 == 1)
  {
    id v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = v4;
    v6 = @"Can’t View Note";
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    id v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = v4;
    v6 = @"Unsupported Note";
  }
  v2 = [v4 localizedStringForKey:v6 value:&stru_26C10E100 table:0];

LABEL_6:

  return v2;
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(ICUnsupportedNoteView *)self title];
    [(UILabel *)self->_titleLabel setText:v6];

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    objc_super v7 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForStyle:symbolicTraits:", *MEMORY[0x263F83628], 2);
    [(UILabel *)self->_titleLabel setFont:v7];

    [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_titleLabel setMaximumContentSizeCategory:*MEMORY[0x263F83418]];
    LODWORD(v8) = 1148846080;
    [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v8];
    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (id)summary
{
  unint64_t v3 = [(ICUnsupportedNoteView *)self reason];
  if (v3 == 1)
  {
    v6 = [MEMORY[0x263F086E0] mainBundle];
    objc_super v7 = v6;
    double v8 = @"This note can’t be viewed because the encryption key wasn’t found in iCloud Keychain. Resetting your end-to-end encrypted data can cause this.";
  }
  else
  {
    if (v3) {
      goto LABEL_10;
    }
    id v4 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 6)
    {
      v6 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v7 = v6;
      double v8 = @"This note uses unsupported features. To view or edit it, upgrade to the latest version of visionOS.";
    }
    else
    {
      v6 = [MEMORY[0x263F086E0] mainBundle];
      if (v5 == 1)
      {
        objc_super v7 = v6;
        double v8 = @"This note uses unsupported features. To view or edit it, upgrade to the latest version of iPadOS.";
      }
      else
      {
        objc_super v7 = v6;
        double v8 = @"This note uses unsupported features. To view or edit it, upgrade to the latest version of iOS.";
      }
    }
  }
  v2 = [v6 localizedStringForKey:v8 value:&stru_26C10E100 table:0];

LABEL_10:

  return v2;
}

- (UILabel)summaryLabel
{
  summaryLabel = self->_summaryLabel;
  if (!summaryLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    uint64_t v5 = self->_summaryLabel;
    self->_summaryLabel = v4;

    [(UILabel *)self->_summaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(ICUnsupportedNoteView *)self summary];
    [(UILabel *)self->_summaryLabel setText:v6];

    [(UILabel *)self->_summaryLabel setTextAlignment:1];
    objc_super v7 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)self->_summaryLabel setTextColor:v7];

    [(UILabel *)self->_summaryLabel setNumberOfLines:0];
    double v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    v9 = objc_msgSend(v8, "ic_fontWithSingleLineA");
    [(UILabel *)self->_summaryLabel setFont:v9];

    [(UILabel *)self->_summaryLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_summaryLabel setMaximumContentSizeCategory:*MEMORY[0x263F83418]];
    LODWORD(v10) = 1148846080;
    [(UILabel *)self->_summaryLabel setContentCompressionResistancePriority:1 forAxis:v10];
    summaryLabel = self->_summaryLabel;
  }

  return summaryLabel;
}

- (id)action
{
  if ([(ICUnsupportedNoteView *)self reason] == 1)
  {
    v2 = [MEMORY[0x263F086E0] mainBundle];
    unint64_t v3 = [v2 localizedStringForKey:@"Delete Note" value:&stru_26C10E100 table:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)isActionDestructive
{
  return [(ICUnsupportedNoteView *)self reason] != 0;
}

- (UIButton)actionButton
{
  if (!self->_actionButton)
  {
    unint64_t v3 = [(ICUnsupportedNoteView *)self action];

    if (v3)
    {
      objc_initWeak(&location, self);
      id v4 = (void *)MEMORY[0x263F823D0];
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __37__ICUnsupportedNoteView_actionButton__block_invoke;
      v18 = &unk_2640B9E88;
      objc_copyWeak(&v19, &location);
      uint64_t v5 = [v4 actionWithHandler:&v15];
      v6 = objc_msgSend(MEMORY[0x263F824F0], "borderlessButtonConfiguration", v15, v16, v17, v18);
      objc_super v7 = [(ICUnsupportedNoteView *)self action];
      [v6 setTitle:v7];

      [v6 setButtonSize:2];
      double v8 = [MEMORY[0x263F824E8] buttonWithConfiguration:v6 primaryAction:v5];
      actionButton = self->_actionButton;
      self->_actionButton = v8;

      [(UIButton *)self->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
      double v10 = [(UIButton *)self->_actionButton titleLabel];
      [v10 setAdjustsFontForContentSizeCategory:1];

      if ([(ICUnsupportedNoteView *)self isActionDestructive]) {
        [MEMORY[0x263F825C8] systemRedColor];
      }
      else {
      v11 = [MEMORY[0x263F825C8] tintColor];
      }
      [(UIButton *)self->_actionButton setTintColor:v11];

      [(UIButton *)self->_actionButton setShowsLargeContentViewer:1];
      LODWORD(v12) = 1148846080;
      [(UIButton *)self->_actionButton setContentCompressionResistancePriority:0 forAxis:v12];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  v13 = self->_actionButton;

  return v13;
}

void __37__ICUnsupportedNoteView_actionButton__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v3 = [WeakRetained didTapActionButton];

  if (v3)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v4 = [v5 didTapActionButton];
    v4[2]();
  }
}

- (void)createLayout
{
  [(ICUnsupportedNoteView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  unint64_t v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [(ICUnsupportedNoteView *)self setBackgroundColor:v3];

  id v4 = [(ICUnsupportedNoteView *)self stackView];
  [(ICUnsupportedNoteView *)self addSubview:v4];

  id v5 = [(ICUnsupportedNoteView *)self stackView];
  objc_msgSend(v5, "ic_addAnchorsToFillSuperview");

  v6 = [(ICUnsupportedNoteView *)self actionButton];

  if (v6)
  {
    objc_super v7 = [(ICUnsupportedNoteView *)self stackView];
    double v8 = [(ICUnsupportedNoteView *)self actionButton];
    [v7 addArrangedSubview:v8];

    id v10 = [(ICUnsupportedNoteView *)self stackView];
    v9 = [(ICUnsupportedNoteView *)self summaryLabel];
    [v10 setCustomSpacing:v9 afterView:16.0];
  }
}

- (unint64_t)reason
{
  return self->_reason;
}

- (id)didTapActionButton
{
  return self->_didTapActionButton;
}

- (void)setDidTapActionButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didTapActionButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
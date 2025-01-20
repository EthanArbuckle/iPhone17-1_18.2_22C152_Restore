@interface ICInvitationViewController
- (BOOL)showsActivityIndicator;
- (ICInvitation)invitation;
- (ICInvitationViewController)init;
- (ICTextBackgroundView)backgroundView;
- (NSDirectionalEdgeInsets)backgroundInsets;
- (SWAttributionView)attributionView;
- (SWHighlight)highlight;
- (UIButton)largeViewButton;
- (UIButton)viewButton;
- (UIImageView)invitationImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)didTapViewButton;
- (void)dealloc;
- (void)setAttributionView:(id)a3;
- (void)setBackgroundInsets:(NSDirectionalEdgeInsets)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDidTapViewButton:(id)a3;
- (void)setHighlight:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setInvitationImageView:(id)a3;
- (void)setLargeViewButton:(id)a3;
- (void)setShowsActivityIndicator:(BOOL)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setViewButton:(id)a3;
- (void)updateButtonConfiguration;
- (void)viewButtonDidTap:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICInvitationViewController

- (ICInvitationViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [(ICInvitationViewController *)self initWithNibName:0 bundle:v3];

  return v4;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)ICInvitationViewController;
  [(ICInvitationViewController *)&v28 viewDidLoad];
  v4 = [MEMORY[0x263F825C8] ICBackgroundColor];
  v5 = [(ICInvitationViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorBackgroundColor");
  v7 = [(ICInvitationViewController *)self backgroundView];
  [v7 setBackgroundColor:v6];

  v8 = (void *)MEMORY[0x263F82818];
  v9 = [(ICInvitationViewController *)self invitationImageView];
  [v9 bounds];
  v10 = [v8 configurationWithPointSize:CGRectGetHeight(v29)];

  v11 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.down.message" withConfiguration:v10];
  v12 = [(ICInvitationViewController *)self invitationImageView];
  [v12 setImage:v11];

  int v13 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
  char v14 = v13;
  if (v13)
  {
    [MEMORY[0x263F825C8] systemGrayColor];
  }
  else
  {
    v2 = [(ICInvitationViewController *)self invitationImageView];
    [v2 tintColor];
  v15 = };
  v16 = [(ICInvitationViewController *)self invitationImageView];
  [v16 setTintColor:v15];

  if ((v14 & 1) == 0)
  {

    v15 = v2;
  }

  v17 = [(ICInvitationViewController *)self titleLabel];
  [v17 setText:&stru_26C10E100];

  v18 = objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorLabelColor");
  v19 = [(ICInvitationViewController *)self titleLabel];
  [v19 setTextColor:v18];

  v20 = [(ICInvitationViewController *)self subtitleLabel];
  [v20 setText:&stru_26C10E100];

  v21 = objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorSecondaryLabelColor");
  v22 = [(ICInvitationViewController *)self subtitleLabel];
  [v22 setTextColor:v21];

  v23 = [(ICInvitationViewController *)self viewButton];
  [v23 _accessibilitySetIsSpeakThisElement:1];

  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    v24 = [(ICInvitationViewController *)self viewButton];
    [v24 setTitleColor:0 forState:0];

    v25 = objc_msgSend(MEMORY[0x263F824F0], "ic_filledTintedButtonConfiguration");
    v26 = [(ICInvitationViewController *)self viewButton];
    [v26 setConfiguration:v25];
  }
  v27 = [(ICInvitationViewController *)self largeViewButton];
  [v27 setIsAccessibilityElement:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICInvitationViewController;
  [(ICNAViewController *)&v4 dealloc];
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
  id v5 = a3;
  v6 = [v5 participantsInfoDescription];
  v7 = [(ICInvitationViewController *)self titleLabel];
  [v7 setText:v6];

  v8 = [v5 joinDescription];
  v9 = [(ICInvitationViewController *)self subtitleLabel];
  [v9 setText:v8];

  v10 = [v5 removeActionTitle];

  v11 = [(ICInvitationViewController *)self attributionView];
  [v11 setMenuTitleForHideAction:v10];

  [(ICInvitationViewController *)self updateButtonConfiguration];
}

- (void)setHighlight:(id)a3
{
  v29[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(ICInvitationViewController *)self attributionView];
  [v6 removeFromSuperview];

  objc_storeStrong((id *)&self->_highlight, a3);
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F17718]);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
    {
      v8 = [v7 traitOverrides];
      [v8 setUserInterfaceStyle:1];
    }
    [v7 setHighlight:v5];
    [v7 setDisplayContext:1];
    [v7 setHorizontalAlignment:2];
    v9 = [(ICInvitationViewController *)self invitation];
    [v9 removeActionTitle];
    v10 = id v28 = v5;
    [v7 setMenuTitleForHideAction:v10];

    v11 = [(ICInvitationViewController *)self view];
    [v11 addSubview:v7];

    [(ICInvitationViewController *)self setAttributionView:v7];
    v22 = (void *)MEMORY[0x263F08938];
    v26 = [v7 leadingAnchor];
    v27 = [(ICInvitationViewController *)self view];
    v25 = [v27 safeAreaLayoutGuide];
    v24 = [v25 leadingAnchor];
    v23 = [v26 constraintEqualToAnchor:v24];
    v29[0] = v23;
    v21 = [v7 trailingAnchor];
    v12 = [(ICInvitationViewController *)self view];
    int v13 = [v12 safeAreaLayoutGuide];
    char v14 = [v13 trailingAnchor];
    v15 = [v21 constraintEqualToAnchor:v14];
    v29[1] = v15;
    v16 = [v7 topAnchor];
    v17 = [(ICInvitationViewController *)self invitationImageView];
    v18 = [v17 bottomAnchor];
    v19 = [v16 constraintEqualToAnchor:v18 constant:12.0];
    v29[2] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
    [v22 activateConstraints:v20];

    id v5 = v28;
  }
}

- (void)setShowsActivityIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsActivityIndicator = a3;
  id v5 = [(ICInvitationViewController *)self viewButton];
  v6 = [v5 configuration];
  id v9 = (id)[v6 copy];

  [v9 setShowsActivityIndicator:v3];
  id v7 = [(ICInvitationViewController *)self viewButton];
  [v7 setConfiguration:v9];

  v8 = [(ICInvitationViewController *)self viewButton];
  [v8 setEnabled:v3 ^ 1];
}

- (void)updateButtonConfiguration
{
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
    objc_msgSend(MEMORY[0x263F824F0], "ic_filledTintedButtonConfiguration");
  }
  else {
    objc_msgSend(MEMORY[0x263F824F0], "ic_plainButtonConfiguration");
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setImagePadding:8.0];
  BOOL v3 = [(ICInvitationViewController *)self invitation];
  objc_super v4 = [v3 joinActionTitle];
  [v6 setTitle:v4];

  id v5 = [(ICInvitationViewController *)self viewButton];
  [v5 setConfiguration:v6];
}

- (void)viewButtonDidTap:(id)a3
{
  objc_super v4 = [(ICInvitationViewController *)self didTapViewButton];

  if (v4)
  {
    id v5 = [(ICInvitationViewController *)self didTapViewButton];
    v5[2]();
  }
}

- (ICInvitation)invitation
{
  return self->_invitation;
}

- (SWHighlight)highlight
{
  return self->_highlight;
}

- (BOOL)showsActivityIndicator
{
  return self->_showsActivityIndicator;
}

- (NSDirectionalEdgeInsets)backgroundInsets
{
  double top = self->_backgroundInsets.top;
  double leading = self->_backgroundInsets.leading;
  double bottom = self->_backgroundInsets.bottom;
  double trailing = self->_backgroundInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setBackgroundInsets:(NSDirectionalEdgeInsets)a3
{
  self->_backgroundInsets = a3;
}

- (id)didTapViewButton
{
  return self->_didTapViewButton;
}

- (void)setDidTapViewButton:(id)a3
{
}

- (ICTextBackgroundView)backgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);

  return (ICTextBackgroundView *)WeakRetained;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIImageView)invitationImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invitationImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setInvitationImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIButton)viewButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewButton);

  return (UIButton *)WeakRetained;
}

- (void)setViewButton:(id)a3
{
}

- (UIButton)largeViewButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_largeViewButton);

  return (UIButton *)WeakRetained;
}

- (void)setLargeViewButton:(id)a3
{
}

- (SWAttributionView)attributionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attributionView);

  return (SWAttributionView *)WeakRetained;
}

- (void)setAttributionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attributionView);
  objc_destroyWeak((id *)&self->_largeViewButton);
  objc_destroyWeak((id *)&self->_viewButton);
  objc_destroyWeak((id *)&self->_subtitleLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_invitationImageView);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong(&self->_didTapViewButton, 0);
  objc_storeStrong((id *)&self->_highlight, 0);

  objc_storeStrong((id *)&self->_invitation, 0);
}

@end
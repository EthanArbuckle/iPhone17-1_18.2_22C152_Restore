@interface TPPillView
- (NSLayoutConstraint)stackViewBottomAnchorLayoutConstraint;
- (NSLayoutConstraint)stackViewLeftAnchorLayoutConstraint;
- (NSLayoutConstraint)stackViewRightAnchorLayoutConstraint;
- (NSLayoutConstraint)stackViewTopAnchorLayoutConstraint;
- (NSString)badgeText;
- (NSString)title;
- (TPBadgeView)badgeView;
- (TPPillView)initWithTitle:(id)a3 frame:(CGRect)a4;
- (TPPillView)initWithTitle:(id)a3 frame:(CGRect)a4 theme:(unint64_t)a5;
- (TPPillViewDelegate)delegate;
- (UILabel)textLabel;
- (UIStackView)stackView;
- (UITapGestureRecognizer)gestureRecognizer;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (unint64_t)_controlEventsForActionTriggered;
- (unint64_t)theme;
- (void)commonInit;
- (void)handleTap:(id)a3;
- (void)loadConstraints;
- (void)setBadgeText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStackViewBottomAnchorLayoutConstraint:(id)a3;
- (void)setStackViewLeftAnchorLayoutConstraint:(id)a3;
- (void)setStackViewRightAnchorLayoutConstraint:(id)a3;
- (void)setStackViewTopAnchorLayoutConstraint:(id)a3;
- (void)setTheme:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)unloadConstraints;
- (void)updateFonts;
- (void)updateTheme;
@end

@implementation TPPillView

- (TPPillView)initWithTitle:(id)a3 frame:(CGRect)a4
{
  return -[TPPillView initWithTitle:frame:theme:](self, "initWithTitle:frame:theme:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (TPPillView)initWithTitle:(id)a3 frame:(CGRect)a4 theme:(unint64_t)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPPillView;
  v12 = -[TPControl initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v12->_theme = a5;
    [(UILabel *)v12->_textLabel setText:v11];
    [(TPPillView *)v13 updateTheme];
  }

  return v13;
}

- (void)commonInit
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)TPPillView;
  [(TPControl *)&v15 commonInit];
  v3 = [(TPPillView *)self layer];
  [v3 setCornerRadius:12.5];

  v4 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleTap_];
  gestureRecognizer = self->_gestureRecognizer;
  self->_gestureRecognizer = v4;

  [(TPPillView *)self addGestureRecognizer:self->_gestureRecognizer];
  v6 = [[TPBadgeView alloc] initWithTitle:&stru_1F1E807C8];
  badgeView = self->_badgeView;
  self->_badgeView = v6;

  [(TPBadgeView *)self->_badgeView setSizeCategory:1];
  v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  textLabel = self->_textLabel;
  self->_textLabel = v8;

  id v10 = objc_alloc(MEMORY[0x1E4FB1C60]);
  id v11 = self->_textLabel;
  v16[0] = self->_badgeView;
  v16[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v13 = (UIStackView *)[v10 initWithArrangedSubviews:v12];
  stackView = self->_stackView;
  self->_stackView = v13;

  [(UIStackView *)self->_stackView setAlignment:3];
  [(UIStackView *)self->_stackView setAxis:0];
  [(UIStackView *)self->_stackView setDistribution:3];
  -[UIStackView setLayoutMargins:](self->_stackView, "setLayoutMargins:", 4.0, 13.0, 4.0, 13.0);
  [(UIStackView *)self->_stackView setLayoutMarginsRelativeArrangement:1];
  [(UIStackView *)self->_stackView setSpacing:6.0];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TPPillView *)self addSubview:self->_stackView];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    char v5 = objc_opt_respondsToSelector();
    v6 = [(TPPillView *)self gestureRecognizer];
    [v6 setEnabled:(v5 & 1) == 0];

    uint64_t v7 = v5 & 1;
    [(TPPillView *)self setContextMenuEnabled:v7];
    [(TPPillView *)self setContextMenuIsPrimary:v7];
  }
}

- (void)loadConstraints
{
  v23.receiver = self;
  v23.super_class = (Class)TPPillView;
  [(TPControl *)&v23 loadConstraints];
  v3 = [(TPPillView *)self stackView];
  v4 = [v3 leftAnchor];
  char v5 = [(TPPillView *)self leftAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];

  [v6 setActive:1];
  uint64_t v7 = NSStringFromSelector(sel_stackViewLeftAnchorLayoutConstraint);
  [v6 setIdentifier:v7];

  [(TPPillView *)self setStackViewLeftAnchorLayoutConstraint:v6];
  v8 = [(TPPillView *)self rightAnchor];
  v9 = [(TPPillView *)self stackView];
  id v10 = [v9 rightAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];

  [v11 setActive:1];
  v12 = NSStringFromSelector(sel_stackViewRightAnchorLayoutConstraint);
  [v11 setIdentifier:v12];

  [(TPPillView *)self setStackViewRightAnchorLayoutConstraint:v11];
  v13 = [(TPPillView *)self stackView];
  v14 = [v13 topAnchor];
  objc_super v15 = [(TPPillView *)self topAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];

  [v16 setActive:1];
  v17 = NSStringFromSelector(sel_stackViewTopAnchorLayoutConstraint);
  [v16 setIdentifier:v17];

  [(TPPillView *)self setStackViewTopAnchorLayoutConstraint:v16];
  v18 = [(TPPillView *)self stackView];
  v19 = [v18 bottomAnchor];
  v20 = [(TPPillView *)self bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];

  [v21 setActive:1];
  v22 = NSStringFromSelector(sel_stackViewBottomAnchorLayoutConstraint);
  [v21 setIdentifier:v22];

  [(TPPillView *)self setStackViewBottomAnchorLayoutConstraint:v21];
}

- (void)unloadConstraints
{
  v3 = [(TPPillView *)self stackViewLeftAnchorLayoutConstraint];
  [v3 setActive:0];

  [(TPPillView *)self setStackViewLeftAnchorLayoutConstraint:0];
  v4 = [(TPPillView *)self stackViewRightAnchorLayoutConstraint];
  [v4 setActive:0];

  [(TPPillView *)self setStackViewRightAnchorLayoutConstraint:0];
  char v5 = [(TPPillView *)self stackViewTopAnchorLayoutConstraint];
  [v5 setActive:0];

  [(TPPillView *)self setStackViewTopAnchorLayoutConstraint:0];
  v6 = [(TPPillView *)self stackViewBottomAnchorLayoutConstraint];
  [v6 setActive:0];

  [(TPPillView *)self setStackViewBottomAnchorLayoutConstraint:0];
  v7.receiver = self;
  v7.super_class = (Class)TPPillView;
  [(TPControl *)&v7 unloadConstraints];
}

- (void)updateFonts
{
  v5.receiver = self;
  v5.super_class = (Class)TPPillView;
  [(TPControl *)&v5 updateFonts];
  v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
  v4 = [(TPPillView *)self textLabel];
  [v4 setFont:v3];
}

- (void)updateTheme
{
  switch([(TPPillView *)self theme])
  {
    case 0uLL:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "_tp_defaultPillColor");
      [(TPPillView *)self setBackgroundColor:v3];

      v4 = [(TPPillView *)self badgeView];
      [v4 setTheme:0];

      uint64_t v5 = [MEMORY[0x1E4FB1618] dynamicLabelColor];
      goto LABEL_6;
    case 1uLL:
      v6 = objc_msgSend(MEMORY[0x1E4FB1618], "_tp_bluePillColor");
      [(TPPillView *)self setBackgroundColor:v6];

      objc_super v7 = [(TPPillView *)self badgeView];
      v8 = v7;
      uint64_t v9 = 3;
      goto LABEL_5;
    case 2uLL:
      id v10 = objc_msgSend(MEMORY[0x1E4FB1618], "_tp_greenPillColor");
      [(TPPillView *)self setBackgroundColor:v10];

      objc_super v7 = [(TPPillView *)self badgeView];
      v8 = v7;
      uint64_t v9 = 4;
LABEL_5:
      [v7 setTheme:v9];

      uint64_t v5 = [MEMORY[0x1E4FB1618] whiteColor];
LABEL_6:
      id v17 = (id)v5;
      id v11 = [(TPPillView *)self textLabel];
      [v11 setTextColor:v17];

      goto LABEL_11;
    case 3uLL:
      v12 = [MEMORY[0x1E4FB1618] clearColor];
      [(TPPillView *)self setBackgroundColor:v12];

      v13 = [(TPPillView *)self badgeView];
      [v13 setTheme:8];

      v14 = [(TPPillView *)self badgeView];
      [v14 setSizeCategory:3];

      objc_super v15 = [(TPPillView *)self textLabel];
      [v15 setHidden:1];

      if (+[TPUIConfiguration screenSize]) {
        double v16 = 10.0;
      }
      else {
        double v16 = 5.0;
      }
      id v17 = [(TPPillView *)self stackView];
      objc_msgSend(v17, "setLayoutMargins:", v16, v16, v16, v16);
LABEL_11:

      break;
    default:
      return;
  }
}

- (void)handleTap:(id)a3
{
  if ([a3 state] == 3)
  {
    v4 = [(TPPillView *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(TPPillView *)self delegate];
      [v6 pillViewWasTapped:self];
    }
  }
}

- (NSString)badgeText
{
  v2 = [(TPPillView *)self badgeView];
  v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setBadgeText:(id)a3
{
  id v7 = a3;
  v4 = [(TPPillView *)self badgeView];
  id v5 = [v4 title];

  if (v5 != v7)
  {
    id v6 = [(TPPillView *)self badgeView];
    [v6 setTitle:v7];
  }
}

- (void)setTheme:(unint64_t)a3
{
  if (self->_theme != a3)
  {
    self->_theme = a3;
    [(TPPillView *)self updateTheme];
  }
}

- (NSString)title
{
  v2 = [(TPPillView *)self textLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v9 = a3;
  v4 = [(TPPillView *)self textLabel];
  id v5 = [v4 text];
  char v6 = [v5 isEqualToString:v9];

  if ((v6 & 1) == 0)
  {
    id v7 = [(TPPillView *)self textLabel];
    [v7 setText:v9];

    v8 = [(TPPillView *)self textLabel];
    [v8 sizeToFit];
  }
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__TPPillView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v6[3] = &unk_1E647C330;
  v6[4] = self;
  v4 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];
  return v4;
}

id __68__TPPillView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0
    || ([*(id *)(a1 + 32) delegate],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 menuForPillView:*(void *)(a1 + 32)],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    id v5 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F1E807C8 children:MEMORY[0x1E4F1CBF0]];
  }
  return v5;
}

- (TPPillViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPPillViewDelegate *)WeakRetained;
}

- (unint64_t)theme
{
  return self->_theme;
}

- (TPBadgeView)badgeView
{
  return self->_badgeView;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UITapGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (NSLayoutConstraint)stackViewBottomAnchorLayoutConstraint
{
  return self->_stackViewBottomAnchorLayoutConstraint;
}

- (void)setStackViewBottomAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewLeftAnchorLayoutConstraint
{
  return self->_stackViewLeftAnchorLayoutConstraint;
}

- (void)setStackViewLeftAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewRightAnchorLayoutConstraint
{
  return self->_stackViewRightAnchorLayoutConstraint;
}

- (void)setStackViewRightAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewTopAnchorLayoutConstraint
{
  return self->_stackViewTopAnchorLayoutConstraint;
}

- (void)setStackViewTopAnchorLayoutConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewTopAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewRightAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewLeftAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewBottomAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
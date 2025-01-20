@interface VSUIActionStatusView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)activityView;
- (VSUIActionStatusView)initWithCoder:(id)a3;
- (VSUIActionStatusView)initWithFrame:(CGRect)a3;
- (VSUIActionStatusViewDelegate)delegate;
- (_VSUIActionStatusErrorView)errorView;
- (void)_setUpViews;
- (void)_updateAcitivityViewSubviewWithDelegateProvidedView;
- (void)progressStateMachine:(id)a3 didTransitionToState:(unint64_t)a4 fromState:(unint64_t)a5 forEvent:(unint64_t)a6;
- (void)progressStateMachine:(id)a3 ignoredEvent:(unint64_t)a4;
- (void)resetState;
- (void)setActivityView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorView:(id)a3;
@end

@implementation VSUIActionStatusView

- (VSUIActionStatusView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSUIActionStatusView;
  v3 = -[VSUIActionStatusView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VSUIActionStatusView *)v3 _setUpViews];
  }
  return v4;
}

- (VSUIActionStatusView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSUIActionStatusView;
  v3 = [(VSUIActionStatusView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(VSUIActionStatusView *)v3 _setUpViews];
  }
  return v4;
}

- (void)resetState
{
  v3 = [(VSUIActionStatusView *)self activityView];
  [v3 setHidden:1];

  id v4 = [(VSUIActionStatusView *)self errorView];
  [v4 setHidden:1];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  [(VSUIActionStatusView *)self _updateAcitivityViewSubviewWithDelegateProvidedView];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v6 = [(VSUIActionStatusView *)self errorView];
  char v7 = [v6 isHidden];

  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)VSUIActionStatusView;
    -[VSUIActionStatusView sizeThatFits:](&v15, sel_sizeThatFits_, width, height);
  }
  else
  {
    v10 = [(VSUIActionStatusView *)self errorView];
    objc_msgSend(v10, "sizeThatFits:", width, height);
    double v12 = v11;
    double v14 = v13;

    double v8 = v12;
    double v9 = v14;
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)progressStateMachine:(id)a3 didTransitionToState:(unint64_t)a4 fromState:(unint64_t)a5 forEvent:(unint64_t)a6
{
  id v9 = a3;
  id v18 = v9;
  switch(a4)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      v10 = [(VSUIActionStatusView *)self activityView];
      double v11 = v10;
      uint64_t v12 = 1;
      goto LABEL_4;
    case 0uLL:
      double v13 = [(VSUIActionStatusView *)self activityView];
      [v13 setHidden:1];

      double v14 = [(VSUIActionStatusView *)self errorView];
      objc_super v15 = v14;
      if (a6 != 3) {
        goto LABEL_9;
      }
      uint64_t v16 = 0;
      goto LABEL_10;
    case 1uLL:
    case 2uLL:
      v10 = [(VSUIActionStatusView *)self activityView];
      double v11 = v10;
      uint64_t v12 = 0;
LABEL_4:
      [v10 setHidden:v12];

      goto LABEL_8;
    case 3uLL:
      v17 = [(VSUIActionStatusView *)self activityView];
      [v17 setHidden:a6 != 2];

LABEL_8:
      double v14 = [(VSUIActionStatusView *)self errorView];
      objc_super v15 = v14;
LABEL_9:
      uint64_t v16 = 1;
LABEL_10:
      [v14 setHidden:v16];

      id v9 = v18;
      break;
    default:
      break;
  }
}

- (void)progressStateMachine:(id)a3 ignoredEvent:(unint64_t)a4
{
  v5 = (void *)*MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
    -[VSUIActionStatusView progressStateMachine:ignoredEvent:](v5, a4);
  }
}

- (void)_setUpViews
{
  v31[8] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F1C550] systemGray5Color];
  id v4 = [v3 colorWithAlphaComponent:0.5];
  [(VSUIActionStatusView *)self setBackgroundColor:v4];

  v5 = objc_opt_new();
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setHidden:1];
  [(VSUIActionStatusView *)self addSubview:v5];
  [(VSUIActionStatusView *)self setActivityView:v5];
  objc_super v6 = objc_opt_new();
  [v6 setHidden:1];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VSUIActionStatusView *)self addSubview:v6];
  [(VSUIActionStatusView *)self setErrorView:v6];
  v21 = (void *)MEMORY[0x263F08938];
  v30 = [v5 heightAnchor];
  v29 = [v30 constraintEqualToConstant:20.0];
  v31[0] = v29;
  v28 = [v5 widthAnchor];
  v27 = [v28 constraintEqualToConstant:20.0];
  v31[1] = v27;
  v26 = [v5 centerXAnchor];
  v25 = [(VSUIActionStatusView *)self centerXAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v31[2] = v24;
  v23 = [v5 centerYAnchor];
  v22 = [(VSUIActionStatusView *)self centerYAnchor];
  v20 = [v23 constraintEqualToAnchor:v22];
  v31[3] = v20;
  v19 = [v6 topAnchor];
  id v18 = [(VSUIActionStatusView *)self topAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v31[4] = v17;
  uint64_t v16 = [v6 bottomAnchor];
  objc_super v15 = [(VSUIActionStatusView *)self bottomAnchor];
  char v7 = [v16 constraintEqualToAnchor:v15];
  v31[5] = v7;
  double v8 = [v6 leadingAnchor];
  id v9 = [(VSUIActionStatusView *)self leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v31[6] = v10;
  double v11 = [v6 trailingAnchor];
  uint64_t v12 = [(VSUIActionStatusView *)self trailingAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];
  v31[7] = v13;
  double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:8];
  [v21 activateConstraints:v14];
}

- (void)_updateAcitivityViewSubviewWithDelegateProvidedView
{
  v20[4] = *MEMORY[0x263EF8340];
  v3 = [(VSUIActionStatusView *)self delegate];
  id v4 = [v3 progressViewController];
  v5 = [v4 view];

  if (v5)
  {
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 removeFromSuperview];
    [(UIView *)self->_activityView addSubview:v5];
    objc_super v15 = (void *)MEMORY[0x263F08938];
    v19 = [v5 leadingAnchor];
    id v18 = [(UIView *)self->_activityView leadingAnchor];
    v17 = [v19 constraintEqualToAnchor:v18];
    v20[0] = v17;
    uint64_t v16 = [v5 trailingAnchor];
    objc_super v6 = [(UIView *)self->_activityView trailingAnchor];
    char v7 = [v16 constraintEqualToAnchor:v6];
    v20[1] = v7;
    double v8 = [v5 topAnchor];
    id v9 = [(UIView *)self->_activityView topAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v20[2] = v10;
    double v11 = [v5 bottomAnchor];
    uint64_t v12 = [(UIView *)self->_activityView bottomAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    v20[3] = v13;
    double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];
    [v15 activateConstraints:v14];
  }
}

- (VSUIActionStatusViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSUIActionStatusViewDelegate *)WeakRetained;
}

- (UIView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
}

- (_VSUIActionStatusErrorView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)progressStateMachine:(void *)a1 ignoredEvent:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = NSNumber;
  id v4 = a1;
  v5 = [v3 numberWithUnsignedInteger:a2];
  int v6 = 138412290;
  char v7 = v5;
  _os_log_error_impl(&dword_22F0E9000, v4, OS_LOG_TYPE_ERROR, "progressStateMachine ignoredEvent:%@", (uint8_t *)&v6, 0xCu);
}

@end
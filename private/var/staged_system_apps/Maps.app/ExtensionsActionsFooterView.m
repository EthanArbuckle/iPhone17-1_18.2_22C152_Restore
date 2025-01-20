@interface ExtensionsActionsFooterView
- (ExtensionsActionsFooterView)initWithCoder:(id)a3;
- (ExtensionsActionsFooterView)initWithFrame:(CGRect)a3;
- (NSString)openAppButtonTitle;
- (id)didTapOpenAppButton;
- (void)_commonInit;
- (void)setActions:(id)a3;
- (void)setDidTapOpenAppButton:(id)a3;
- (void)setOpenAppButtonTitle:(id)a3;
@end

@implementation ExtensionsActionsFooterView

- (ExtensionsActionsFooterView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExtensionsActionsFooterView;
  v3 = [(ExtensionsActionsFooterView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ExtensionsActionsFooterView *)v3 _commonInit];
  }
  return v4;
}

- (ExtensionsActionsFooterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExtensionsActionsFooterView;
  v3 = -[ExtensionsActionsFooterView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ExtensionsActionsFooterView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  stackView = self->_stackView;
  self->_stackView = v3;

  [(UIStackView *)self->_stackView setAxis:1];
  [(ExtensionsActionsFooterView *)self addSubview:self->_stackView];
  v5 = objc_alloc_init(ExtensionsActionView);
  openAppView = self->_openAppView;
  self->_openAppView = v5;

  [(ExtensionsActionView *)self->_openAppView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [(UIStackView *)self->_stackView _maps_constraintsForCenteringInView:self];
  +[NSLayoutConstraint activateConstraints:v7];

  [(ExtensionsActionsFooterView *)self setActions:&__NSArray0__struct];
}

- (void)setActions:(id)a3
{
  v4 = sub_100099700(a3, &stru_1012EBE18);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = [(UIStackView *)self->_stackView arrangedSubviews];
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(ExtensionsActionView **)(*((void *)&v21 + 1) + 8 * i) != self->_openAppView) {
          -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:");
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v10);
        }
        -[UIStackView insertArrangedSubview:atIndex:](self->_stackView, "insertArrangedSubview:atIndex:", *(void *)(*((void *)&v17 + 1) + 8 * (void)j), (char *)j + v13, (void)v17);
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      v13 += (uint64_t)j;
    }
    while (v12);
  }

  v16 = [(ExtensionsActionView *)self->_openAppView superview];

  if (!v16) {
    [(UIStackView *)self->_stackView addArrangedSubview:self->_openAppView];
  }
}

- (NSString)openAppButtonTitle
{
  return [(ExtensionsActionView *)self->_openAppView buttonTitle];
}

- (void)setOpenAppButtonTitle:(id)a3
{
}

- (id)didTapOpenAppButton
{
  return [(ExtensionsActionView *)self->_openAppView didTapButton];
}

- (void)setDidTapOpenAppButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openAppView, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
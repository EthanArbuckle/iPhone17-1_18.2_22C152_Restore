@interface TwoButtonContainerHeaderView
- (TwoButtonContainerHeaderView)initWithAdditionalCardButtonType:(unint64_t)a3 tintColor:(id)a4 buttonMenu:(id)a5;
- (id)quickActionButtonView;
- (void)_customInitForSecondButton;
@end

@implementation TwoButtonContainerHeaderView

- (TwoButtonContainerHeaderView)initWithAdditionalCardButtonType:(unint64_t)a3 tintColor:(id)a4 buttonMenu:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TwoButtonContainerHeaderView;
  v10 = [(ContainerHeaderView *)&v15 initWithCardButtonType:0 cardButtonTintColor:v8];
  if (v10)
  {
    v11 = (CardButtonConfiguration *)objc_opt_new();
    [(CardButtonConfiguration *)v11 setType:a3];
    [(CardButtonConfiguration *)v11 setTintColor:v8];
    buttonConfig = v10->_buttonConfig;
    v10->_buttonConfig = v11;
    v13 = v11;

    objc_storeStrong((id *)&v10->_quickActionButtonMenu, a5);
    [(TwoButtonContainerHeaderView *)v10 setAccessibilityIdentifier:@"TwoButtonContainerHeader"];
    [(TwoButtonContainerHeaderView *)v10 _customInitForSecondButton];
  }

  return v10;
}

- (id)quickActionButtonView
{
  return self->_quickActionButtonView;
}

- (void)_customInitForSecondButton
{
  v3 = [[CardButton alloc] initWithConfiguration:self->_buttonConfig];
  quickActionButtonView = self->_quickActionButtonView;
  self->_quickActionButtonView = v3;

  [(CardButton *)self->_quickActionButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CardButton *)self->_quickActionButtonView setMenu:self->_quickActionButtonMenu];
  [(TwoButtonContainerHeaderView *)self addSubview:self->_quickActionButtonView];
  v5 = [(CardButton *)self->_quickActionButtonView trailingAnchor];
  v6 = [(TwoButtonContainerHeaderView *)self trailingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  v13[0] = v7;
  id v8 = [(CardButton *)self->_quickActionButtonView centerYAnchor];
  id v9 = [(ContainerHeaderView *)self buttonView];
  v10 = [v9 centerYAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v13[1] = v11;
  v12 = +[NSArray arrayWithObjects:v13 count:2];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickActionButtonMenu, 0);
  objc_storeStrong((id *)&self->_buttonConfig, 0);

  objc_storeStrong((id *)&self->_quickActionButtonView, 0);
}

@end
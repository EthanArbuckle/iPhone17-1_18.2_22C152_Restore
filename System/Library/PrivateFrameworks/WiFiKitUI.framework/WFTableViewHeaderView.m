@interface WFTableViewHeaderView
- (BOOL)animating;
- (NSString)title;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIListContentView)listContentView;
- (WFTableViewHeaderView)initWithReuseIdentifier:(id)a3;
- (void)_configureContents;
- (void)setActivityIndicatorView:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setListContentView:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFTableViewHeaderView

- (WFTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFTableViewHeaderView;
  v3 = [(WFTableViewHeaderView *)&v8 initWithReuseIdentifier:a3];
  v4 = [MEMORY[0x263F82918] groupedHeaderConfiguration];
  [v4 setText:&stru_26D8F6070];
  v5 = (void *)[objc_alloc(MEMORY[0x263F82920]) initWithConfiguration:v4];
  [(WFTableViewHeaderView *)v3 setListContentView:v5];

  id v6 = objc_alloc_init(MEMORY[0x263F823E8]);
  [(WFTableViewHeaderView *)v3 setActivityIndicatorView:v6];

  [(WFTableViewHeaderView *)v3 _configureContents];
  return v3;
}

- (void)setTitle:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = [(WFTableViewHeaderView *)self listContentView];
  id v8 = [v5 configuration];

  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = &stru_26D8F6070;
  }
  [v8 setText:v6];

  v7 = [(WFTableViewHeaderView *)self listContentView];
  [v7 setConfiguration:v8];
}

- (NSString)title
{
  v2 = [(WFTableViewHeaderView *)self contentConfiguration];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  self->_animating = a3;
  v4 = [(WFTableViewHeaderView *)self activityIndicatorView];
  id v5 = v4;
  if (v3) {
    [v4 startAnimating];
  }
  else {
    [v4 stopAnimating];
  }
}

- (void)_configureContents
{
  v46[6] = *MEMORY[0x263EF8340];
  BOOL v3 = [(WFTableViewHeaderView *)self listContentView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(WFTableViewHeaderView *)self activityIndicatorView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(WFTableViewHeaderView *)self contentView];
  id v6 = [(WFTableViewHeaderView *)self listContentView];
  [v5 addSubview:v6];

  v7 = [(WFTableViewHeaderView *)self contentView];
  id v8 = [(WFTableViewHeaderView *)self activityIndicatorView];
  [v7 addSubview:v8];

  v31 = (void *)MEMORY[0x263F08938];
  v45 = [(WFTableViewHeaderView *)self listContentView];
  v43 = [v45 leadingAnchor];
  v44 = [(WFTableViewHeaderView *)self contentView];
  v42 = [v44 leadingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v46[0] = v41;
  v40 = [(WFTableViewHeaderView *)self listContentView];
  v38 = [v40 topAnchor];
  v39 = [(WFTableViewHeaderView *)self contentView];
  v37 = [v39 topAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v46[1] = v36;
  v35 = [(WFTableViewHeaderView *)self listContentView];
  v33 = [v35 trailingAnchor];
  v34 = [(WFTableViewHeaderView *)self contentView];
  v32 = [v34 trailingAnchor];
  v30 = [v33 constraintEqualToAnchor:v32];
  v46[2] = v30;
  v29 = [(WFTableViewHeaderView *)self listContentView];
  v27 = [v29 bottomAnchor];
  v28 = [(WFTableViewHeaderView *)self contentView];
  v26 = [v28 bottomAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v46[3] = v25;
  v24 = [(WFTableViewHeaderView *)self activityIndicatorView];
  v21 = [v24 leadingAnchor];
  v23 = [(WFTableViewHeaderView *)self listContentView];
  v22 = [v23 textLayoutGuide];
  v9 = [v22 trailingAnchor];
  v10 = [v21 constraintEqualToAnchor:v9 constant:7.5];
  v46[4] = v10;
  v11 = [(WFTableViewHeaderView *)self activityIndicatorView];
  v12 = [v11 centerYAnchor];
  v13 = [(WFTableViewHeaderView *)self listContentView];
  v14 = [v13 textLayoutGuide];
  v15 = [v14 centerYAnchor];
  v16 = [v12 constraintEqualToAnchor:v15];
  v46[5] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:6];
  [v31 activateConstraints:v17];

  v18 = [(WFTableViewHeaderView *)self activityIndicatorView];
  [v18 setActivityIndicatorViewStyle:100];

  LODWORD(v18) = [(WFTableViewHeaderView *)self animating];
  v19 = [(WFTableViewHeaderView *)self activityIndicatorView];
  v20 = v19;
  if (v18) {
    [v19 startAnimating];
  }
  else {
    [v19 stopAnimating];
  }
}

- (BOOL)animating
{
  return self->_animating;
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (void)setListContentView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
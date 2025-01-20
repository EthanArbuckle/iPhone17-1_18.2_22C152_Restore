@interface HomeSearchStatusOutlineCell
- (HomeSearchStatusOutlineCell)initWithFrame:(CGRect)a3;
- (HomeSearchStatusOutlineCellModel)cellModel;
- (void)_addRAPButton;
- (void)_didTapOnRAPButton;
- (void)_removeRAPButton;
- (void)_updateFromModel;
- (void)prepareForReuse;
- (void)setCellModel:(id)a3;
@end

@implementation HomeSearchStatusOutlineCell

- (HomeSearchStatusOutlineCell)initWithFrame:(CGRect)a3
{
  v57.receiver = self;
  v57.super_class = (Class)HomeSearchStatusOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v57, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    stackView = v3->_stackView;
    v3->_stackView = v4;

    [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView setAxis:1];
    [(UIStackView *)v3->_stackView setDistribution:0];
    [(UIStackView *)v3->_stackView setAlignment:1];
    v6 = [(HomeSearchStatusOutlineCell *)v3 contentView];
    [v6 addSubview:v3->_stackView];

    id v7 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v11 = [v7 initWithFrame:CGRectZero.origin.x, y, width, height];
    errorLabel = v3->_errorLabel;
    v3->_errorLabel = v11;

    [(UILabel *)v3->_errorLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_errorLabel setNumberOfLines:0];
    v13 = +[UIFont system17];
    [(UILabel *)v3->_errorLabel setFont:v13];

    v14 = +[UIColor secondaryLabelColor];
    [(UILabel *)v3->_errorLabel setTextColor:v14];

    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_errorLabel];
    v15 = [objc_alloc((Class)UIActivityIndicatorView) initWithFrame:CGRectZero.origin.x, y, width, height];
    loadingIndicator = v3->_loadingIndicator;
    v3->_loadingIndicator = v15;

    [(UIActivityIndicatorView *)v3->_loadingIndicator setActivityIndicatorViewStyle:100];
    [(UIActivityIndicatorView *)v3->_loadingIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = +[UIColor blackColor];
    [(UIActivityIndicatorView *)v3->_loadingIndicator setColor:v17];

    v18 = [(HomeSearchStatusOutlineCell *)v3 contentView];
    [v18 addSubview:v3->_loadingIndicator];

    [(UIActivityIndicatorView *)v3->_loadingIndicator setHidesWhenStopped:0];
    [(UIActivityIndicatorView *)v3->_loadingIndicator startAnimating];
    v19 = +[UIButtonConfiguration plainButtonConfiguration];
    v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"Add a Missing Place" value:@"localized string not found" table:0];
    v56 = v19;
    [v19 setTitle:v21];

    uint64_t v22 = +[UIButton buttonWithType:1];
    rapButton = v3->_rapButton;
    v3->_rapButton = (UIButton *)v22;

    [(UIButton *)v3->_rapButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v3->_rapButton addTarget:v3 action:"_didTapOnRAPButton" forControlEvents:64];
    [(UIButton *)v3->_rapButton setConfiguration:v19];
    v54 = [(UIStackView *)v3->_stackView topAnchor];
    v55 = [(HomeSearchStatusOutlineCell *)v3 contentView];
    v53 = [v55 topAnchor];
    v52 = [v54 constraintEqualToAnchor:v53 constant:16.0];
    v58[0] = v52;
    v50 = [(UIStackView *)v3->_stackView leadingAnchor];
    v51 = [(HomeSearchStatusOutlineCell *)v3 contentView];
    v49 = [v51 layoutMarginsGuide];
    v48 = [v49 leadingAnchor];
    v47 = [v50 constraintEqualToAnchor:v48];
    v58[1] = v47;
    v45 = [(UIStackView *)v3->_stackView trailingAnchor];
    v46 = [(HomeSearchStatusOutlineCell *)v3 contentView];
    v44 = [v46 layoutMarginsGuide];
    v43 = [v44 trailingAnchor];
    v42 = [v45 constraintEqualToAnchor:v43];
    v58[2] = v42;
    v40 = [(UIStackView *)v3->_stackView bottomAnchor];
    v41 = [(HomeSearchStatusOutlineCell *)v3 contentView];
    v39 = [v41 bottomAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:-16.0];
    v58[3] = v38;
    v37 = [(UIActivityIndicatorView *)v3->_loadingIndicator leadingAnchor];
    v36 = [(UIStackView *)v3->_stackView leadingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v58[4] = v35;
    v34 = [(UIActivityIndicatorView *)v3->_loadingIndicator trailingAnchor];
    v24 = [(UIStackView *)v3->_stackView trailingAnchor];
    v25 = [v34 constraintLessThanOrEqualToAnchor:v24];
    v58[5] = v25;
    v26 = [(UIActivityIndicatorView *)v3->_loadingIndicator topAnchor];
    v27 = [(UIStackView *)v3->_stackView topAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v58[6] = v28;
    v29 = [(UIActivityIndicatorView *)v3->_loadingIndicator bottomAnchor];
    v30 = [(UIStackView *)v3->_stackView bottomAnchor];
    v31 = [v29 constraintLessThanOrEqualToAnchor:v30];
    v58[7] = v31;
    v32 = +[NSArray arrayWithObjects:v58 count:8];
    +[NSLayoutConstraint activateConstraints:v32];
  }
  return v3;
}

- (void)setCellModel:(id)a3
{
  v5 = (HomeSearchStatusOutlineCellModel *)a3;
  v6 = v5;
  if (self->_cellModel != v5)
  {
    v8 = v5;
    unsigned __int8 v7 = -[HomeSearchStatusOutlineCellModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      [(HomeSearchStatusOutlineCell *)self _updateFromModel];
      v6 = v8;
    }
  }
}

- (void)_updateFromModel
{
  v3 = sub_1000AA148();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(HomeSearchStatusOutlineCellModel *)self->_cellModel errorString];
    unsigned int v5 = [(HomeSearchStatusOutlineCellModel *)self->_cellModel enableStructuredRAPAffordance];
    int v10 = 138412546;
    v11 = v4;
    __int16 v12 = 1024;
    unsigned int v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Loading started for search %@ enableStructuredRAPAffordance %d", (uint8_t *)&v10, 0x12u);
  }
  v6 = [(HomeSearchStatusOutlineCellModel *)self->_cellModel errorString];
  id v7 = [v6 length];

  if (v7)
  {
    v8 = [(HomeSearchStatusOutlineCellModel *)self->_cellModel errorString];
    [(UILabel *)self->_errorLabel setText:v8];

    [(UIActivityIndicatorView *)self->_loadingIndicator setHidden:1];
    [(UILabel *)self->_errorLabel setHidden:0];
    if ([(HomeSearchStatusOutlineCellModel *)self->_cellModel enableStructuredRAPAffordance])
    {
      [(HomeSearchStatusOutlineCell *)self _addRAPButton];
    }
    else
    {
      [(HomeSearchStatusOutlineCell *)self _removeRAPButton];
    }
    v9 = [(HomeSearchStatusOutlineCell *)self contentView];
    [v9 invalidateIntrinsicContentSize];
  }
  else
  {
    [(UIActivityIndicatorView *)self->_loadingIndicator setHidden:0];
    [(UILabel *)self->_errorLabel setHidden:1];
    [(HomeSearchStatusOutlineCell *)self _removeRAPButton];
  }
}

- (void)_addRAPButton
{
}

- (void)_removeRAPButton
{
  [(UIStackView *)self->_stackView removeArrangedSubview:self->_rapButton];
  rapButton = self->_rapButton;

  [(UIButton *)rapButton removeFromSuperview];
}

- (void)_didTapOnRAPButton
{
  id v2 = [(HomeSearchStatusOutlineCellModel *)self->_cellModel delegate];
  [v2 didTapOnReportAnIssue];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HomeSearchStatusOutlineCell;
  [(HomeSearchStatusOutlineCell *)&v3 prepareForReuse];
  [(UIActivityIndicatorView *)self->_loadingIndicator startAnimating];
}

- (HomeSearchStatusOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_bottomAnchorContraint, 0);
  objc_storeStrong((id *)&self->_rapButton, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);

  objc_storeStrong((id *)&self->_errorLabel, 0);
}

@end
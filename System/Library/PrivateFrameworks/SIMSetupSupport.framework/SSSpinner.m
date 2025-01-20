@interface SSSpinner
- (BOOL)isAnimating;
- (SSSpinner)initWithText:(id)a3;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)label;
- (void)setActivityIndicator:(id)a3;
- (void)setLabel:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)updateText:(id)a3;
@end

@implementation SSSpinner

- (SSSpinner)initWithText:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSSpinner;
  v5 = [(SSSpinner *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    activityIndicator = v5->_activityIndicator;
    v5->_activityIndicator = (UIActivityIndicatorView *)v6;

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    label = v5->_label;
    v5->_label = v8;

    [(UILabel *)v5->_label setText:v4];
    v10 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v5->_label setTextColor:v10];

    [(UILabel *)v5->_label setHidden:1];
    v11 = v5->_label;
    v12 = [MEMORY[0x263F81708] boldSystemFontOfSize:16.0];
    [(UILabel *)v11 setFont:v12];

    [(SSSpinner *)v5 setSpacing:8.0];
    [(SSSpinner *)v5 addArrangedSubview:v5->_activityIndicator];
    [(SSSpinner *)v5 addArrangedSubview:v5->_label];
    [(SSSpinner *)v5 setAxis:0];
    [(SSSpinner *)v5 setAlignment:3];
  }

  return v5;
}

- (void)startAnimating
{
  [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
  label = self->_label;
  [(UILabel *)label setHidden:0];
}

- (void)stopAnimating
{
  [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
  label = self->_label;
  [(UILabel *)label setHidden:1];
}

- (void)updateText:(id)a3
{
}

- (BOOL)isAnimating
{
  return [(UIActivityIndicatorView *)self->_activityIndicator isAnimating];
}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 440, 1);
}

- (void)setActivityIndicator:(id)a3
{
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 448, 1);
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
@interface PreviousDraftPickerHeaderView
- (PreviousDraftPickerHeaderView)initWithFrame:(CGRect)a3;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)layoutSubviews;
- (void)setHasDrafts:(BOOL)a3;
- (void)setLoading:(BOOL)a3 immediately:(BOOL)a4;
- (void)updateUI;
@end

@implementation PreviousDraftPickerHeaderView

- (PreviousDraftPickerHeaderView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PreviousDraftPickerHeaderView;
  v3 = -[PreviousDraftPickerHeaderView initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PreviousDraftPickerHeaderView *)v3 setInsetsLayoutMarginsFromSafeArea:0];
    [(PreviousDraftPickerHeaderView *)v4 setPreservesSuperviewLayoutMargins:1];
    v4->_completedFirstLoad = 0;
    v5 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    label = v4->_label;
    v4->_label = v5;

    v7 = +[UIColor mailPreviousDraftPickerHeaderTextColor];
    [(UILabel *)v4->_label setTextColor:v7];

    v8 = +[UIColor clearColor];
    [(UILabel *)v4->_label setBackgroundColor:v8];

    [(PreviousDraftPickerHeaderView *)v4 addSubview:v4->_label];
    v9 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    activityIndicatorView = v4->_activityIndicatorView;
    v4->_activityIndicatorView = v9;

    [(UIActivityIndicatorView *)v4->_activityIndicatorView setHidesWhenStopped:1];
    [(PreviousDraftPickerHeaderView *)v4 addSubview:v4->_activityIndicatorView];
    [(PreviousDraftPickerHeaderView *)v4 setLoading:1 immediately:1];
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v4 selector:"_contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v4;
}

- (void)_contentSizeCategoryChanged:(id)a3
{
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PreviousDraftPickerHeaderView;
  [(PreviousDraftPickerHeaderView *)&v14 layoutSubviews];
  [(PreviousDraftPickerHeaderView *)self layoutMargins];
  double v4 = v3;
  [(PreviousDraftPickerHeaderView *)self layoutMargins];
  double v6 = v5;
  [(PreviousDraftPickerHeaderView *)self bounds];
  CGFloat v8 = v4 + v7;
  CGFloat v10 = v9 + 0.0;
  CGFloat v12 = v11 - (v4 + v6);
  -[UILabel setFrame:](self->_label, "setFrame:", v8, v9 + 0.0, v12, 35.0);
  v15.origin.x = v8;
  v15.origin.y = v10;
  v15.size.width = v12;
  v15.size.height = 35.0;
  double MidX = CGRectGetMidX(v15);
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = 35.0;
  -[UIActivityIndicatorView setCenter:](self->_activityIndicatorView, "setCenter:", MidX, CGRectGetMidY(v16));
}

- (void)setHasDrafts:(BOOL)a3
{
  if (self->_hasDrafts != a3)
  {
    self->_hasDrafts = a3;
    [(PreviousDraftPickerHeaderView *)self updateUI];
  }
}

- (void)setLoading:(BOOL)a3 immediately:(BOOL)a4
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    if (!self->_completedFirstLoad && a3) {
      self->_completedFirstLoad = 1;
    }
    if (a4)
    {
      [(PreviousDraftPickerHeaderView *)self updateUI];
    }
    else
    {
      if (self->_loading) {
        double v6 = 2.0;
      }
      else {
        double v6 = 1.0;
      }
      +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"updateUI" object:0];
      [(PreviousDraftPickerHeaderView *)self performSelector:"updateUI" withObject:0 afterDelay:v6];
    }
  }
}

- (void)updateUI
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"updateUI" object:0];
  if (self->_hasDrafts)
  {
    double v3 = +[NSBundle mainBundle];
    double v4 = [v3 localizedStringForKey:@"PREVIOUS_DRAFT_PICKER_PREVIOUS_DRAFTS" value:&stru_100619928 table:@"Main"];
    double v5 = [v4 localizedUppercaseString];
    [(UILabel *)self->_label setText:v5];

    [(UILabel *)self->_label setTextAlignment:4];
    double v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline1];
    [(UILabel *)self->_label setFont:v6];

LABEL_3:
    activityIndicatorView = self->_activityIndicatorView;
    [(UIActivityIndicatorView *)activityIndicatorView stopAnimating];
    return;
  }
  if (!self->_loading && self->_completedFirstLoad)
  {
    double v9 = +[NSBundle mainBundle];
    CGFloat v10 = [v9 localizedStringForKey:@"PREVIOUS_DRAFT_PICKER_NO_DRAFTS" value:&stru_100619928 table:@"Main"];
    [(UILabel *)self->_label setText:v10];

    double v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    [(UILabel *)self->_label setFont:v11];

    [(UILabel *)self->_label setTextAlignment:1];
    goto LABEL_3;
  }
  [(UILabel *)self->_label setText:&stru_100619928];
  CGFloat v8 = self->_activityIndicatorView;

  [(UIActivityIndicatorView *)v8 startAnimating];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end
@interface MTLoadingCell
- (UIActivityIndicatorView)activityIndicator;
- (void)layoutSubviews;
- (void)setActivityIndicator:(id)a3;
- (void)setupCell;
@end

@implementation MTLoadingCell

- (void)setupCell
{
  v7.receiver = self;
  v7.super_class = (Class)MTLoadingCell;
  [(MTTableViewCell *)&v7 setupCell];
  id v3 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(MTLoadingCell *)self setActivityIndicator:v3];

  v4 = [(MTLoadingCell *)self contentView];
  v5 = [(MTLoadingCell *)self activityIndicator];
  [v4 addSubview:v5];

  v6 = [(MTLoadingCell *)self activityIndicator];
  [v6 startAnimating];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MTLoadingCell;
  [(MTTableViewCell *)&v13 layoutSubviews];
  id v3 = [(MTLoadingCell *)self activityIndicator];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  v8 = [(MTLoadingCell *)self contentView];
  [v8 frame];
  CGFloat v9 = CGRectGetMidX(v14) - v5 * 0.5;
  v10 = [(MTLoadingCell *)self contentView];
  [v10 frame];
  CGFloat v11 = CGRectGetMidY(v15) - v7 * 0.5;
  v12 = [(MTLoadingCell *)self activityIndicator];
  [v12 setFrame:v9, v11, v5, v7];
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
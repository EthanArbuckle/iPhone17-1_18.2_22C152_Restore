@interface MTATimerTipTableViewCell
+ (CGSize)sizeThatFits:(CGSize)a3 siriTipView:(id)a4;
- (MTATimerTipTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)siriTipView;
- (void)prepareForReuse;
- (void)setSiriTipView:(id)a3;
@end

@implementation MTATimerTipTableViewCell

- (MTATimerTipTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTATimerTipTableViewCell;
  v4 = [(MTATimerTipTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    -[MTATimerTipTableViewCell setSeparatorInset:](v4, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
  }
  return v5;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)MTATimerTipTableViewCell;
  [(MTATimerTipTableViewCell *)&v4 prepareForReuse];
  [(UIView *)self->_siriTipView removeFromSuperview];
  siriTipView = self->_siriTipView;
  self->_siriTipView = 0;
}

- (void)setSiriTipView:(id)a3
{
  v5 = (UIView *)a3;
  p_siriTipView = (id *)&self->_siriTipView;
  siriTipView = self->_siriTipView;
  if (siriTipView != v5)
  {
    [(UIView *)siriTipView removeFromSuperview];
    id v8 = *p_siriTipView;
    id *p_siriTipView = 0;

    if (v5)
    {
      objc_storeStrong((id *)&self->_siriTipView, a3);
      [*p_siriTipView setTranslatesAutoresizingMaskIntoConstraints:0];
      v9 = [(MTATimerTipTableViewCell *)self contentView];
      [v9 addSubview:*p_siriTipView];
      v22 = [*p_siriTipView leadingAnchor];
      v21 = [v9 leadingAnchor];
      v20 = [v22 constraintEqualToAnchor:v21 constant:16.0];
      v23[0] = v20;
      v19 = [*p_siriTipView trailingAnchor];
      v18 = [v9 trailingAnchor];
      v10 = [v19 constraintEqualToAnchor:v18 constant:-16.0];
      v23[1] = v10;
      v11 = [*p_siriTipView topAnchor];
      v12 = [v9 topAnchor];
      v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
      v23[2] = v13;
      v14 = [*p_siriTipView bottomAnchor];
      v15 = [v9 bottomAnchor];
      v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
      v23[3] = v16;
      v17 = +[NSArray arrayWithObjects:v23 count:4];
      +[NSLayoutConstraint activateConstraints:v17];
    }
  }
}

+ (CGSize)sizeThatFits:(CGSize)a3 siriTipView:(id)a4
{
  LODWORD(v4) = 1112014848;
  [a4 systemLayoutSizeFittingSize:a3.width + -32.0 withHorizontalFittingPriority:a3.height verticalFittingPriority:-32.0000082 v4];
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIView)siriTipView
{
  return self->_siriTipView;
}

- (void).cxx_destruct
{
}

@end
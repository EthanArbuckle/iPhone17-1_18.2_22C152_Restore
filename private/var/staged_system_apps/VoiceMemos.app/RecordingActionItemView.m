@interface RecordingActionItemView
- (RecordingActionItemView)initWithCoder:(id)a3;
- (RecordingActionItemView)initWithFrame:(CGRect)a3;
- (UIImageView)actionImageView;
- (UILabel)actionTitleLabel;
- (void)_commonInit;
- (void)setActionImageView:(id)a3;
- (void)setActionTitleLabel:(id)a3;
@end

@implementation RecordingActionItemView

- (RecordingActionItemView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RecordingActionItemView;
  v3 = [(RecordingActionItemView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RecordingActionItemView *)v3 _commonInit];
  }
  return v4;
}

- (RecordingActionItemView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RecordingActionItemView;
  v3 = -[RecordingActionItemView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RecordingActionItemView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v9 = (UILabel *)objc_opt_new();
  self->_actionTitleLabel = v9;
  [(RecordingActionItemView *)self addSubview:v9];
  [(UILabel *)self->_actionTitleLabel addLeadingToLeadingMarginConstraintWithView:self padding:0.0];
  [(UILabel *)self->_actionTitleLabel addCenterYConstraintWithView:self];
  v3 = (UIImageView *)objc_opt_new();
  self->_actionImageView = v3;
  [(RecordingActionItemView *)self addSubview:v3];
  v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v4 actionMenuImageSize];
  double v6 = v5;
  double v8 = v7;

  -[UIImageView constrainSize:](self->_actionImageView, "constrainSize:", v6, v8);
  [(UIImageView *)self->_actionImageView alignCenterTrailingToCenterTrailingMarginOfView:self padding:0.0];
}

- (UILabel)actionTitleLabel
{
  return self->_actionTitleLabel;
}

- (void)setActionTitleLabel:(id)a3
{
  self->_actionTitleLabel = (UILabel *)a3;
}

- (UIImageView)actionImageView
{
  return self->_actionImageView;
}

- (void)setActionImageView:(id)a3
{
  self->_actionImageView = (UIImageView *)a3;
}

@end
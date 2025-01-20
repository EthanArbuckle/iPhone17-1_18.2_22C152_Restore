@interface RCRecordingCardView
- (RCRecordingCardView)initWithCoder:(id)a3;
- (RCRecordingCardView)initWithFrame:(CGRect)a3;
- (RCRecordingCardViewHostedViewProtocol)hostedView;
- (int64_t)_commonOrientationForOrientation:(int64_t)a3;
- (void)_styleView;
- (void)layoutSubviews;
- (void)setHostedView:(id)a3;
@end

@implementation RCRecordingCardView

- (RCRecordingCardView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCRecordingCardView;
  v3 = [(RCRecordingCardView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RCRecordingCardView *)v3 _commonInit];
  }
  return v4;
}

- (RCRecordingCardView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCRecordingCardView;
  v3 = -[RCRecordingCardView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RCRecordingCardView *)v3 _commonInit];
  }
  return v4;
}

- (void)_styleView
{
  id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  v3 = [v4 recordingCardBackgroundColor];
  [(RCRecordingCardView *)self setBackgroundColor:v3];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)RCRecordingCardView;
  [(RCRecordingCardView *)&v5 layoutSubviews];
  v3 = [(RCRecordingCardView *)self hostedView];
  [(RCRecordingCardView *)self frame];
  [v3 setHostViewHeight:v4];
  [v3 layoutSubviews];
}

- (void)setHostedView:(id)a3
{
  p_hostedView = &self->_hostedView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_hostedView);
  [WeakRetained removeFromSuperview];

  objc_storeWeak((id *)p_hostedView, v5);
  [(RCRecordingCardView *)self addSubview:v5];
  v7 = [v5 bottomAnchor];
  v8 = [(RCRecordingCardView *)self bottomAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [v5 topAnchor];
  v11 = [(RCRecordingCardView *)self safeAreaLayoutGuide];
  v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [v5 leadingAnchor];
  v15 = [(RCRecordingCardView *)self leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  id v19 = [v5 trailingAnchor];

  v17 = [(RCRecordingCardView *)self trailingAnchor];
  v18 = [v19 constraintEqualToAnchor:v17];
  [v18 setActive:1];
}

- (int64_t)_commonOrientationForOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  else {
    return qword_1001F0210[a3 - 1];
  }
}

- (RCRecordingCardViewHostedViewProtocol)hostedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedView);

  return (RCRecordingCardViewHostedViewProtocol *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
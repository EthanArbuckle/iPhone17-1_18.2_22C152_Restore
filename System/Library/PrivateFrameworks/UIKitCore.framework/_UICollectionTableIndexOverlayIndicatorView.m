@interface _UICollectionTableIndexOverlayIndicatorView
- (NSString)currentText;
- (_UICollectionTableIndexOverlayIndicatorView)initWithHost:(id)a3;
- (void)_tapGestureChanged:(id)a3;
- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4;
- (void)layoutSubviews;
- (void)setCurrentText:(id)a3;
@end

@implementation _UICollectionTableIndexOverlayIndicatorView

- (_UICollectionTableIndexOverlayIndicatorView)initWithHost:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionTableIndexOverlayIndicatorView;
  v5 = [(UIView *)&v11 init];
  if (v5)
  {
    v6 = objc_alloc_init(UILabel);
    label = v5->_label;
    v5->_label = v6;

    [(UIView *)v5 addSubview:v5->_label];
    v8 = [[UITapGestureRecognizer alloc] initWithTarget:v5 action:sel__tapGestureChanged_];
    tapGestureRecognizer = v5->_tapGestureRecognizer;
    v5->_tapGestureRecognizer = v8;

    [(UIView *)v5 addGestureRecognizer:v5->_tapGestureRecognizer];
    objc_storeWeak((id *)&v5->_host, v4);
  }

  return v5;
}

- (void)_tapGestureChanged:(id)a3
{
  if ([a3 state] == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    [WeakRetained _hideIndexOverlay];
  }
}

- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  if (a3 == 3)
  {
    label = self->_label;
    v7 = +[UIColor whiteColor];
    [(UILabel *)label setTextColor:v7];

    v8 = self->_label;
    v9 = [off_1E52D39B8 _ultraLightSystemFontOfSize:150.0];
    [(UILabel *)v8 setFont:v9];

    [(UILabel *)self->_label setTextAlignment:1];
    id v10 = +[UIColor colorWithWhite:0.0 alpha:0.85];
    [(UIView *)self setBackgroundColor:v10];
  }
}

- (void)layoutSubviews
{
  label = self->_label;
  [(UIView *)self bounds];
  -[UILabel setFrame:](label, "setFrame:");
}

- (NSString)currentText
{
  return [(UILabel *)self->_label text];
}

- (void)setCurrentText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
@interface _MFMessageContentResizeWrapperView
- (UIView)snapshotView;
- (_MFMessageContentResizeWrapperView)initWithFrame:(CGRect)a3 snapshotView:(id)a4;
- (double)snapshotViewYOrigin;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setSnapshotView:(id)a3;
- (void)setSnapshotViewYOrigin:(double)a3;
@end

@implementation _MFMessageContentResizeWrapperView

- (void)dealloc
{
  [(UIView *)self->_snapshotView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)_MFMessageContentResizeWrapperView;
  [(_MFMessageContentResizeWrapperView *)&v3 dealloc];
}

- (_MFMessageContentResizeWrapperView)initWithFrame:(CGRect)a3 snapshotView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_MFMessageContentResizeWrapperView;
  v11 = -[_MFMessageContentResizeWrapperView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    [v10 frame];
    v11->_snapshotViewYOrigin = v12;
    objc_storeStrong((id *)&v11->_snapshotView, a4);
    [(UIView *)v11->_snapshotView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v11->_snapshotView setAutoresizingMask:0];
    [(_MFMessageContentResizeWrapperView *)v11 setAutoresizingMask:18];
    [(_MFMessageContentResizeWrapperView *)v11 addSubview:v11->_snapshotView];
  }

  return v11;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)_MFMessageContentResizeWrapperView;
  [(_MFMessageContentResizeWrapperView *)&v10 layoutSubviews];
  [(UIView *)self->_snapshotView frame];
  double v4 = v3;
  double v6 = v5;
  [(_MFMessageContentResizeWrapperView *)self layoutMargins];
  double v8 = v7;
  [(_MFMessageContentResizeWrapperView *)self snapshotViewYOrigin];
  -[UIView setFrame:](self->_snapshotView, "setFrame:", v8, v9, v4, v6);
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (double)snapshotViewYOrigin
{
  return self->_snapshotViewYOrigin;
}

- (void)setSnapshotViewYOrigin:(double)a3
{
  self->_snapshotViewYOrigin = a3;
}

- (void).cxx_destruct
{
}

@end
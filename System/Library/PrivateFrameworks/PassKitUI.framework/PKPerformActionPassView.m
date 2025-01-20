@interface PKPerformActionPassView
- (CGSize)_passImageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPerformActionPassView)init;
- (PKPerformActionPassView)initWithPass:(id)a3 frame:(CGRect)a4;
- (void)_createSubviews;
- (void)_loadSnapshotView;
- (void)configureWithPass:(id)a3 frame:(CGRect)a4;
- (void)layoutSubviews;
- (void)shakeImage;
- (void)smallShakeImage;
@end

@implementation PKPerformActionPassView

- (PKPerformActionPassView)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPerformActionPassView;
  return [(PKPerformActionBackdropView *)&v3 init];
}

- (PKPerformActionPassView)initWithPass:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPerformActionPassView;
  v9 = [(PKPerformActionBackdropView *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    v11 = objc_alloc_init(PKPassSnapshotter);
    snapshotter = v10->_snapshotter;
    v10->_snapshotter = v11;

    [(PKPerformActionPassView *)v10 _createSubviews];
    [(PKPerformActionPassView *)v10 _loadSnapshotView];
    double v13 = *MEMORY[0x1E4F1DAD8];
    double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    -[PKPerformActionPassView sizeThatFits:](v10, "sizeThatFits:", width, width);
    -[PKPerformActionPassView setFrame:](v10, "setFrame:", v13, v14, v15, v16);
    -[PKPerformActionPassView sizeThatFits:](v10, "sizeThatFits:", width, height);
    [(PKPerformActionPassView *)v10 setUserInteractionEnabled:1];
  }

  return v10;
}

- (void)configureWithPass:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  objc_storeStrong((id *)&self->_pass, a3);
  id v8 = a3;
  v9 = objc_alloc_init(PKPassSnapshotter);
  snapshotter = self->_snapshotter;
  self->_snapshotter = v9;

  [(PKPerformActionPassView *)self _createSubviews];
  [(PKPerformActionPassView *)self _loadSnapshotView];
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[PKPerformActionPassView sizeThatFits:](self, "sizeThatFits:", width, width);
  -[PKPerformActionPassView setFrame:](self, "setFrame:", v11, v12, v13, v14);
  -[PKPerformActionPassView sizeThatFits:](self, "sizeThatFits:", width, height);

  [(PKPerformActionPassView *)self setUserInteractionEnabled:1];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PKPerformActionPassView;
  [(PKPerformActionBackdropView *)&v7 layoutSubviews];
  [(PKPerformActionPassView *)self bounds];
  double v4 = v3;
  [(PKPerformActionPassView *)self _passImageSize];
  -[UIImageView setFrame:](self->_passView, "setFrame:", v4 * 0.5 - v5 * 0.5, 0.0, v5, v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(PKPerformActionPassView *)self _passImageSize];
  double v5 = fmax(v4, 88.0);
  double v6 = width;
  result.double height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)shakeImage
{
}

- (void)smallShakeImage
{
}

- (void)_createSubviews
{
  double v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  passView = self->_passView;
  self->_passView = v3;

  double v5 = [(UIImageView *)self->_passView layer];
  [v5 setShadowRadius:12.0];

  double v6 = [(UIImageView *)self->_passView layer];
  id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.15];
  objc_msgSend(v6, "setShadowColor:", objc_msgSend(v7, "CGColor"));

  id v8 = [(UIImageView *)self->_passView layer];
  objc_msgSend(v8, "setShadowOffset:", 0.0, 12.0);

  v9 = [(UIImageView *)self->_passView layer];
  LODWORD(v10) = 1.0;
  [v9 setShadowOpacity:v10];

  double v11 = [(UIImageView *)self->_passView layer];
  [v11 setMasksToBounds:0];

  [(UIImageView *)self->_passView setAccessibilityIgnoresInvertColors:1];
  double v12 = self->_passView;

  [(PKPerformActionPassView *)self addSubview:v12];
}

- (void)_loadSnapshotView
{
  snapshotter = self->_snapshotter;
  pass = self->_pass;
  [(PKPerformActionPassView *)self _passImageSize];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PKPerformActionPassView__loadSnapshotView__block_invoke;
  v5[3] = &unk_1E59CA898;
  v5[4] = self;
  -[PKPassSnapshotter snapshotWithPass:size:completion:](snapshotter, "snapshotWithPass:size:completion:", pass, v5);
}

void __44__PKPerformActionPassView__loadSnapshotView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PKPerformActionPassView__loadSnapshotView__block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __44__PKPerformActionPassView__loadSnapshotView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setImage:*(void *)(a1 + 40)];
}

- (CGSize)_passImageSize
{
  PKPassType v2 = [(PKPass *)self->_pass passType];
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v2 == PKPassTypeSecureElement)
  {
    double v3 = 190.0;
    double v4 = 121.0;
  }
  result.double height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end
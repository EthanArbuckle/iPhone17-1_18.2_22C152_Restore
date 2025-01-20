@interface NCCAPackageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCCAPackageView)initWithPackageNamed:(id)a3 inBundle:(id)a4;
- (double)scale;
- (void)_setupPackageNamed:(id)a3 inBundle:(id)a4;
- (void)layoutSubviews;
- (void)removeAllStateChanges;
- (void)setScale:(double)a3;
- (void)setStateName:(id)a3;
@end

@implementation NCCAPackageView

- (NCCAPackageView)initWithPackageNamed:(id)a3 inBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCCAPackageView;
  v8 = -[NCCAPackageView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    v8->_scale = 1.0;
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    packageContentView = v9->_packageContentView;
    v9->_packageContentView = v10;

    [(NCCAPackageView *)v9 addSubview:v9->_packageContentView];
    [(NCCAPackageView *)v9 setUserInteractionEnabled:0];
    [(NCCAPackageView *)v9 _setupPackageNamed:v6 inBundle:v7];
  }

  return v9;
}

- (void)setStateName:(id)a3
{
  id v5 = [(CALayer *)self->_packageLayer stateWithName:a3];
  LODWORD(v4) = 1.0;
  [(CAStateController *)self->_stateController setState:v5 ofLayer:self->_packageLayer transitionSpeed:v4];
}

- (void)removeAllStateChanges
{
  id v2 = (id)[(CAStateController *)self->_stateController removeAllStateChanges];
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(NCCAPackageView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)NCCAPackageView;
  [(NCCAPackageView *)&v6 layoutSubviews];
  packageContentView = self->_packageContentView;
  [(NCCAPackageView *)self bounds];
  UIRectGetCenter();
  -[UIView setCenter:](packageContentView, "setCenter:");
  double v4 = self->_packageContentView;
  CGAffineTransformMakeScale(&v5, self->_scale, self->_scale);
  [(UIView *)v4 setTransform:&v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double scale = self->_scale;
  [(CALayer *)self->_packageLayer bounds];
  double v5 = scale * CGRectGetHeight(v8);
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)_setupPackageNamed:(id)a3 inBundle:(id)a4
{
  double v5 = [a4 URLForResource:a3 withExtension:@"ca"];
  uint64_t v6 = *MEMORY[0x1E4F3A4C0];
  id v19 = 0;
  id v7 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v5 type:v6 options:0 error:&v19];
  id v8 = v19;
  package = self->_package;
  self->_package = v7;

  if (v8)
  {
    v10 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      -[NCCAPackageView _setupPackageNamed:inBundle:]((uint64_t)v5, (uint64_t)v8, v10);
    }
  }
  [(CALayer *)self->_packageLayer removeFromSuperlayer];
  v11 = [(CAPackage *)self->_package rootLayer];
  [(CALayer *)v11 setGeometryFlipped:[(CAPackage *)self->_package isGeometryFlipped]];
  if ([(NCCAPackageView *)self _shouldReverseLayoutDirection])
  {
    CGAffineTransformMakeScale(&v18, -1.0, 1.0);
    [(CALayer *)v11 setAffineTransform:&v18];
  }
  v12 = [(UIView *)self->_packageContentView layer];
  [v12 addSublayer:v11];

  packageContentView = self->_packageContentView;
  [(CALayer *)v11 bounds];
  -[UIView setBounds:](packageContentView, "setBounds:");
  packageLayer = self->_packageLayer;
  self->_packageLayer = v11;
  v15 = v11;

  v16 = (CAStateController *)[objc_alloc(MEMORY[0x1E4F39CB0]) initWithLayer:v15];
  stateController = self->_stateController;
  self->_stateController = v16;

  [(NCCAPackageView *)self setNeedsLayout];
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageLayer, 0);
  objc_storeStrong((id *)&self->_packageContentView, 0);
  objc_storeStrong((id *)&self->_stateController, 0);

  objc_storeStrong((id *)&self->_package, 0);
}

- (void)_setupPackageNamed:(os_log_t)log inBundle:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D7C04000, log, OS_LOG_TYPE_ERROR, "Cannot load CAPackage from %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
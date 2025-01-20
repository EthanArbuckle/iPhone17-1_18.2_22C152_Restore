@interface _UIPlatterSoftShadowView
- (BOOL)needsPunchOut;
- (UIBezierPath)shadowPath;
- (UIView)backgroundView;
- (_UIPlatterShadowView)diffuseShadowView;
- (_UIPlatterShadowView)rimShadowView;
- (_UIPlatterSoftShadowView)initWithFrame:(CGRect)a3 shadowPath:(id)a4;
- (void)_updateForShadowPath;
- (void)setNeedsPunchOut:(BOOL)a3;
- (void)setShadowPath:(id)a3;
@end

@implementation _UIPlatterSoftShadowView

- (_UIPlatterSoftShadowView)initWithFrame:(CGRect)a3 shadowPath:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIPlatterSoftShadowView;
  v10 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(_UIPlatterSoftShadowView *)v10 setShadowPath:v9];
    [(_UIPlatterSoftShadowView *)v11 _updateForShadowPath];
  }

  return v11;
}

- (void)setNeedsPunchOut:(BOOL)a3
{
  if (self->_needsPunchOut != a3)
  {
    self->_BOOL needsPunchOut = a3;
    -[_UIPlatterShadowView setPunchOut:](self->_rimShadowView, "setPunchOut:");
    BOOL needsPunchOut = self->_needsPunchOut;
    diffuseShadowView = self->_diffuseShadowView;
    [(_UIPlatterShadowView *)diffuseShadowView setPunchOut:needsPunchOut];
  }
}

- (void)setShadowPath:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_shadowPath] & 1) == 0)
  {
    v4 = (UIBezierPath *)[v6 copy];
    shadowPath = self->_shadowPath;
    self->_shadowPath = v4;

    [(_UIPlatterSoftShadowView *)self _updateForShadowPath];
  }
}

- (void)_updateForShadowPath
{
  [(UIView *)self->_rimShadowView removeFromSuperview];
  rimShadowView = self->_rimShadowView;
  self->_rimShadowView = 0;

  [(UIView *)self->_diffuseShadowView removeFromSuperview];
  diffuseShadowView = self->_diffuseShadowView;
  self->_diffuseShadowView = 0;

  v5 = [(_UIPlatterSoftShadowView *)self shadowPath];

  if (v5)
  {
    id v6 = [_UIPlatterShadowView alloc];
    v7 = [(_UIPlatterSoftShadowView *)self shadowPath];
    v8 = [(_UIPlatterShadowView *)v6 initWithShadowPath:v7];
    id v9 = self->_rimShadowView;
    self->_rimShadowView = v8;

    [(_UIPlatterShadowView *)self->_rimShadowView setShadowOpacity:0.2];
    -[_UIPlatterShadowView setShadowOffset:](self->_rimShadowView, "setShadowOffset:", 0.0, 1.0);
    [(_UIPlatterShadowView *)self->_rimShadowView setShadowRadius:3.0];
    [(UIView *)self addSubview:self->_rimShadowView];
    v10 = [_UIPlatterShadowView alloc];
    v11 = [(_UIPlatterSoftShadowView *)self shadowPath];
    v12 = [(_UIPlatterShadowView *)v10 initWithShadowPath:v11];
    objc_super v13 = self->_diffuseShadowView;
    self->_diffuseShadowView = v12;

    [(_UIPlatterShadowView *)self->_diffuseShadowView setShadowOpacity:0.2];
    -[_UIPlatterShadowView setShadowOffset:](self->_diffuseShadowView, "setShadowOffset:", 0.0, 0.0);
    [(_UIPlatterShadowView *)self->_diffuseShadowView setShadowRadius:20.0];
    v14 = self->_diffuseShadowView;
    [(UIView *)self addSubview:v14];
  }
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (BOOL)needsPunchOut
{
  return self->_needsPunchOut;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (_UIPlatterShadowView)diffuseShadowView
{
  return self->_diffuseShadowView;
}

- (_UIPlatterShadowView)rimShadowView
{
  return self->_rimShadowView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rimShadowView, 0);
  objc_storeStrong((id *)&self->_diffuseShadowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_shadowPath, 0);
}

@end
@interface _UIDiffuseShadowView
- (CGSize)offset;
- (UIBezierPath)path;
- (_UIDiffuseShadowView)initWithFrame:(CGRect)a3;
- (double)intensity;
- (double)radius;
- (void)_updateForCurrentTraits;
- (void)setIntensity:(double)a3;
- (void)setOffset:(CGSize)a3;
- (void)setPath:(id)a3;
- (void)setRadius:(double)a3;
@end

@implementation _UIDiffuseShadowView

- (_UIDiffuseShadowView)initWithFrame:(CGRect)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UIDiffuseShadowView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    [(_UIDiffuseShadowView *)v4 setRadius:56.0];
    -[_UIDiffuseShadowView setOffset:](v4, "setOffset:", 0.0, 7.0);
    [(_UIDiffuseShadowView *)v4 setIntensity:0.24];
    v5 = [(UIView *)v4 layer];
    [v5 setShadowPathIsBounds:1];

    [(_UIDiffuseShadowView *)v4 _updateForCurrentTraits];
    v10[0] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = [(UIView *)v4 registerForTraitChanges:v6 withTarget:v4 action:sel__updateForCurrentTraits];
  }
  return v4;
}

- (void)setIntensity:(double)a3
{
  self->_intensity = a3;
  [(_UIDiffuseShadowView *)self _updateForCurrentTraits];
}

- (void)setRadius:(double)a3
{
  id v4 = [(UIView *)self layer];
  [v4 setShadowRadius:a3];
}

- (double)radius
{
  v2 = [(UIView *)self layer];
  [v2 shadowRadius];
  double v4 = v3;

  return v4;
}

- (void)setOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(UIView *)self layer];
  objc_msgSend(v5, "setShadowOffset:", width, height);
}

- (CGSize)offset
{
  v2 = [(UIView *)self layer];
  [v2 shadowOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  double v5 = (UIBezierPath *)[v4 copy];
  path = self->_path;
  self->_path = v5;

  double v7 = [(UIView *)self layer];
  [v7 setShadowPathIsBounds:v4 == 0];

  id v8 = v4;
  uint64_t v9 = [v8 CGPath];

  id v10 = [(UIView *)self layer];
  [v10 setShadowPath:v9];
}

- (void)_updateForCurrentTraits
{
  v17[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 1)
  {
    double v5 = [(UIView *)self layer];
    [v5 setFilters:0];

    [(_UIDiffuseShadowView *)self intensity];
    double v7 = v6;
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
    v16[2] = xmmword_186B9BC90;
    v16[3] = unk_186B9BCA0;
    v16[4] = xmmword_186B9BCB0;
    v16[0] = kDarkModeColorMatrix;
    v16[1] = unk_186B9BC80;
    id v10 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v16];
    [v9 setValue:v10 forKey:@"inputColorMatrix"];

    v17[0] = v9;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [(_UIDiffuseShadowView *)self intensity];
    double v7 = v11 / 0.24;
  }
  v12 = [(UIView *)self layer];
  [v12 setFilters:v8];

  v14 = [(UIView *)self layer];
  float v13 = v7;
  *(float *)&double v15 = v13;
  [v14 setShadowOpacity:v15];
}

- (double)intensity
{
  return self->_intensity;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end
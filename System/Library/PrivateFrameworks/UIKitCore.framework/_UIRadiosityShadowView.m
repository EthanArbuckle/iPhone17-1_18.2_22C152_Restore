@interface _UIRadiosityShadowView
- (BOOL)needsPunchout;
- (CALayer)punchoutLayer;
- (UIBezierPath)shadowPath;
- (_UIRadiosityShadowView)initWithSourceView:(id)a3 shadowPath:(id)a4 isSoft:(BOOL)a5;
- (void)setNeedsPunchout:(BOOL)a3;
- (void)setPunchoutLayer:(id)a3;
- (void)setShadowPath:(id)a3;
@end

@implementation _UIRadiosityShadowView

- (_UIRadiosityShadowView)initWithSourceView:(id)a3 shadowPath:(id)a4 isSoft:(BOOL)a5
{
  BOOL v5 = a5;
  v28[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [v9 bounds];
  v27.receiver = self;
  v27.super_class = (Class)_UIRadiosityShadowView;
  v10 = -[UIView initWithFrame:](&v27, sel_initWithFrame_);
  v11 = v10;
  if (v10)
  {
    [(_UIRadiosityShadowView *)v10 setShadowPath:v9];
    v12 = objc_opt_new();
    [(UIView *)v11 bounds];
    objc_msgSend(v12, "setFrame:");
    v13 = [v8 layer];
    [v12 setSourceLayer:v13];

    [v12 setMatchesPosition:1];
    [v12 setAllowsBackdropGroups:1];
    v14 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v14 setValue:&unk_1ED3F2028 forKey:*MEMORY[0x1E4F3A1D8]];
    v15 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
    CAColorMatrixMakeMultiplyColor();
    memset(v26, 0, sizeof(v26));
    v16 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v26];
    [v15 setValue:v16 forKey:*MEMORY[0x1E4F3A168]];

    v28[0] = v14;
    v28[1] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    [v12 setFilters:v17];

    v18 = [(UIView *)v11 layer];
    [v18 addSublayer:v12];

    if (v5) {
      float v19 = 0.07;
    }
    else {
      float v19 = 0.15;
    }
    if (v5) {
      double v20 = 16.0;
    }
    else {
      double v20 = 8.0;
    }
    if (v5) {
      double v21 = 5.0;
    }
    else {
      double v21 = 3.0;
    }
    v22 = objc_opt_new();
    [(UIView *)v11 bounds];
    objc_msgSend(v22, "setFrame:");
    objc_msgSend(v22, "setShadowPath:", objc_msgSend(v9, "CGPath"));
    objc_msgSend(v22, "setShadowOffset:", 0.0, v21);
    [v22 setShadowRadius:v20];
    *(float *)&double v23 = v19;
    [v22 setShadowOpacity:v23];
    v24 = [(UIView *)v11 layer];
    [v24 addSublayer:v22];
  }
  return v11;
}

- (void)setNeedsPunchout:(BOOL)a3
{
  if (self->_needsPunchout != a3)
  {
    self->_needsPunchout = a3;
    if (a3)
    {
      v4 = objc_opt_new();
      id v5 = [(_UIRadiosityShadowView *)self shadowPath];
      objc_msgSend(v4, "setPath:", objc_msgSend(v5, "CGPath"));

      [v4 setCompositingFilter:*MEMORY[0x1E4F3A098]];
      [(_UIRadiosityShadowView *)self setPunchoutLayer:v4];

      id v8 = [(UIView *)self layer];
      v6 = [(_UIRadiosityShadowView *)self punchoutLayer];
      [v8 addSublayer:v6];
    }
    else
    {
      v7 = [(_UIRadiosityShadowView *)self punchoutLayer];
      [v7 removeFromSuperlayer];

      [(_UIRadiosityShadowView *)self setPunchoutLayer:0];
    }
  }
}

- (BOOL)needsPunchout
{
  return self->_needsPunchout;
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (void)setShadowPath:(id)a3
{
}

- (CALayer)punchoutLayer
{
  return self->_punchoutLayer;
}

- (void)setPunchoutLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchoutLayer, 0);
  objc_storeStrong((id *)&self->_shadowPath, 0);
}

@end
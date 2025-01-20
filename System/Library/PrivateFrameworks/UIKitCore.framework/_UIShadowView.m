@interface _UIShadowView
- (BOOL)useLowerIntensity;
- (void)_updateShadowVisualStyling;
- (void)didMoveToSuperview;
- (void)setUseLowerIntensity:(BOOL)a3;
@end

@implementation _UIShadowView

- (void)didMoveToSuperview
{
  v3 = [(UIView *)self superview];

  if (v3)
  {
    [(_UIShadowView *)self _updateShadowVisualStyling];
  }
}

- (void)setUseLowerIntensity:(BOOL)a3
{
  if (self->_useLowerIntensity != a3)
  {
    self->_useLowerIntensity = a3;
    [(_UIShadowView *)self _updateShadowVisualStyling];
  }
}

- (void)_updateShadowVisualStyling
{
  v29[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UIShadowView *)self useLowerIntensity];
  float v4 = -0.17188;
  if (v3) {
    float v4 = -0.1875;
  }
  float v5 = 0.67188;
  if (v3) {
    float v5 = 0.79688;
  }
  unint64_t v16 = __PAIR64__(LODWORD(v4), LODWORD(v5));
  long long v17 = xmmword_186B98D70;
  float v6 = 0.57812;
  if (v3) {
    float v6 = 0.71875;
  }
  float v7 = 0.078125;
  if (v3) {
    float v7 = 0.09375;
  }
  unint64_t v18 = __PAIR64__(LODWORD(v7), LODWORD(v6));
  float v8 = 0.82812;
  if (v3) {
    float v8 = 0.96875;
  }
  float v9 = -0.015625;
  if (!v3) {
    float v9 = 0.0;
  }
  float v10 = -0.23438;
  if (v3) {
    float v10 = -0.25;
  }
  float v11 = -0.45312;
  if (v3) {
    float v11 = -0.5;
  }
  uint64_t v19 = 0x3C80000000000000;
  int v20 = -1111490560;
  float v21 = v4;
  float v22 = v8;
  int v23 = 0;
  float v24 = v9;
  float v25 = v10;
  float v26 = v11;
  uint64_t v27 = 0x3F800000BDC00000;
  int v28 = 0;
  v12 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v16];
  v13 = objc_msgSend(MEMORY[0x1E4F39BC0], "filterWithType:", *MEMORY[0x1E4F3A350], v16, v17, v18);
  [v13 setValue:v12 forKey:@"inputColorMatrix"];
  v29[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v15 = [(UIView *)self layer];
  [v15 setFilters:v14];
}

- (BOOL)useLowerIntensity
{
  return self->_useLowerIntensity;
}

@end
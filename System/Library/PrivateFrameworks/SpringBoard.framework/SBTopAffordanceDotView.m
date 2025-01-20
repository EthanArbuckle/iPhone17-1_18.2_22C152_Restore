@interface SBTopAffordanceDotView
+ (CAColorMatrix)darkDefaultColorMatrix;
+ (CAColorMatrix)darkHighlightedColorMatrix;
+ (CAColorMatrix)lightDefaultColorMatrix;
+ (CAColorMatrix)lightHighlightedColorMatrix;
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)isHighlighted;
- (CAColorMatrix)_effectiveColorMatrix;
- (SBTopAffordanceDotView)initWithFrame:(CGRect)a3;
- (id)_makeBackdropLayerFilters;
- (void)_updateBackdropLayerFilters;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SBTopAffordanceDotView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (CAColorMatrix)lightDefaultColorMatrix
{
  *retstr = *(CAColorMatrix *)byte_1D8FD1420;
  return result;
}

+ (CAColorMatrix)lightHighlightedColorMatrix
{
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var18 = 0.75;
  return result;
}

+ (CAColorMatrix)darkDefaultColorMatrix
{
  *(_OWORD *)&retstr->var0 = xmmword_1D8FD1470;
  *(_OWORD *)&retstr->var4 = xmmword_1D8FD1480;
  *(_OWORD *)&retstr->var8 = xmmword_1D8FD1490;
  *(_OWORD *)&retstr->var12 = xmmword_1D8FD14A0;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)&byte_1D8FD1420[64];
  return result;
}

+ (CAColorMatrix)darkHighlightedColorMatrix
{
  *(_OWORD *)&retstr->var0 = xmmword_1D8FD14B0;
  *(_OWORD *)&retstr->var4 = xmmword_1D8FD14C0;
  *(_OWORD *)&retstr->var8 = xmmword_1D8FD14D0;
  *(_OWORD *)&retstr->var12 = xmmword_1D8FD14E0;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)&byte_1D8FD1420[64];
  return result;
}

- (SBTopAffordanceDotView)initWithFrame:(CGRect)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SBTopAffordanceDotView;
  v3 = -[SBTopAffordanceDotView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SBTopAffordanceDotView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(SBTopAffordanceDotView *)v4 _backdropLayer];
    [v5 setAllowsInPlaceFiltering:1];
    [v5 setCornerCurve:*MEMORY[0x1E4F39EA0]];
    [v5 setCornerRadius:2.5];
    v6 = [(SBTopAffordanceDotView *)v4 _makeBackdropLayerFilters];
    [v5 setFilters:v6];

    v7 = [(SBTopAffordanceDotView *)v4 widthAnchor];
    v8 = [v7 constraintEqualToConstant:5.0];
    v15[0] = v8;
    v9 = [(SBTopAffordanceDotView *)v4 heightAnchor];
    v10 = [(SBTopAffordanceDotView *)v4 widthAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v15[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    [(SBTopAffordanceDotView *)v4 addConstraints:v12];
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(SBTopAffordanceDotView *)self _updateBackdropLayerFilters];
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"filters.colorMatrix.inputColorMatrix"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBTopAffordanceDotView;
    BOOL v5 = [(SBTopAffordanceDotView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (CAColorMatrix)_effectiveColorMatrix
{
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  BOOL v5 = [(SBTopAffordanceDotView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  if (v6 != 2)
  {
    if (self->_highlighted)
    {
      result = (CAColorMatrix *)objc_opt_class();
      if (result)
      {
        result = (CAColorMatrix *)[(CAColorMatrix *)result lightHighlightedColorMatrix];
        goto LABEL_13;
      }
    }
    else
    {
      result = (CAColorMatrix *)objc_opt_class();
      if (result)
      {
        result = (CAColorMatrix *)[(CAColorMatrix *)result lightDefaultColorMatrix];
        goto LABEL_13;
      }
    }
LABEL_12:
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
    goto LABEL_13;
  }
  if (!self->_highlighted)
  {
    result = (CAColorMatrix *)objc_opt_class();
    if (result)
    {
      result = (CAColorMatrix *)[(CAColorMatrix *)result darkDefaultColorMatrix];
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  result = (CAColorMatrix *)objc_opt_class();
  if (!result) {
    goto LABEL_12;
  }
  result = (CAColorMatrix *)[(CAColorMatrix *)result darkHighlightedColorMatrix];
LABEL_13:
  *(_OWORD *)&retstr->var8 = v10;
  *(_OWORD *)&retstr->var12 = v11;
  *(_OWORD *)&retstr->var16 = v12;
  *(_OWORD *)&retstr->var0 = v8;
  *(_OWORD *)&retstr->var4 = v9;
  return result;
}

- (id)_makeBackdropLayerFilters
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
  [v3 setName:@"colorMatrix"];
  id v4 = (void *)MEMORY[0x1E4F29238];
  [(SBTopAffordanceDotView *)self _effectiveColorMatrix];
  BOOL v5 = [v4 valueWithCAColorMatrix:&v8];
  [v3 setValue:v5 forKey:*MEMORY[0x1E4F3A168]];

  v9[0] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v6;
}

- (void)_updateBackdropLayerFilters
{
  v3 = [(SBTopAffordanceDotView *)self _backdropLayer];
  id v4 = (void *)MEMORY[0x1E4F29238];
  [(SBTopAffordanceDotView *)self _effectiveColorMatrix];
  BOOL v5 = [v4 valueWithCAColorMatrix:&v6];
  [v3 setValue:v5 forKeyPath:@"filters.colorMatrix.inputColorMatrix"];
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
}

@end
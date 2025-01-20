@interface NTKDigitalTimeLabel
- (BOOL)isFrozen;
- (BOOL)usesLegibility;
- (NTKDigitalTimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4;
- (UIColor)contentColor;
- (UIColor)overrideColor;
- (id)_labelColorFromFaceColorPalette:(id)a3 device:(id)a4;
- (id)_newUnderlyingLabel:(BOOL)a3;
- (void)applyFaceColorPalette:(id)a3 device:(id)a4;
- (void)applyFaceFromColorPalette:(id)a3 toColorPalette:(id)a4 fraction:(float)a5 device:(id)a6;
- (void)layoutSubviews;
- (void)setForcedNumberSystem:(unint64_t)a3;
- (void)setFrameUsingCurrentStyle;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideColor:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setShadowColor:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setUsesLegibility:(BOOL)a3;
@end

@implementation NTKDigitalTimeLabel

- (NTKDigitalTimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKDigitalTimeLabel;
  return [(CLKUITimeLabel *)&v5 initWithTimeLabelOptions:a3 forDevice:a4];
}

- (void)setFrameUsingCurrentStyle
{
  v3 = [(CLKUITimeLabel *)self style];
  v4 = [v3 layoutRule];
  [(NTKDigitalTimeLabel *)self bounds];
  objc_msgSend(v4, "calculateLayoutFrameForBoundsSize:", v5, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  -[UIView ntk_setBoundsAndPositionFromFrame:](self, "ntk_setBoundsAndPositionFromFrame:", v8, v10, v12, v14);
}

- (void)setStyle:(id)a3
{
  id v4 = a3;
  double v5 = [(CLKUITimeLabel *)self style];
  v6.receiver = self;
  v6.super_class = (Class)NTKDigitalTimeLabel;
  [(CLKUITimeLabel *)&v6 setStyle:v4];
  [v4 isEqual:v5];
}

- (id)_newUnderlyingLabel:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)off_1E62BDB58);
  objc_super v6 = objc_msgSend(v5, "initWithFrame:options:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = [(NTKDigitalTimeLabel *)self color];
  [v6 setColor:v7];

  [v6 setShadowBlur:10.0];
  BOOL v8 = v3 && self->_usesLegibility;
  [v6 setUsesLegibility:v8];
  double v9 = [(CLKUITimeLabel *)self style];
  double v10 = [v9 tracking];

  if (v10)
  {
    [v10 doubleValue];
    objc_msgSend(v6, "setTracking:");
  }

  return v6;
}

- (void)setShadowColor:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_shadowColor, a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__NTKDigitalTimeLabel_setShadowColor___block_invoke;
  v7[3] = &unk_1E62C6938;
  id v8 = v5;
  id v6 = v5;
  [(CLKUITimeLabel *)self _enumerateUnderlyingLabelsWithBlock:v7];
}

uint64_t __38__NTKDigitalTimeLabel_setShadowColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShadowColor:*(void *)(a1 + 32)];
}

- (void)applyFaceColorPalette:(id)a3 device:(id)a4
{
  LODWORD(v4) = 1.0;
  [(NTKDigitalTimeLabel *)self applyFaceFromColorPalette:a3 toColorPalette:a3 fraction:a4 device:v4];
}

- (void)applyFaceFromColorPalette:(id)a3 toColorPalette:(id)a4 fraction:(float)a5 device:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v13 = [(NTKDigitalTimeLabel *)self _labelColorFromFaceColorPalette:a3 device:v9];
  double v11 = [(NTKDigitalTimeLabel *)self _labelColorFromFaceColorPalette:v10 device:v9];

  double v12 = NTKInterpolateBetweenColors();
  [(NTKDigitalTimeLabel *)self setColor:v12];
}

- (id)_labelColorFromFaceColorPalette:(id)a3 device:(id)a4
{
  id v5 = a3;
  if ([v5 isMulticolor]) {
    [(NTKDigitalTimeLabel *)self overrideColor];
  }
  else {
  id v6 = [v5 primaryColor];
  }

  return v6;
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKDigitalTimeLabel;
  [(CLKUITimeLabel *)&v8 setTextColor:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NTKDigitalTimeLabel_setTextColor___block_invoke;
  v6[3] = &unk_1E62C6938;
  id v7 = v4;
  id v5 = v4;
  [(CLKUITimeLabel *)self _enumerateUnderlyingLabelsWithBlock:v6];
}

uint64_t __36__NTKDigitalTimeLabel_setTextColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setColor:*(void *)(a1 + 32)];
}

- (UIColor)contentColor
{
  return 0;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setUsesLegibility:(BOOL)a3
{
  self->_usesLegibility = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__NTKDigitalTimeLabel_setUsesLegibility___block_invoke;
  v3[3] = &unk_1E62C6938;
  v3[4] = self;
  [(CLKUITimeLabel *)self _enumerateUnderlyingLabelsWithBlock:v3];
}

uint64_t __41__NTKDigitalTimeLabel_setUsesLegibility___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUsesLegibility:");
}

- (void)setForcedNumberSystem:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKDigitalTimeLabel;
  [(CLKUITimeLabel *)&v3 setForcedNumberSystem:a3];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v5 = a3;
  id v6 = [(CLKUITimeLabel *)self timeFormatter];
  [v6 setOverrideDate:v5];
}

- (void)setTimeOffset:(double)a3
{
  id v4 = [(CLKUITimeLabel *)self timeFormatter];
  [v4 setTimeOffset:a3];
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
  -[CLKUITimeLabel setPaused:](self, "setPaused:");
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)NTKDigitalTimeLabel;
  [(CLKUITimeLabel *)&v2 layoutSubviews];
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (void)setOverrideColor:(id)a3
{
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);

  objc_storeStrong((id *)&self->_shadowColor, 0);
}

@end
@interface NTKVictoryTimeLabel
- (NSHashTable)labels;
- (NTKVictoryTimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4 additionalPaddingInsets:(double)a5;
- (UIColor)outlineColor;
- (double)additionalPaddingInsets;
- (double)outlineAlpha;
- (id)_newUnderlyingLabel:(BOOL)a3;
- (void)setAdditionalPaddingInsets:(double)a3;
- (void)setLabels:(id)a3;
- (void)setOutlineAlpha:(double)a3;
- (void)setOutlineColor:(id)a3;
@end

@implementation NTKVictoryTimeLabel

- (NTKVictoryTimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4 additionalPaddingInsets:(double)a5
{
  self->_additionalPaddingInsets = a5;
  v6.receiver = self;
  v6.super_class = (Class)NTKVictoryTimeLabel;
  return [(NTKDigitalTimeLabel *)&v6 initWithTimeLabelOptions:a3 forDevice:a4];
}

- (id)_newUnderlyingLabel:(BOOL)a3
{
  v4 = [NTKVictoryLabel alloc];
  v5 = -[CLKUIColoringLabel initWithFrame:options:](v4, "initWithFrame:options:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NTKVictoryLabel *)v5 setOutlineColor:self->_outlineColor];
  [(NTKVictoryLabel *)v5 setOutlineAlpha:self->_outlineAlpha];
  [(NTKVictoryLabel *)v5 setAdditionalPaddingInsets:self->_additionalPaddingInsets];
  labels = self->_labels;
  if (!labels)
  {
    v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v8 = self->_labels;
    self->_labels = v7;

    labels = self->_labels;
  }
  [(NSHashTable *)labels addObject:v5];
  return v5;
}

- (void)setOutlineColor:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_outlineColor, a3);
  objc_super v6 = [(NSHashTable *)self->_labels allObjects];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__NTKVictoryTimeLabel_setOutlineColor___block_invoke;
  v8[3] = &unk_1E62C36E8;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __39__NTKVictoryTimeLabel_setOutlineColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOutlineColor:*(void *)(a1 + 32)];
}

- (void)setOutlineAlpha:(double)a3
{
  self->_outlineAlpha = a3;
  v4 = [(NSHashTable *)self->_labels allObjects];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__NTKVictoryTimeLabel_setOutlineAlpha___block_invoke;
  v5[3] = &__block_descriptor_40_e32_v32__0__NTKVictoryLabel_8Q16_B24l;
  *(double *)&v5[4] = a3;
  [v4 enumerateObjectsUsingBlock:v5];
}

uint64_t __39__NTKVictoryTimeLabel_setOutlineAlpha___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOutlineAlpha:*(double *)(a1 + 32)];
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (double)outlineAlpha
{
  return self->_outlineAlpha;
}

- (double)additionalPaddingInsets
{
  return self->_additionalPaddingInsets;
}

- (void)setAdditionalPaddingInsets:(double)a3
{
  self->_additionalPaddingInsets = a3;
}

- (NSHashTable)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_outlineColor, 0);
}

@end
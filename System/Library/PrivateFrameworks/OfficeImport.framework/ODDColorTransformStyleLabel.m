@interface ODDColorTransformStyleLabel
- (id)effectColors;
- (id)fillColors;
- (id)lineColors;
- (id)textEffectColors;
- (id)textFillColors;
- (id)textLineColors;
- (void)applyToShapeStyle:(id)a3 index:(unsigned int)a4 count:(unsigned int)a5 state:(id)a6;
- (void)setEffectColors:(id)a3;
- (void)setFillColors:(id)a3;
- (void)setLineColors:(id)a3;
- (void)setTextEffectColors:(id)a3;
- (void)setTextFillColors:(id)a3;
- (void)setTextLineColors:(id)a3;
@end

@implementation ODDColorTransformStyleLabel

- (void)setFillColors:(id)a3
{
}

- (void)setLineColors:(id)a3
{
}

- (void)setEffectColors:(id)a3
{
}

- (void)setTextLineColors:(id)a3
{
}

- (void)setTextFillColors:(id)a3
{
}

- (void)setTextEffectColors:(id)a3
{
}

- (void)applyToShapeStyle:(id)a3 index:(unsigned int)a4 count:(unsigned int)a5 state:(id)a6
{
  id v24 = a3;
  id v10 = a6;
  v11 = [(ODDColorTransformStyleLabel *)self fillColors];
  uint64_t v12 = a5;
  v13 = [v11 colorAtIndex:a4 count:a5 state:v10];

  if (v13)
  {
    v14 = [v24 fillReference];
    [v14 setColor:v13];
  }
  v15 = [(ODDColorTransformStyleLabel *)self lineColors];
  v16 = [v15 colorAtIndex:a4 count:v12 state:v10];

  if (v16)
  {
    v17 = [v24 lineReference];
    [v17 setColor:v16];
  }
  v18 = [(ODDColorTransformStyleLabel *)self effectColors];
  v19 = [v18 colorAtIndex:a4 count:v12 state:v10];

  if (v19)
  {
    v20 = [v24 effectReference];
    [v20 setColor:v19];
  }
  v21 = [(ODDColorTransformStyleLabel *)self textFillColors];
  v22 = [v21 colorAtIndex:a4 count:v12 state:v10];

  if (v22)
  {
    v23 = [v24 fontReference];
    [v23 setColor:v22];
  }
}

- (id)fillColors
{
  return self->mFillColors;
}

- (id)lineColors
{
  return self->mLineColors;
}

- (id)effectColors
{
  return self->mEffectColors;
}

- (id)textFillColors
{
  return self->mTextFillColors;
}

- (id)textLineColors
{
  return self->mTextLineColors;
}

- (id)textEffectColors
{
  return self->mTextEffectColors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextEffectColors, 0);
  objc_storeStrong((id *)&self->mTextFillColors, 0);
  objc_storeStrong((id *)&self->mTextLineColors, 0);
  objc_storeStrong((id *)&self->mEffectColors, 0);
  objc_storeStrong((id *)&self->mLineColors, 0);
  objc_storeStrong((id *)&self->mFillColors, 0);
}

@end
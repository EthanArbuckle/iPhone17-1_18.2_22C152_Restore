@interface DynamicTypeValue
- (double)scaledValue;
- (double)unscaledValue;
- (id)fontProvider;
- (void)setFontProvider:(id)a3;
- (void)setUnscaledValue:(double)a3;
@end

@implementation DynamicTypeValue

- (double)scaledValue
{
  uint64_t v3 = [(DynamicTypeValue *)self fontProvider];
  if (v3
    && (v4 = (void *)v3,
        [(DynamicTypeValue *)self fontProvider],
        v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(),
        v5[2](),
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v6))
  {
    [(DynamicTypeValue *)self unscaledValue];
    [v6 _mapkit_scaledValueForValue:1 scalingForMacIdiom:0 respectingTraitEnvironment:];
    double v8 = v7;

    return v8;
  }
  else
  {
    [(DynamicTypeValue *)self unscaledValue];
  }
  return result;
}

- (id)fontProvider
{
  return self->_fontProvider;
}

- (void)setFontProvider:(id)a3
{
}

- (double)unscaledValue
{
  return self->_unscaledValue;
}

- (void)setUnscaledValue:(double)a3
{
  self->_unscaledValue = a3;
}

- (void).cxx_destruct
{
}

@end
@interface NSCoder(UIGeometryKeyedCodingPrivate)
- (float)_ui_decodeCAFrameRateRangeForKey:()UIGeometryKeyedCodingPrivate;
- (void)_ui_encodeCAFrameRateRange:()UIGeometryKeyedCodingPrivate forKey:;
@end

@implementation NSCoder(UIGeometryKeyedCodingPrivate)

- (void)_ui_encodeCAFrameRateRange:()UIGeometryKeyedCodingPrivate forKey:
{
  id v10 = a6;
  _NSStringFromCAFrameRateRange(a2, a3, a4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v11 forKey:v10];
}

- (float)_ui_decodeCAFrameRateRangeForKey:()UIGeometryKeyedCodingPrivate
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if (v5) {
    float v6 = _CAFrameRateRangeFromString(v5);
  }
  else {
    float v6 = *MEMORY[0x1E4F39AF0];
  }

  return v6;
}

@end
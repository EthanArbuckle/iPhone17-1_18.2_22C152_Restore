@interface _UIFontSystemCacheKey
- (BOOL)_isEqualToKey:(id)a3;
- (BOOL)monospacedDigits;
- (BOOL)textLegibility;
- (NSNumber)width;
- (NSString)design;
- (double)pointSize;
- (double)weight;
- (id)description;
- (int)traits;
- (unint64_t)_hash;
- (void)dealloc;
- (void)setDesign:(id)a3;
- (void)setMonospacedDigits:(BOOL)a3;
- (void)setPointSize:(double)a3;
- (void)setTextLegibility:(BOOL)a3;
- (void)setTraits:(int)a3;
- (void)setWeight:(double)a3;
- (void)setWidth:(id)a3;
@end

@implementation _UIFontSystemCacheKey

- (unint64_t)_hash
{
  uint64_t traits = self->_traits;
  NSUInteger v4 = [(NSString *)self->_design hash];
  double weight = self->_weight;
  width = self->_width;
  if (width) {
    uint64_t v7 = [(NSNumber *)width hash];
  }
  else {
    uint64_t v7 = -1;
  }
  return v4 ^ traits ^ v7 ^ vcvtmd_u64_f64(weight * 100.0) ^ vcvtmd_u64_f64(self->_pointSize * 100.0) ^ self->_monospacedDigits ^ self->_textLegibility;
}

- (BOOL)_isEqualToKey:(id)a3
{
  if (self->super._hash != *((void *)a3 + 1) || self->_traits != *((_DWORD *)a3 + 5)) {
    goto LABEL_14;
  }
  design = self->_design;
  if (design == *((NSString **)a3 + 3) || (BOOL v6 = -[NSString isEqualToString:](design, "isEqualToString:")))
  {
    double weight = self->_weight;
    [a3 weight];
    if (vabdd_f64(weight, v8) < 0.00000011920929)
    {
      width = self->_width;
      uint64_t v10 = *((void *)a3 + 5);
      if (width)
      {
        if (!v10) {
          goto LABEL_14;
        }
        BOOL v6 = -[NSNumber isEqualToNumber:](width, "isEqualToNumber:");
        if (!v6) {
          return v6;
        }
      }
      else if (v10)
      {
        goto LABEL_14;
      }
      double pointSize = self->_pointSize;
      [a3 pointSize];
      if (vabdd_f64(pointSize, v12) < 0.00000011920929)
      {
        int monospacedDigits = self->_monospacedDigits;
        if (monospacedDigits == [a3 monospacedDigits])
        {
          int textLegibility = self->_textLegibility;
          LOBYTE(v6) = textLegibility == [a3 textLegibility];
          return v6;
        }
      }
    }
LABEL_14:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (double)weight
{
  return self->_weight;
}

- (BOOL)textLegibility
{
  return self->_textLegibility;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (BOOL)monospacedDigits
{
  return self->_monospacedDigits;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFontSystemCacheKey;
  [(_UIFontSystemCacheKey *)&v3 dealloc];
}

- (void)setWidth:(id)a3
{
}

- (void)setTextLegibility:(BOOL)a3
{
  self->_int textLegibility = a3;
}

- (void)setPointSize:(double)a3
{
  self->_double pointSize = a3;
}

- (void)setTraits:(int)a3
{
  self->_uint64_t traits = a3;
}

- (void)setWeight:(double)a3
{
  self->_double weight = a3;
}

- (void)setMonospacedDigits:(BOOL)a3
{
  self->_int monospacedDigits = a3;
}

- (void)setDesign:(id)a3
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"system, traits: %ld, pointSize: %g", self->_traits, *(void *)&self->_pointSize];
}

- (int)traits
{
  return self->_traits;
}

- (NSString)design
{
  return self->_design;
}

- (NSNumber)width
{
  return self->_width;
}

@end
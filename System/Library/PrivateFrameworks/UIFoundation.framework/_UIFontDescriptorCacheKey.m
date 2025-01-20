@interface _UIFontDescriptorCacheKey
- (BOOL)_isEqualToKey:(id)a3;
- (BOOL)textLegibility;
- (NSString)textStyleForScaling;
- (UIFontDescriptor)fontDescriptor;
- (double)maximumPointSizeAfterScaling;
- (double)pointSize;
- (double)pointSizeForScaling;
- (id)description;
- (unint64_t)_hash;
- (void)dealloc;
- (void)setFontDescriptor:(id)a3;
- (void)setMaximumPointSizeAfterScaling:(double)a3;
- (void)setPointSize:(double)a3;
- (void)setPointSizeForScaling:(double)a3;
- (void)setTextLegibility:(BOOL)a3;
- (void)setTextStyleForScaling:(id)a3;
@end

@implementation _UIFontDescriptorCacheKey

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFontDescriptorCacheKey;
  [(_UIFontDescriptorCacheKey *)&v3 dealloc];
}

- (void)setTextStyleForScaling:(id)a3
{
}

- (void)setTextLegibility:(BOOL)a3
{
  self->_textLegibility = a3;
}

- (void)setPointSizeForScaling:(double)a3
{
  self->_pointSizeForScaling = a3;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (void)setMaximumPointSizeAfterScaling:(double)a3
{
  self->_maximumPointSizeAfterScaling = a3;
}

- (void)setFontDescriptor:(id)a3
{
}

- (unint64_t)_hash
{
  uint64_t v3 = [(UIFontDescriptor *)self->_fontDescriptor hash];
  unint64_t v4 = vcvtmd_u64_f64((self->_pointSize + self->_pointSizeForScaling + self->_maximumPointSizeAfterScaling) * 100.0);
  return [(NSString *)self->_textStyleForScaling hash] ^ v3 ^ self->_textLegibility ^ v4;
}

- (BOOL)_isEqualToKey:(id)a3
{
  if (self->super._hash != *((void *)a3 + 1) || vabdd_f64(self->_pointSize, *((double *)a3 + 4)) >= 0.00000011920929) {
    goto LABEL_10;
  }
  fontDescriptor = self->_fontDescriptor;
  if (fontDescriptor == *((UIFontDescriptor **)a3 + 3)
    || (int v6 = -[UIFontDescriptor isEqual:](fontDescriptor, "isEqual:")) != 0)
  {
    textStyleForScaling = self->_textStyleForScaling;
    if (textStyleForScaling == *((NSString **)a3 + 5)
      || (int v6 = -[NSString isEqualToString:](textStyleForScaling, "isEqualToString:")) != 0)
    {
      if (self->_pointSizeForScaling == *((double *)a3 + 6)
        && self->_maximumPointSizeAfterScaling == *((double *)a3 + 7))
      {
        LOBYTE(v6) = self->_textLegibility == *((unsigned __int8 *)a3 + 16);
        return v6;
      }
LABEL_10:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"descriptor: <%p:%@>, pointSize: %g, textStyleForScaling: %@, pointSizeForScaling: %g, maximumPointSizeAfterScaling: %g", self->_fontDescriptor, -[UIFontDescriptor postscriptName](self->_fontDescriptor, "postscriptName"), *(void *)&self->_pointSize, self->_textStyleForScaling, *(void *)&self->_pointSizeForScaling, *(void *)&self->_maximumPointSizeAfterScaling];
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (NSString)textStyleForScaling
{
  return self->_textStyleForScaling;
}

- (double)pointSizeForScaling
{
  return self->_pointSizeForScaling;
}

- (double)maximumPointSizeAfterScaling
{
  return self->_maximumPointSizeAfterScaling;
}

- (BOOL)textLegibility
{
  return self->_textLegibility;
}

@end
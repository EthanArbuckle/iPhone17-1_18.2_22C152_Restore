@interface MTMPUMutableFontDescriptor
- (id)_copyAllowingGlobalCacheLookup:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_resetToDefaultValues;
- (void)setDefaultPointSizeAdjustment:(double)a3;
- (void)setLeadingAdjustment:(int64_t)a3;
- (void)setSystemFontSize:(double)a3;
- (void)setTextStyle:(int64_t)a3;
- (void)setUsesCondensedMetrics:(BOOL)a3;
- (void)setUsesItalic:(BOOL)a3;
- (void)setWantsMonospaceNumbers:(BOOL)a3;
- (void)setWeight:(int64_t)a3;
@end

@implementation MTMPUMutableFontDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  return [(MTMPUMutableFontDescriptor *)self _copyAllowingGlobalCacheLookup:1];
}

- (void)setDefaultPointSizeAdjustment:(double)a3
{
  if (!MTMPUFloatEqualToFloat(self->super._defaultPointSizeAdjustment, a3))
  {
    self->super._defaultPointSizeAdjustment = a3;
    [(MTMPUFontDescriptor *)self _invalidateCachedFontsAndMetrics];
  }
}

- (void)setLeadingAdjustment:(int64_t)a3
{
  if (self->super._leadingAdjustment != a3)
  {
    self->super._leadingAdjustment = a3;
    [(MTMPUFontDescriptor *)self _invalidateCachedFontsAndMetrics];
  }
}

- (void)setSystemFontSize:(double)a3
{
  if (!MTMPUFloatEqualToFloat(self->super._systemFontSize, a3))
  {
    self->super._systemFontSize = a3;
    [(MTMPUFontDescriptor *)self _invalidateCachedFontsAndMetrics];
  }
}

- (void)setTextStyle:(int64_t)a3
{
  if (self->super._textStyle != a3)
  {
    self->super._textStyle = a3;
    [(MTMPUFontDescriptor *)self _invalidateCachedFontsAndMetrics];
  }
}

- (void)setWeight:(int64_t)a3
{
  if (self->super._weight != a3)
  {
    self->super._weight = a3;
    [(MTMPUFontDescriptor *)self _invalidateCachedFontsAndMetrics];
  }
}

- (void)setUsesItalic:(BOOL)a3
{
  if (self->super._usesItalic != a3)
  {
    self->super._usesItalic = a3;
    [(MTMPUFontDescriptor *)self _invalidateCachedFontsAndMetrics];
  }
}

- (void)setUsesCondensedMetrics:(BOOL)a3
{
  if (self->super._usesCondensedMetrics != a3)
  {
    self->super._usesCondensedMetrics = a3;
    [(MTMPUFontDescriptor *)self _invalidateCachedFontsAndMetrics];
  }
}

- (void)setWantsMonospaceNumbers:(BOOL)a3
{
  if (self->super._wantsMonospaceNumbers != a3)
  {
    self->super._wantsMonospaceNumbers = a3;
    [(MTMPUFontDescriptor *)self _invalidateCachedFontsAndMetrics];
  }
}

- (id)_copyAllowingGlobalCacheLookup:(BOOL)a3
{
  if (a3)
  {
    v4 = +[MTMPUFontDescriptorCache sharedFontDescriptorCache];
    uint64_t v5 = [v4 cachedImmutableFontDescriptorMatchingMutableFontDescriptor:self];
  }
  else
  {
    v6 = objc_alloc_init(MTMPUFontDescriptor);
    uint64_t v5 = (uint64_t)v6;
    if (v6)
    {
      v6->_textStyle = self->super._textStyle;
      v6->_weight = self->super._weight;
      v6->_defaultPointSizeAdjustment = self->super._defaultPointSizeAdjustment;
      v6->_leadingAdjustment = self->super._leadingAdjustment;
      v6->_usesItalic = self->super._usesItalic;
      v6->_usesCondensedMetrics = self->super._usesCondensedMetrics;
      v6->_wantsMonospaceNumbers = self->super._wantsMonospaceNumbers;
      objc_storeStrong((id *)&v6->_preferredFont, self->super._preferredFont);
      *(_OWORD *)(v5 + 64) = *(_OWORD *)&self->super._preferredFontMetrics.ascender;
      long long v7 = *(_OWORD *)&self->super._preferredFontMetrics.bodyLeading;
      long long v8 = *(_OWORD *)&self->super._preferredFontMetrics.capHeight;
      long long v9 = *(_OWORD *)&self->super._preferredFontMetrics.lineHeight;
      *(_OWORD *)(v5 + 112) = *(_OWORD *)&self->super._preferredFontMetrics.descender;
      *(_OWORD *)(v5 + 128) = v9;
      *(_OWORD *)(v5 + 80) = v7;
      *(_OWORD *)(v5 + 96) = v8;
      objc_storeStrong((id *)(v5 + 144), self->super._defaultFont);
      *(_OWORD *)(v5 + 152) = *(_OWORD *)&self->super._defaultFontMetrics.ascender;
      long long v10 = *(_OWORD *)&self->super._defaultFontMetrics.bodyLeading;
      long long v11 = *(_OWORD *)&self->super._defaultFontMetrics.capHeight;
      long long v12 = *(_OWORD *)&self->super._defaultFontMetrics.descender;
      *(_OWORD *)(v5 + 216) = *(_OWORD *)&self->super._defaultFontMetrics.lineHeight;
      *(_OWORD *)(v5 + 200) = v12;
      *(_OWORD *)(v5 + 184) = v11;
      *(_OWORD *)(v5 + 168) = v10;
      *(double *)(v5 + 24) = self->super._systemFontSize;
    }
  }
  return (id)v5;
}

- (void)_resetToDefaultValues
{
  v2.receiver = self;
  v2.super_class = (Class)MTMPUMutableFontDescriptor;
  [(MTMPUFontDescriptor *)&v2 _resetToDefaultValues];
}

@end
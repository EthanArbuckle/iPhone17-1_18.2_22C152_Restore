@interface WDRubyProperties
- (BOOL)isAlignmentOverridden;
- (BOOL)isAnythingOverridden;
- (BOOL)isAnythingOverriddenIn:(id *)a3;
- (BOOL)isBaseFontSizeOverridden;
- (BOOL)isDistanceBetweenOverridden;
- (BOOL)isPhoneticGuideFontSizeOverridden;
- (BOOL)isPhoneticGuideLanguageOverridden;
- (WDRubyProperties)init;
- (id)description;
- (int)alignment;
- (int)phoneticGuideLanguage;
- (unsigned)baseFontSize;
- (unsigned)distanceBetween;
- (unsigned)phoneticGuideFontSize;
- (void)clearAlignment;
- (void)clearBaseFontSize;
- (void)clearDistanceBetween;
- (void)clearPhoneticGuideFontSize;
- (void)clearPhoneticGuideLanguage;
- (void)dealloc;
- (void)setAlignment:(int)a3;
- (void)setBaseFontSize:(unsigned __int16)a3;
- (void)setDistanceBetween:(unsigned __int16)a3;
- (void)setPhoneticGuideFontSize:(unsigned __int16)a3;
- (void)setPhoneticGuideLanguage:(int)a3;
@end

@implementation WDRubyProperties

- (WDRubyProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)WDRubyProperties;
  result = [(WDRubyProperties *)&v3 init];
  if (result)
  {
    result->mOriginalProperties = 0;
    *((unsigned char *)result + 8) |= 1u;
  }
  return result;
}

- (void)dealloc
{
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties)
  {
    MEMORY[0x23EC997B0](mOriginalProperties, 0x1000C40977131E8);
    self->mOriginalProperties = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WDRubyProperties;
  [(WDRubyProperties *)&v4 dealloc];
}

- (BOOL)isAnythingOverridden
{
  return [(WDRubyProperties *)self isAnythingOverriddenIn:self->mOriginalProperties];
}

- (int)alignment
{
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  int result = mOriginalProperties->var0;
  if (!mOriginalProperties->var0) {
    return 0;
  }
  return result;
}

- (void)setAlignment:(int)a3
{
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties) {
    operator new();
  }
  mOriginalProperties->var0 = a3;
  mOriginalProperties->var5 = 1;
}

- (BOOL)isAlignmentOverridden
{
  mOriginalProperties = self->mOriginalProperties;
  return mOriginalProperties && mOriginalProperties->var5;
}

- (void)clearAlignment
{
  mOriginalProperties = self->mOriginalProperties;
  mOriginalProperties->var5 = 0;
  mOriginalProperties->var0 = 0;
}

- (unsigned)phoneticGuideFontSize
{
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  unsigned __int16 result = mOriginalProperties->var1;
  if (!result) {
    return 0;
  }
  return result;
}

- (void)setPhoneticGuideFontSize:(unsigned __int16)a3
{
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties) {
    operator new();
  }
  mOriginalProperties->var1 = a3;
  mOriginalProperties->var6 = 1;
}

- (BOOL)isPhoneticGuideFontSizeOverridden
{
  mOriginalProperties = self->mOriginalProperties;
  return mOriginalProperties && mOriginalProperties->var6;
}

- (void)clearPhoneticGuideFontSize
{
  mOriginalProperties = self->mOriginalProperties;
  mOriginalProperties->var6 = 0;
  mOriginalProperties->var1 = 0;
}

- (unsigned)baseFontSize
{
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  unsigned __int16 result = mOriginalProperties->var2;
  if (!result) {
    return 0;
  }
  return result;
}

- (void)setBaseFontSize:(unsigned __int16)a3
{
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties) {
    operator new();
  }
  mOriginalProperties->var2 = a3;
  mOriginalProperties->var7 = 1;
}

- (BOOL)isBaseFontSizeOverridden
{
  mOriginalProperties = self->mOriginalProperties;
  return mOriginalProperties && mOriginalProperties->var7;
}

- (void)clearBaseFontSize
{
  mOriginalProperties = self->mOriginalProperties;
  mOriginalProperties->var7 = 0;
  mOriginalProperties->var2 = 0;
}

- (unsigned)distanceBetween
{
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties) {
    return 0;
  }
  unsigned __int16 result = mOriginalProperties->var3;
  if (!result) {
    return 0;
  }
  return result;
}

- (void)setDistanceBetween:(unsigned __int16)a3
{
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties) {
    operator new();
  }
  mOriginalProperties->var3 = a3;
  mOriginalProperties->var8 = 1;
}

- (BOOL)isDistanceBetweenOverridden
{
  mOriginalProperties = self->mOriginalProperties;
  return mOriginalProperties && mOriginalProperties->var8;
}

- (void)clearDistanceBetween
{
  mOriginalProperties = self->mOriginalProperties;
  mOriginalProperties->var8 = 0;
  mOriginalProperties->var3 = 0;
}

- (int)phoneticGuideLanguage
{
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties) {
    return 9;
  }
  int result = mOriginalProperties->var4;
  if (!result) {
    return 9;
  }
  return result;
}

- (void)setPhoneticGuideLanguage:(int)a3
{
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties) {
    operator new();
  }
  mOriginalProperties->var4 = a3;
  mOriginalProperties->var9 = 1;
}

- (BOOL)isPhoneticGuideLanguageOverridden
{
  mOriginalProperties = self->mOriginalProperties;
  return mOriginalProperties && mOriginalProperties->var9;
}

- (void)clearPhoneticGuideLanguage
{
  mOriginalProperties = self->mOriginalProperties;
  mOriginalProperties->var9 = 0;
  mOriginalProperties->var4 = 0xFFFF;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDRubyProperties;
  v2 = [(WDRubyProperties *)&v4 description];
  return v2;
}

- (BOOL)isAnythingOverriddenIn:(id *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->var5 || a3->var6 || a3->var7 || a3->var8) {
    return 1;
  }
  return a3->var9;
}

@end
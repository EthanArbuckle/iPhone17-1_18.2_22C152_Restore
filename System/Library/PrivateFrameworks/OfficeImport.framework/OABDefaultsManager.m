@interface OABDefaultsManager
- (EshBlip)fillBlipDataReference;
- (EshBlip)strokeFillBlipDataReference;
- (EshColor)fillBgColor;
- (EshColor)fillFgColor;
- (EshColor)shadowColor;
- (EshColor)strokeBgColor;
- (EshColor)strokeFgColor;
- (id)fillBlipName;
- (id)strokeFillBlipName;
- (id)textPathFontFamily;
- (id)textPathUnicodeString;
@end

@implementation OABDefaultsManager

- (EshColor)strokeFgColor
{
  LODWORD(v2->var0) = 255;
  return (EshColor)EshStroke::getDefaultColor(v2, (EshColor *)a2);
}

- (EshColor)fillFgColor
{
  LODWORD(v2->var0) = 255;
  return (EshColor)EshFill::getDefaultColor(v2, (EshColor *)a2);
}

- (id)fillBlipName
{
  DefaultBlipName = (void *)EshFill::getDefaultBlipName((EshFill *)self);
  if (DefaultBlipName) {
    DefaultBlipName = (void *)[[NSString alloc] initWithCsString:DefaultBlipName];
  }
  return DefaultBlipName;
}

- (EshColor)fillBgColor
{
  LODWORD(v2->var0) = 255;
  return (EshColor)EshFill::getDefaultColor(v2, (EshColor *)a2);
}

- (id)strokeFillBlipName
{
  DefaultBlipName = (void *)EshFill::getDefaultBlipName((EshFill *)self);
  if (DefaultBlipName) {
    DefaultBlipName = (void *)[[NSString alloc] initWithCsString:DefaultBlipName];
  }
  return DefaultBlipName;
}

- (EshColor)strokeBgColor
{
  LODWORD(v2->var0) = 255;
  return (EshColor)EshFill::getDefaultColor(v2, (EshColor *)a2);
}

- (EshColor)shadowColor
{
  *(_DWORD *)v2 = 255;
  return (EshColor)EshShadow::getDefaultColor(v2, (EshColor *)a2);
}

- (EshBlip)fillBlipDataReference
{
  return 0;
}

- (EshBlip)strokeFillBlipDataReference
{
  return 0;
}

- (id)textPathUnicodeString
{
  DefaultBlipName = (void *)EshFill::getDefaultBlipName((EshFill *)self);
  if (DefaultBlipName) {
    DefaultBlipName = (void *)[[NSString alloc] initWithCsString:DefaultBlipName];
  }
  return DefaultBlipName;
}

- (id)textPathFontFamily
{
  DefaultBlipName = (void *)EshFill::getDefaultBlipName((EshFill *)self);
  if (DefaultBlipName) {
    DefaultBlipName = (void *)[[NSString alloc] initWithCsString:DefaultBlipName];
  }
  return DefaultBlipName;
}

@end
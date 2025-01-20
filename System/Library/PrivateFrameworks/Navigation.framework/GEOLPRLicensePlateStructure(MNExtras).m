@interface GEOLPRLicensePlateStructure(MNExtras)
- (id)supportedAlphabeticCharacterSet;
- (id)supportedNumericCharacterSet;
@end

@implementation GEOLPRLicensePlateStructure(MNExtras)

- (id)supportedAlphabeticCharacterSet
{
  int v2 = [a1 hasSupportedPlateAlphabetLetters];
  v3 = (void *)MEMORY[0x1E4F28B88];
  if (v2)
  {
    v4 = [a1 supportedPlateAlphabetLetters];
    v5 = [v3 characterSetWithCharactersInString:v4];
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  }
  return v5;
}

- (id)supportedNumericCharacterSet
{
  int v2 = [a1 hasSupportedPlateNumerics];
  v3 = (void *)MEMORY[0x1E4F28B88];
  if (v2)
  {
    v4 = [a1 supportedPlateNumerics];
    v5 = [v3 characterSetWithCharactersInString:v4];
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  }
  return v5;
}

@end
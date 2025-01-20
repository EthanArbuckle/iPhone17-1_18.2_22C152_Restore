@interface SBF
@end

@implementation SBF

uint64_t ___SBF_Private_IsN84OrSimilarDevice_block_invoke()
{
  uint64_t result = SBFEffectiveArtworkSubtype();
  _SBF_Private_IsN84OrSimilarDevice_isN84OrSimilarDevice = result == 1792;
  return result;
}

uint64_t ___SBF_Private_IsN84ZoomedOrSimilarDevice_block_invoke()
{
  uint64_t v0 = SBFEffectiveArtworkSubtype();
  v1 = [MEMORY[0x1E4F42D90] mainScreen];
  [v1 nativeScale];

  if (v0 == 1792) {
    uint64_t result = BSFloatEqualToFloat();
  }
  else {
    uint64_t result = 0;
  }
  _SBF_Private_IsN84ZoomedOrSimilarDevice_isN84Zoomed4OrSimilarDevice = result;
  return result;
}

uint64_t ___SBF_Private_IsD33OrSimilarDevice_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  _SBF_Private_IsD33OrSimilarDevice_isD33OrSimilarDevice = (result & 0xFFFFFFFE) == 18;
  return result;
}

void ___SBF_Private_IsD52OrSimilarDevice_block_invoke()
{
  int v0 = MGGetSInt32Answer();
  v1 = [MEMORY[0x1E4F42D90] mainScreen];
  [v1 nativeScale];

  if (v0 == 22) {
    char v2 = BSFloatEqualToFloat() ^ 1;
  }
  else {
    char v2 = 0;
  }
  _SBF_Private_IsD52OrSimilarDevice_isD52OrSimilarDevice = v2;
}

uint64_t ___SBF_Private_IsD52ZoomedOrSimilarDevice_block_invoke()
{
  int v0 = MGGetSInt32Answer();
  v1 = [MEMORY[0x1E4F42D90] mainScreen];
  [v1 nativeScale];

  if (v0 == 22) {
    uint64_t result = BSFloatEqualToFloat();
  }
  else {
    uint64_t result = 0;
  }
  _SBF_Private_IsD52ZoomedOrSimilarDevice_isD52ZoomedOrSimilarDevice = result;
  return result;
}

void ___SBF_Private_IsD54_block_invoke()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  id v1 = [v0 productHardwareModel];

  _SBF_Private_IsD54_isD54 = [v1 hasPrefix:@"D54"];
}

void ___SBF_Private_IsD53_block_invoke()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  id v1 = [v0 productHardwareModel];

  _SBF_Private_IsD53_isD53 = [v1 hasPrefix:@"D53"];
}

void ___SBF_Private_IsD16_block_invoke()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  id v1 = [v0 productHardwareModel];

  _SBF_Private_IsD16_isD16 = [v1 hasPrefix:@"D16"];
}

void ___SBF_Private_IsD17_block_invoke()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  id v1 = [v0 productHardwareModel];

  _SBF_Private_IsD17_isD17 = [v1 hasPrefix:@"D17"];
}

void ___SBF_Private_IsD63_block_invoke()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  id v1 = [v0 productHardwareModel];

  _SBF_Private_IsD63_isD63 = [v1 hasPrefix:@"D63"];
}

void ___SBF_Private_IsD64_block_invoke()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  id v1 = [v0 productHardwareModel];

  _SBF_Private_IsD64_isD64 = [v1 hasPrefix:@"D64"];
}

void ___SBF_Private_IsD63Like_block_invoke()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  id v2 = [v0 productHardwareModel];

  if (([v2 hasPrefix:@"D17"] & 1) != 0
    || ([v2 hasPrefix:@"D27"] & 1) != 0
    || ([v2 hasPrefix:@"D63"] & 1) != 0
    || ([v2 hasPrefix:@"D73"] & 1) != 0
    || ([v2 hasPrefix:@"D37"] & 1) != 0
    || (_SBF_Private_IsD63Like_isD63Like = [v2 hasPrefix:@"D83"],
        (_SBF_Private_IsD63Like_isD63Like & 1) != 0))
  {
    char v1 = 1;
  }
  else
  {
    char v1 = [v2 hasPrefix:@"D47"];
  }
  _SBF_Private_IsD63Like_isD63Like = v1;
}

void ___SBF_Private_IsD64Like_block_invoke()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  id v2 = [v0 productHardwareModel];

  if (([v2 hasPrefix:@"D64"] & 1) != 0
    || ([v2 hasPrefix:@"D28"] & 1) != 0
    || ([v2 hasPrefix:@"D74"] & 1) != 0
    || ([v2 hasPrefix:@"D38"] & 1) != 0
    || (_SBF_Private_IsD64Like_isD64Like = [v2 hasPrefix:@"D84"],
        (_SBF_Private_IsD64Like_isD64Like & 1) != 0))
  {
    char v1 = 1;
  }
  else
  {
    char v1 = [v2 hasPrefix:@"D48"];
  }
  _SBF_Private_IsD64Like_isD64Like = v1;
}

void ___SBF_Private_IsD93Like_block_invoke()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  id v1 = [v0 productHardwareModel];

  _SBF_Private_IsD93Like_isD93Like = [v1 hasPrefix:@"D93"];
}

void ___SBF_Private_IsD94Like_block_invoke()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  id v1 = [v0 productHardwareModel];

  _SBF_Private_IsD94Like_isD94Like = [v1 hasPrefix:@"D94"];
}

@end
@interface CLSAssetProcessedSignals_v3
- (BOOL)isNSFWExplicit;
- (BOOL)isPreciselyNSFWExplicit;
- (BOOL)isRecallinglyNSFWExplicit;
- (void)setIsNSFWExplicit:(BOOL)a3;
- (void)setIsPreciselyNSFWExplicit:(BOOL)a3;
- (void)setIsRecallinglyNSFWExplicit:(BOOL)a3;
@end

@implementation CLSAssetProcessedSignals_v3

- (void)setIsNSFWExplicit:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFB | v3;
}

- (BOOL)isNSFWExplicit
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (void)setIsPreciselyNSFWExplicit:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFD | v3;
}

- (BOOL)isPreciselyNSFWExplicit
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setIsRecallinglyNSFWExplicit:(BOOL)a3
{
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFE | a3;
}

- (BOOL)isRecallinglyNSFWExplicit
{
  return *((unsigned char *)self + 8) & 1;
}

@end
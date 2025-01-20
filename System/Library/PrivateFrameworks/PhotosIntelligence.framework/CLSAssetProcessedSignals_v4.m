@interface CLSAssetProcessedSignals_v4
- (BOOL)isVeryPreciselyIVSNSFWExplicit;
- (void)setIsVeryPreciselyIVSNSFWExplicit:(BOOL)a3;
@end

@implementation CLSAssetProcessedSignals_v4

- (void)setIsVeryPreciselyIVSNSFWExplicit:(BOOL)a3
{
  *((unsigned char *)&self->super + 9) = *((unsigned char *)&self->super + 9) & 0xFE | a3;
}

- (BOOL)isVeryPreciselyIVSNSFWExplicit
{
  return *((unsigned char *)&self->super + 9) & 1;
}

@end
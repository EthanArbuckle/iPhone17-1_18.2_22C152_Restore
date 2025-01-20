@interface PDPrismOptions
- (BOOL)isContent;
- (BOOL)isInverted;
- (void)setIsContent:(BOOL)a3;
- (void)setIsInverted:(BOOL)a3;
@end

@implementation PDPrismOptions

- (BOOL)isContent
{
  return *((unsigned char *)&self->super.mDirection + 4);
}

- (void)setIsContent:(BOOL)a3
{
  *((unsigned char *)&self->super.mDirection + 4) = a3;
}

- (BOOL)isInverted
{
  return *((unsigned char *)&self->super.mDirection + 5);
}

- (void)setIsInverted:(BOOL)a3
{
  *((unsigned char *)&self->super.mDirection + 5) = a3;
}

@end
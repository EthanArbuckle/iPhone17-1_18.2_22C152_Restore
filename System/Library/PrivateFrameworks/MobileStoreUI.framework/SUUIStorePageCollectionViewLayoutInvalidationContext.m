@interface SUUIStorePageCollectionViewLayoutInvalidationContext
- (BOOL)invalidateItemPinningLayoutInformation;
- (BOOL)invalidatePinnedBackdropViewStyle;
- (void)setInvalidateItemPinningLayoutInformation:(BOOL)a3;
- (void)setInvalidatePinnedBackdropViewStyle:(BOOL)a3;
@end

@implementation SUUIStorePageCollectionViewLayoutInvalidationContext

- (BOOL)invalidateItemPinningLayoutInformation
{
  return *((unsigned char *)&self->super._flowLayoutInvalidationFlags + 4);
}

- (void)setInvalidateItemPinningLayoutInformation:(BOOL)a3
{
  *((unsigned char *)&self->super._flowLayoutInvalidationFlags + 4) = a3;
}

- (BOOL)invalidatePinnedBackdropViewStyle
{
  return *((unsigned char *)&self->super._flowLayoutInvalidationFlags + 5);
}

- (void)setInvalidatePinnedBackdropViewStyle:(BOOL)a3
{
  *((unsigned char *)&self->super._flowLayoutInvalidationFlags + 5) = a3;
}

@end
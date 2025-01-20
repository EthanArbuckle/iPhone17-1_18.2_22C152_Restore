@interface MeCardService
- (void)clearCachedMeCard;
@end

@implementation MeCardService

- (void)clearCachedMeCard
{
  *(void *)self->cachedMeCard = 0;
  MEMORY[0x1F41817F8]();
}

@end
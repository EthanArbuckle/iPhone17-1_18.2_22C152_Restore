@interface ContactService
- (void)clearCachedMeCard;
@end

@implementation ContactService

- (void)clearCachedMeCard
{
  swift_retain();
  ContactService.clearCachedMeCard()();
  swift_release();
}

@end
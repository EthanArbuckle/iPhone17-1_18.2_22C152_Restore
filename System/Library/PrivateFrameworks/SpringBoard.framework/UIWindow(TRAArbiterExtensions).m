@interface UIWindow(TRAArbiterExtensions)
- (id)sb_traitsParticipant;
- (void)sb_setTraitsParticipant:()TRAArbiterExtensions;
@end

@implementation UIWindow(TRAArbiterExtensions)

- (id)sb_traitsParticipant
{
  return objc_getAssociatedObject(a1, sel_sb_traitsParticipant);
}

- (void)sb_setTraitsParticipant:()TRAArbiterExtensions
{
}

@end
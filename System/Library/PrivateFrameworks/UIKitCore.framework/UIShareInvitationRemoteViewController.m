@interface UIShareInvitationRemoteViewController
@end

@implementation UIShareInvitationRemoteViewController

void __74___UIShareInvitationRemoteViewController__dismissAndRepresentForActivity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) publicController];
  [v2 _representFullscreenAfterActivityDismissal:*(void *)(a1 + 40)];
}

@end
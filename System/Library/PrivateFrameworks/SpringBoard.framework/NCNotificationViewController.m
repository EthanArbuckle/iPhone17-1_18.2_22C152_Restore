@interface NCNotificationViewController
@end

@implementation NCNotificationViewController

uint64_t __80__NCNotificationViewController_SBPPTRunnerAdditions___recapSwipePresentLongLook__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendFlickWithStartPoint:endPoint:duration:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 32), *(double *)(a1 + 40) + 400.0, 0.25);
}

uint64_t __86__NCNotificationViewController_SBPPTRunnerAdditions___recapDismissLongLookViaPullDown__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendFlickWithStartPoint:endPoint:duration:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 32), *(double *)(a1 + 40) + 300.0, 0.25);
}

uint64_t __88__NCNotificationViewController_SBPPTRunnerAdditions___recapDismissLongLookViaTapOutside__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tap:", *(double *)(a1 + 32), *(double *)(a1 + 40) + 100.0);
}

@end
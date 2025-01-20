@interface OBPrivacyPresenter
@end

@implementation OBPrivacyPresenter

void __72__OBPrivacyPresenter_PKPrivacy__pk_defaultPresentationActionForContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v2, "pk_presenterForContext:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setPresentingViewController:v4];

  [v5 present];
}

@end
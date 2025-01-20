@interface WBSBiomeDonationManager
@end

@implementation WBSBiomeDonationManager

void __129__WBSBiomeDonationManager_SafariSharedUI__donateWindowProxyWithDomain_openedDomain_windowProxyProperty_accessedPropertyDirectly___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v3 = [WeakRetained _windowProxyStream];
    v4 = [v3 source];
    [v4 sendEvent:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

@end
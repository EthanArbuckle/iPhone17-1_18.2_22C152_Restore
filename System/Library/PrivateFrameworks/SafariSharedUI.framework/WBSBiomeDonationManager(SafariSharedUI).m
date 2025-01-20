@interface WBSBiomeDonationManager(SafariSharedUI)
- (uint64_t)_biomeWindowProperty:()SafariSharedUI;
- (void)donateWindowProxyWithDomain:()SafariSharedUI openedDomain:windowProxyProperty:accessedPropertyDirectly:;
@end

@implementation WBSBiomeDonationManager(SafariSharedUI)

- (void)donateWindowProxyWithDomain:()SafariSharedUI openedDomain:windowProxyProperty:accessedPropertyDirectly:
{
  id v10 = a3;
  id v11 = a4;
  if ([(id)objc_opt_class() isBiomeStreamDonationAvailable])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F50098]);
    v13 = WBSTimestampForBiomeEventDonation();
    uint64_t v14 = [a1 _biomeWindowProperty:a5];
    v15 = [NSNumber numberWithInt:a6];
    v16 = (void *)[v12 initWithDomain:v10 openedDomain:v11 visited:v13 property:v14 accessedPropertyDirectly:v15];

    if (v16)
    {
      objc_initWeak(&location, a1);
      v17 = *(NSObject **)&a1[*MEMORY[0x1E4F98438]];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __129__WBSBiomeDonationManager_SafariSharedUI__donateWindowProxyWithDomain_openedDomain_windowProxyProperty_accessedPropertyDirectly___block_invoke;
      block[3] = &unk_1E5E41598;
      objc_copyWeak(&v20, &location);
      id v19 = v16;
      dispatch_async(v17, block);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
}

- (uint64_t)_biomeWindowProperty:()SafariSharedUI
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return dword_1ABC5F630[a3];
  }
}

@end
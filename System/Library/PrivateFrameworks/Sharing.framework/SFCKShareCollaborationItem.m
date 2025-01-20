@interface SFCKShareCollaborationItem
@end

@implementation SFCKShareCollaborationItem

void __64___SFCKShareCollaborationItem__loadCKContainerSetupInfoIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64___SFCKShareCollaborationItem__loadCKContainerSetupInfoIfNeeded__block_invoke_2;
  v5[3] = &unk_1E5BBC540;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __64___SFCKShareCollaborationItem__loadCKContainerSetupInfoIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didLoadContainerSetupInfo:*(void *)(a1 + 32)];
}

@end
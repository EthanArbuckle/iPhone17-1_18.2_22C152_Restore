@interface SBRemoteAlertHandleServerTarget
@end

@implementation SBRemoteAlertHandleServerTarget

void __116___SBRemoteAlertHandleServerTarget_remoteAlertHandleContextsForDefinition_allowsCreationValue_configurationContext___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  uint64_t v2 = [WeakRetained remoteAlertHandleContextsForDefinition:a1[5] allowsCreationValue:a1[6] configurationContext:a1[7]];
  uint64_t v3 = *(void *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __102___SBRemoteAlertHandleServerTarget_createRemoteAlertHandleContextWithDefinition_configurationContext___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  uint64_t v2 = [WeakRetained createRemoteAlertHandleContextWithDefinition:a1[5] configurationContext:a1[6]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __86___SBRemoteAlertHandleServerTarget_activateRemoteAlertHandleWithID_activationContext___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained activateRemoteAlertHandleWithID:a1[5] activationContext:a1[6]];
}

void __70___SBRemoteAlertHandleServerTarget_invalidateRemoteAlertHandleWithID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained invalidateRemoteAlertHandleWithID:*(void *)(a1 + 40)];
}

@end
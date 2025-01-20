@interface SMReceiverContact
@end

@implementation SMReceiverContact

void __74__SMReceiverContact_RTCoreDataTransformable__createWithReceiverContactMO___block_invoke(uint64_t a1)
{
  id v29 = objc_alloc(MEMORY[0x1E4F998E8]);
  v32 = [*(id *)(a1 + 32) identifier];
  v27 = [*(id *)(a1 + 32) syncDate];
  v2 = (void *)MEMORY[0x1E4F99818];
  v31 = [*(id *)(a1 + 32) phoneCache];
  v26 = [v2 createWithManagedObject:v31];
  v3 = (void *)MEMORY[0x1E4F99818];
  v30 = [*(id *)(a1 + 32) watchCache];
  v25 = [v3 createWithManagedObject:v30];
  v4 = (void *)MEMORY[0x1E4F998F8];
  v28 = [*(id *)(a1 + 32) sessionStatus];
  v24 = [v4 createWithManagedObject:v28];
  v23 = [*(id *)(a1 + 32) allowReadToken];
  v22 = [*(id *)(a1 + 32) safetyCacheKey];
  v21 = [*(id *)(a1 + 32) shareURL];
  v20 = [*(id *)(a1 + 32) participantID];
  v5 = [*(id *)(a1 + 32) sharingInvitationData];
  uint64_t v18 = [*(id *)(a1 + 32) numCacheDownloads];
  uint64_t v19 = [*(id *)(a1 + 32) numSuccessfulCacheDownloads];
  uint64_t v6 = [*(id *)(a1 + 32) maxPhoneCacheSize];
  uint64_t v7 = [*(id *)(a1 + 32) maxWatchCacheSize];
  uint64_t v8 = [*(id *)(a1 + 32) maxLocationsInPhoneCacheTrace];
  uint64_t v9 = [*(id *)(a1 + 32) maxLocationsInWatchCacheTrace];
  [*(id *)(a1 + 32) timeTillCacheRelease];
  double v11 = v10;
  [*(id *)(a1 + 32) timeTillFirstSuccessfulCacheDownload];
  double v13 = v12;
  v17 = [*(id *)(a1 + 32) sessionUUID];
  uint64_t v14 = objc_msgSend(v29, "initWithIdentifier:syncDate:phoneCache:watchCache:sessionStatus:allowReadToken:safetyCacheKey:shareURL:participantID:sharingInvitationData:numCacheDownloads:numSuccessfulCacheDownloads:maxPhoneCacheSize:maxWatchCacheSize:maxLocationsInPhoneCacheTrace:maxLocationsInWatchCacheTrace:timeTillCacheRelease:timeTillFirstSuccessfulCacheDownload:sessionID:firstDetailViewSessionState:lastDetailViewSessionState:phoneMaxWorkoutEvents:watchMaxWorkoutEvents:", v32, v27, v26, v25, v24, v23, v11, v13, v22, v21, v20, v5, v18, v19,
          v6,
          v7,
          v8,
          v9,
          v17,
          [*(id *)(a1 + 32) firstDetailViewSessionState],
          [*(id *)(a1 + 32) lastDetailViewSessionState],
          [*(id *)(a1 + 32) phoneMaxWorkoutEvents],
          [*(id *)(a1 + 32) watchMaxWorkoutEvents]);
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

@end
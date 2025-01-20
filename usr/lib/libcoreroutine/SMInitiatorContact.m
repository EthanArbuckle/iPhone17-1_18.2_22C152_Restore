@interface SMInitiatorContact
@end

@implementation SMInitiatorContact

void __76__SMInitiatorContact_RTCoreDataTransformable__createWithInitiatorContactMO___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F999E0];
  v3 = [*(id *)(a1 + 32) workoutEvents];
  v81 = [v2 createWithSMWorkoutEventMOs:v3];

  id v4 = objc_alloc(MEMORY[0x1E4F5CE00]);
  [*(id *)(a1 + 32) locationOfTriggerLatitude];
  double v6 = v5;
  [*(id *)(a1 + 32) locationOfTriggerLongitude];
  double v8 = v7;
  [*(id *)(a1 + 32) locationOfTriggerHorizontalUncertainty];
  double v10 = v9;
  [*(id *)(a1 + 32) locationOfTriggerAltitude];
  double v12 = v11;
  [*(id *)(a1 + 32) locationOfTriggerVerticalUncertainty];
  double v14 = v13;
  v15 = [*(id *)(a1 + 32) locationOfTriggerDate];
  uint64_t v16 = [*(id *)(a1 + 32) locationOfTriggerReferenceFrame];
  [*(id *)(a1 + 32) locationOfTriggerSpeed];
  v80 = [v4 initWithLatitude:v15 longitude:v16 horizontalUncertainty:(int)objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerSourceAccuracy") altitude:v6 verticalUncertainty:v8 date:v10 speed:v12 sourceAccuracy:v17];

  id v65 = objc_alloc(MEMORY[0x1E4F99890]);
  v79 = [*(id *)(a1 + 32) identifier];
  v78 = [*(id *)(a1 + 32) shouldBeCleanedUpDate];
  unsigned int v64 = [*(id *)(a1 + 32) cloudkitShareZoneCleanedUpSuccessfully];
  v77 = [*(id *)(a1 + 32) syncDate];
  v75 = [*(id *)(a1 + 32) keyReleaseMessageSendDate];
  v74 = [*(id *)(a1 + 32) scheduledSendExpiryDate];
  v18 = (void *)MEMORY[0x1E4F99818];
  v67 = [*(id *)(a1 + 32) phoneCache];
  v76 = [v18 createWithManagedObject:v67];
  v19 = (void *)MEMORY[0x1E4F99818];
  v66 = [*(id *)(a1 + 32) watchCache];
  v73 = [v19 createWithManagedObject:v66];
  v72 = [*(id *)(a1 + 32) sessionUUID];
  v71 = [*(id *)(a1 + 32) safetyCacheKey];
  v70 = [*(id *)(a1 + 32) allowReadToken];
  v69 = [*(id *)(a1 + 32) scheduleSendMessageGUID];
  v20 = (void *)MEMORY[0x1E4F998C8];
  v63 = [*(id *)(a1 + 32) unlockLocation];
  v58 = [v20 createWithManagedObject:v63];
  v21 = (void *)MEMORY[0x1E4F998C8];
  v62 = [*(id *)(a1 + 32) lockLocation];
  v57 = [v21 createWithManagedObject:v62];
  v22 = (void *)MEMORY[0x1E4F998C8];
  v61 = [*(id *)(a1 + 32) startingLocation];
  v56 = [v22 createWithManagedObject:v61];
  v23 = (void *)MEMORY[0x1E4F998C8];
  v60 = [*(id *)(a1 + 32) offWristLocation];
  v55 = [v23 createWithManagedObject:v60];
  v24 = (void *)MEMORY[0x1E4F998C8];
  v59 = [*(id *)(a1 + 32) parkedCarLocation];
  v68 = [v24 createWithManagedObject:v59];
  v54 = [*(id *)(a1 + 32) destinationMapItem];
  v53 = [*(id *)(a1 + 32) timeCacheUploadCompletion];
  [*(id *)(a1 + 32) maxCacheSize];
  double v26 = v25;
  uint64_t v52 = (int)[*(id *)(a1 + 32) maxLocationsInTrace];
  [*(id *)(a1 + 32) maxTimeBetweenCacheUpdates];
  double v28 = v27;
  uint64_t v51 = (int)[*(id *)(a1 + 32) numCacheUpdates];
  [*(id *)(a1 + 32) timeTilCacheRelease];
  double v30 = v29;
  uint64_t v50 = (int)[*(id *)(a1 + 32) numberOfSuccessfulCacheUpdates];
  uint64_t v49 = (int)[*(id *)(a1 + 32) numberOfMessageCancelling];
  uint64_t v48 = (int)[*(id *)(a1 + 32) numberOfSuccessfulMessageCancelling];
  uint64_t v47 = (int)[*(id *)(a1 + 32) numberOfMessageScheduling];
  uint64_t v46 = (int)[*(id *)(a1 + 32) numberOfSuccessfulMessageScheduling];
  char v45 = [*(id *)(a1 + 32) wasCacheReleased];
  char v31 = [*(id *)(a1 + 32) wasScheduledSendTriggered];
  v44 = [*(id *)(a1 + 32) triggerDate];
  char v32 = [*(id *)(a1 + 32) lockState];
  v43 = [*(id *)(a1 + 32) cacheUpdateBackstopExpiryDate];
  v33 = (void *)[v81 mutableCopy];
  uint64_t v34 = (int)[*(id *)(a1 + 32) numberOfHandoffBecomingActive];
  uint64_t v35 = (int)[*(id *)(a1 + 32) numberOfHandoffBecomingNonActive];
  v36 = [*(id *)(a1 + 32) earliestActiveDeviceIdentifier];
  v37 = [*(id *)(a1 + 32) latestActiveDeviceIdentifier];
  LOBYTE(v42) = v32;
  BYTE1(v41) = v31;
  LOBYTE(v41) = v45;
  uint64_t v38 = objc_msgSend(v65, "initWithIdentifier:shouldBeCleanedUpDate:cloudkitShareZoneCleanedUpSuccessfully:syncDate:keyReleaseMessageSendDate:scheduledSendExpiryDate:phoneCache:watchCache:sessionID:safetyCacheKey:allowReadToken:scheduleSendMessageGUID:unlockLocation:lockLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:timeCacheUploadCompletion:maxCacheSize:maxLocationsInTrace:maxTimeBetweenCacheUpdates:numCacheUpdates:timeTilCacheRelease:numberOfSuccessfulCacheUpdates:numberOfMessageCancelling:numberOfSuccessfulMessageCancelling:numberOfMessageScheduling:numberOfSuccessfulMessageScheduling:wasCacheReleased:wasScheduledSendTriggered:locationOfTrigger:triggerDate:lockState:cacheUpdateBackstopExpiryDate:workoutEvents:numberOfHandoffBecomingActive:numberOfHandoffBecomingNonActive:earliestActiveDeviceIdentifier:latestActiveDeviceIdentifier:", v79, v78, v64, v77, v75, v74, v26, v28, v30, v76,
          v73,
          v72,
          v71,
          v70,
          v69,
          v58,
          v57,
          v56,
          v55,
          v68,
          v54,
          v53,
          v52,
          v51,
          v50,
          v49,
          v48,
          v47,
          v46,
          v41,
          v80,
          v44,
          v42,
          v43,
          v33,
          v34,
          v35,
          v36,
          v37);
  uint64_t v39 = *(void *)(*(void *)(a1 + 40) + 8);
  v40 = *(void **)(v39 + 40);
  *(void *)(v39 + 40) = v38;
}

@end
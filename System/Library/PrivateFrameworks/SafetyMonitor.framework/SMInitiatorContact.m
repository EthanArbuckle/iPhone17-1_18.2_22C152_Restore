@interface SMInitiatorContact
- (BOOL)cloudkitShareZoneCleanedUpSuccessfully;
- (BOOL)lockState;
- (BOOL)wasCacheReleased;
- (BOOL)wasScheduledSendTriggered;
- (NSData)destinationMapItem;
- (NSDate)cacheUpdateBackstopExpiryDate;
- (NSDate)keyReleaseMessageSendDate;
- (NSDate)scheduledSendExpiryDate;
- (NSDate)shouldBeCleanedUpDate;
- (NSDate)timeCacheUploadCompletion;
- (NSDate)triggerDate;
- (NSMutableArray)workoutEvents;
- (NSString)scheduleSendMessageGUID;
- (NSUUID)earliestActiveDeviceIdentifier;
- (NSUUID)latestActiveDeviceIdentifier;
- (RTLocation)locationOfTrigger;
- (SMCache)phoneCache;
- (SMCache)watchCache;
- (SMInitiatorContact)init;
- (SMInitiatorContact)initWithIdentifier:(id)a3 shouldBeCleanedUpDate:(id)a4 cloudkitShareZoneCleanedUpSuccessfully:(BOOL)a5 syncDate:(id)a6 keyReleaseMessageSendDate:(id)a7 scheduledSendExpiryDate:(id)a8 phoneCache:(id)a9 watchCache:(id)a10 sessionID:(id)a11 safetyCacheKey:(id)a12 allowReadToken:(id)a13 scheduleSendMessageGUID:(id)a14 unlockLocation:(id)a15 lockLocation:(id)a16 startingLocation:(id)a17 offWristLocation:(id)a18 parkedCarLocation:(id)a19 destinationMapItem:(id)a20 timeCacheUploadCompletion:(id)a21 maxCacheSize:(double)a22 maxLocationsInTrace:(int64_t)a23 maxTimeBetweenCacheUpdates:(double)a24 numCacheUpdates:(int64_t)a25 timeTilCacheRelease:(double)a26 numberOfSuccessfulCacheUpdates:(int64_t)a27 numberOfMessageCancelling:(int64_t)a28 numberOfSuccessfulMessageCancelling:(int64_t)a29 numberOfMessageScheduling:(int64_t)a30 numberOfSuccessfulMessageScheduling:(int64_t)a31 wasCacheReleased:(BOOL)a32 wasScheduledSendTriggered:(BOOL)a33 locationOfTrigger:(id)a34 triggerDate:(id)a35 lockState:(BOOL)a36 cacheUpdateBackstopExpiryDate:(id)a37 workoutEvents:(id)a38 numberOfHandoffBecomingActive:(int64_t)a39 numberOfHandoffBecomingNonActive:(int64_t)a40 earliestActiveDeviceIdentifier:(id)a41 latestActiveDeviceIdentifier:(id)a42;
- (SMLocation)lockLocation;
- (SMLocation)offWristLocation;
- (SMLocation)parkedCarLocation;
- (SMLocation)startingLocation;
- (SMLocation)unlockLocation;
- (double)maxCacheSize;
- (double)maxTimeBetweenCacheUpdates;
- (double)timeTilCacheRelease;
- (id)description;
- (int64_t)maxLocationsInTrace;
- (int64_t)numCacheUpdates;
- (int64_t)numberOfHandoffBecomingActive;
- (int64_t)numberOfHandoffBecomingNonActive;
- (int64_t)numberOfMessageCancelling;
- (int64_t)numberOfMessageScheduling;
- (int64_t)numberOfSuccessfulCacheUpdates;
- (int64_t)numberOfSuccessfulMessageCancelling;
- (int64_t)numberOfSuccessfulMessageScheduling;
- (void)setCacheUpdateBackstopExpiryDate:(id)a3;
- (void)setCloudkitShareZoneCleanedUpSuccessfully:(BOOL)a3;
- (void)setDestinationMapItem:(id)a3;
- (void)setEarliestActiveDeviceIdentifier:(id)a3;
- (void)setKeyReleaseMessageSendDate:(id)a3;
- (void)setLatestActiveDeviceIdentifier:(id)a3;
- (void)setLocationOfTrigger:(id)a3;
- (void)setLockLocation:(id)a3;
- (void)setLockState:(BOOL)a3;
- (void)setMaxCacheSize:(double)a3;
- (void)setMaxLocationsInTrace:(int64_t)a3;
- (void)setMaxTimeBetweenCacheUpdates:(double)a3;
- (void)setNumCacheUpdates:(int64_t)a3;
- (void)setNumberOfHandoffBecomingActive:(int64_t)a3;
- (void)setNumberOfHandoffBecomingNonActive:(int64_t)a3;
- (void)setNumberOfMessageCancelling:(int64_t)a3;
- (void)setNumberOfMessageScheduling:(int64_t)a3;
- (void)setNumberOfSuccessfulCacheUpdates:(int64_t)a3;
- (void)setNumberOfSuccessfulMessageCancelling:(int64_t)a3;
- (void)setNumberOfSuccessfulMessageScheduling:(int64_t)a3;
- (void)setOffWristLocation:(id)a3;
- (void)setParkedCarLocation:(id)a3;
- (void)setPhoneCache:(id)a3;
- (void)setScheduleSendMessageGUID:(id)a3;
- (void)setScheduledSendExpiryDate:(id)a3;
- (void)setShouldBeCleanedUpDate:(id)a3;
- (void)setStartingLocation:(id)a3;
- (void)setTimeCacheUploadCompletion:(id)a3;
- (void)setTimeTilCacheRelease:(double)a3;
- (void)setTriggerDate:(id)a3;
- (void)setUnlockLocation:(id)a3;
- (void)setWasCacheReleased:(BOOL)a3;
- (void)setWasScheduledSendTriggered:(BOOL)a3;
- (void)setWatchCache:(id)a3;
- (void)setWorkoutEvents:(id)a3;
@end

@implementation SMInitiatorContact

- (SMInitiatorContact)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  LOBYTE(v10) = 1;
  LOWORD(v9) = 0;
  v7 = -[SMInitiatorContact initWithIdentifier:shouldBeCleanedUpDate:cloudkitShareZoneCleanedUpSuccessfully:syncDate:keyReleaseMessageSendDate:scheduledSendExpiryDate:phoneCache:watchCache:sessionID:safetyCacheKey:allowReadToken:scheduleSendMessageGUID:unlockLocation:lockLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:timeCacheUploadCompletion:maxCacheSize:maxLocationsInTrace:maxTimeBetweenCacheUpdates:numCacheUpdates:timeTilCacheRelease:numberOfSuccessfulCacheUpdates:numberOfMessageCancelling:numberOfSuccessfulMessageCancelling:numberOfMessageScheduling:numberOfSuccessfulMessageScheduling:wasCacheReleased:wasScheduledSendTriggered:locationOfTrigger:triggerDate:lockState:cacheUpdateBackstopExpiryDate:workoutEvents:numberOfHandoffBecomingActive:numberOfHandoffBecomingNonActive:earliestActiveDeviceIdentifier:latestActiveDeviceIdentifier:](self, "initWithIdentifier:shouldBeCleanedUpDate:cloudkitShareZoneCleanedUpSuccessfully:syncDate:keyReleaseMessageSendDate:scheduledSendExpiryDate:phoneCache:watchCache:sessionID:safetyCacheKey:allowReadToken:scheduleSendMessageGUID:unlockLocation:lockLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:timeCacheUploadCompletion:maxCacheSize:maxLocationsInTrace:maxTimeBetweenCacheUpdates:numCacheUpdates:timeTilCacheRelease:numberOfSuccessfulCacheUpdates:numberOfMessageCancelling:numberOfSuccessfulMessageCancelling:numberOfMessageScheduling:numberOfSuccessfulMessageScheduling:wasCacheReleased:wasScheduledSendTriggered:locationOfTrigger:triggerDate:lockState:cacheUpdateBackstopExpiryDate:workoutEvents:numberOfHandoffBecomingActive:numberOfHandoffBecomingNonActive:earliestActiveDeviceIdentifier:latestActiveDeviceIdentifier:", v3, 0, 0, 0, 0, 0, -1.0, -1.0, -1.0, v4,
         v5,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         -1,
         -1,
         -1,
         -1,
         -1,
         -1,
         -1,
         v9,
         0,
         0,
         v10,
         0,
         v6,
         0,
         0,
         0,
         0);

  return v7;
}

- (SMInitiatorContact)initWithIdentifier:(id)a3 shouldBeCleanedUpDate:(id)a4 cloudkitShareZoneCleanedUpSuccessfully:(BOOL)a5 syncDate:(id)a6 keyReleaseMessageSendDate:(id)a7 scheduledSendExpiryDate:(id)a8 phoneCache:(id)a9 watchCache:(id)a10 sessionID:(id)a11 safetyCacheKey:(id)a12 allowReadToken:(id)a13 scheduleSendMessageGUID:(id)a14 unlockLocation:(id)a15 lockLocation:(id)a16 startingLocation:(id)a17 offWristLocation:(id)a18 parkedCarLocation:(id)a19 destinationMapItem:(id)a20 timeCacheUploadCompletion:(id)a21 maxCacheSize:(double)a22 maxLocationsInTrace:(int64_t)a23 maxTimeBetweenCacheUpdates:(double)a24 numCacheUpdates:(int64_t)a25 timeTilCacheRelease:(double)a26 numberOfSuccessfulCacheUpdates:(int64_t)a27 numberOfMessageCancelling:(int64_t)a28 numberOfSuccessfulMessageCancelling:(int64_t)a29 numberOfMessageScheduling:(int64_t)a30 numberOfSuccessfulMessageScheduling:(int64_t)a31 wasCacheReleased:(BOOL)a32 wasScheduledSendTriggered:(BOOL)a33 locationOfTrigger:(id)a34 triggerDate:(id)a35 lockState:(BOOL)a36 cacheUpdateBackstopExpiryDate:(id)a37 workoutEvents:(id)a38 numberOfHandoffBecomingActive:(int64_t)a39 numberOfHandoffBecomingNonActive:(int64_t)a40 earliestActiveDeviceIdentifier:(id)a41 latestActiveDeviceIdentifier:(id)a42
{
  id v77 = a4;
  id v76 = a7;
  id v75 = a8;
  id v74 = a9;
  id v73 = a10;
  id v72 = a14;
  id v71 = a15;
  id v70 = a16;
  id v69 = a17;
  id v68 = a18;
  id v67 = a19;
  id v66 = a20;
  id v65 = a21;
  id v64 = a34;
  id v63 = a35;
  id v62 = a37;
  id v47 = a38;
  id v48 = a41;
  id v49 = a42;
  if (a3)
  {
    v78.receiver = self;
    v78.super_class = (Class)SMInitiatorContact;
    v50 = [(SMContact *)&v78 initWithIdentifier:a3 sessionID:a11 allowReadToken:a13 safetyCacheKey:a12 syncDate:a6 sharingInvitationData:0 shareURL:0 participantID:0];
    v51 = v50;
    if (v50)
    {
      objc_storeStrong((id *)&v50->_shouldBeCleanedUpDate, a4);
      v51->_cloudkitShareZoneCleanedUpSuccessfully = a5;
      objc_storeStrong((id *)&v51->_scheduledSendExpiryDate, a8);
      objc_storeStrong((id *)&v51->_keyReleaseMessageSendDate, a7);
      objc_storeStrong((id *)&v51->_unlockLocation, a15);
      objc_storeStrong((id *)&v51->_lockLocation, a16);
      objc_storeStrong((id *)&v51->_startingLocation, a17);
      objc_storeStrong((id *)&v51->_offWristLocation, a18);
      objc_storeStrong((id *)&v51->_parkedCarLocation, a19);
      objc_storeStrong((id *)&v51->_destinationMapItem, a20);
      objc_storeStrong((id *)&v51->_phoneCache, a9);
      objc_storeStrong((id *)&v51->_watchCache, a10);
      objc_storeStrong((id *)&v51->_scheduleSendMessageGUID, a14);
      objc_storeStrong((id *)&v51->_timeCacheUploadCompletion, a21);
      v51->_maxCacheSize = a22;
      v51->_maxLocationsInTrace = a23;
      v51->_maxTimeBetweenCacheUpdates = a24;
      v51->_numCacheUpdates = a25;
      v51->_timeTilCacheRelease = a26;
      v51->_numberOfSuccessfulCacheUpdates = a27;
      v51->_numberOfMessageCancelling = a28;
      v51->_numberOfSuccessfulMessageCancelling = a29;
      v51->_numberOfMessageScheduling = a30;
      v51->_numberOfSuccessfulMessageScheduling = a31;
      v51->_wasCacheReleased = a32;
      v51->_wasScheduledSendTriggered = a33;
      objc_storeStrong((id *)&v51->_locationOfTrigger, a34);
      objc_storeStrong((id *)&v51->_triggerDate, a35);
      v51->_lockState = a36;
      objc_storeStrong((id *)&v51->_cacheUpdateBackstopExpiryDate, a37);
      v52 = v47;
      if (!v47) {
        v52 = objc_opt_new();
      }
      objc_storeStrong((id *)&v51->_workoutEvents, v52);
      if (!v47) {

      }
      v51->_numberOfHandoffBecomingActive = a39;
      v51->_numberOfHandoffBecomingNonActive = a40;
      objc_storeStrong((id *)&v51->_earliestActiveDeviceIdentifier, a41);
      objc_storeStrong((id *)&v51->_latestActiveDeviceIdentifier, a42);
    }
    v53 = v51;
    v54 = v53;
  }
  else
  {
    v53 = self;
    v55 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v55, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v54 = 0;
  }

  return v54;
}

- (id)description
{
  v21 = NSString;
  v30 = [(SMContact *)self sessionUUID];
  v29 = [(SMContact *)self identifier];
  v25 = [(SMContact *)self syncDate];
  v28 = [v25 stringFromDate];
  v24 = [(SMInitiatorContact *)self keyReleaseMessageSendDate];
  v19 = [v24 stringFromDate];
  v23 = [(SMInitiatorContact *)self shouldBeCleanedUpDate];
  v27 = [v23 stringFromDate];
  v18 = [(SMContact *)self allowReadToken];
  v26 = [(SMContact *)self safetyCacheKey];
  BOOL v17 = [(SMInitiatorContact *)self cloudkitShareZoneCleanedUpSuccessfully];
  v20 = [(SMInitiatorContact *)self scheduledSendExpiryDate];
  v16 = [v20 stringFromDate];
  v15 = [(SMInitiatorContact *)self scheduleSendMessageGUID];
  v13 = [(SMInitiatorContact *)self startingLocation];
  v14 = [(SMInitiatorContact *)self unlockLocation];
  v12 = [(SMInitiatorContact *)self lockLocation];
  v3 = [(SMInitiatorContact *)self parkedCarLocation];
  v4 = [(SMInitiatorContact *)self offWristLocation];
  v5 = [(SMInitiatorContact *)self workoutEvents];
  uint64_t v6 = [v5 count];
  int64_t v7 = [(SMInitiatorContact *)self numberOfHandoffBecomingActive];
  int64_t v8 = [(SMInitiatorContact *)self numberOfHandoffBecomingNonActive];
  uint64_t v9 = [(SMInitiatorContact *)self earliestActiveDeviceIdentifier];
  uint64_t v10 = [(SMInitiatorContact *)self latestActiveDeviceIdentifier];
  objc_msgSend(v21, "stringWithFormat:", @"sessionID,%@,identifier,%@,syncDate,%@,keyReleaseMessageDate,%@,shouldBeCleanedUpDate,%@,allowReadToken,%@,safetyCacheKey,%@,cloudKitCleanedUp,%d,scheduledSendDate,%@,scheduledSendGUID,%@,startLocation,%@,unlockLocation,%@,lockLocation,%@,parkedCarLocation,%@,offWristLocation,%@,workoutEventsCount,%lu,numberOfHandoffBecomingActive,%ld,numberOfHandoffBecomingNonActive,%ld,earliestActiveDeviceIdentifier,%@,latestActiveDeviceIdentifier,%@", v30, v29, v28, v19, v27, v18, v26, v17, v16, v15, v13, v14, v12, v3, v4, v6,
    v7,
    v8,
    v9,
  v22 = v10);

  return v22;
}

- (NSDate)shouldBeCleanedUpDate
{
  return self->_shouldBeCleanedUpDate;
}

- (void)setShouldBeCleanedUpDate:(id)a3
{
}

- (NSDate)keyReleaseMessageSendDate
{
  return self->_keyReleaseMessageSendDate;
}

- (void)setKeyReleaseMessageSendDate:(id)a3
{
}

- (BOOL)cloudkitShareZoneCleanedUpSuccessfully
{
  return self->_cloudkitShareZoneCleanedUpSuccessfully;
}

- (void)setCloudkitShareZoneCleanedUpSuccessfully:(BOOL)a3
{
  self->_cloudkitShareZoneCleanedUpSuccessfully = a3;
}

- (NSDate)scheduledSendExpiryDate
{
  return self->_scheduledSendExpiryDate;
}

- (void)setScheduledSendExpiryDate:(id)a3
{
}

- (NSString)scheduleSendMessageGUID
{
  return self->_scheduleSendMessageGUID;
}

- (void)setScheduleSendMessageGUID:(id)a3
{
}

- (SMLocation)unlockLocation
{
  return self->_unlockLocation;
}

- (void)setUnlockLocation:(id)a3
{
}

- (SMLocation)lockLocation
{
  return self->_lockLocation;
}

- (void)setLockLocation:(id)a3
{
}

- (SMLocation)startingLocation
{
  return self->_startingLocation;
}

- (void)setStartingLocation:(id)a3
{
}

- (SMLocation)offWristLocation
{
  return self->_offWristLocation;
}

- (void)setOffWristLocation:(id)a3
{
}

- (SMLocation)parkedCarLocation
{
  return self->_parkedCarLocation;
}

- (void)setParkedCarLocation:(id)a3
{
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void)setDestinationMapItem:(id)a3
{
}

- (SMCache)phoneCache
{
  return self->_phoneCache;
}

- (void)setPhoneCache:(id)a3
{
}

- (SMCache)watchCache
{
  return self->_watchCache;
}

- (void)setWatchCache:(id)a3
{
}

- (NSDate)timeCacheUploadCompletion
{
  return self->_timeCacheUploadCompletion;
}

- (void)setTimeCacheUploadCompletion:(id)a3
{
}

- (RTLocation)locationOfTrigger
{
  return self->_locationOfTrigger;
}

- (void)setLocationOfTrigger:(id)a3
{
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (void)setTriggerDate:(id)a3
{
}

- (NSDate)cacheUpdateBackstopExpiryDate
{
  return self->_cacheUpdateBackstopExpiryDate;
}

- (void)setCacheUpdateBackstopExpiryDate:(id)a3
{
}

- (NSMutableArray)workoutEvents
{
  return self->_workoutEvents;
}

- (void)setWorkoutEvents:(id)a3
{
}

- (double)maxCacheSize
{
  return self->_maxCacheSize;
}

- (void)setMaxCacheSize:(double)a3
{
  self->_maxCacheSize = a3;
}

- (int64_t)maxLocationsInTrace
{
  return self->_maxLocationsInTrace;
}

- (void)setMaxLocationsInTrace:(int64_t)a3
{
  self->_maxLocationsInTrace = a3;
}

- (double)maxTimeBetweenCacheUpdates
{
  return self->_maxTimeBetweenCacheUpdates;
}

- (void)setMaxTimeBetweenCacheUpdates:(double)a3
{
  self->_maxTimeBetweenCacheUpdates = a3;
}

- (int64_t)numCacheUpdates
{
  return self->_numCacheUpdates;
}

- (void)setNumCacheUpdates:(int64_t)a3
{
  self->_numCacheUpdates = a3;
}

- (double)timeTilCacheRelease
{
  return self->_timeTilCacheRelease;
}

- (void)setTimeTilCacheRelease:(double)a3
{
  self->_timeTilCacheRelease = a3;
}

- (int64_t)numberOfSuccessfulCacheUpdates
{
  return self->_numberOfSuccessfulCacheUpdates;
}

- (void)setNumberOfSuccessfulCacheUpdates:(int64_t)a3
{
  self->_numberOfSuccessfulCacheUpdates = a3;
}

- (int64_t)numberOfMessageCancelling
{
  return self->_numberOfMessageCancelling;
}

- (void)setNumberOfMessageCancelling:(int64_t)a3
{
  self->_numberOfMessageCancelling = a3;
}

- (int64_t)numberOfSuccessfulMessageCancelling
{
  return self->_numberOfSuccessfulMessageCancelling;
}

- (void)setNumberOfSuccessfulMessageCancelling:(int64_t)a3
{
  self->_numberOfSuccessfulMessageCancelling = a3;
}

- (int64_t)numberOfMessageScheduling
{
  return self->_numberOfMessageScheduling;
}

- (void)setNumberOfMessageScheduling:(int64_t)a3
{
  self->_numberOfMessageScheduling = a3;
}

- (int64_t)numberOfSuccessfulMessageScheduling
{
  return self->_numberOfSuccessfulMessageScheduling;
}

- (void)setNumberOfSuccessfulMessageScheduling:(int64_t)a3
{
  self->_numberOfSuccessfulMessageScheduling = a3;
}

- (BOOL)wasCacheReleased
{
  return self->_wasCacheReleased;
}

- (void)setWasCacheReleased:(BOOL)a3
{
  self->_wasCacheReleased = a3;
}

- (BOOL)wasScheduledSendTriggered
{
  return self->_wasScheduledSendTriggered;
}

- (void)setWasScheduledSendTriggered:(BOOL)a3
{
  self->_wasScheduledSendTriggered = a3;
}

- (BOOL)lockState
{
  return self->_lockState;
}

- (void)setLockState:(BOOL)a3
{
  self->_lockState = a3;
}

- (int64_t)numberOfHandoffBecomingActive
{
  return self->_numberOfHandoffBecomingActive;
}

- (void)setNumberOfHandoffBecomingActive:(int64_t)a3
{
  self->_numberOfHandoffBecomingActive = a3;
}

- (int64_t)numberOfHandoffBecomingNonActive
{
  return self->_numberOfHandoffBecomingNonActive;
}

- (void)setNumberOfHandoffBecomingNonActive:(int64_t)a3
{
  self->_numberOfHandoffBecomingNonActive = a3;
}

- (NSUUID)earliestActiveDeviceIdentifier
{
  return self->_earliestActiveDeviceIdentifier;
}

- (void)setEarliestActiveDeviceIdentifier:(id)a3
{
}

- (NSUUID)latestActiveDeviceIdentifier
{
  return self->_latestActiveDeviceIdentifier;
}

- (void)setLatestActiveDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestActiveDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_earliestActiveDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_workoutEvents, 0);
  objc_storeStrong((id *)&self->_cacheUpdateBackstopExpiryDate, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_locationOfTrigger, 0);
  objc_storeStrong((id *)&self->_timeCacheUploadCompletion, 0);
  objc_storeStrong((id *)&self->_watchCache, 0);
  objc_storeStrong((id *)&self->_phoneCache, 0);
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_parkedCarLocation, 0);
  objc_storeStrong((id *)&self->_offWristLocation, 0);
  objc_storeStrong((id *)&self->_startingLocation, 0);
  objc_storeStrong((id *)&self->_lockLocation, 0);
  objc_storeStrong((id *)&self->_unlockLocation, 0);
  objc_storeStrong((id *)&self->_scheduleSendMessageGUID, 0);
  objc_storeStrong((id *)&self->_scheduledSendExpiryDate, 0);
  objc_storeStrong((id *)&self->_keyReleaseMessageSendDate, 0);
  objc_storeStrong((id *)&self->_shouldBeCleanedUpDate, 0);
}

@end
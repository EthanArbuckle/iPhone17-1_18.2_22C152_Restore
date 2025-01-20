@interface MOEvent
+ (BOOL)supportsSecureCoding;
+ (id)FormatDate:(id)a3;
+ (id)describeCategory:(unint64_t)a3;
+ (id)describeProvider:(unint64_t)a3;
- (BOOL)fromFirstParty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFitnessPlusSession;
- (BOOL)isGComplete;
- (BOOL)isHighConfidence;
- (BOOL)isHomeWorkVisit;
- (BOOL)isInvalid;
- (BOOL)itemIsPinned;
- (CLLocation)workoutLocationStart;
- (GEOAddressObject)geoAddressObject;
- (MOEvent)initWithCoder:(id)a3;
- (MOEvent)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 creationDate:(id)a6 provider:(unint64_t)a7 category:(unint64_t)a8;
- (MOEventAnalytics)analyticsEvent;
- (MOEventExtendedAttributes)extendedAttributes;
- (MOEventLifeEvents)lifeEventsEvent;
- (MOEventMedia)mediaEvent;
- (MOEventMotionActivity)motionActivityEvent;
- (MOEventPeopleDiscovery)peopleDiscoveryEvent;
- (MOEventPhoto)photoEvent;
- (MOEventPortrait)portraitEvent;
- (MOEventProactiveSuggested)proactiveSuggestedEvent;
- (MOEventRoutine)routineEvent;
- (MOEventSharedWithYou)sharedWithYouEvent;
- (MOEventSignificantContact)significantContactEvent;
- (MOEventStateOfMind)stateOfMindEvent;
- (MOEventTravel)travelEvent;
- (MOEventWorkout)workoutEvent;
- (MOWeather)predominantWeather;
- (NSArray)interactionContacts;
- (NSArray)interactions;
- (NSArray)itemRecipients;
- (NSArray)itemSenders;
- (NSArray)mediaPlaySessions;
- (NSArray)photoMemoryAssets;
- (NSArray)tripParts;
- (NSArray)workoutLocationRoute;
- (NSData)placeMapItem;
- (NSDate)creationDate;
- (NSDate)endDate;
- (NSDate)expirationDate;
- (NSDate)sourceCreationDate;
- (NSDate)startDate;
- (NSDictionary)contactClassificationMap;
- (NSDictionary)patterns;
- (NSDictionary)scoredTopics;
- (NSDictionary)trends;
- (NSNumber)densityScanDuration;
- (NSNumber)densityScore;
- (NSNumber)interactionContactScore;
- (NSNumber)itemAttributionsCount;
- (NSNumber)mediaRepetitions;
- (NSNumber)mediaSumTimePlayed;
- (NSNumber)motionStepCount;
- (NSNumber)pCount;
- (NSNumber)workoutDuration;
- (NSNumber)workoutTotalDistance;
- (NSNumber)workoutTotalEnergyBurned;
- (NSSet)interactionMechanisms;
- (NSString)appBundle;
- (NSString)identifierFromProvider;
- (NSString)interactionGroupName;
- (NSString)mediaAlbum;
- (NSString)mediaArtist;
- (NSString)mediaGenre;
- (NSString)mediaPlayerBundleId;
- (NSString)mediaProductId;
- (NSString)mediaTitle;
- (NSString)mediaType;
- (NSString)photoMemoryTitle;
- (NSString)placeName;
- (NSString)poiCategory;
- (NSString)suggestedEventIdentifier;
- (NSString)suggestedEventTitle;
- (NSString)tripTitle;
- (NSString)workoutType;
- (NSTimeZone)timeZone;
- (NSURL)itemURL;
- (NSUUID)eventIdentifier;
- (PHAsset)photoAsset;
- (PPEvent)suggestedEvent;
- (PPScoredContact)interactionScoredContact;
- (RTAddress)address;
- (RTLocation)location;
- (double)confidenceScore;
- (double)duration;
- (double)familiarityIndexLOI;
- (double)placeNameConfidence;
- (id)_descriptionOf:(unint64_t)a3;
- (id)bundleSourceType;
- (id)copy;
- (id)describeCategory;
- (id)describeProvider;
- (id)description;
- (id)descriptionOfLifeEventCategory:(unint64_t)a3;
- (id)descriptionOfMode:(unint64_t)a3;
- (id)descriptionOfMotionType:(unint64_t)a3;
- (id)descriptionOfPhotoMomentSource:(unint64_t)a3;
- (id)displayNameOfScoredTopics:(id)a3;
- (id)formatAddressWithFormatOption:(id)a3;
- (id)formatAdministrativeAreaWithFormatOption:(id)a3;
- (id)formatCountryWithFormatOption:(id)a3;
- (id)formatLocalityWithFormatOption:(id)a3;
- (int64_t)gaPR;
- (unint64_t)category;
- (unint64_t)hash;
- (unint64_t)itemShareDirection;
- (unint64_t)itemSyndicationStatus;
- (unint64_t)lifeEventCategory;
- (unint64_t)mode;
- (unint64_t)motionType;
- (unint64_t)photoMemoryCategory;
- (unint64_t)photoMomentSource;
- (unint64_t)placeDiscovery;
- (unint64_t)placeSource;
- (unint64_t)placeType;
- (unint64_t)placeUserType;
- (unint64_t)provider;
- (unint64_t)rehydrationFailCount;
- (unint64_t)suggestedEventCategory;
- (unint64_t)timeAtHomeSubType;
- (void)encodeWithCoder:(id)a3;
- (void)initSubEvent;
- (void)setAddress:(id)a3;
- (void)setAnalyticsEvent:(id)a3;
- (void)setAppBundle:(id)a3;
- (void)setConfidenceScore:(double)a3;
- (void)setContactClassificationMap:(id)a3;
- (void)setDensityScanDuration:(id)a3;
- (void)setDensityScore:(id)a3;
- (void)setEventIdentifier:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExtendedAttributes:(id)a3;
- (void)setFamiliarityIndexLOI:(double)a3;
- (void)setFromFirstParty:(BOOL)a3;
- (void)setGaPR:(int64_t)a3;
- (void)setGeoAddressObject:(id)a3;
- (void)setIdentifierFromProvider:(id)a3;
- (void)setInteractionContactScore:(id)a3;
- (void)setInteractionContacts:(id)a3;
- (void)setInteractionGroupName:(id)a3;
- (void)setInteractionMechanisms:(id)a3;
- (void)setInteractionScoredContact:(id)a3;
- (void)setInteractions:(id)a3;
- (void)setIsFitnessPlusSession:(BOOL)a3;
- (void)setIsGComplete:(BOOL)a3;
- (void)setIsHighConfidence:(BOOL)a3;
- (void)setIsInvalid:(BOOL)a3;
- (void)setItemAttributionsCount:(id)a3;
- (void)setItemIsPinned:(BOOL)a3;
- (void)setItemRecipients:(id)a3;
- (void)setItemSenders:(id)a3;
- (void)setItemShareDirection:(unint64_t)a3;
- (void)setItemSyndicationStatus:(unint64_t)a3;
- (void)setItemURL:(id)a3;
- (void)setLifeEventCategory:(unint64_t)a3;
- (void)setLifeEventsEvent:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMediaAlbum:(id)a3;
- (void)setMediaArtist:(id)a3;
- (void)setMediaEvent:(id)a3;
- (void)setMediaGenre:(id)a3;
- (void)setMediaPlaySessions:(id)a3;
- (void)setMediaPlayerBundleId:(id)a3;
- (void)setMediaProductId:(id)a3;
- (void)setMediaRepetitions:(id)a3;
- (void)setMediaSumTimePlayed:(id)a3;
- (void)setMediaTitle:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setMotionActivityEvent:(id)a3;
- (void)setMotionStepCount:(id)a3;
- (void)setMotionType:(unint64_t)a3;
- (void)setPCount:(id)a3;
- (void)setPatterns:(id)a3;
- (void)setPeopleDiscoveryEvent:(id)a3;
- (void)setPhotoAsset:(id)a3;
- (void)setPhotoEvent:(id)a3;
- (void)setPhotoMemoryAssets:(id)a3;
- (void)setPhotoMemoryCategory:(unint64_t)a3;
- (void)setPhotoMemoryTitle:(id)a3;
- (void)setPhotoMomentSource:(unint64_t)a3;
- (void)setPlaceDiscovery:(unint64_t)a3;
- (void)setPlaceMapItem:(id)a3;
- (void)setPlaceName:(id)a3;
- (void)setPlaceNameConfidence:(double)a3;
- (void)setPlaceSource:(unint64_t)a3;
- (void)setPlaceType:(unint64_t)a3;
- (void)setPlaceUserType:(unint64_t)a3;
- (void)setPoiCategory:(id)a3;
- (void)setPortraitEvent:(id)a3;
- (void)setPredominantWeather:(id)a3;
- (void)setProactiveSuggestedEvent:(id)a3;
- (void)setRehydrationFailCount:(unint64_t)a3;
- (void)setRoutineEvent:(id)a3;
- (void)setScoredTopics:(id)a3;
- (void)setSharedWithYouEvent:(id)a3;
- (void)setSignificantContactEvent:(id)a3;
- (void)setSourceCreationDate:(id)a3;
- (void)setStateOfMindEvent:(id)a3;
- (void)setSuggestedEvent:(id)a3;
- (void)setSuggestedEventCategory:(unint64_t)a3;
- (void)setSuggestedEventIdentifier:(id)a3;
- (void)setSuggestedEventTitle:(id)a3;
- (void)setTimeAtHomeSubType:(unint64_t)a3;
- (void)setTimeZone:(id)a3;
- (void)setTravelEvent:(id)a3;
- (void)setTrends:(id)a3;
- (void)setTripParts:(id)a3;
- (void)setTripTitle:(id)a3;
- (void)setWorkoutDuration:(id)a3;
- (void)setWorkoutEvent:(id)a3;
- (void)setWorkoutLocationRoute:(id)a3;
- (void)setWorkoutLocationStart:(id)a3;
- (void)setWorkoutTotalDistance:(id)a3;
- (void)setWorkoutTotalEnergyBurned:(id)a3;
- (void)setWorkoutType:(id)a3;
@end

@implementation MOEvent

- (id)bundleSourceType
{
  unint64_t v2 = [(MOEvent *)self category] - 1;
  if (v2 <= 0x17 && ((0xF1E2BFu >> v2) & 1) != 0) {
    v3 = *off_1E691EBE0[v2];
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (MOEvent)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 creationDate:(id)a6 provider:(unint64_t)a7 category:(unint64_t)a8
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  v20 = v19;
  if (!v16)
  {
    v30 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:]();
    }

    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = v31;
    v33 = @"Invalid parameter not satisfying: eventIdentifier";
    SEL v34 = a2;
    v35 = self;
    uint64_t v36 = 31;
    goto LABEL_20;
  }
  if (!v17)
  {
    v37 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:]();
    }

    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = v31;
    v33 = @"Invalid parameter not satisfying: startDate";
    SEL v34 = a2;
    v35 = self;
    uint64_t v36 = 32;
    goto LABEL_20;
  }
  if (!v18)
  {
    v38 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:]();
    }

    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = v31;
    v33 = @"Invalid parameter not satisfying: endDate";
    SEL v34 = a2;
    v35 = self;
    uint64_t v36 = 33;
    goto LABEL_20;
  }
  if (!v19)
  {
    v39 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.4();
    }

    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = v31;
    v33 = @"Invalid parameter not satisfying: creationDate";
    SEL v34 = a2;
    v35 = self;
    uint64_t v36 = 34;
LABEL_20:
    [v31 handleFailureInMethod:v34 object:v35 file:@"MOEvent.m" lineNumber:v36 description:v33];

    v29 = 0;
    goto LABEL_21;
  }
  v41.receiver = self;
  v41.super_class = (Class)MOEvent;
  v21 = [(MOEvent *)&v41 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_eventIdentifier, a3);
    uint64_t v23 = [v17 copy];
    startDate = v22->_startDate;
    v22->_startDate = (NSDate *)v23;

    uint64_t v25 = [v18 copy];
    endDate = v22->_endDate;
    v22->_endDate = (NSDate *)v25;

    uint64_t v27 = [v20 copy];
    creationDate = v22->_creationDate;
    v22->_creationDate = (NSDate *)v27;

    v22->_provider = a7;
    v22->_category = a8;
    [(MOEvent *)v22 initSubEvent];
  }
  self = v22;
  v29 = self;
LABEL_21:

  return v29;
}

- (void)initSubEvent
{
  unint64_t category = self->_category;
  if (category == 16)
  {
    v4 = objc_alloc_init(MOEventMotionActivity);
    motionActivityEvent = self->_motionActivityEvent;
    self->_motionActivityEvent = v4;

    goto LABEL_6;
  }
  if (category == 2)
  {
LABEL_6:
    self->_workoutEvent = objc_alloc_init(MOEventWorkout);
    goto LABEL_7;
  }
  if (category != 1) {
    return;
  }
  self->_routineEvent = objc_alloc_init(MOEventRoutine);
LABEL_7:
  MEMORY[0x1F41817F8]();
}

+ (id)describeProvider:(unint64_t)a3
{
  if (a3 >= 0xC) {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown (%lu)", a3);
  }
  else {
    v3 = off_1E691FB98[a3];
  }
  return v3;
}

+ (id)describeCategory:(unint64_t)a3
{
  if (a3 - 1 > 0x17) {
    return @"Unknown Category";
  }
  else {
    return off_1E691FBF8[a3 - 1];
  }
}

- (id)describeCategory
{
  unint64_t v2 = [(MOEvent *)self category];
  return +[MOEvent describeCategory:v2];
}

- (id)describeProvider
{
  unint64_t v2 = [(MOEvent *)self provider];
  return +[MOEvent describeProvider:v2];
}

- (unint64_t)photoMomentSource
{
  unint64_t result = (unint64_t)self->_photoEvent;
  if (result) {
    return [(id)result photoMomentSource];
  }
  return result;
}

- (MOEventExtendedAttributes)extendedAttributes
{
  photoEvent = self->_photoEvent;
  if (photoEvent)
  {
    photoEvent = [photoEvent extendedAttributes];
  }
  return (MOEventExtendedAttributes *)photoEvent;
}

- (PHAsset)photoAsset
{
  photoEvent = self->_photoEvent;
  if (photoEvent)
  {
    photoEvent = [photoEvent photoAsset];
  }
  return (PHAsset *)photoEvent;
}

- (NSString)photoMemoryTitle
{
  photoEvent = self->_photoEvent;
  if (photoEvent)
  {
    photoEvent = [photoEvent photoMemoryTitle];
  }
  return (NSString *)photoEvent;
}

- (NSArray)photoMemoryAssets
{
  photoEvent = self->_photoEvent;
  if (photoEvent)
  {
    photoEvent = [photoEvent photoMemoryAssets];
  }
  return (NSArray *)photoEvent;
}

- (unint64_t)photoMemoryCategory
{
  unint64_t result = (unint64_t)self->_photoEvent;
  if (result) {
    return [(id)result photoMemoryCategory];
  }
  return result;
}

- (unint64_t)timeAtHomeSubType
{
  unint64_t result = (unint64_t)self->_analyticsEvent;
  if (result) {
    return [(id)result timeAtHomeSubType];
  }
  return result;
}

- (BOOL)isHighConfidence
{
  routineEvent = self->_routineEvent;
  if (routineEvent) {
    LOBYTE(routineEvent) = [(MOEventRoutine *)routineEvent isHighConfidence];
  }
  return (char)routineEvent;
}

- (BOOL)isInvalid
{
  routineEvent = self->_routineEvent;
  if (routineEvent) {
    LOBYTE(routineEvent) = [(MOEventRoutine *)routineEvent isInvalid];
  }
  return (char)routineEvent;
}

- (unint64_t)placeType
{
  unint64_t result = (unint64_t)self->_routineEvent;
  if (result) {
    return [(id)result placeType];
  }
  return result;
}

- (unint64_t)placeUserType
{
  unint64_t result = (unint64_t)self->_routineEvent;
  if (result) {
    return [(id)result placeUserType];
  }
  return result;
}

- (NSString)placeName
{
  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    routineEvent = [routineEvent placeName];
  }
  return (NSString *)routineEvent;
}

- (double)placeNameConfidence
{
  routineEvent = self->_routineEvent;
  if (!routineEvent) {
    return 0.0;
  }
  [(MOEventRoutine *)routineEvent placeNameConfidence];
  return result;
}

- (unint64_t)placeDiscovery
{
  unint64_t result = (unint64_t)self->_routineEvent;
  if (result) {
    return [(id)result placeDiscovery];
  }
  return result;
}

- (RTLocation)location
{
  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    routineEvent = [routineEvent location];
  }
  return (RTLocation *)routineEvent;
}

- (RTAddress)address
{
  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    routineEvent = [routineEvent address];
  }
  return (RTAddress *)routineEvent;
}

- (GEOAddressObject)geoAddressObject
{
  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    routineEvent = [routineEvent geoAddressObject];
  }
  return (GEOAddressObject *)routineEvent;
}

- (unint64_t)mode
{
  unint64_t result = (unint64_t)self->_routineEvent;
  if (result) {
    return [(id)result mode];
  }
  return result;
}

- (NSData)placeMapItem
{
  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    routineEvent = [routineEvent placeMapItem];
  }
  return (NSData *)routineEvent;
}

- (NSString)poiCategory
{
  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    routineEvent = [routineEvent poiCategory];
  }
  return (NSString *)routineEvent;
}

- (unint64_t)placeSource
{
  unint64_t result = (unint64_t)self->_routineEvent;
  if (result) {
    return [(id)result placeSource];
  }
  return result;
}

- (double)familiarityIndexLOI
{
  routineEvent = self->_routineEvent;
  if (!routineEvent) {
    return 0.0;
  }
  [(MOEventRoutine *)routineEvent familiarityIndexLOI];
  return result;
}

- (NSString)workoutType
{
  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    workoutEvent = [workoutEvent workoutType];
  }
  return (NSString *)workoutEvent;
}

- (NSNumber)workoutTotalDistance
{
  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    workoutEvent = [workoutEvent workoutTotalDistance];
  }
  return (NSNumber *)workoutEvent;
}

- (NSNumber)workoutTotalEnergyBurned
{
  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    workoutEvent = [workoutEvent workoutTotalEnergyBurned];
  }
  return (NSNumber *)workoutEvent;
}

- (NSNumber)workoutDuration
{
  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    workoutEvent = [workoutEvent workoutDuration];
  }
  return (NSNumber *)workoutEvent;
}

- (CLLocation)workoutLocationStart
{
  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    workoutEvent = [workoutEvent workoutLocationStart];
  }
  return (CLLocation *)workoutEvent;
}

- (NSArray)workoutLocationRoute
{
  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    workoutEvent = [workoutEvent workoutLocationRoute];
  }
  return (NSArray *)workoutEvent;
}

- (NSNumber)motionStepCount
{
  motionActivityEvent = self->_motionActivityEvent;
  if (motionActivityEvent)
  {
    motionActivityEvent = [motionActivityEvent motionStepCount];
  }
  return (NSNumber *)motionActivityEvent;
}

- (BOOL)isFitnessPlusSession
{
  workoutEvent = self->_workoutEvent;
  if (workoutEvent) {
    LOBYTE(workoutEvent) = [(MOEventWorkout *)workoutEvent isFitnessPlusSession];
  }
  return (char)workoutEvent;
}

- (NSString)suggestedEventTitle
{
  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (proactiveSuggestedEvent)
  {
    proactiveSuggestedEvent = [proactiveSuggestedEvent suggestedEventTitle];
  }
  return (NSString *)proactiveSuggestedEvent;
}

- (NSString)suggestedEventIdentifier
{
  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (proactiveSuggestedEvent)
  {
    proactiveSuggestedEvent = [proactiveSuggestedEvent suggestedEventIdentifier];
  }
  return (NSString *)proactiveSuggestedEvent;
}

- (unint64_t)suggestedEventCategory
{
  unint64_t result = (unint64_t)self->_proactiveSuggestedEvent;
  if (result) {
    return [(id)result suggestedEventCategory];
  }
  return result;
}

- (PPEvent)suggestedEvent
{
  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (proactiveSuggestedEvent)
  {
    proactiveSuggestedEvent = [proactiveSuggestedEvent suggestedEvent];
  }
  return (PPEvent *)proactiveSuggestedEvent;
}

- (NSString)tripTitle
{
  travelEvent = self->_travelEvent;
  if (travelEvent)
  {
    travelEvent = [travelEvent tripTitle];
  }
  return (NSString *)travelEvent;
}

- (NSArray)tripParts
{
  travelEvent = self->_travelEvent;
  if (travelEvent)
  {
    travelEvent = [travelEvent tripParts];
  }
  return (NSArray *)travelEvent;
}

- (NSString)mediaTitle
{
  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    mediaEvent = [mediaEvent mediaTitle];
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaAlbum
{
  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    mediaEvent = [mediaEvent mediaAlbum];
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaPlayerBundleId
{
  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    mediaEvent = [mediaEvent mediaPlayerBundleId];
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaProductId
{
  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    mediaEvent = [mediaEvent mediaProductId];
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaGenre
{
  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    mediaEvent = [mediaEvent mediaGenre];
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaType
{
  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    mediaEvent = [mediaEvent mediaType];
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaArtist
{
  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    mediaEvent = [mediaEvent mediaArtist];
  }
  return (NSString *)mediaEvent;
}

- (NSNumber)mediaRepetitions
{
  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    mediaEvent = [mediaEvent mediaRepetitions];
  }
  return (NSNumber *)mediaEvent;
}

- (NSNumber)mediaSumTimePlayed
{
  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    mediaEvent = [mediaEvent mediaSumTimePlayed];
  }
  return (NSNumber *)mediaEvent;
}

- (NSArray)mediaPlaySessions
{
  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    mediaEvent = [mediaEvent mediaPlaySessions];
  }
  return (NSArray *)mediaEvent;
}

- (MOWeather)predominantWeather
{
  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    routineEvent = [routineEvent predominantWeather];
  }
  return (MOWeather *)routineEvent;
}

- (NSURL)itemURL
{
  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
  {
    sharedWithYouEvent = [sharedWithYouEvent itemURL];
  }
  return (NSURL *)sharedWithYouEvent;
}

- (NSArray)itemSenders
{
  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
  {
    sharedWithYouEvent = [sharedWithYouEvent itemSenders];
  }
  return (NSArray *)sharedWithYouEvent;
}

- (NSArray)itemRecipients
{
  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
  {
    sharedWithYouEvent = [sharedWithYouEvent itemRecipients];
  }
  return (NSArray *)sharedWithYouEvent;
}

- (unint64_t)itemShareDirection
{
  unint64_t result = (unint64_t)self->_sharedWithYouEvent;
  if (result) {
    return [(id)result itemShareDirection];
  }
  return result;
}

- (BOOL)itemIsPinned
{
  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent) {
    LOBYTE(sharedWithYouEvent) = [(MOEventSharedWithYou *)sharedWithYouEvent itemIsPinned];
  }
  return (char)sharedWithYouEvent;
}

- (unint64_t)itemSyndicationStatus
{
  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent) {
    return [(MOEventSharedWithYou *)sharedWithYouEvent itemSyndicationStatus];
  }
  else {
    return 1;
  }
}

- (NSNumber)itemAttributionsCount
{
  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
  {
    sharedWithYouEvent = [sharedWithYouEvent itemAttributionsCount];
  }
  return (NSNumber *)sharedWithYouEvent;
}

- (NSNumber)interactionContactScore
{
  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    significantContactEvent = [significantContactEvent interactionContactScore];
  }
  return (NSNumber *)significantContactEvent;
}

- (PPScoredContact)interactionScoredContact
{
  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    significantContactEvent = [significantContactEvent interactionScoredContact];
  }
  return (PPScoredContact *)significantContactEvent;
}

- (NSString)interactionGroupName
{
  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    significantContactEvent = [significantContactEvent interactionGroupName];
  }
  return (NSString *)significantContactEvent;
}

- (NSArray)interactionContacts
{
  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    significantContactEvent = [significantContactEvent interactionContacts];
  }
  return (NSArray *)significantContactEvent;
}

- (NSDictionary)contactClassificationMap
{
  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    significantContactEvent = [significantContactEvent contactClassificationMap];
  }
  return (NSDictionary *)significantContactEvent;
}

- (NSSet)interactionMechanisms
{
  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    significantContactEvent = [significantContactEvent interactionMechanisms];
  }
  return (NSSet *)significantContactEvent;
}

- (NSArray)interactions
{
  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    significantContactEvent = [significantContactEvent interactions];
  }
  return (NSArray *)significantContactEvent;
}

- (BOOL)isGComplete
{
  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent) {
    LOBYTE(peopleDiscoveryEvent) = [(MOEventPeopleDiscovery *)peopleDiscoveryEvent isGComplete];
  }
  return (char)peopleDiscoveryEvent;
}

- (int64_t)gaPR
{
  int64_t result = (int64_t)self->_peopleDiscoveryEvent;
  if (result) {
    return [(id)result gaPR];
  }
  return result;
}

- (NSNumber)pCount
{
  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent)
  {
    peopleDiscoveryEvent = [peopleDiscoveryEvent pCount];
  }
  return (NSNumber *)peopleDiscoveryEvent;
}

- (NSNumber)densityScore
{
  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent)
  {
    peopleDiscoveryEvent = [peopleDiscoveryEvent densityScore];
  }
  return (NSNumber *)peopleDiscoveryEvent;
}

- (NSNumber)densityScanDuration
{
  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent)
  {
    peopleDiscoveryEvent = [peopleDiscoveryEvent densityScanDuration];
  }
  return (NSNumber *)peopleDiscoveryEvent;
}

- (NSDictionary)scoredTopics
{
  portraitEvent = self->_portraitEvent;
  if (portraitEvent)
  {
    portraitEvent = [portraitEvent scoredTopics];
  }
  return (NSDictionary *)portraitEvent;
}

- (unint64_t)motionType
{
  unint64_t result = (unint64_t)self->_motionActivityEvent;
  if (result) {
    return [(id)result motionType];
  }
  return result;
}

- (NSDictionary)trends
{
  analyticsEvent = self->_analyticsEvent;
  if (analyticsEvent)
  {
    analyticsEvent = [analyticsEvent trends];
  }
  return (NSDictionary *)analyticsEvent;
}

- (NSDictionary)patterns
{
  analyticsEvent = self->_analyticsEvent;
  if (analyticsEvent)
  {
    analyticsEvent = [analyticsEvent patterns];
  }
  return (NSDictionary *)analyticsEvent;
}

- (unint64_t)lifeEventCategory
{
  unint64_t result = (unint64_t)self->_lifeEventsEvent;
  if (result) {
    return [(id)result lifeEventCategory];
  }
  return result;
}

- (double)confidenceScore
{
  lifeEventsEvent = self->_lifeEventsEvent;
  if (!lifeEventsEvent) {
    return 0.0;
  }
  [(MOEventLifeEvents *)lifeEventsEvent confidenceScore];
  return result;
}

- (void)setPhotoMomentSource:(unint64_t)a3
{
  photoEvent = self->_photoEvent;
  if (!photoEvent)
  {
    v6 = objc_alloc_init(MOEventPhoto);
    v7 = self->_photoEvent;
    self->_photoEvent = v6;

    photoEvent = self->_photoEvent;
  }
  [(MOEventPhoto *)photoEvent setPhotoMomentSource:a3];
}

- (void)setExtendedAttributes:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    id v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    [(MOEventPhoto *)photoEvent setExtendedAttributes:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setPhotoAsset:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    id v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    [(MOEventPhoto *)photoEvent setPhotoAsset:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setPhotoMemoryTitle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    id v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    [(MOEventPhoto *)photoEvent setPhotoMemoryTitle:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setPhotoMemoryAssets:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    id v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    [(MOEventPhoto *)photoEvent setPhotoMemoryAssets:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setPhotoMemoryCategory:(unint64_t)a3
{
  photoEvent = self->_photoEvent;
  if (!photoEvent)
  {
    v6 = objc_alloc_init(MOEventPhoto);
    v7 = self->_photoEvent;
    self->_photoEvent = v6;

    photoEvent = self->_photoEvent;
  }
  [(MOEventPhoto *)photoEvent setPhotoMemoryCategory:a3];
}

- (void)setTimeAtHomeSubType:(unint64_t)a3
{
  analyticsEvent = self->_analyticsEvent;
  if (!analyticsEvent)
  {
    v6 = objc_alloc_init(MOEventAnalytics);
    v7 = self->_analyticsEvent;
    self->_analyticsEvent = v6;

    analyticsEvent = self->_analyticsEvent;
  }
  [(MOEventAnalytics *)analyticsEvent setTimeAtHomeSubType:a3];
}

- (void)setIsHighConfidence:(BOOL)a3
{
  BOOL v3 = a3;
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  [(MOEventRoutine *)routineEvent setIsHighConfidence:v3];
}

- (void)setIsInvalid:(BOOL)a3
{
  BOOL v3 = a3;
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  [(MOEventRoutine *)routineEvent setIsInvalid:v3];
}

- (void)setPlaceType:(unint64_t)a3
{
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  [(MOEventRoutine *)routineEvent setPlaceType:a3];
}

- (void)setPlaceUserType:(unint64_t)a3
{
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  [(MOEventRoutine *)routineEvent setPlaceUserType:a3];
}

- (void)setPlaceName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    id v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    [(MOEventRoutine *)routineEvent setPlaceName:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setPlaceNameConfidence:(double)a3
{
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  [(MOEventRoutine *)routineEvent setPlaceNameConfidence:a3];
}

- (void)setPlaceDiscovery:(unint64_t)a3
{
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  [(MOEventRoutine *)routineEvent setPlaceDiscovery:a3];
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    id v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    [(MOEventRoutine *)routineEvent setLocation:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setAddress:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    id v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    [(MOEventRoutine *)routineEvent setAddress:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setGeoAddressObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    id v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    [(MOEventRoutine *)routineEvent setGeoAddressObject:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMode:(unint64_t)a3
{
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  [(MOEventRoutine *)routineEvent setMode:a3];
}

- (void)setPlaceMapItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    id v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    [(MOEventRoutine *)routineEvent setPlaceMapItem:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setPoiCategory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    id v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    [(MOEventRoutine *)routineEvent setPoiCategory:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setPlaceSource:(unint64_t)a3
{
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  [(MOEventRoutine *)routineEvent setPlaceSource:a3];
}

- (void)setFamiliarityIndexLOI:(double)a3
{
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  [(MOEventRoutine *)routineEvent setFamiliarityIndexLOI:a3];
}

- (void)setWorkoutType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    id v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    [(MOEventWorkout *)workoutEvent setWorkoutType:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setWorkoutTotalDistance:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    id v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    [(MOEventWorkout *)workoutEvent setWorkoutTotalDistance:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setWorkoutTotalEnergyBurned:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    id v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    [(MOEventWorkout *)workoutEvent setWorkoutTotalEnergyBurned:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setWorkoutDuration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    id v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    [(MOEventWorkout *)workoutEvent setWorkoutDuration:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setWorkoutLocationStart:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    id v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    [(MOEventWorkout *)workoutEvent setWorkoutLocationStart:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setWorkoutLocationRoute:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    id v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    [(MOEventWorkout *)workoutEvent setWorkoutLocationRoute:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMotionStepCount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    motionActivityEvent = self->_motionActivityEvent;
    id v8 = v4;
    if (!motionActivityEvent)
    {
      v6 = objc_alloc_init(MOEventMotionActivity);
      v7 = self->_motionActivityEvent;
      self->_motionActivityEvent = v6;

      motionActivityEvent = self->_motionActivityEvent;
    }
    [(MOEventMotionActivity *)motionActivityEvent setMotionStepCount:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setIsFitnessPlusSession:(BOOL)a3
{
  BOOL v3 = a3;
  workoutEvent = self->_workoutEvent;
  if (!workoutEvent)
  {
    v6 = objc_alloc_init(MOEventWorkout);
    v7 = self->_workoutEvent;
    self->_workoutEvent = v6;

    workoutEvent = self->_workoutEvent;
  }
  [(MOEventWorkout *)workoutEvent setIsFitnessPlusSession:v3];
}

- (void)setSuggestedEventTitle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    id v8 = v4;
    if (!proactiveSuggestedEvent)
    {
      v6 = objc_alloc_init(MOEventProactiveSuggested);
      v7 = self->_proactiveSuggestedEvent;
      self->_proactiveSuggestedEvent = v6;

      proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    }
    [(MOEventProactiveSuggested *)proactiveSuggestedEvent setSuggestedEventTitle:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setSuggestedEventIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    id v8 = v4;
    if (!proactiveSuggestedEvent)
    {
      v6 = objc_alloc_init(MOEventProactiveSuggested);
      v7 = self->_proactiveSuggestedEvent;
      self->_proactiveSuggestedEvent = v6;

      proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    }
    [(MOEventProactiveSuggested *)proactiveSuggestedEvent setSuggestedEventIdentifier:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setSuggestedEventCategory:(unint64_t)a3
{
  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (!proactiveSuggestedEvent)
  {
    v6 = objc_alloc_init(MOEventProactiveSuggested);
    v7 = self->_proactiveSuggestedEvent;
    self->_proactiveSuggestedEvent = v6;

    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  }
  [(MOEventProactiveSuggested *)proactiveSuggestedEvent setSuggestedEventCategory:a3];
}

- (void)setSuggestedEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    id v8 = v4;
    if (!proactiveSuggestedEvent)
    {
      v6 = objc_alloc_init(MOEventProactiveSuggested);
      v7 = self->_proactiveSuggestedEvent;
      self->_proactiveSuggestedEvent = v6;

      proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    }
    [(MOEventProactiveSuggested *)proactiveSuggestedEvent setSuggestedEvent:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setTripTitle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    travelEvent = self->_travelEvent;
    id v8 = v4;
    if (!travelEvent)
    {
      v6 = objc_alloc_init(MOEventTravel);
      v7 = self->_travelEvent;
      self->_travelEvent = v6;

      travelEvent = self->_travelEvent;
    }
    [(MOEventTravel *)travelEvent setTripTitle:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setTripParts:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    travelEvent = self->_travelEvent;
    id v8 = v4;
    if (!travelEvent)
    {
      v6 = objc_alloc_init(MOEventTravel);
      v7 = self->_travelEvent;
      self->_travelEvent = v6;

      travelEvent = self->_travelEvent;
    }
    [(MOEventTravel *)travelEvent setTripParts:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMediaTitle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    id v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    [(MOEventMedia *)mediaEvent setMediaTitle:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMediaAlbum:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    id v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    [(MOEventMedia *)mediaEvent setMediaAlbum:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMediaPlayerBundleId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    id v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    [(MOEventMedia *)mediaEvent setMediaPlayerBundleId:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMediaProductId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    id v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    [(MOEventMedia *)mediaEvent setMediaProductId:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMediaGenre:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    id v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    [(MOEventMedia *)mediaEvent setMediaGenre:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMediaType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    id v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    [(MOEventMedia *)mediaEvent setMediaType:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMediaArtist:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    id v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    [(MOEventMedia *)mediaEvent setMediaArtist:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMediaRepetitions:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    id v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    [(MOEventMedia *)mediaEvent setMediaRepetitions:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMediaSumTimePlayed:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    id v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    [(MOEventMedia *)mediaEvent setMediaSumTimePlayed:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMediaPlaySessions:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    id v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    [(MOEventMedia *)mediaEvent setMediaPlaySessions:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setPredominantWeather:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    id v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    [(MOEventRoutine *)routineEvent setPredominantWeather:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setItemURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    id v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    [(MOEventSharedWithYou *)sharedWithYouEvent setItemURL:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setItemSenders:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    id v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    [(MOEventSharedWithYou *)sharedWithYouEvent setItemSenders:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setItemRecipients:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    id v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    [(MOEventSharedWithYou *)sharedWithYouEvent setItemRecipients:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setItemShareDirection:(unint64_t)a3
{
  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (!sharedWithYouEvent)
  {
    v6 = objc_alloc_init(MOEventSharedWithYou);
    v7 = self->_sharedWithYouEvent;
    self->_sharedWithYouEvent = v6;

    sharedWithYouEvent = self->_sharedWithYouEvent;
  }
  [(MOEventSharedWithYou *)sharedWithYouEvent setItemShareDirection:a3];
}

- (void)setItemIsPinned:(BOOL)a3
{
  BOOL v3 = a3;
  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (!sharedWithYouEvent)
  {
    v6 = objc_alloc_init(MOEventSharedWithYou);
    v7 = self->_sharedWithYouEvent;
    self->_sharedWithYouEvent = v6;

    sharedWithYouEvent = self->_sharedWithYouEvent;
  }
  [(MOEventSharedWithYou *)sharedWithYouEvent setItemIsPinned:v3];
}

- (void)setItemSyndicationStatus:(unint64_t)a3
{
  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (!sharedWithYouEvent)
  {
    v6 = objc_alloc_init(MOEventSharedWithYou);
    v7 = self->_sharedWithYouEvent;
    self->_sharedWithYouEvent = v6;

    sharedWithYouEvent = self->_sharedWithYouEvent;
  }
  [(MOEventSharedWithYou *)sharedWithYouEvent setItemSyndicationStatus:a3];
}

- (void)setItemAttributionsCount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    id v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    [(MOEventSharedWithYou *)sharedWithYouEvent setItemAttributionsCount:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setInteractionContactScore:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    id v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    [(MOEventSignificantContact *)significantContactEvent setInteractionContactScore:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setInteractionScoredContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    id v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    [(MOEventSignificantContact *)significantContactEvent setInteractionScoredContact:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setInteractionGroupName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    id v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    [(MOEventSignificantContact *)significantContactEvent setInteractionGroupName:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setInteractionContacts:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    id v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    [(MOEventSignificantContact *)significantContactEvent setInteractionContacts:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setContactClassificationMap:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    id v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    [(MOEventSignificantContact *)significantContactEvent setContactClassificationMap:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setInteractionMechanisms:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    id v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    [(MOEventSignificantContact *)significantContactEvent setInteractionMechanisms:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setInteractions:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    id v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    [(MOEventSignificantContact *)significantContactEvent setInteractions:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setIsGComplete:(BOOL)a3
{
  BOOL v3 = a3;
  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (!peopleDiscoveryEvent)
  {
    v6 = objc_alloc_init(MOEventPeopleDiscovery);
    v7 = self->_peopleDiscoveryEvent;
    self->_peopleDiscoveryEvent = v6;

    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  }
  [(MOEventPeopleDiscovery *)peopleDiscoveryEvent setIsGComplete:v3];
}

- (void)setGaPR:(int64_t)a3
{
  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (!peopleDiscoveryEvent)
  {
    v6 = objc_alloc_init(MOEventPeopleDiscovery);
    v7 = self->_peopleDiscoveryEvent;
    self->_peopleDiscoveryEvent = v6;

    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  }
  [(MOEventPeopleDiscovery *)peopleDiscoveryEvent setGaPR:a3];
}

- (void)setPCount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    id v8 = v4;
    if (!peopleDiscoveryEvent)
    {
      v6 = objc_alloc_init(MOEventPeopleDiscovery);
      v7 = self->_peopleDiscoveryEvent;
      self->_peopleDiscoveryEvent = v6;

      peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    }
    [(MOEventPeopleDiscovery *)peopleDiscoveryEvent setPCount:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setDensityScore:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    id v8 = v4;
    if (!peopleDiscoveryEvent)
    {
      v6 = objc_alloc_init(MOEventPeopleDiscovery);
      v7 = self->_peopleDiscoveryEvent;
      self->_peopleDiscoveryEvent = v6;

      peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    }
    [(MOEventPeopleDiscovery *)peopleDiscoveryEvent setDensityScore:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setDensityScanDuration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    id v8 = v4;
    if (!peopleDiscoveryEvent)
    {
      v6 = objc_alloc_init(MOEventPeopleDiscovery);
      v7 = self->_peopleDiscoveryEvent;
      self->_peopleDiscoveryEvent = v6;

      peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    }
    [(MOEventPeopleDiscovery *)peopleDiscoveryEvent setDensityScanDuration:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setScoredTopics:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    portraitEvent = self->_portraitEvent;
    id v8 = v4;
    if (!portraitEvent)
    {
      v6 = objc_alloc_init(MOEventPortrait);
      v7 = self->_portraitEvent;
      self->_portraitEvent = v6;

      portraitEvent = self->_portraitEvent;
    }
    [(MOEventPortrait *)portraitEvent setScoredTopics:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setMotionType:(unint64_t)a3
{
  motionActivityEvent = self->_motionActivityEvent;
  if (!motionActivityEvent)
  {
    v6 = objc_alloc_init(MOEventMotionActivity);
    v7 = self->_motionActivityEvent;
    self->_motionActivityEvent = v6;

    motionActivityEvent = self->_motionActivityEvent;
  }
  [(MOEventMotionActivity *)motionActivityEvent setMotionType:a3];
}

- (void)setTrends:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    analyticsEvent = self->_analyticsEvent;
    id v8 = v4;
    if (!analyticsEvent)
    {
      v6 = objc_alloc_init(MOEventAnalytics);
      v7 = self->_analyticsEvent;
      self->_analyticsEvent = v6;

      analyticsEvent = self->_analyticsEvent;
    }
    [(MOEventAnalytics *)analyticsEvent setTrends:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setPatterns:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    analyticsEvent = self->_analyticsEvent;
    id v8 = v4;
    if (!analyticsEvent)
    {
      v6 = objc_alloc_init(MOEventAnalytics);
      v7 = self->_analyticsEvent;
      self->_analyticsEvent = v6;

      analyticsEvent = self->_analyticsEvent;
    }
    [(MOEventAnalytics *)analyticsEvent setPatterns:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setLifeEventCategory:(unint64_t)a3
{
  lifeEventsEvent = self->_lifeEventsEvent;
  if (!lifeEventsEvent)
  {
    v6 = objc_alloc_init(MOEventLifeEvents);
    v7 = self->_lifeEventsEvent;
    self->_lifeEventsEvent = v6;

    lifeEventsEvent = self->_lifeEventsEvent;
  }
  [(MOEventLifeEvents *)lifeEventsEvent setLifeEventCategory:a3];
}

- (void)setConfidenceScore:(double)a3
{
  lifeEventsEvent = self->_lifeEventsEvent;
  if (!lifeEventsEvent)
  {
    v6 = objc_alloc_init(MOEventLifeEvents);
    v7 = self->_lifeEventsEvent;
    self->_lifeEventsEvent = v6;

    lifeEventsEvent = self->_lifeEventsEvent;
  }
  [(MOEventLifeEvents *)lifeEventsEvent setConfidenceScore:a3];
}

- (id)_descriptionOf:(unint64_t)a3
{
  return +[MOEventProactiveSuggested describeCategory:a3];
}

- (id)displayNameOfScoredTopics:(id)a3
{
  return +[MOEventPortrait displayNameOfScoredTopics:a3];
}

+ (id)FormatDate:(id)a3
{
  if (a3)
  {
    BOOL v3 = (objc_class *)MEMORY[0x1E4F28C10];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    [v5 setDateStyle:4];
    [v5 setTimeStyle:3];
    v6 = [v5 stringFromDate:v4];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)descriptionOfMode:(unint64_t)a3
{
  return +[MOEventRoutine descriptionOfMode:a3];
}

- (id)descriptionOfPhotoMomentSource:(unint64_t)a3
{
  return +[MOEventPhoto descriptionOfPhotoMomentSource:a3];
}

- (id)descriptionOfMotionType:(unint64_t)a3
{
  return +[MOEventMotionActivity descriptionOfMotionType:a3];
}

- (id)descriptionOfLifeEventCategory:(unint64_t)a3
{
  return +[MOEventLifeEvents descriptionOfLifeEventCategory:a3];
}

- (id)description
{
  if ([(MOEvent *)self provider] == 5)
  {
    analyticsEvent = (__CFString *)self->_analyticsEvent;
    if (analyticsEvent)
    {
LABEL_3:
      analyticsEvent = [(__CFString *)analyticsEvent description];
    }
  }
  else
  {
    unint64_t v13 = [(MOEvent *)self category] - 1;
    analyticsEvent = 0;
    switch(v13)
    {
      case 0uLL:
        analyticsEvent = (__CFString *)self->_routineEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      case 1uLL:
        analyticsEvent = (__CFString *)self->_workoutEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      case 2uLL:
      case 3uLL:
      case 5uLL:
        analyticsEvent = (__CFString *)self->_mediaEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      case 4uLL:
      case 0x10uLL:
        analyticsEvent = (__CFString *)self->_photoEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      case 6uLL:
        analyticsEvent = (__CFString *)self->_portraitEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      case 7uLL:
        analyticsEvent = (__CFString *)self->_travelEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      case 8uLL:
        analyticsEvent = (__CFString *)self->_sharedWithYouEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      case 9uLL:
        analyticsEvent = (__CFString *)self->_significantContactEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      case 0xAuLL:
      case 0xBuLL:
        analyticsEvent = (__CFString *)self->_proactiveSuggestedEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      case 0xCuLL:
        break;
      case 0xEuLL:
      case 0x14uLL:
      case 0x16uLL:
        analyticsEvent = (__CFString *)self->_peopleDiscoveryEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      case 0xFuLL:
        analyticsEvent = (__CFString *)self->_motionActivityEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      case 0x15uLL:
        analyticsEvent = (__CFString *)self->_lifeEventsEvent;
        if (analyticsEvent) {
          goto LABEL_3;
        }
        break;
      default:
        analyticsEvent = @"no other details";
        break;
    }
  }
  uint64_t v23 = analyticsEvent;
  id v19 = [NSString alloc];
  id v18 = [(MOEvent *)self eventIdentifier];
  v14 = [(MOEvent *)self identifierFromProvider];
  v22 = [(MOEvent *)self startDate];
  v15 = +[MOEvent FormatDate:v22];
  v21 = [(MOEvent *)self endDate];
  id v4 = +[MOEvent FormatDate:v21];
  id v17 = [(MOEvent *)self creationDate];
  id v5 = +[MOEvent FormatDate:v17];
  id v16 = [(MOEvent *)self sourceCreationDate];
  v6 = +[MOEvent FormatDate:v16];
  v7 = [(MOEvent *)self expirationDate];
  id v8 = +[MOEvent FormatDate:v7];
  v9 = [(MOEvent *)self timeZone];
  v10 = [(MOEvent *)self describeProvider];
  v11 = [(MOEvent *)self describeCategory];
  v20 = (void *)[v19 initWithFormat:@"<MOEvent eventIdentifier, %@, identifierFromProvider, %@, startDate, %@, endDate, %@, creationDate, %@, sourceCreationDate, %@, expirationDate, %@, timeZone, %@, provider, %@, category, %@, rehydrationFailCount, %lu, source app, %@, %@>", v18, v14, v15, v4, v5, v6, v8, v9, v10, v11, -[MOEvent rehydrationFailCount](self, "rehydrationFailCount"), self->_appBundle, v23];

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  v9 = (void *)v8;
  if (v5) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v6 == 0 || v7 == 0)
  {
    unint64_t v13 = 0;
  }
  else
  {
    v14 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](self, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v5, v6, v7, v8, [v4 decodeIntegerForKey:@"provider"], objc_msgSend(v4, "decodeIntegerForKey:", @"category"));
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifierFromProvider"];
      identifierFromProvider = v15->_identifierFromProvider;
      v15->_identifierFromProvider = (NSString *)v16;

      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
      expirationDate = v15->_expirationDate;
      v15->_expirationDate = (NSDate *)v18;

      v15->_fromFirstParty = [v4 decodeBoolForKey:@"fromFirstParty"];
      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceCreationDate"];
      sourceCreationDate = v15->_sourceCreationDate;
      v15->_sourceCreationDate = (NSDate *)v20;

      v15->_rehydrationFailCount = [v4 decodeIntegerForKey:@"rehydrationFailCount"];
      uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundle"];
      appBundle = v15->_appBundle;
      v15->_appBundle = (NSString *)v22;

      uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoEvent"];
      photoEvent = v15->_photoEvent;
      v15->_photoEvent = (MOEventPhoto *)v24;

      uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routineEvent"];
      routineEvent = v15->_routineEvent;
      v15->_routineEvent = (MOEventRoutine *)v26;

      uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workoutEvent"];
      workoutEvent = v15->_workoutEvent;
      v15->_workoutEvent = (MOEventWorkout *)v28;

      uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proactiveSuggestedEvent"];
      proactiveSuggestedEvent = v15->_proactiveSuggestedEvent;
      v15->_proactiveSuggestedEvent = (MOEventProactiveSuggested *)v30;

      uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"travelEvent"];
      travelEvent = v15->_travelEvent;
      v15->_travelEvent = (MOEventTravel *)v32;

      uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaEvent"];
      mediaEvent = v15->_mediaEvent;
      v15->_mediaEvent = (MOEventMedia *)v34;

      uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedWithYouEvent"];
      sharedWithYouEvent = v15->_sharedWithYouEvent;
      v15->_sharedWithYouEvent = (MOEventSharedWithYou *)v36;

      uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"significantContactEvent"];
      significantContactEvent = v15->_significantContactEvent;
      v15->_significantContactEvent = (MOEventSignificantContact *)v38;

      uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peopleDiscoveryEvent"];
      peopleDiscoveryEvent = v15->_peopleDiscoveryEvent;
      v15->_peopleDiscoveryEvent = (MOEventPeopleDiscovery *)v40;

      uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"portraitEvent"];
      portraitEvent = v15->_portraitEvent;
      v15->_portraitEvent = (MOEventPortrait *)v42;

      uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"motionActivityEvent"];
      motionActivityEvent = v15->_motionActivityEvent;
      v15->_motionActivityEvent = (MOEventMotionActivity *)v44;

      uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"analyticsEvent"];
      analyticsEvent = v15->_analyticsEvent;
      v15->_analyticsEvent = (MOEventAnalytics *)v46;

      uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lifeEventsEvent"];
      lifeEventsEvent = v15->_lifeEventsEvent;
      v15->_lifeEventsEvent = (MOEventLifeEvents *)v48;

      uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stateOfMindEvent"];
      stateOfMindEvent = v15->_stateOfMindEvent;
      v15->_stateOfMindEvent = (MOEventStateOfMind *)v50;
    }
    self = v15;
    unint64_t v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  eventIdentifier = self->_eventIdentifier;
  id v5 = a3;
  [v5 encodeObject:eventIdentifier forKey:@"eventIdentifier"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeInteger:self->_provider forKey:@"provider"];
  [v5 encodeInteger:self->_category forKey:@"category"];
  [v5 encodeObject:self->_identifierFromProvider forKey:@"identifierFromProvider"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeBool:self->_fromFirstParty forKey:@"fromFirstParty"];
  [v5 encodeObject:self->_sourceCreationDate forKey:@"sourceCreationDate"];
  [v5 encodeInteger:self->_rehydrationFailCount forKey:@"rehydrationFailCount"];
  [v5 encodeObject:self->_appBundle forKey:@"appBundle"];
  [v5 encodeObject:self->_photoEvent forKey:@"photoEvent"];
  [v5 encodeObject:self->_routineEvent forKey:@"routineEvent"];
  [v5 encodeObject:self->_workoutEvent forKey:@"workoutEvent"];
  [v5 encodeObject:self->_proactiveSuggestedEvent forKey:@"proactiveSuggestedEvent"];
  [v5 encodeObject:self->_travelEvent forKey:@"travelEvent"];
  [v5 encodeObject:self->_mediaEvent forKey:@"mediaEvent"];
  [v5 encodeObject:self->_sharedWithYouEvent forKey:@"sharedWithYouEvent"];
  [v5 encodeObject:self->_significantContactEvent forKey:@"significantContactEvent"];
  [v5 encodeObject:self->_peopleDiscoveryEvent forKey:@"peopleDiscoveryEvent"];
  [v5 encodeObject:self->_portraitEvent forKey:@"portraitEvent"];
  [v5 encodeObject:self->_motionActivityEvent forKey:@"motionActivityEvent"];
  [v5 encodeObject:self->_analyticsEvent forKey:@"analyticsEvent"];
  [v5 encodeObject:self->_lifeEventsEvent forKey:@"lifeEventsEvent"];
  [v5 encodeObject:self->_stateOfMindEvent forKey:@"stateOfMindEvent"];
}

- (unint64_t)hash
{
  unint64_t v2 = [(MOEvent *)self eventIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copy
{
  unint64_t v3 = [MOEvent alloc];
  id v4 = [(MOEvent *)self eventIdentifier];
  id v5 = [(MOEvent *)self startDate];
  v6 = [(MOEvent *)self endDate];
  v7 = [(MOEvent *)self creationDate];
  uint64_t v8 = [(MOEvent *)v3 initWithEventIdentifier:v4 startDate:v5 endDate:v6 creationDate:v7 provider:[(MOEvent *)self provider] category:[(MOEvent *)self category]];

  objc_storeStrong((id *)(v8 + 64), self->_expirationDate);
  objc_storeStrong((id *)(v8 + 56), self->_sourceCreationDate);
  objc_storeStrong((id *)(v8 + 88), self->_identifierFromProvider);
  *(void *)(v8 + 96) = self->_rehydrationFailCount;
  objc_storeStrong((id *)(v8 + 104), self->_appBundle);
  uint64_t v9 = [(MOEventPhoto *)self->_photoEvent copy];
  BOOL v10 = *(void **)(v8 + 112);
  *(void *)(v8 + 112) = v9;

  uint64_t v11 = [(MOEventRoutine *)self->_routineEvent copy];
  v12 = *(void **)(v8 + 120);
  *(void *)(v8 + 120) = v11;

  uint64_t v13 = [(MOEventWorkout *)self->_workoutEvent copy];
  v14 = *(void **)(v8 + 128);
  *(void *)(v8 + 128) = v13;

  uint64_t v15 = [(MOEventProactiveSuggested *)self->_proactiveSuggestedEvent copy];
  uint64_t v16 = *(void **)(v8 + 136);
  *(void *)(v8 + 136) = v15;

  uint64_t v17 = [(MOEventTravel *)self->_travelEvent copy];
  uint64_t v18 = *(void **)(v8 + 144);
  *(void *)(v8 + 144) = v17;

  uint64_t v19 = [(MOEventMedia *)self->_mediaEvent copy];
  uint64_t v20 = *(void **)(v8 + 152);
  *(void *)(v8 + 152) = v19;

  uint64_t v21 = [(MOEventSharedWithYou *)self->_sharedWithYouEvent copy];
  uint64_t v22 = *(void **)(v8 + 160);
  *(void *)(v8 + 160) = v21;

  uint64_t v23 = [(MOEventSignificantContact *)self->_significantContactEvent copy];
  uint64_t v24 = *(void **)(v8 + 168);
  *(void *)(v8 + 168) = v23;

  uint64_t v25 = [(MOEventPeopleDiscovery *)self->_peopleDiscoveryEvent copy];
  uint64_t v26 = *(void **)(v8 + 176);
  *(void *)(v8 + 176) = v25;

  uint64_t v27 = [(MOEventPortrait *)self->_portraitEvent copy];
  uint64_t v28 = *(void **)(v8 + 184);
  *(void *)(v8 + 184) = v27;

  uint64_t v29 = [(MOEventMotionActivity *)self->_motionActivityEvent copy];
  uint64_t v30 = *(void **)(v8 + 192);
  *(void *)(v8 + 192) = v29;

  uint64_t v31 = [(MOEventAnalytics *)self->_analyticsEvent copy];
  uint64_t v32 = *(void **)(v8 + 200);
  *(void *)(v8 + 200) = v31;

  uint64_t v33 = [(MOEventLifeEvents *)self->_lifeEventsEvent copy];
  uint64_t v34 = *(void **)(v8 + 208);
  *(void *)(v8 + 208) = v33;

  uint64_t v35 = [(MOEventStateOfMind *)self->_stateOfMindEvent copy];
  uint64_t v36 = *(void **)(v8 + 216);
  *(void *)(v8 + 216) = v35;

  return (id)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOEvent *)a3;
  v6 = v5;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = v6;
        uint64_t v8 = [(MOEvent *)self eventIdentifier];
        if (v8
          || ([(MOEvent *)v7 eventIdentifier],
              (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v9 = [(MOEvent *)self eventIdentifier];
          BOOL v10 = [(MOEvent *)v7 eventIdentifier];
          char v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          char v11 = 1;
        }

        goto LABEL_12;
      }
    }
    char v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSDate)sourceCreationDate
{
  sourceCreationDate = self->_sourceCreationDate;
  if (!sourceCreationDate) {
    sourceCreationDate = self->_endDate;
  }
  unint64_t v3 = sourceCreationDate;
  return v3;
}

- (BOOL)isHomeWorkVisit
{
  if (self->_category != 1) {
    goto LABEL_5;
  }
  unint64_t v3 = [(MOEvent *)self placeUserType];
  if (v3 != 1)
  {
    if ([(MOEvent *)self placeUserType] == 2)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (double)duration
{
  unint64_t v3 = [(MOEvent *)self endDate];
  id v4 = [(MOEvent *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (id)formatAddressWithFormatOption:(id)a3
{
  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    double v5 = [(MOEventRoutine *)routineEvent formatAddressWithFormatOption:a3];
  }
  else
  {
    v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MOEvent formatAddressWithFormatOption:]();
    }

    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOEvent.m", 1736, @"request formatAddressWithFormatOption on non routine event instance (in %s:%d)", "-[MOEvent formatAddressWithFormatOption:]", 1736);

    double v5 = 0;
  }
  return v5;
}

- (id)formatLocalityWithFormatOption:(id)a3
{
  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    double v5 = [(MOEventRoutine *)routineEvent formatLocalityWithFormatOption:a3];
  }
  else
  {
    v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MOEvent formatLocalityWithFormatOption:]();
    }

    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOEvent.m", 1745, @"request formatLocalityWithFormatOption on non routine event instance (in %s:%d)", "-[MOEvent formatLocalityWithFormatOption:]", 1745);

    double v5 = 0;
  }
  return v5;
}

- (id)formatAdministrativeAreaWithFormatOption:(id)a3
{
  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    double v5 = [(MOEventRoutine *)routineEvent formatAdministrativeAreaWithFormatOption:a3];
  }
  else
  {
    v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MOEvent formatAdministrativeAreaWithFormatOption:]();
    }

    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOEvent.m", 1754, @"request formatLocalityWithFormatOption on non routine event instance (in %s:%d)", "-[MOEvent formatAdministrativeAreaWithFormatOption:]", 1754);

    double v5 = 0;
  }
  return v5;
}

- (id)formatCountryWithFormatOption:(id)a3
{
  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    double v5 = [(MOEventRoutine *)routineEvent formatCountryWithFormatOption:a3];
  }
  else
  {
    v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MOEvent formatCountryWithFormatOption:]();
    }

    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOEvent.m", 1763, @"request formatCountryWithFormatOption on non routine event instance (in %s:%d)", "-[MOEvent formatCountryWithFormatOption:]", 1763);

    double v5 = 0;
  }
  return v5;
}

- (NSUUID)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setSourceCreationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (unint64_t)provider
{
  return self->_provider;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)identifierFromProvider
{
  return self->_identifierFromProvider;
}

- (void)setIdentifierFromProvider:(id)a3
{
}

- (BOOL)fromFirstParty
{
  return self->_fromFirstParty;
}

- (void)setFromFirstParty:(BOOL)a3
{
  self->_fromFirstParty = a3;
}

- (unint64_t)rehydrationFailCount
{
  return self->_rehydrationFailCount;
}

- (void)setRehydrationFailCount:(unint64_t)a3
{
  self->_rehydrationFailCount = a3;
}

- (NSString)appBundle
{
  return self->_appBundle;
}

- (void)setAppBundle:(id)a3
{
}

- (MOEventPhoto)photoEvent
{
  return self->_photoEvent;
}

- (void)setPhotoEvent:(id)a3
{
}

- (MOEventRoutine)routineEvent
{
  return self->_routineEvent;
}

- (void)setRoutineEvent:(id)a3
{
}

- (MOEventWorkout)workoutEvent
{
  return self->_workoutEvent;
}

- (void)setWorkoutEvent:(id)a3
{
}

- (MOEventProactiveSuggested)proactiveSuggestedEvent
{
  return self->_proactiveSuggestedEvent;
}

- (void)setProactiveSuggestedEvent:(id)a3
{
}

- (MOEventTravel)travelEvent
{
  return self->_travelEvent;
}

- (void)setTravelEvent:(id)a3
{
}

- (MOEventMedia)mediaEvent
{
  return self->_mediaEvent;
}

- (void)setMediaEvent:(id)a3
{
}

- (MOEventSharedWithYou)sharedWithYouEvent
{
  return self->_sharedWithYouEvent;
}

- (void)setSharedWithYouEvent:(id)a3
{
}

- (MOEventSignificantContact)significantContactEvent
{
  return self->_significantContactEvent;
}

- (void)setSignificantContactEvent:(id)a3
{
}

- (MOEventPeopleDiscovery)peopleDiscoveryEvent
{
  return self->_peopleDiscoveryEvent;
}

- (void)setPeopleDiscoveryEvent:(id)a3
{
}

- (MOEventPortrait)portraitEvent
{
  return self->_portraitEvent;
}

- (void)setPortraitEvent:(id)a3
{
}

- (MOEventMotionActivity)motionActivityEvent
{
  return self->_motionActivityEvent;
}

- (void)setMotionActivityEvent:(id)a3
{
}

- (MOEventAnalytics)analyticsEvent
{
  return self->_analyticsEvent;
}

- (void)setAnalyticsEvent:(id)a3
{
}

- (MOEventLifeEvents)lifeEventsEvent
{
  return self->_lifeEventsEvent;
}

- (void)setLifeEventsEvent:(id)a3
{
}

- (MOEventStateOfMind)stateOfMindEvent
{
  return self->_stateOfMindEvent;
}

- (void)setStateOfMindEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateOfMindEvent, 0);
  objc_storeStrong((id *)&self->_lifeEventsEvent, 0);
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_motionActivityEvent, 0);
  objc_storeStrong((id *)&self->_portraitEvent, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryEvent, 0);
  objc_storeStrong((id *)&self->_significantContactEvent, 0);
  objc_storeStrong((id *)&self->_sharedWithYouEvent, 0);
  objc_storeStrong((id *)&self->_mediaEvent, 0);
  objc_storeStrong((id *)&self->_travelEvent, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestedEvent, 0);
  objc_storeStrong((id *)&self->_workoutEvent, 0);
  objc_storeStrong((id *)&self->_routineEvent, 0);
  objc_storeStrong((id *)&self->_photoEvent, 0);
  objc_storeStrong((id *)&self->_appBundle, 0);
  objc_storeStrong((id *)&self->_identifierFromProvider, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_sourceCreationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "Invalid parameter not satisfying: eventIdentifier", v2, v3, v4, v5, v6);
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "Invalid parameter not satisfying: startDate", v2, v3, v4, v5, v6);
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "Invalid parameter not satisfying: endDate", v2, v3, v4, v5, v6);
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "Invalid parameter not satisfying: creationDate", v2, v3, v4, v5, v6);
}

- (void)formatAddressWithFormatOption:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D24AE000, v0, v1, "request formatAddressWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)formatLocalityWithFormatOption:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D24AE000, v0, v1, "request formatLocalityWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)formatAdministrativeAreaWithFormatOption:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D24AE000, v0, v1, "request formatLocalityWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)formatCountryWithFormatOption:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D24AE000, v0, v1, "request formatCountryWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
}

@end
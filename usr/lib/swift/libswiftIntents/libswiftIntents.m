INPlayMediaIntent __swiftcall INPlayMediaIntent.init(mediaItems:mediaContainer:playShuffled:playbackRepeatMode:resumePlayback:playbackQueueLocation:playbackSpeed:mediaSearch:)(Swift::OpaquePointer_optional mediaItems, INMediaItem_optional mediaContainer, Swift::Bool_optional playShuffled, INPlaybackRepeatMode playbackRepeatMode, Swift::Bool_optional resumePlayback, INPlaybackQueueLocation playbackQueueLocation, Swift::Double_optional playbackSpeed, INMediaSearch_optional mediaSearch)
{
  char v8;
  uint64_t v11;
  void *v12;
  int isa_low;
  NSArray v14;
  int value;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  double v22;

  v22 = *(double *)&resumePlayback.value;
  v8 = playbackQueueLocation;
  v11 = *(void *)&mediaContainer.is_nil;
  v12 = *(void **)&mediaItems.is_nil;
  isa_low = LOBYTE(mediaContainer.value.super.isa);
  if (mediaItems.value._rawValue)
  {
    type metadata accessor for INMediaItem();
    v14.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v14.super.isa = 0;
  }
  value = playShuffled.value;
  if (isa_low == 2)
  {
    v16 = 0;
    if (value != 2) {
      goto LABEL_6;
    }
LABEL_9:
    v17 = 0;
    v18 = *(void **)&playbackSpeed.is_nil;
    if (v8) {
      goto LABEL_7;
    }
LABEL_10:
    v19 = [objc_allocWithZone(NSNumber) initWithDouble:v22];
    goto LABEL_11;
  }
  v16 = [objc_allocWithZone(NSNumber) initWithBool:isa_low & 1];
  if (value == 2) {
    goto LABEL_9;
  }
LABEL_6:
  v17 = [objc_allocWithZone(NSNumber) initWithBool:value & 1];
  v18 = *(void **)&playbackSpeed.is_nil;
  if ((v8 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  v19 = 0;
LABEL_11:
  v20 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithMediaItems:v14.super.isa mediaContainer:v12 mediaShuffled:v16 mediaPlaybackRepeatMode:v11 mediaResumePlayback:v17 mediaPlaybackQueueLocation:v19 mediaPlaybackSpeed:v18];

  return (INPlayMediaIntent)v20;
}

unint64_t type metadata accessor for INMediaItem()
{
  unint64_t result = lazy cache variable for type metadata for INMediaItem;
  if (!lazy cache variable for type metadata for INMediaItem)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for INMediaItem);
  }
  return result;
}

INMediaSearch __swiftcall INMediaSearch.init(mediaType:sortOrder:mediaName:artistName:albumName:genreNames:moodNames:releaseDate:reference:mediaIdentifier:)(INMediaItemType mediaType, INMediaSortOrder sortOrder, Swift::String_optional mediaName, Swift::String_optional artistName, Swift::String_optional albumName, Swift::OpaquePointer_optional genreNames, Swift::OpaquePointer_optional moodNames, INDateComponentsRange_optional releaseDate, INMediaReference reference, Swift::String_optional mediaIdentifier)
{
  object = albumName.value._object;
  uint64_t countAndFlagsBits = albumName.value._countAndFlagsBits;
  v12 = artistName.value._object;
  uint64_t v13 = artistName.value._countAndFlagsBits;
  if (mediaName.value._object)
  {
    v14 = (void *)MEMORY[0x216690CF0](mediaName.value._countAndFlagsBits, mediaName.value._object);
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = 0;
    if (artistName.value._object)
    {
LABEL_3:
      v15 = (void *)MEMORY[0x216690CF0](v13, v12);
      swift_bridgeObjectRelease();
      rawValue = genreNames.value._rawValue;
      if (object) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  v15 = 0;
  rawValue = genreNames.value._rawValue;
  if (object)
  {
LABEL_4:
    v17 = (void *)MEMORY[0x216690CF0](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void *)&genreNames.is_nil;
    if (rawValue) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  v17 = 0;
  uint64_t v18 = *(void *)&genreNames.is_nil;
  if (rawValue)
  {
LABEL_5:
    v19.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void *)&releaseDate.is_nil;
    if (v18) {
      goto LABEL_6;
    }
LABEL_12:
    v21.super.isa = 0;
    v23 = moodNames.value._rawValue;
    uint64_t v22 = *(void *)&moodNames.is_nil;
    if (v20) {
      goto LABEL_7;
    }
LABEL_13:
    v24 = 0;
    goto LABEL_14;
  }
LABEL_11:
  v19.super.isa = 0;
  uint64_t v20 = *(void *)&releaseDate.is_nil;
  if (!v18) {
    goto LABEL_12;
  }
LABEL_6:
  v21.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v23 = moodNames.value._rawValue;
  uint64_t v22 = *(void *)&moodNames.is_nil;
  if (!v20) {
    goto LABEL_13;
  }
LABEL_7:
  v24 = (void *)MEMORY[0x216690CF0](releaseDate.value.super.isa, v20);
  swift_bridgeObjectRelease();
LABEL_14:
  id v25 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithMediaType:mediaType sortOrder:sortOrder mediaName:v14 artistName:v15 albumName:v17 genreNames:v19.super.isa albumName:v21.super.isa moodNames:v23 releaseDate:v22 mediaIdentifier:v24];

  return (INMediaSearch)v25;
}

id INParameter.init<A, B>(keyPath:)(void *a1)
{
  uint64_t v1 = *(void *)(*a1 + *MEMORY[0x263F8EA20]);
  if (swift_isClassType()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  if (v2 && (uint64_t v3 = dispatch thunk of AnyKeyPath._kvcKeyPathString.getter(), v4))
  {
    uint64_t v5 = v3;
    uint64_t v6 = v4;
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    uint64_t v8 = swift_getObjCClassFromMetadata();
    v9 = (void *)MEMORY[0x216690CF0](v5, v6);
    swift_bridgeObjectRelease();
    id v10 = [ObjCClassFromMetadata parameterForClass:v8 keyPath:v9];

    swift_release();
  }
  else
  {
    swift_release();
    return 0;
  }
  return v10;
}

INSetCarLockStatusIntent __swiftcall INSetCarLockStatusIntent.init(locked:carName:)(Swift::Bool_optional locked, INSpeakableString_optional carName)
{
  Class isa = carName.value.super.isa;
  if (locked.value == 2) {
    Class v3 = 0;
  }
  else {
    Class v3 = Bool._bridgeToObjectiveC()().super.super.isa;
  }
  id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithLocked_carName:v3 isa:isa];

  return (INSetCarLockStatusIntent)v4;
}

uint64_t INSetCarLockStatusIntent.locked.getter()
{
  id v1 = [v0 sel_locked];
  if (!v1) {
    return 2;
  }
  uint64_t v2 = v1;
  id v3 = [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

INRequestRideIntent __swiftcall INRequestRideIntent.init(pickupLocation:dropOffLocation:rideOptionName:partySize:paymentMethod:scheduledPickupTime:)(CLPlacemark_optional pickupLocation, CLPlacemark_optional dropOffLocation, INSpeakableString_optional rideOptionName, Swift::Int_optional partySize, INPaymentMethod_optional paymentMethod, INDateComponentsRange_optional scheduledPickupTime)
{
  Class isa = rideOptionName.value.super.isa;
  v7 = *(void **)&dropOffLocation.is_nil;
  uint64_t v8 = *(void **)&pickupLocation.is_nil;
  internal = pickupLocation.value._internal;
  Class v10 = pickupLocation.value.super.isa;
  if ((uint64_t)dropOffLocation.value._internal) {
    id v11 = 0;
  }
  else {
    id v11 = [objc_allocWithZone(NSNumber) initWithInteger:dropOffLocation.value.super.isa];
  }
  id v12 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithPickupLocation:v10 dropOffLocation:internal rideOptionName:v8 partySize:v11 paymentMethod:v7 scheduledPickupTime:isa];

  return (INRequestRideIntent)v12;
}

id INRequestRideIntent.partySize.getter()
{
  id v1 = [v0 partySize];
  uint64_t v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 sel_integerValue];

  return v3;
}

id static INNotebookItemTypeResolutionResult.disambiguation(with:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    id v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v4 = *v3++;
      [objc_allocWithZone(NSNumber) initWithInteger:v4];
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      --v1;
    }
    while (v1);
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [ObjCClassFromMetadata sel_disambiguationWithNotebookItemTypesToDisambiguate_:isa];

  return v7;
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

id INRideOption.usesMeteredFare.getter()
{
  id v1 = [v0 sel_usesMeteredFare];

  return v1;
}

void INRideOption.usesMeteredFare.setter(void *a1)
{
  [v1 setUsesMeteredFare:a1];
}

void (*INRideOption.usesMeteredFare.modify(void *a1))(id *a1)
{
  a1[1] = v1;
  *a1 = [v1 sel_usesMeteredFare];
  return INRideOption.usesMeteredFare.modify;
}

void INRideOption.usesMeteredFare.modify(id *a1)
{
  id v1 = *a1;
  [a1[1] setUsesMeteredFare:];
}

uint64_t INRideOption.usesMeteredFare.getter()
{
  id v1 = [v0 sel_usesMeteredFare];
  if (!v1) {
    return 2;
  }
  uint64_t v2 = v1;
  [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

void key path getter for INRideOption.usesMeteredFare : INRideOption(id *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  id v3 = [*a1 sel_usesMeteredFare];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned __int8 v5 = [v3 sel_BOOLValue];
  }
  else
  {
    unsigned __int8 v5 = 2;
  }
  *a2 = v5;
}

void key path setter for INRideOption.usesMeteredFare : INRideOption(unsigned __int8 *a1, void **a2)
{
  int v2 = *a1;
  id v3 = *a2;
  if (v2 == 2) {
    id v4 = 0;
  }
  else {
    id v4 = [objc_allocWithZone(NSNumber) initWithBool:(v2 & 1)];
  }
  id v5 = v4;
  [v3 setUsesMeteredFare:];
}

void INRideOption.usesMeteredFare.setter(char a1)
{
  if (a1 == 2) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_allocWithZone(NSNumber) initWithBool:a1 & 1];
  }
  id v4 = v3;
  [v1 setUsesMeteredFare_];
}

void (*INRideOption.usesMeteredFare.modify(uint64_t a1))(uint64_t a1)
{
  int v2 = v1;
  *(void *)a1 = v2;
  id v4 = [v2 sel_usesMeteredFare];
  if (v4)
  {
    id v5 = v4;
    unsigned __int8 v6 = [v4 sel_BOOLValue];
  }
  else
  {
    unsigned __int8 v6 = 2;
  }
  *(unsigned char *)(a1 + 8) = v6;
  return INRideOption.usesMeteredFare.modify;
}

void INRideOption.usesMeteredFare.modify(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  if (v2 == 2) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_allocWithZone(NSNumber) initWithBool:(v2 & 1)];
  }
  id v4 = v3;
  [*(id *)a1 sel_setUsesMeteredFare_];
}

id sub_213B332D0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 sel_usesMeteredFare];
  *a2 = result;
  return result;
}

id sub_213B3330C(void *a1, id *a2)
{
  return [*a2 setUsesMeteredFare:*a1];
}

id static INIntegerResolutionResult.confirmationRequired(with:)(uint64_t a1, char a2)
{
  if (a2) {
    id v2 = 0;
  }
  else {
    id v2 = [objc_allocWithZone(NSNumber) initWithInteger:a1];
  }
  id v3 = [swift_getObjCClassFromMetadata() confirmationRequiredWithValueToConfirm:v2];

  return v3;
}

INPlayMediaIntent __swiftcall INPlayMediaIntent.init(mediaItems:mediaContainer:playShuffled:playbackRepeatMode:resumePlayback:)(Swift::OpaquePointer_optional mediaItems, INMediaItem_optional mediaContainer, Swift::Bool_optional playShuffled, INPlaybackRepeatMode playbackRepeatMode, Swift::Bool_optional resumePlayback)
{
  uint64_t v6 = *(void *)&mediaContainer.is_nil;
  id v7 = *(void **)&mediaItems.is_nil;
  int isa_low = LOBYTE(mediaContainer.value.super.isa);
  if (mediaItems.value._rawValue)
  {
    type metadata accessor for INMediaItem();
    v9.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  int value = playShuffled.value;
  if (isa_low != 2)
  {
    id v11 = [objc_allocWithZone(NSNumber) initWithBool:isa_low & 1];
    if (value != 2) {
      goto LABEL_6;
    }
LABEL_8:
    id v12 = 0;
    goto LABEL_9;
  }
  id v11 = 0;
  if (value == 2) {
    goto LABEL_8;
  }
LABEL_6:
  id v12 = [objc_allocWithZone(NSNumber) initWithBool:value & 1];
LABEL_9:
  id v13 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithMediaItems:v9.super.isa mediaContainer:v7 playShuffled:v11 playbackRepeatMode:v6 resumePlayback:v12];

  return (INPlayMediaIntent)v13;
}

uint64_t INPlayMediaIntent.playShuffled.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_playShuffled);
}

uint64_t INPlayMediaIntent.resumePlayback.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_resumePlayback);
}

uint64_t INPlayMediaIntent.playShuffled.getter(SEL *a1)
{
  id v2 = [v1 *a1];
  if (!v2) {
    return 2;
  }
  id v3 = v2;
  [v2 sel_BOOLValue];

  return (uint64_t)v4;
}

id INPlayMediaIntent.playbackSpeed.getter()
{
  id result = [v0 sel_playbackSpeed];
  id v2 = result;
  if (result)
  {
    [result doubleValue];
    uint64_t v4 = v3;

    return (id)v4;
  }
  return result;
}

INSearchCallHistoryIntent __swiftcall INSearchCallHistoryIntent.init(dateCreated:recipient:callCapabilities:callTypes:unseen:)(INDateComponentsRange_optional dateCreated, INPerson_optional recipient, INCallCapabilityOptions callCapabilities, INCallRecordTypeOptions callTypes, Swift::Bool_optional unseen)
{
  uint64_t v5 = *(void *)&recipient.is_nil;
  Class isa = recipient.value.super.isa;
  id v7 = *(void **)&dateCreated.is_nil;
  Class v8 = dateCreated.value.super.isa;
  char v9 = callCapabilities;
  if (callCapabilities == 2) {
    id v10 = 0;
  }
  else {
    id v10 = [objc_allocWithZone(NSNumber) initWithBool:(v9 & 1)];
  }
  id v11 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithDateCreated:v8 recipient:v7 callCapabilities:isa callTypes:v5 unseen:v10];

  return (INSearchCallHistoryIntent)v11;
}

uint64_t INSearchCallHistoryIntent.unseen.getter()
{
  id v1 = [v0 sel_unseen];
  if (!v1) {
    return 2;
  }
  id v2 = v1;
  id v3 = [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

INSetDefrosterSettingsInCarIntent __swiftcall INSetDefrosterSettingsInCarIntent.init(enable:defroster:carName:)(Swift::Bool_optional enable, INCarDefroster defroster, INSpeakableString_optional carName)
{
  Class isa = carName.value.super.isa;
  if (enable.value == 2) {
    id v6 = 0;
  }
  else {
    id v6 = [objc_allocWithZone(NSNumber) initWithBool:enable.value];
  }
  id v7 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithEnable_defroster_carName_:v6 defroster:defroster isa:isa];

  return (INSetDefrosterSettingsInCarIntent)v7;
}

INSetDefrosterSettingsInCarIntent __swiftcall INSetDefrosterSettingsInCarIntent.init(enable:defroster:)(Swift::Bool_optional enable, INCarDefroster defroster)
{
  if (enable.value == 2) {
    id v4 = 0;
  }
  else {
    id v4 = [objc_allocWithZone(NSNumber) initWithBool:enable.value];
  }
  id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithEnable_defroster:v4 defroster:defroster];

  return (INSetDefrosterSettingsInCarIntent)v5;
}

uint64_t INSetDefrosterSettingsInCarIntent.enable.getter()
{
  id v1 = [v0 sel_enable];
  if (!v1) {
    return 2;
  }
  id v2 = v1;
  [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

id INSetClimateSettingsInCarIntent.init(enableFan:enableAirConditioner:enableClimateControl:enableAutoMode:airCirculationMode:fanSpeedIndex:fanSpeedPercentage:relativeFanSpeedSetting:temperature:relativeTemperatureSetting:climateZone:carName:)(unsigned __int8 a1, unsigned __int8 a2, char a3, char a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  uint64_t v40 = a5;
  uint64_t v36 = a8;
  int v18 = a2;
  int v19 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>?);
  MEMORY[0x270FA5388]();
  NSArray v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v19 == 2) {
    id v39 = 0;
  }
  else {
    id v39 = [objc_allocWithZone(NSNumber) initWithBool:v19 & 1];
  }
  if (v18 == 2) {
    id v38 = 0;
  }
  else {
    id v38 = [objc_allocWithZone(NSNumber) initWithBool:v18 & 1];
  }
  if (a3 == 2)
  {
    id v37 = 0;
    if (a4 != 2)
    {
LABEL_9:
      id v35 = [objc_allocWithZone(NSNumber) initWithBool:a4 & 1];
      goto LABEL_12;
    }
  }
  else
  {
    id v37 = [objc_allocWithZone(NSNumber) initWithBool:a3 & 1];
    if (a4 != 2) {
      goto LABEL_9;
    }
  }
  id v35 = 0;
LABEL_12:
  if (a7)
  {
    id v22 = 0;
    if (a9) {
      goto LABEL_14;
    }
  }
  else
  {
    id v22 = [objc_allocWithZone(NSNumber) initWithInteger:a6];
    if (a9)
    {
LABEL_14:
      id v23 = 0;
      goto LABEL_17;
    }
  }
  id v23 = [objc_allocWithZone(NSNumber) initWithDouble:v36];
LABEL_17:
  uint64_t v36 = a11;
  outlined init with copy of Measurement<NSUnitTemperature>?(a11, (uint64_t)v21);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v21, 1, v24) == 1)
  {
    Class isa = 0;
  }
  else
  {
    NSMeasurement v41 = Measurement._bridgeToObjectiveC()();
    Class isa = v41.super.isa;
    (*(void (**)(char *, uint64_t, __n128))(v25 + 8))(v21, v24, *(__n128 *)&v41._doubleValue);
  }
  id v27 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v29 = v38;
  v28 = v39;
  v30 = v37;
  v31 = v35;
  id v32 = [v27 initWithEnableFan:v39 enableAirConditioner:v38 enableClimateControl:v37 enableAutoMode:v35 airCirculationMode:v40 fanSpeedIndex:v22 fanSpeedPercentage:v23 relativeFanSpeedSetting:a10 isa:isa climateZone:a12 carName:a13];

  outlined destroy of Measurement<NSUnitTemperature>?(v36);
  return v32;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t outlined init with copy of Measurement<NSUnitTemperature>?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Measurement<NSUnitTemperature>?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id INSetClimateSettingsInCarIntent.init(enableFan:enableAirConditioner:enableClimateControl:enableAutoMode:airCirculationMode:fanSpeedIndex:fanSpeedPercentage:relativeFanSpeedSetting:temperature:relativeTemperatureSetting:climateZone:)(unsigned __int8 a1, unsigned __int8 a2, char a3, char a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v37 = a5;
  uint64_t v33 = a8;
  int v17 = a2;
  int v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>?);
  MEMORY[0x270FA5388]();
  uint64_t v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v18 == 2) {
    id v36 = 0;
  }
  else {
    id v36 = [objc_allocWithZone(NSNumber) initWithBool:v18 & 1];
  }
  if (v17 == 2) {
    id v35 = 0;
  }
  else {
    id v35 = [objc_allocWithZone(NSNumber) initWithBool:v17 & 1];
  }
  if (a3 == 2)
  {
    id v34 = 0;
    if (a4 != 2)
    {
LABEL_9:
      id v21 = [objc_allocWithZone(NSNumber) initWithBool:a4 & 1];
      goto LABEL_12;
    }
  }
  else
  {
    id v34 = [objc_allocWithZone(NSNumber) initWithBool:a3 & 1];
    if (a4 != 2) {
      goto LABEL_9;
    }
  }
  id v21 = 0;
LABEL_12:
  if (a7)
  {
    id v22 = 0;
    if (a9) {
      goto LABEL_14;
    }
  }
  else
  {
    id v22 = [objc_allocWithZone(NSNumber) initWithInteger:a6];
    if (a9)
    {
LABEL_14:
      id v23 = 0;
      goto LABEL_17;
    }
  }
  id v23 = [objc_allocWithZone(NSNumber) initWithDouble:v33];
LABEL_17:
  uint64_t v33 = a11;
  outlined init with copy of Measurement<NSUnitTemperature>?(a11, (uint64_t)v20);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v20, 1, v24) == 1)
  {
    Class isa = 0;
  }
  else
  {
    NSMeasurement v38 = Measurement._bridgeToObjectiveC()();
    Class isa = v38.super.isa;
    (*(void (**)(char *, uint64_t, __n128))(v25 + 8))(v20, v24, *(__n128 *)&v38._doubleValue);
  }
  id v27 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v29 = v35;
  v28 = v36;
  v30 = v34;
  id v31 = [v27 initWithEnableFan:v36 enableAirConditioner:v35 enableClimateControl:v34 enableAutoMode:v21 airCirculationMode:v37 fanSpeedIndex:v22 fanSpeedPercentage:v23 relativeFanSpeedSetting:a10 isa:isa relativeTemperatureSetting:a12 climateZone:a13];

  outlined destroy of Measurement<NSUnitTemperature>?(v33);
  return v31;
}

uint64_t INSetClimateSettingsInCarIntent.enableFan.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableFan);
}

uint64_t INSetClimateSettingsInCarIntent.enableAirConditioner.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableAirConditioner);
}

uint64_t INSetClimateSettingsInCarIntent.enableClimateControl.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableClimateControl);
}

uint64_t INSetClimateSettingsInCarIntent.enableAutoMode.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableAutoMode);
}

id INSetClimateSettingsInCarIntent.fanSpeedIndex.getter()
{
  id v1 = [v0 sel_fanSpeedIndex];
  uint64_t v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 sel_integerValue];

  return v3;
}

id INSetClimateSettingsInCarIntent.fanSpeedPercentage.getter()
{
  id result = [v0 sel_fanSpeedPercentage];
  uint64_t v2 = result;
  if (result)
  {
    [result doubleValue];
    uint64_t v4 = v3;

    return (id)v4;
  }
  return result;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(profileNumber:profileName:isDefaultProfile:carName:)(Swift::Int_optional profileNumber, Swift::String_optional profileName, Swift::Bool_optional isDefaultProfile, INSpeakableString_optional carName)
{
  Class isa = carName.value.super.isa;
  LOBYTE(value) = isDefaultProfile;
  object = profileName.value._object;
  uint64_t countAndFlagsBits = profileName.value._countAndFlagsBits;
  if (!profileNumber.is_nil)
  {
    id v8 = [objc_allocWithZone(NSNumber) initWithInteger:profileNumber.value];
    int value = value;
    if (object) {
      goto LABEL_3;
    }
LABEL_6:
    char v9 = 0;
    if (value == 2) {
      goto LABEL_4;
    }
LABEL_7:
    id v10 = [objc_allocWithZone(NSNumber) initWithBool:value & 1];
    goto LABEL_8;
  }
  id v8 = 0;
  int value = isDefaultProfile.value;
  if (!profileName.value._object) {
    goto LABEL_6;
  }
LABEL_3:
  char v9 = (void *)MEMORY[0x216690CF0](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
  if (value != 2) {
    goto LABEL_7;
  }
LABEL_4:
  id v10 = 0;
LABEL_8:
  id v11 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithProfileNumber:v8 profileName:v9 defaultProfile:v10 carName:isa];

  return (INSetProfileInCarIntent)v11;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(defaultProfile:)(Swift::Int_optional defaultProfile)
{
  if (defaultProfile.is_nil) {
    id v1 = 0;
  }
  else {
    id v1 = [objc_allocWithZone(NSNumber) initWithInteger:defaultProfile.value];
  }
  id v2 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithProfileNumber:0 profileName:0 defaultProfile:v1];

  return (INSetProfileInCarIntent)v2;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(profileLabel:)(Swift::String_optional profileLabel)
{
  if (profileLabel.value._object)
  {
    id v1 = (void *)MEMORY[0x216690CF0](profileLabel.value._countAndFlagsBits);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v1 = 0;
  }
  id v2 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithProfileNumber:0 profileName:v1 defaultProfile:0];

  return (INSetProfileInCarIntent)v2;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(profileLabel:isDefaultProfile:)(Swift::String_optional profileLabel, Swift::Bool_optional isDefaultProfile)
{
  int value = isDefaultProfile.value;
  if (!profileLabel.value._object)
  {
    uint64_t v3 = 0;
    if (isDefaultProfile.value == 2) {
      goto LABEL_3;
    }
LABEL_5:
    id v4 = [objc_allocWithZone(NSNumber) initWithBool:value & 1];
    goto LABEL_6;
  }
  uint64_t v3 = (void *)MEMORY[0x216690CF0](profileLabel.value._countAndFlagsBits);
  swift_bridgeObjectRelease();
  if (value != 2) {
    goto LABEL_5;
  }
LABEL_3:
  id v4 = 0;
LABEL_6:
  id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithProfileNumber:0 profileName:v3 defaultProfile:v4];

  return (INSetProfileInCarIntent)v5;
}

id INSetProfileInCarIntent.init(profileLabel:defaultProfile:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (!a2)
  {
    id v6 = 0;
    if ((a4 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_5:
    id v7 = 0;
    goto LABEL_6;
  }
  id v6 = (void *)MEMORY[0x216690CF0]();
  swift_bridgeObjectRelease();
  if (a4) {
    goto LABEL_5;
  }
LABEL_3:
  id v7 = [objc_allocWithZone(NSNumber) initWithInteger:a3];
LABEL_6:
  id v8 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithProfileNumber:0 profileName:v6 defaultProfile:v7];

  return v8;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(profileNumber:defaultProfile:)(Swift::Int_optional profileNumber, Swift::Int_optional defaultProfile)
{
  Swift::Bool is_nil = defaultProfile.is_nil;
  Swift::Int value = defaultProfile.value;
  if (profileNumber.is_nil)
  {
    id v4 = 0;
    if (defaultProfile.is_nil) {
      goto LABEL_3;
    }
LABEL_5:
    id v5 = [objc_allocWithZone(NSNumber) initWithInteger:value];
    goto LABEL_6;
  }
  id v4 = [objc_allocWithZone(NSNumber) initWithInteger:profileNumber.value];
  if (!is_nil) {
    goto LABEL_5;
  }
LABEL_3:
  id v5 = 0;
LABEL_6:
  id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithProfileNumber:v4 profileName:v5 defaultProfile:0];

  return (INSetProfileInCarIntent)v6;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(profileNumber:profileLabel:)(Swift::Int_optional profileNumber, Swift::String_optional profileLabel)
{
  object = profileLabel.value._object;
  uint64_t countAndFlagsBits = profileLabel.value._countAndFlagsBits;
  if (profileNumber.is_nil)
  {
    id v4 = 0;
    if (profileLabel.value._object) {
      goto LABEL_3;
    }
LABEL_5:
    id v5 = 0;
    goto LABEL_6;
  }
  id v4 = [objc_allocWithZone(NSNumber) initWithInteger:profileNumber.value];
  if (!object) {
    goto LABEL_5;
  }
LABEL_3:
  id v5 = (void *)MEMORY[0x216690CF0](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
LABEL_6:
  id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithProfileNumber:v4 profileName:v5 defaultProfile:0];

  return (INSetProfileInCarIntent)v6;
}

id INSetProfileInCarIntent.init(profileNumber:profileName:isDefaultProfile:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  LOBYTE(v5) = a5;
  if ((a2 & 1) == 0)
  {
    id v8 = [objc_allocWithZone(NSNumber) initWithInteger:a1];
    int v5 = v5;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    char v9 = 0;
    if (v5 == 2) {
      goto LABEL_4;
    }
LABEL_7:
    id v10 = [objc_allocWithZone(NSNumber) initWithBool:v5 & 1];
    goto LABEL_8;
  }
  id v8 = 0;
  int v5 = a5;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  char v9 = (void *)MEMORY[0x216690CF0](a3, a4);
  swift_bridgeObjectRelease();
  if (v5 != 2) {
    goto LABEL_7;
  }
LABEL_4:
  id v10 = 0;
LABEL_8:
  id v11 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithProfileNumber:v8 profileName:v9 defaultProfile:v10];

  return v11;
}

id INSetProfileInCarIntent.init(profileNumber:profileLabel:defaultProfile:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a2 & 1) == 0)
  {
    id v10 = [objc_allocWithZone(NSNumber) initWithInteger:a1];
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v11 = 0;
    if ((a6 & 1) == 0) {
      goto LABEL_4;
    }
LABEL_7:
    id v12 = 0;
    goto LABEL_8;
  }
  id v10 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  id v11 = (void *)MEMORY[0x216690CF0](a3, a4);
  swift_bridgeObjectRelease();
  if (a6) {
    goto LABEL_7;
  }
LABEL_4:
  id v12 = [objc_allocWithZone(NSNumber) initWithInteger:a5];
LABEL_8:
  id v13 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithProfileNumber:v10 profileName:v11 defaultProfile:v12];

  return v13;
}

uint64_t INSetProfileInCarIntent.isDefaultProfile.getter()
{
  id v1 = [v0 sel_defaultProfile];
  if (!v1) {
    return 2;
  }
  id v2 = v1;
  id v3 = [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

id INSetProfileInCarIntent.defaultProfile.getter()
{
  return INSetProfileInCarIntent.defaultProfile.getter((SEL *)&selRef_defaultProfile);
}

id INSetProfileInCarIntent.profileNumber.getter()
{
  return INSetProfileInCarIntent.defaultProfile.getter((SEL *)&selRef_profileNumber);
}

id INSetProfileInCarIntent.defaultProfile.getter(SEL *a1)
{
  id v2 = [v1 *a1];
  id v3 = v2;
  if (!v2) {
    return 0;
  }
  id v4 = [v2 integerValue];

  return v4;
}

INSetSeatSettingsInCarIntent __swiftcall INSetSeatSettingsInCarIntent.init(enableHeating:enableCooling:enableMassage:seat:level:relativeLevel:carName:)(Swift::Bool_optional enableHeating, Swift::Bool_optional enableCooling, Swift::Bool_optional enableMassage, INCarSeat seat, Swift::Int_optional level, INRelativeSetting relativeLevel, INSpeakableString_optional carName)
{
  Class isa = carName.value.super.isa;
  Swift::Int value = level.value;
  Swift::Bool is_nil = level.is_nil;
  int v11 = enableCooling.value;
  if (enableHeating.value == 2) {
    id v13 = 0;
  }
  else {
    id v13 = [objc_allocWithZone(NSNumber) initWithBool:enableHeating.value];
  }
  int v14 = enableMassage.value;
  if (v11 == 2)
  {
    id v15 = 0;
    if (v14 != 2) {
      goto LABEL_6;
    }
LABEL_9:
    id v16 = 0;
    if (is_nil) {
      goto LABEL_7;
    }
LABEL_10:
    id v17 = [objc_allocWithZone(NSNumber) initWithInteger:value];
    goto LABEL_11;
  }
  id v15 = [objc_allocWithZone(NSNumber) initWithBool:v11 & 1];
  if (v14 == 2) {
    goto LABEL_9;
  }
LABEL_6:
  id v16 = [objc_allocWithZone(NSNumber) initWithBool:v14 & 1];
  if (!is_nil) {
    goto LABEL_10;
  }
LABEL_7:
  id v17 = 0;
LABEL_11:
  id v18 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithEnableHeating:v13 enableCooling:v15 enableMassage:v16 seat:seat level:v17 relativeLevelSetting:v18 carName:isa];

  return (INSetSeatSettingsInCarIntent)v18;
}

INSetSeatSettingsInCarIntent __swiftcall INSetSeatSettingsInCarIntent.init(enableHeating:enableCooling:enableMassage:seat:level:relativeLevel:)(Swift::Bool_optional enableHeating, Swift::Bool_optional enableCooling, Swift::Bool_optional enableMassage, INCarSeat seat, Swift::Int_optional level, INRelativeSetting relativeLevel)
{
  Swift::Bool is_nil = level.is_nil;
  Swift::Int value = level.value;
  int v10 = enableCooling.value;
  if (enableHeating.value == 2) {
    id v12 = 0;
  }
  else {
    id v12 = [objc_allocWithZone(NSNumber) initWithBool:enableHeating.value];
  }
  int v13 = enableMassage.value;
  if (v10 == 2)
  {
    id v14 = 0;
    if (v13 != 2) {
      goto LABEL_6;
    }
LABEL_9:
    id v15 = 0;
    if (is_nil) {
      goto LABEL_7;
    }
LABEL_10:
    id v16 = [objc_allocWithZone(NSNumber) initWithInteger:value];
    goto LABEL_11;
  }
  id v14 = [objc_allocWithZone(NSNumber) initWithBool:v10 & 1];
  if (v13 == 2) {
    goto LABEL_9;
  }
LABEL_6:
  id v15 = [objc_allocWithZone(NSNumber) initWithBool:v13 & 1];
  if (!is_nil) {
    goto LABEL_10;
  }
LABEL_7:
  id v16 = 0;
LABEL_11:
  id v17 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithEnableHeating:v12 enableCooling:v14 enableMassage:v15 seat:seat level:v16 relativeLevelSetting:relativeLevel];

  return (INSetSeatSettingsInCarIntent)v17;
}

uint64_t INSetSeatSettingsInCarIntent.enableHeating.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableHeating);
}

uint64_t INSetSeatSettingsInCarIntent.enableCooling.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableCooling);
}

uint64_t INSetSeatSettingsInCarIntent.enableMassage.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableMassage);
}

id INSetSeatSettingsInCarIntent.level.getter()
{
  id v1 = [v0 sel_level];
  id v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 sel_integerValue];

  return v3;
}

uint64_t static NSString.deferredLocalizedIntentsString(with:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  specialized withVaList<A>(_:_:)(a3, v3, a1, a2);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t static NSString.deferredLocalizedIntentsString(with:table:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized withVaList<A>(_:_:)(a5, v5, a1, a2, a3, a4);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

void static NSString.deferredLocalizedIntentsString(with:table:arguments:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v11 = (void *)MEMORY[0x216690CF0](a1, a2);
  uint64_t v12 = (void *)MEMORY[0x216690CF0](a3, a4);
  id v13 = [ObjCClassFromMetadata deferredLocalizedIntentsStringWithFormat:v11 fromTable:v12, a5];

  if (!v13) {
    __break(1u);
  }
}

void specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for __VaListBuilder();
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = 8;
  v5[3] = 0;
  id v6 = v5 + 3;
  v5[4] = 0;
  v5[5] = 0;
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a1 + 32;
    while (1)
    {
      outlined init with copy of CVarArg(v9 + 40 * v8, (uint64_t)v30);
      __swift_project_boxed_opaque_existential_1(v30, v30[3]);
      uint64_t v10 = dispatch thunk of CVarArg._cVarArgEncoding.getter();
      uint64_t v11 = *v6;
      uint64_t v12 = *(void *)(v10 + 16);
      BOOL v13 = __OFADD__(*v6, v12);
      uint64_t v14 = *v6 + v12;
      if (v13)
      {
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        return;
      }
      uint64_t v15 = v10;
      uint64_t v16 = v5[4];
      if (v16 >= v14) {
        goto LABEL_18;
      }
      if (v16 + 0x4000000000000000 < 0) {
        goto LABEL_29;
      }
      id v17 = (char *)v5[5];
      if (2 * v16 > v14) {
        uint64_t v14 = 2 * v16;
      }
      v5[4] = v14;
      if ((unint64_t)(v14 - 0x1000000000000000) >> 61 != 7) {
        goto LABEL_30;
      }
      id v18 = (char *)swift_slowAlloc();
      v5[5] = v18;
      if (v17) {
        break;
      }
LABEL_19:
      if (!v18) {
        goto LABEL_31;
      }
      uint64_t v20 = *(void *)(v15 + 16);
      if (v20)
      {
        id v21 = (uint64_t *)(v15 + 32);
        uint64_t v22 = *v6;
        while (1)
        {
          uint64_t v23 = *v21++;
          *(void *)&v18[8 * v22] = v23;
          uint64_t v22 = *v6 + 1;
          if (__OFADD__(*v6, 1)) {
            break;
          }
          *id v6 = v22;
          if (!--v20) {
            goto LABEL_3;
          }
        }
        __break(1u);
        goto LABEL_28;
      }
LABEL_3:
      ++v8;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      if (v8 == v7) {
        goto LABEL_25;
      }
    }
    if (v18 != v17 || v18 >= &v17[8 * v11]) {
      memmove(v18, v17, 8 * v11);
    }
    __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_18:
    id v18 = (char *)v5[5];
    goto LABEL_19;
  }
LABEL_25:
  uint64_t v24 = __VaListBuilder.va_list()();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v26 = (void *)MEMORY[0x216690CF0](a3, a4);
  id v27 = [ObjCClassFromMetadata deferredLocalizedIntentsStringWithFormat:v26 fromTable:v24];

  if (!v27) {
    goto LABEL_32;
  }
  swift_release();
}

void specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  type metadata accessor for __VaListBuilder();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 8;
  v7[3] = 0;
  uint64_t v8 = v7 + 3;
  v7[4] = 0;
  v7[5] = 0;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = a1 + 32;
    while (1)
    {
      outlined init with copy of CVarArg(v11 + 40 * v10, (uint64_t)v35);
      __swift_project_boxed_opaque_existential_1(v35, v35[3]);
      uint64_t v12 = dispatch thunk of CVarArg._cVarArgEncoding.getter();
      uint64_t v13 = *v8;
      uint64_t v14 = *(void *)(v12 + 16);
      BOOL v15 = __OFADD__(*v8, v14);
      uint64_t v16 = *v8 + v14;
      if (v15)
      {
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        return;
      }
      uint64_t v17 = v12;
      uint64_t v18 = v7[4];
      if (v18 >= v16) {
        goto LABEL_18;
      }
      if (v18 + 0x4000000000000000 < 0) {
        goto LABEL_29;
      }
      uint64_t v19 = (char *)v7[5];
      if (2 * v18 > v16) {
        uint64_t v16 = 2 * v18;
      }
      v7[4] = v16;
      if ((unint64_t)(v16 - 0x1000000000000000) >> 61 != 7) {
        goto LABEL_30;
      }
      uint64_t v20 = (char *)swift_slowAlloc();
      v7[5] = v20;
      if (v19) {
        break;
      }
LABEL_19:
      if (!v20) {
        goto LABEL_31;
      }
      uint64_t v22 = *(void *)(v17 + 16);
      if (v22)
      {
        uint64_t v23 = (uint64_t *)(v17 + 32);
        uint64_t v24 = *v8;
        while (1)
        {
          uint64_t v25 = *v23++;
          *(void *)&v20[8 * v24] = v25;
          uint64_t v24 = *v8 + 1;
          if (__OFADD__(*v8, 1)) {
            break;
          }
          *uint64_t v8 = v24;
          if (!--v22) {
            goto LABEL_3;
          }
        }
        __break(1u);
        goto LABEL_28;
      }
LABEL_3:
      ++v10;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
      if (v10 == v9) {
        goto LABEL_25;
      }
    }
    if (v20 != v19 || v20 >= &v19[8 * v13]) {
      memmove(v20, v19, 8 * v13);
    }
    __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_18:
    uint64_t v20 = (char *)v7[5];
    goto LABEL_19;
  }
LABEL_25:
  uint64_t v26 = __VaListBuilder.va_list()();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v28 = (void *)MEMORY[0x216690CF0](a3, a4);
  v29 = (void *)MEMORY[0x216690CF0](a5, a6);
  id v30 = [ObjCClassFromMetadata deferredLocalizedIntentsStringWithFormat:v28 fromTable:v29 arguments:v26];

  if (!v30) {
    goto LABEL_32;
  }
  swift_release();
}

uint64_t outlined init with copy of CVarArg(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id INCallRecord.init(identifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:numberOfCalls:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9, uint64_t a10, char a11)
{
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (void *)MEMORY[0x216690CF0](a1, a2);
  swift_bridgeObjectRelease();
  outlined init with copy of Date?(a3, (uint64_t)v18);
  uint64_t v20 = type metadata accessor for Date();
  uint64_t v21 = *(void *)(v20 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v18, 1, v20) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
  }
  if (a8) {
    id v23 = 0;
  }
  else {
    id v23 = [objc_allocWithZone(NSNumber) initWithDouble:a7];
  }
  if (a9 != 2)
  {
    id v24 = [objc_allocWithZone(NSNumber) initWithBool:a9 & 1];
    if (a11) {
      goto LABEL_8;
    }
LABEL_10:
    id v25 = [objc_allocWithZone(NSNumber) initWithInteger:a10];
    goto LABEL_11;
  }
  id v24 = 0;
  if ((a11 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  id v25 = 0;
LABEL_11:
  id v26 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v27 = [v26 initWithIdentifier:v19 dateCreated:isa caller:a4 callRecordType:v29 callCapability:v30 callDuration:v23 unseen:v24 numberOfCalls:v25];

  outlined destroy of Date?(a3);
  return v27;
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Date?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id INCallRecord.init(identifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9)
{
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (void *)MEMORY[0x216690CF0](a1, a2);
  swift_bridgeObjectRelease();
  outlined init with copy of Date?(a3, (uint64_t)v16);
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v19 = *(void *)(v18 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
  }
  if (a8)
  {
    id v21 = 0;
    if (a9 != 2) {
      goto LABEL_5;
    }
LABEL_7:
    id v22 = 0;
    goto LABEL_8;
  }
  id v21 = [objc_allocWithZone(NSNumber) initWithDouble:a7];
  if (a9 == 2) {
    goto LABEL_7;
  }
LABEL_5:
  id v22 = [objc_allocWithZone(NSNumber) initWithBool:a9 & 1];
LABEL_8:
  id v23 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v24 = [v23 initWithIdentifier:v17 dateCreated:isa caller:a4 callRecordType:v26 callCapability:v27 callDuration:v21 unseen:v22];

  outlined destroy of Date?(a3);
  return v24;
}

id INCallRecord.callDuration.getter()
{
  id result = [v0 sel_callDuration];
  uint64_t v2 = result;
  if (result)
  {
    [result doubleValue];
    uint64_t v4 = v3;

    return (id)v4;
  }
  return result;
}

uint64_t INCallRecord.unseen.getter()
{
  [v0 sel_unseen];
  if (!v1) {
    return 2;
  }
  uint64_t v2 = v1;
  id v3 = [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

id INCallRecord.numberOfCalls.getter()
{
  id v1 = [v0 sel_numberOfCalls];
  uint64_t v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 integerValue];

  return v3;
}

id static INDoubleResolutionResult.confirmationRequired(with:)(uint64_t a1, char a2)
{
  if (a2) {
    id v2 = 0;
  }
  else {
    id v2 = [objc_allocWithZone(NSNumber) initWithDouble:a1];
  }
  id v3 = [swift_getObjCClassFromMetadata() confirmationRequiredWithValueToConfirm:v2];

  return v3;
}

id INMediaUserContext.numberOfLibraryItems.getter()
{
  id v1 = [v0 sel_numberOfLibraryItems];
  id v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 integerValue];

  return v3;
}

void key path getter for INMediaUserContext.numberOfLibraryItems : INMediaUserContext(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = [*a1 sel_numberOfLibraryItems];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 integerValue];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v4 == 0;
}

void key path setter for INMediaUserContext.numberOfLibraryItems : INMediaUserContext(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(unsigned char *)(a1 + 8)) {
    Class isa = 0;
  }
  else {
    Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  }
  Class v4 = isa;
  [v2 setNumberOfLibraryItems:];
}

void INMediaUserContext.numberOfLibraryItems.setter(uint64_t a1, char a2)
{
  if (a2) {
    v3.super.super.Class isa = 0;
  }
  else {
    v3.super.super.Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  }
  Class isa = v3.super.super.isa;
  [v2 setNumberOfLibraryItems:];
}

void (*INMediaUserContext.numberOfLibraryItems.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  id v3 = [v1 sel_numberOfLibraryItems];
  Class v4 = v3;
  if (v3)
  {
    id v5 = [v3 sel_integerValue];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v4 == 0;
  return INMediaUserContext.numberOfLibraryItems.modify;
}

void INMediaUserContext.numberOfLibraryItems.modify(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    Class isa = 0;
  }
  else {
    Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  }
  Class v3 = isa;
  [*(id *)(a1 + 16) setNumberOfLibraryItems:];
}

void _INIntentSetImageKeyPath.setImage<A>(_:forParameterNamed:)(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(*a2 + *MEMORY[0x263F8EA20]);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v15 - v7;
  uint64_t v9 = dispatch thunk of AnyKeyPath._kvcKeyPathString.getter();
  if (v10)
  {
    uint64_t v11 = v9;
    uint64_t v12 = v10;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3, v5);
    type metadata accessor for INIntent();
    swift_dynamicCast();
    uint64_t v13 = (void *)v15[1];
    uint64_t v14 = (void *)MEMORY[0x216690CF0](v11, v12);
    swift_bridgeObjectRelease();
    [v13 setImage:a1 forParameterNamed:v14];
  }
}

unint64_t type metadata accessor for INIntent()
{
  unint64_t result = lazy cache variable for type metadata for INIntent;
  if (!lazy cache variable for type metadata for INIntent)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for INIntent);
  }
  return result;
}

id _INIntentSetImageKeyPath.image<A>(forParameterNamed:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(*a1 + *MEMORY[0x263F8EA20]);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v15 - v5;
  uint64_t v7 = dispatch thunk of AnyKeyPath._kvcKeyPathString.getter();
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v7;
  uint64_t v10 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, v3);
  type metadata accessor for INIntent();
  swift_dynamicCast();
  uint64_t v11 = (void *)v15[1];
  uint64_t v12 = (void *)MEMORY[0x216690CF0](v9, v10);
  swift_bridgeObjectRelease();
  id v13 = [v11 imageForParameterNamed:v12];

  return v13;
}

INDeleteTasksIntent __swiftcall INDeleteTasksIntent.init(taskList:tasks:all:)(INTaskList_optional taskList, Swift::OpaquePointer_optional tasks, Swift::Bool_optional all)
{
  Class isa = taskList.value.super.isa;
  int rawValue_low = LOBYTE(tasks.value._rawValue);
  if (!*(void *)&taskList.is_nil)
  {
    v5.super.Class isa = 0;
    if (LOBYTE(tasks.value._rawValue) == 2) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = [objc_allocWithZone(NSNumber) initWithBool:(rawValue_low & 1)];
    goto LABEL_6;
  }
  type metadata accessor for INTask();
  v5.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (rawValue_low != 2) {
    goto LABEL_5;
  }
LABEL_3:
  id v6 = 0;
LABEL_6:
  id v7 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithTaskList:isa tasks:v5.super.isa all:v6];

  return (INDeleteTasksIntent)v7;
}

unint64_t type metadata accessor for INTask()
{
  unint64_t result = lazy cache variable for type metadata for INTask;
  if (!lazy cache variable for type metadata for INTask)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for INTask);
  }
  return result;
}

uint64_t INDeleteTasksIntent.all.getter()
{
  id v1 = [v0 sel_all];
  if (!v1) {
    return 2;
  }
  uint64_t v2 = v1;
  id v3 = [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

unint64_t INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.getter()
{
  return INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.getter((SEL *)&selRef_fuelPercentRemaining);
}

void INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.setter(uint64_t a1)
{
}

void (*INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = v1;
  *(void *)a1 = v2;
  id v4 = [v2 fuelPercentRemaining];
  NSArray v5 = v4;
  if (v4)
  {
    [v4 sel_floatValue];
    int v7 = v6;
  }
  else
  {
    int v7 = 0;
  }
  *(_DWORD *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 12) = v5 == 0;
  return INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.modify;
}

void INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.modify(uint64_t a1, uint64_t a2)
{
}

unint64_t INGetCarPowerLevelStatusIntentResponse.chargePercentRemaining.getter()
{
  return INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.getter((SEL *)&selRef_chargePercentRemaining);
}

unint64_t INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.getter(SEL *a1)
{
  id v2 = [v1 *a1];
  id v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    unsigned int v5 = v4;

    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6 | ((unint64_t)(v3 == 0) << 32);
}

void key path getter for INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining : INGetCarPowerLevelStatusIntentResponse(id *a1@<X0>, SEL *a2@<X3>, uint64_t a3@<X8>)
{
  id v4 = [*a1 *a2];
  unsigned int v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    int v7 = v6;
  }
  else
  {
    int v7 = 0;
  }
  *(_DWORD *)a3 = v7;
  *(unsigned char *)(a3 + 4) = v5 == 0;
}

void key path setter for INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining : INGetCarPowerLevelStatusIntentResponse(int *a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  int v6 = *a2;
  if (a1[1])
  {
    id v7 = 0;
  }
  else
  {
    int v8 = *a1;
    id v9 = objc_allocWithZone(NSNumber);
    LODWORD(v10) = v8;
    id v7 = [v9 initWithFloat:v10];
  }
  id v11 = v7;
  [v6 *a5];
}

void INGetCarPowerLevelStatusIntentResponse.chargePercentRemaining.setter(uint64_t a1)
{
}

void INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.setter(uint64_t a1, SEL *a2)
{
  if ((a1 & 0x100000000) != 0)
  {
    id v7 = 0;
  }
  else
  {
    int v4 = a1;
    id v5 = objc_allocWithZone(NSNumber);
    LODWORD(v6) = v4;
    id v7 = [v5 initWithFloat:v6];
  }
  id v8 = v7;
  [v2 *a2];
}

void (*INGetCarPowerLevelStatusIntentResponse.chargePercentRemaining.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  id v2 = v1;
  *(void *)a1 = v2;
  id v4 = [v2 sel_chargePercentRemaining];
  id v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    int v7 = v6;
  }
  else
  {
    int v7 = 0;
  }
  *(_DWORD *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 12) = v5 == 0;
  return INGetCarPowerLevelStatusIntentResponse.chargePercentRemaining.modify;
}

void INGetCarPowerLevelStatusIntentResponse.chargePercentRemaining.modify(uint64_t a1, uint64_t a2)
{
}

void INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.modify(uint64_t a1, uint64_t a2, SEL *a3)
{
  if (*(unsigned char *)(a1 + 12))
  {
    id v5 = 0;
  }
  else
  {
    int v6 = *(_DWORD *)(a1 + 8);
    id v7 = objc_allocWithZone(NSNumber);
    LODWORD(v8) = v6;
    id v5 = [v7 initWithFloat:v8];
  }
  id v9 = v5;
  [*(id *)a1 *a3];
}

uint64_t INGetCarPowerLevelStatusIntentResponse.charging.getter()
{
  id v1 = [v0 charging];
  if (!v1) {
    return 2;
  }
  id v2 = v1;
  id v3 = [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

void key path getter for INGetCarPowerLevelStatusIntentResponse.charging : INGetCarPowerLevelStatusIntentResponse(id *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  id v3 = [*a1 sel_charging];
  if (v3)
  {
    id v4 = v3;
    unsigned __int8 v5 = [v3 sel_BOOLValue];
  }
  else
  {
    unsigned __int8 v5 = 2;
  }
  *a2 = v5;
}

void key path setter for INGetCarPowerLevelStatusIntentResponse.charging : INGetCarPowerLevelStatusIntentResponse(unsigned __int8 *a1, void **a2)
{
  int v2 = *a1;
  id v3 = *a2;
  if (v2 == 2) {
    id v4 = 0;
  }
  else {
    id v4 = [objc_allocWithZone(NSNumber) initWithBool:v2 & 1];
  }
  id v5 = v4;
  [v3 setCharging:];
}

void INGetCarPowerLevelStatusIntentResponse.charging.setter(char a1)
{
  if (a1 == 2) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_allocWithZone(NSNumber) initWithBool:a1 & 1];
  }
  id v4 = v3;
  [v1 setCharging:];
}

void (*INGetCarPowerLevelStatusIntentResponse.charging.modify(uint64_t a1))(uint64_t a1)
{
  int v2 = v1;
  *(void *)a1 = v2;
  id v4 = [v2 charging];
  if (v4)
  {
    id v5 = v4;
    unsigned __int8 v6 = [v4 sel_BOOLValue];
  }
  else
  {
    unsigned __int8 v6 = 2;
  }
  *(unsigned char *)(a1 + 8) = v6;
  return INGetCarPowerLevelStatusIntentResponse.charging.modify;
}

void INGetCarPowerLevelStatusIntentResponse.charging.modify(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  if (v2 == 2) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_allocWithZone(NSNumber) initWithBool:v2 & 1];
  }
  id v4 = v3;
  [*(id *)a1 setCharging:];
}

id INGetCarPowerLevelStatusIntentResponse.minutesToFull.getter()
{
  id v1 = [v0 minutesToFull];
  int v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 sel_integerValue];

  return v3;
}

void key path getter for INGetCarPowerLevelStatusIntentResponse.minutesToFull : INGetCarPowerLevelStatusIntentResponse(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = [*a1 sel_minutesToFull];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 integerValue];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v4 == 0;
}

void key path setter for INGetCarPowerLevelStatusIntentResponse.minutesToFull : INGetCarPowerLevelStatusIntentResponse(uint64_t a1, void **a2)
{
  int v2 = *a2;
  if (*(unsigned char *)(a1 + 8)) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_allocWithZone(NSNumber) initWithInteger:*(void *)a1];
  }
  id v4 = v3;
  [v2 setMinutesToFull_];
}

void INGetCarPowerLevelStatusIntentResponse.minutesToFull.setter(uint64_t a1, char a2)
{
  if (a2) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_allocWithZone(NSNumber) initWithInteger:a1];
  }
  id v4 = v3;
  [v2 setMinutesToFull:];
}

void (*INGetCarPowerLevelStatusIntentResponse.minutesToFull.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  id v3 = [v1 sel_minutesToFull];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 integerValue];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v4 == 0;
  return INGetCarPowerLevelStatusIntentResponse.minutesToFull.modify;
}

void INGetCarPowerLevelStatusIntentResponse.minutesToFull.modify(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    id v2 = 0;
  }
  else {
    id v2 = [objc_allocWithZone(NSNumber) initWithInteger:*(void *)a1];
  }
  id v3 = v2;
  [*(id *)(a1 + 16) setMinutesToFull:];
}

void sub_213B36A78(id *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_213B36A98(int *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_213B36AB8(id *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_213B36AD8(int *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id INSearchForPhotosIntentResponse.searchResultsCount.getter()
{
  id v1 = [v0 sel_searchResultsCount];
  id v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 integerValue];

  return v3;
}

void key path getter for INSearchForPhotosIntentResponse.searchResultsCount : INSearchForPhotosIntentResponse(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = [*a1 sel_searchResultsCount];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 integerValue];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v4 == 0;
}

void key path setter for INSearchForPhotosIntentResponse.searchResultsCount : INSearchForPhotosIntentResponse(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(unsigned char *)(a1 + 8)) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_allocWithZone(NSNumber) initWithInteger:*(void *)a1];
  }
  id v4 = v3;
  [v2 setSearchResultsCount:];
}

void INSearchForPhotosIntentResponse.searchResultsCount.setter(uint64_t a1, char a2)
{
  if (a2) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_allocWithZone(NSNumber) initWithInteger:a1];
  }
  id v4 = v3;
  [v2 setSearchResultsCount:];
}

void (*INSearchForPhotosIntentResponse.searchResultsCount.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  id v3 = [v1 sel_searchResultsCount];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 integerValue];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v4 == 0;
  return INSearchForPhotosIntentResponse.searchResultsCount.modify;
}

void INSearchForPhotosIntentResponse.searchResultsCount.modify(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    id v2 = 0;
  }
  else {
    id v2 = [objc_allocWithZone(NSNumber) initWithInteger:*(void *)a1];
  }
  id v3 = v2;
  [*(id *)(a1 + 16) setSearchResultsCount:];
}

INSnoozeTasksIntent __swiftcall INSnoozeTasksIntent.init(tasks:nextTriggerTime:all:)(Swift::OpaquePointer_optional tasks, INDateComponentsRange_optional nextTriggerTime, Swift::Bool_optional all)
{
  id v3 = *(void **)&tasks.is_nil;
  int isa_low = LOBYTE(nextTriggerTime.value.super.isa);
  if (!tasks.value._rawValue)
  {
    v5.super.Class isa = 0;
    if (LOBYTE(nextTriggerTime.value.super.isa) == 2) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = [objc_allocWithZone(NSNumber) initWithBool:isa_low & 1];
    goto LABEL_6;
  }
  type metadata accessor for INTask();
  v5.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (isa_low != 2) {
    goto LABEL_5;
  }
LABEL_3:
  id v6 = 0;
LABEL_6:
  id v7 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithTasks_nextTriggerTime_all_:v5.super.isa, v3, v6];

  return (INSnoozeTasksIntent)v7;
}

uint64_t INSnoozeTasksIntent.all.getter()
{
  id v1 = [v0 sel_all];
  if (!v1) {
    return 2;
  }
  id v2 = v1;
  id v3 = [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

INSaveProfileInCarIntent __swiftcall INSaveProfileInCarIntent.init(profileNumber:profileLabel:)(Swift::Int_optional profileNumber, Swift::String_optional profileLabel)
{
  object = profileLabel.value._object;
  uint64_t countAndFlagsBits = profileLabel.value._countAndFlagsBits;
  if (profileNumber.is_nil)
  {
    id v4 = 0;
    if (profileLabel.value._object) {
      goto LABEL_3;
    }
LABEL_5:
    NSArray v5 = 0;
    goto LABEL_6;
  }
  id v4 = [objc_allocWithZone(NSNumber) initWithInteger:profileNumber.value];
  if (!object) {
    goto LABEL_5;
  }
LABEL_3:
  NSArray v5 = (void *)MEMORY[0x216690CF0](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
LABEL_6:
  id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithProfileNumber:v4 profileLabel:v5];

  return (INSaveProfileInCarIntent)v6;
}

id INSaveProfileInCarIntent.profileNumber.getter()
{
  id v1 = [v0 sel_profileNumber];
  id v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 sel_integerValue];

  return v3;
}

uint64_t INMediaDestination.playlistName.getter()
{
  if (v0[1]) {
    uint64_t v1 = *v0;
  }
  else {
    uint64_t v1 = 0;
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t INMediaDestination.description.getter()
{
  return INMediaDestination.description.getter((SEL *)&selRef_description);
}

uint64_t INMediaDestination.debugDescription.getter()
{
  return INMediaDestination.description.getter((SEL *)&selRef_debugDescription);
}

uint64_t INMediaDestination.description.getter(SEL *a1)
{
  uint64_t v3 = v1[1];
  if (v3)
  {
    uint64_t v4 = *v1;
    NSArray v5 = self;
    swift_bridgeObjectRetain();
    id v6 = (void *)MEMORY[0x216690CF0](v4, v3);
    id v7 = [v5 playlistDestinationWithName:v6];
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = [self sel_libraryDestination];
  }
  id v8 = [v7 *a1];

  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v9;
}

void INMediaDestination.hash(into:)()
{
  uint64_t v1 = v0[1];
  if (v1)
  {
    uint64_t v2 = *v0;
    uint64_t v3 = self;
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)MEMORY[0x216690CF0](v2, v1);
    id v5 = [v3 playlistDestinationWithName:v4];
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = [self sel_libraryDestination];
  }
  NSObject.hash(into:)();
}

Swift::Int INMediaDestination.hashValue.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  Hasher.init(_seed:)();
  if (v1)
  {
    uint64_t v3 = self;
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)MEMORY[0x216690CF0](v2, v1);
    id v5 = [v3 playlistDestinationWithName:v4];
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = [self sel_libraryDestination];
  }
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance INMediaDestination()
{
  uint64_t v1 = v0[1];
  if (v1)
  {
    uint64_t v2 = *v0;
    uint64_t v3 = self;
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)MEMORY[0x216690CF0](v2, v1);
    id v5 = [v3 playlistDestinationWithName:v4];
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = [self sel_libraryDestination];
  }
  NSObject.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance INMediaDestination()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  Hasher.init(_seed:)();
  if (v1)
  {
    uint64_t v3 = self;
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)MEMORY[0x216690CF0](v2, v1);
    id v5 = [v3 playlistDestinationWithName:v4];
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = [self sel_libraryDestination];
  }
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

INMediaDestination __swiftcall INMediaDestination._bridgeToObjectiveC()()
{
  uint64_t v1 = v0[1];
  if (v1)
  {
    uint64_t v2 = *v0;
    uint64_t v3 = self;
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)MEMORY[0x216690CF0](v2, v1);
    id v5 = [v3 playlistDestinationWithName:v4];
    swift_bridgeObjectRelease();

    return (INMediaDestination)v5;
  }
  else
  {
    id v7 = [self sel_libraryDestination];
    return (INMediaDestination)v7;
  }
}

void static INMediaDestination._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t *a2)
{
  outlined consume of INMediaDestination?(*a2, a2[1]);
  id v4 = a1;
  id v5 = [v4 sel_playlistName];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
  }
  else
  {

    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  *a2 = v7;
  a2[1] = v9;
}

uint64_t static INMediaDestination._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t *a2)
{
  outlined consume of INMediaDestination?(*a2, a2[1]);
  id v4 = a1;
  id v5 = [v4 sel_playlistName];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
  }
  else
  {

    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  *a2 = v7;
  a2[1] = v9;
  return 1;
}

void static INMediaDestination._unconditionallyBridgeFromObjectiveC(_:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  if (a1)
  {
    id v3 = a1;
    id v4 = [v3 sel_playlistName];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v8 = v7;
    }
    else
    {

      uint64_t v6 = 0;
      uint64_t v8 = 0;
    }
    *a2 = v6;
    a2[1] = v8;
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INMediaDestination()
{
  uint64_t v1 = v0[1];
  if (v1)
  {
    uint64_t v2 = *v0;
    id v3 = self;
    swift_bridgeObjectRetain();
    id v4 = (void *)MEMORY[0x216690CF0](v2, v1);
    id v5 = [v3 playlistDestinationWithName:v4];
    swift_bridgeObjectRelease();

    return v5;
  }
  else
  {
    id v7 = [self sel_libraryDestination];
    return v7;
  }
}

void protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance INMediaDestination(void *a1, uint64_t *a2)
{
  outlined consume of INMediaDestination?(*a2, a2[1]);
  id v4 = a1;
  id v5 = [v4 sel_playlistName];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
  }
  else
  {

    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  *a2 = v7;
  a2[1] = v9;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance INMediaDestination(void *a1, uint64_t *a2)
{
  outlined consume of INMediaDestination?(*a2, a2[1]);
  id v4 = a1;
  id v5 = [v4 playlistName];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
  }
  else
  {

    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  *a2 = v7;
  a2[1] = v9;
  return 1;
}

uint64_t specialized static INMediaDestination.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (!v3)
  {
    if (!v4)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
    return 0;
  }
  if (!v4) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v4) {
    return 1;
  }

  return MEMORY[0x270F9F7D0]();
}

uint64_t outlined consume of INMediaDestination?(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type INMediaDestination and conformance INMediaDestination()
{
  unint64_t result = lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination;
  if (!lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination;
  if (!lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination;
  if (!lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination;
  if (!lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination;
  if (!lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for INMediaDestination(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for INMediaDestination()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for INMediaDestination(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for INMediaDestination(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for INMediaDestination(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for INMediaDestination(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t getEnumTag for INMediaDestination(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *destructiveInjectEnumTag for INMediaDestination(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for INMediaDestination()
{
  return &type metadata for INMediaDestination;
}

INStartWorkoutIntent __swiftcall INStartWorkoutIntent.init(workoutName:goalValue:workoutGoalUnitType:workoutLocationType:isOpenEnded:)(INSpeakableString_optional workoutName, Swift::Double_optional goalValue, INWorkoutGoalUnitType workoutGoalUnitType, INWorkoutLocationType workoutLocationType, Swift::Bool_optional isOpenEnded)
{
  Class isa = workoutName.value.super.isa;
  int value = isOpenEnded.value;
  if (goalValue.is_nil)
  {
    id v9 = 0;
    if (isOpenEnded.value != 2) {
      goto LABEL_3;
    }
LABEL_5:
    id v10 = 0;
    goto LABEL_6;
  }
  id v9 = [objc_allocWithZone(NSNumber) initWithDouble:*(double *)&workoutName.is_nil];
  if (value == 2) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = [objc_allocWithZone(NSNumber) initWithBool:(value & 1)];
LABEL_6:
  id v11 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithWorkoutName:v9 goalValue:workoutGoalUnitType workoutLocationType:v10];

  return (INStartWorkoutIntent)v11;
}

id INStartWorkoutIntent.goalValue.getter()
{
  id result = [v0 goalValue];
  uint64_t v2 = result;
  if (result)
  {
    [result doubleValue];
    uint64_t v4 = v3;

    return (id)v4;
  }
  return result;
}

uint64_t INStartWorkoutIntent.isOpenEnded.getter()
{
  id v1 = [v0 sel_isOpenEnded];
  if (!v1) {
    return 2;
  }
  uint64_t v2 = v1;
  id v3 = [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

id INRestaurantReservation.init(itemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:reservationDuration:partySize:restaurantLocation:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, char a11, void *a12)
{
  uint64_t v32 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388]();
  uint64_t v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v21 = (void *)MEMORY[0x216690CF0](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v21 = 0;
  }
  outlined init with copy of Date?(a4, (uint64_t)v20, &demangling cache variable for type metadata for Date?);
  uint64_t v22 = type metadata accessor for Date();
  uint64_t v23 = *(void *)(v22 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v20, 1, v22) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
  }
  if (a7)
  {
    id v25 = (void *)MEMORY[0x216690CF0](a6, a7);
    swift_bridgeObjectRelease();
    char v26 = a11;
    if (a8)
    {
LABEL_8:
      type metadata accessor for INReservationAction();
      v27.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  else
  {
    id v25 = 0;
    char v26 = a11;
    if (a8) {
      goto LABEL_8;
    }
  }
  v27.super.Class isa = 0;
LABEL_11:
  if (v26) {
    id v28 = 0;
  }
  else {
    id v28 = [objc_allocWithZone(NSNumber) initWithInteger:a10];
  }
  id v29 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithItemReference:a1 reservationNumber:v21 bookingTime:isa reservationStatus:v32 reservationHolderName:v25 reservationActions:v27.super.isa partySize:a9 reservationDuration:v28 restaurantLocation:a12];

  outlined destroy of Date?(a4, &demangling cache variable for type metadata for Date?);
  return v29;
}

unint64_t type metadata accessor for INReservationAction()
{
  unint64_t result = lazy cache variable for type metadata for INReservationAction;
  if (!lazy cache variable for type metadata for INReservationAction)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for INReservationAction);
  }
  return result;
}

id INRestaurantReservation.init(itemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:url:reservationDuration:partySize:restaurantLocation:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, char a12, void *a13)
{
  uint64_t v44 = a5;
  v45 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388]();
  uint64_t v20 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388]();
  uint64_t v22 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v47 = MEMORY[0x216690CF0](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v47 = 0;
  }
  uint64_t v48 = a4;
  outlined init with copy of Date?(a4, (uint64_t)v22, &demangling cache variable for type metadata for Date?);
  uint64_t v23 = type metadata accessor for Date();
  uint64_t v24 = *(void *)(v23 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v23);
  }
  if (a7)
  {
    uint64_t v26 = MEMORY[0x216690CF0](a6, a7);
    swift_bridgeObjectRelease();
    if (a8)
    {
LABEL_8:
      type metadata accessor for INReservationAction();
      v27.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if (a8) {
      goto LABEL_8;
    }
  }
  v27.super.Class isa = 0;
LABEL_11:
  outlined init with copy of Date?(a9, (uint64_t)v20, &demangling cache variable for type metadata for URL?);
  uint64_t v28 = type metadata accessor for URL();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v31 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v20, 1, v28) != 1)
  {
    URL._bridgeToObjectiveC()(v30);
    uint64_t v31 = v32;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v20, v28);
  }
  uint64_t v46 = a9;
  uint64_t v33 = (void *)v26;
  Class v34 = isa;
  id v35 = v33;
  if (a12) {
    id v36 = 0;
  }
  else {
    id v36 = [objc_allocWithZone(NSNumber) initWithInteger:a11];
  }
  uint64_t v38 = v44;
  uint64_t v37 = v45;
  id v39 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v40 = (void *)v47;
  id v41 = [v39 sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_URL_reservationDuration_partySize_restaurantLocation_:v37, v47, v34, v38, v35, v27.super.isa, v31, a10, v36, a13];

  outlined destroy of Date?(v46, &demangling cache variable for type metadata for URL?);
  outlined destroy of Date?(v48, &demangling cache variable for type metadata for Date?);
  return v41;
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of Date?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id INRestaurantReservation.partySize.getter()
{
  id v1 = [v0 partySize];
  uint64_t v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 sel_integerValue];

  return v3;
}

id static INBooleanResolutionResult.confirmationRequired(with:)(char a1)
{
  if (a1 == 2) {
    id v2 = 0;
  }
  else {
    id v2 = [objc_allocWithZone(NSNumber) initWithBool:a1 & 1];
  }
  id v3 = [swift_getObjCClassFromMetadata() confirmationRequiredWithValueToConfirm:v2];

  return v3;
}

void INShortcut.init(intent:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = [objc_allocWithZone(MEMORY[0x263F0FF68]) initWithIntent:a1];
  if (!v4)
  {

    id v7 = 0;
    char v8 = -1;
    goto LABEL_7;
  }
  uint64_t v5 = v4;
  id v6 = [v4 sel_intent];
  if (v6)
  {
    id v7 = v6;

    char v8 = 0;
LABEL_7:
    *(void *)a2 = v7;
    *(unsigned char *)(a2 + 8) = v8;
    return;
  }
  id v9 = [v5 sel_userActivity];
  if (v9)
  {
    id v7 = v9;

    char v8 = 1;
    goto LABEL_7;
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t INShortcut.init(userActivity:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 1;
  return result;
}

id INShortcut.intent.getter()
{
  if (*(unsigned char *)(v0 + 8)) {
    return 0;
  }
  id v1 = *(id *)v0;
  id v2 = *(id *)v0;
  return v1;
}

id INShortcut.userActivity.getter()
{
  if (*(unsigned char *)(v0 + 8) != 1) {
    return 0;
  }
  id v1 = *(id *)v0;
  id v2 = *(id *)v0;
  return v1;
}

id INShortcut.description.getter()
{
  return INShortcut.description.getter((SEL *)&selRef_description);
}

id INShortcut.debugDescription.getter()
{
  return INShortcut.description.getter((SEL *)&selRef_debugDescription);
}

id INShortcut.description.getter(SEL *a1)
{
  id v3 = *(void **)v1;
  char v4 = *(unsigned char *)(v1 + 8);
  id v5 = objc_allocWithZone(MEMORY[0x263F0FF68]);
  id v6 = v5;
  if (v4)
  {
    id v7 = [v5 initWithUserActivity:v3];
LABEL_5:
    id v10 = [v7 *a1];

    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    return (id)v11;
  }
  id v8 = v3;
  id result = [v6 init:v8];
  if (result)
  {
    id v7 = result;

    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void INShortcut.hash(into:)()
{
  uint64_t v1 = *(void **)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  id v3 = objc_allocWithZone(MEMORY[0x263F0FF68]);
  char v4 = v3;
  if (v2)
  {
    id v5 = [v3 initWithUserActivity:v1];
  }
  else
  {
    id v6 = v1;
    id v7 = [v4 initWithIntent:v6];
    if (!v7)
    {
      __break(1u);
      return;
    }

    id v5 = v7;
  }
  id v8 = v5;
  NSObject.hash(into:)();
}

id INShortcut.hashValue.getter()
{
  uint64_t v1 = *(void **)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  Hasher.init(_seed:)();
  id v3 = objc_allocWithZone(MEMORY[0x263F0FF68]);
  char v4 = v3;
  if (v2)
  {
    id v5 = [v3 initWithUserActivity:v1];
LABEL_5:
    NSObject.hash(into:)();

    return (id)Hasher._finalize()();
  }
  id v6 = v1;
  id result = [v4 init:v6];
  if (result)
  {
    id v5 = result;

    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void protocol witness for Hashable.hash(into:) in conformance INShortcut()
{
  uint64_t v1 = *(void **)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  id v3 = objc_allocWithZone(MEMORY[0x263F0FF68]);
  char v4 = v3;
  if (v2)
  {
    id v5 = [v3 initWithUserActivity:v1];
  }
  else
  {
    id v6 = v1;
    id v7 = [v4 initWithIntent:v6];
    if (!v7)
    {
      __break(1u);
      return;
    }

    id v5 = v7;
  }
  id v8 = v5;
  NSObject.hash(into:)();
}

id protocol witness for Hashable._rawHashValue(seed:) in conformance INShortcut()
{
  uint64_t v1 = *(void **)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  Hasher.init(_seed:)();
  id v3 = objc_allocWithZone(MEMORY[0x263F0FF68]);
  char v4 = v3;
  if (v2)
  {
    id v5 = [v3 sel_initWithUserActivity_:v1];
LABEL_5:
    NSObject.hash(into:)();

    return (id)Hasher._finalize()();
  }
  id v6 = v1;
  id result = [v4 initWithIntent:v6];
  if (result)
  {
    id v5 = result;

    goto LABEL_5;
  }
  __break(1u);
  return result;
}

INShortcut __swiftcall INShortcut._bridgeToObjectiveC()()
{
  uint64_t v1 = *(void **)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  id v3 = objc_allocWithZone(MEMORY[0x263F0FF68]);
  char v4 = v3;
  if (v2)
  {
    return (INShortcut)[v3 initWithUserActivity:v1];
  }
  else
  {
    id v6 = v1;
    result.super.Class = (Class)[v4 sel_initWithIntent_:v6];
    if (result.super.isa)
    {
      Class isa = result.super.isa;

      return (INShortcut)isa;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void static INShortcut._unconditionallyBridgeFromObjectiveC(_:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (a1
    && ((id v3 = a1, v4 = objc_msgSend(v3, sel_intent), (v5 = v4) != 0)
     || (id v5 = objc_msgSend(v3, sel_userActivity)) != 0))
  {

    *(void *)a2 = v5;
    *(unsigned char *)(a2 + 8) = v4 == 0;
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INShortcut()
{
  uint64_t v1 = *(void **)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  id v3 = objc_allocWithZone(MEMORY[0x263F0FF68]);
  id v4 = v3;
  if (v2)
  {
    return [v3 initWithUserActivity:v1];
  }
  else
  {
    id v6 = v1;
    id result = [v4 init:v6];
    if (result)
    {
      id v7 = result;

      return v7;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t specialized static INShortcut.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v2 = *(void **)a1;
  id v3 = *(void **)a2;
  if ((*(unsigned char *)(a1 + 8) & 1) == 0)
  {
    if ((*(unsigned char *)(a2 + 8) & 1) == 0) {
      goto LABEL_3;
    }
LABEL_5:
    char v6 = 0;
    return v6 & 1;
  }
  if ((*(unsigned char *)(a2 + 8) & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  type metadata accessor for NSObject();
  id v4 = v3;
  id v5 = v2;
  char v6 = static NSObject.== infix(_:_:)();

  return v6 & 1;
}

void specialized static INShortcut._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  outlined consume of INShortcut?(*(id *)a2, *(unsigned char *)(a2 + 8));
  id v4 = a1;
  id v5 = [v4 sel_intent];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
LABEL_5:

    *(void *)a2 = v6;
    *(unsigned char *)(a2 + 8) = v7;
    return;
  }
  id v8 = [v4 sel_userActivity];
  if (v8)
  {
    id v6 = v8;
    char v7 = 1;
    goto LABEL_5;
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t specialized static INShortcut._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  outlined consume of INShortcut?(*(id *)a2, *(unsigned char *)(a2 + 8));
  id v4 = a1;
  id v5 = [v4 sel_intent];
  id v6 = v5;
  if (v5 || (id v6 = objc_msgSend(v4, sel_userActivity)) != 0)
  {

    *(void *)a2 = v6;
    *(unsigned char *)(a2 + 8) = v5 == 0;
    return 1;
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type INShortcut and conformance INShortcut()
{
  unint64_t result = lazy protocol witness table cache variable for type INShortcut and conformance INShortcut;
  if (!lazy protocol witness table cache variable for type INShortcut and conformance INShortcut)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INShortcut and conformance INShortcut);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type INShortcut and conformance INShortcut;
  if (!lazy protocol witness table cache variable for type INShortcut and conformance INShortcut)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INShortcut and conformance INShortcut);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type INShortcut and conformance INShortcut;
  if (!lazy protocol witness table cache variable for type INShortcut and conformance INShortcut)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INShortcut and conformance INShortcut);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type INShortcut and conformance INShortcut;
  if (!lazy protocol witness table cache variable for type INShortcut and conformance INShortcut)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INShortcut and conformance INShortcut);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type INShortcut and conformance INShortcut;
  if (!lazy protocol witness table cache variable for type INShortcut and conformance INShortcut)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INShortcut and conformance INShortcut);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for INShortcut(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

void destroy for INShortcut(id *a1)
{
}

uint64_t assignWithCopy for INShortcut(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for INShortcut(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for INShortcut(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for INShortcut(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for INShortcut(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t destructiveInjectEnumTag for INShortcut(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for INShortcut()
{
  return &type metadata for INShortcut;
}

void outlined consume of INShortcut?(id a1, char a2)
{
  if (a2 != -1) {
}
  }

unint64_t type metadata accessor for NSObject()
{
  unint64_t result = lazy cache variable for type metadata for NSObject;
  if (!lazy cache variable for type metadata for NSObject)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  }
  return result;
}

id INLodgingReservation.init(itemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:lodgingBusinessLocation:reservationDuration:numberOfAdults:numberOfChildren:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, char a12, uint64_t a13, char a14)
{
  uint64_t v42 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388]();
  uint64_t v22 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v23 = MEMORY[0x216690CF0](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = 0;
  }
  outlined init with copy of Date?(a4, (uint64_t)v22, &demangling cache variable for type metadata for Date?);
  uint64_t v24 = type metadata accessor for Date();
  uint64_t v25 = *(void *)(v24 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v22, 1, v24) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
  }
  if (a7)
  {
    uint64_t v27 = MEMORY[0x216690CF0](a6, a7);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = 0;
  }
  uint64_t v40 = a1;
  Class v41 = isa;
  uint64_t v43 = a4;
  if (a8)
  {
    type metadata accessor for INReservationAction();
    v28.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v28.super.Class isa = 0;
  }
  if (a12)
  {
    uint64_t v29 = (void *)v27;
    uint64_t v30 = (void *)v23;
    id v31 = 0;
    uint64_t v32 = a9;
    uint64_t v33 = a10;
    if (a14) {
      goto LABEL_14;
    }
LABEL_16:
    id v34 = [objc_allocWithZone(NSNumber) numberWithBool:a13];
    goto LABEL_17;
  }
  uint64_t v29 = (void *)v27;
  uint64_t v30 = (void *)v23;
  id v31 = [objc_allocWithZone(NSNumber) initWithInteger:a11];
  uint64_t v32 = a9;
  uint64_t v33 = a10;
  if ((a14 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  id v34 = 0;
LABEL_17:
  id v36 = v40;
  Class v35 = v41;
  id v37 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithItemReference:v40 reservationNumber:v30 bookingTime:v41 reservationStatus:v42 reservationHolderName:v29 actions:v28.super.isa lodgingBusinessLocation:v32 reservationDuration:v33 numberOfAdults:v31 numberOfChildren:v34];

  outlined destroy of Date?(v43, &demangling cache variable for type metadata for Date?);
  return v37;
}

id INLodgingReservation.init(itemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:url:lodgingBusinessLocation:reservationDuration:numberOfAdults:numberOfChildren:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
  uint64_t v50 = a5;
  id v51 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388]();
  uint64_t v22 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388]();
  uint64_t v24 = (char *)&v49 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v25 = (void *)MEMORY[0x216690CF0](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = 0;
  }
  uint64_t v55 = a4;
  outlined init with copy of Date?(a4, (uint64_t)v24, &demangling cache variable for type metadata for Date?);
  uint64_t v26 = type metadata accessor for Date();
  uint64_t v27 = *(void *)(v26 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v24, 1, v26) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
  }
  if (a7)
  {
    uint64_t v29 = (void *)MEMORY[0x216690CF0](a6, a7);
    swift_bridgeObjectRelease();
    Class v54 = isa;
    if (a8)
    {
LABEL_8:
      type metadata accessor for INReservationAction();
      v30.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v29 = 0;
    Class v54 = isa;
    if (a8) {
      goto LABEL_8;
    }
  }
  v30.super.Class isa = 0;
LABEL_11:
  uint64_t v53 = a9;
  outlined init with copy of Date?(a9, (uint64_t)v22, &demangling cache variable for type metadata for URL?);
  uint64_t v31 = type metadata accessor for URL();
  uint64_t v32 = *(void *)(v31 - 8);
  id v34 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v22, 1, v31) != 1)
  {
    URL._bridgeToObjectiveC()(v33);
    id v34 = v35;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v31);
  }
  Class v52 = v30.super.isa;
  if (a13) {
    id v36 = 0;
  }
  else {
    id v36 = [objc_allocWithZone(NSNumber) initWithInteger:a12];
  }
  uint64_t v37 = v50;
  if (a15) {
    id v38 = 0;
  }
  else {
    id v38 = [objc_allocWithZone(NSNumber) initWithInt:a14];
  }
  uint64_t v39 = v51;
  id v40 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v48 = v36;
  Class v41 = v36;
  uint64_t v42 = v34;
  uint64_t v47 = v34;
  Class v43 = v54;
  uint64_t v44 = v37;
  Class v45 = v52;
  id v51 = [v40 initWithItemReference:v39 reservationNumber:v25 bookingTime:v54 reservationStatus:v44 reservationHolderName:v29 reservationActions:v52 reservationURL:v47 lodgingBusinessLocation:a10 reservationDuration:a11 numberOfAdults:v48 numberOfChildren:v38];

  outlined destroy of Date?(v53, &demangling cache variable for type metadata for URL?);
  outlined destroy of Date?(v55, &demangling cache variable for type metadata for Date?);
  return v51;
}

id INLodgingReservation.numberOfAdults.getter()
{
  return INSetProfileInCarIntent.defaultProfile.getter((SEL *)&selRef_numberOfAdults);
}

id INLodgingReservation.numberOfChildren.getter()
{
  return INSetProfileInCarIntent.defaultProfile.getter((SEL *)&selRef_numberOfChildren);
}

uint64_t INGetCarLockStatusIntentResponse.locked.getter()
{
  id v1 = [v0 sel_locked];
  if (!v1) {
    return 2;
  }
  uint64_t v2 = v1;
  id v3 = [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

void key path getter for INGetCarLockStatusIntentResponse.locked : INGetCarLockStatusIntentResponse(id *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  id v3 = [*a1 sel_locked];
  if (v3)
  {
    int v4 = v3;
    unsigned __int8 v5 = [v3 sel_BOOLValue];
  }
  else
  {
    unsigned __int8 v5 = 2;
  }
  *a2 = v5;
}

void key path setter for INGetCarLockStatusIntentResponse.locked : INGetCarLockStatusIntentResponse(unsigned __int8 *a1, void **a2)
{
  int v2 = *a1;
  id v3 = *a2;
  if (v2 == 2) {
    id v4 = 0;
  }
  else {
    id v4 = [objc_allocWithZone(NSNumber) initWithBool:v2 & 1];
  }
  id v5 = v4;
  [v3 setLocked:];
}

void INGetCarLockStatusIntentResponse.locked.setter(char a1)
{
  if (a1 == 2) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_allocWithZone(NSNumber) initWithBool:(a1 & 1)];
  }
  id v4 = v3;
  [v1 setLocked:];
}

void (*INGetCarLockStatusIntentResponse.locked.modify(uint64_t a1))(uint64_t a1)
{
  int v2 = v1;
  *(void *)a1 = v2;
  id v4 = [v2 sel_locked];
  if (v4)
  {
    id v5 = v4;
    unsigned __int8 v6 = [v4 sel_BOOLValue];
  }
  else
  {
    unsigned __int8 v6 = 2;
  }
  *(unsigned char *)(a1 + 8) = v6;
  return INGetCarLockStatusIntentResponse.locked.modify;
}

void INGetCarLockStatusIntentResponse.locked.modify(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  if (v2 == 2) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_allocWithZone(NSNumber) initWithBool:v2 & 1];
  }
  id v4 = v3;
  [*(id *)a1 setLocked:];
}

INFocusStatus __swiftcall INFocusStatus.init(isFocused:)(Swift::Bool_optional isFocused)
{
  if (isFocused.value == 2) {
    id v2 = 0;
  }
  else {
    id v2 = [objc_allocWithZone(NSNumber) initWithBool:isFocused.value];
  }
  id v3 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithIsFocused:v2];

  return (INFocusStatus)v3;
}

uint64_t INFocusStatus.isFocused.getter()
{
  id v1 = [v0 isFocused];
  if (!v1) {
    return 2;
  }
  id v2 = v1;
  [v1 sel_BOOLValue];

  return (uint64_t)v3;
}

INSetRadioStationIntent __swiftcall INSetRadioStationIntent.init(radioType:frequency:stationName:channel:presetNumber:)(INRadioType radioType, Swift::Double_optional frequency, Swift::String_optional stationName, Swift::String_optional channel, Swift::Int_optional presetNumber)
{
  uint64_t v5 = *(void *)&presetNumber.is_nil;
  Swift::Int value = presetNumber.value;
  object = channel.value._object;
  uint64_t countAndFlagsBits = channel.value._countAndFlagsBits;
  id v9 = stationName.value._object;
  if (stationName.value._countAndFlagsBits)
  {
    id v11 = 0;
    if (channel.value._countAndFlagsBits)
    {
LABEL_3:
      uint64_t v12 = (void *)MEMORY[0x216690CF0](v9, countAndFlagsBits);
      swift_bridgeObjectRelease();
      char v13 = v18;
      if (value) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v14 = 0;
      if ((v13 & 1) == 0) {
        goto LABEL_5;
      }
LABEL_9:
      id v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    id v11 = [objc_allocWithZone(NSNumber) initWithDouble:*(double *)&frequency.is_nil];
    if (countAndFlagsBits) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  char v13 = v18;
  if (!value) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v14 = (void *)MEMORY[0x216690CF0](object, value);
  swift_bridgeObjectRelease();
  if (v13) {
    goto LABEL_9;
  }
LABEL_5:
  id v15 = [objc_allocWithZone(NSNumber) initWithInteger:v5];
LABEL_10:
  id v16 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithRadioType:radioType frequency:v11 stationName:v12 channel:v14 presetNumber:v15];

  return (INSetRadioStationIntent)v16;
}

id INSetRadioStationIntent.frequency.getter()
{
  id result = [v0 sel_frequency];
  id v2 = result;
  if (result)
  {
    [result doubleValue];
    uint64_t v4 = v3;

    return (id)v4;
  }
  return result;
}

id INSetRadioStationIntent.presetNumber.getter()
{
  id v1 = [v0 sel_presetNumber];
  id v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 integerValue];

  return v3;
}

id INStartPhotoPlaybackIntentResponse.searchResultsCount.getter()
{
  id v1 = [v0 sel_searchResultsCount];
  id v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 sel_integerValue];

  return v3;
}

void INStartPhotoPlaybackIntentResponse.searchResultsCount.setter(uint64_t a1, char a2)
{
  if (a2) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_allocWithZone(NSNumber) initWithInteger:a1];
  }
  id v4 = v3;
  [v2 setSearchResultsCount:];
}

void (*INStartPhotoPlaybackIntentResponse.searchResultsCount.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  id v3 = [v1 sel_searchResultsCount];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 integerValue];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v4 == 0;
  return INSearchForPhotosIntentResponse.searchResultsCount.modify;
}

NSMeasurement __swiftcall Measurement._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)MEMORY[0x270EEDF50]();
  result._doubleValue = v2;
  result._unit = v1;
  result.super.Class isa = v0;
  return result;
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1BD8]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1CE0]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t NSObject.hash(into:)()
{
  return MEMORY[0x270FA1190]();
}

uint64_t dispatch thunk of AnyKeyPath._kvcKeyPathString.getter()
{
  return MEMORY[0x270F9E680]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t __VaListBuilder.deallocStorage(wordCount:storage:)()
{
  return MEMORY[0x270F9ED50]();
}

uint64_t __VaListBuilder.va_list()()
{
  return MEMORY[0x270F9ED58]();
}

uint64_t type metadata accessor for __VaListBuilder()
{
  return MEMORY[0x270F9ED60]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t dispatch thunk of CVarArg._cVarArgEncoding.getter()
{
  return MEMORY[0x270F9FD48]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}
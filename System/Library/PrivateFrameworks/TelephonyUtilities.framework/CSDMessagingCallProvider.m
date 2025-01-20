@interface CSDMessagingCallProvider
+ (Class)emergencyHandlesType;
+ (Class)emergencyLabeledHandlesType;
+ (Class)handoffIdentifierType;
+ (Class)prioritizedSenderIdentitiesType;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasBundleURLString;
- (BOOL)hasIdentifier;
- (BOOL)hasLocalizedName;
- (BOOL)hasMaximumCallGroups;
- (BOOL)hasMaximumCallsPerCallGroup;
- (BOOL)hasOriginalRingtoneSoundURLString;
- (BOOL)hasRingtoneSoundURLString;
- (BOOL)hasSupportsAudioAndVideo;
- (BOOL)hasSupportsAudioOnly;
- (BOOL)hasSupportsEmergency;
- (BOOL)hasSupportsRecents;
- (BOOL)hasSupportsVoicemail;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsAudioAndVideo;
- (BOOL)supportsAudioOnly;
- (BOOL)supportsEmergency;
- (BOOL)supportsRecents;
- (BOOL)supportsVoicemail;
- (CSDMessagingCallProvider)initWithProvider:(id)a3;
- (NSArray)emergencyTUHandles;
- (NSArray)emergencyTULabeledHandles;
- (NSMutableArray)emergencyHandles;
- (NSMutableArray)emergencyLabeledHandles;
- (NSMutableArray)handoffIdentifiers;
- (NSMutableArray)prioritizedSenderIdentities;
- (NSOrderedSet)prioritizedTUSenderIdentities;
- (NSSet)supportedHandleTypes;
- (NSString)bundleIdentifier;
- (NSString)bundleURLString;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)originalRingtoneSoundURLString;
- (NSString)ringtoneSoundURLString;
- (TUCallProvider)provider;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)emergencyHandlesAtIndex:(unint64_t)a3;
- (id)emergencyLabeledHandlesAtIndex:(unint64_t)a3;
- (id)handoffIdentifierAtIndex:(unint64_t)a3;
- (id)prioritizedSenderIdentitiesAtIndex:(unint64_t)a3;
- (unint64_t)emergencyHandlesCount;
- (unint64_t)emergencyLabeledHandlesCount;
- (unint64_t)handoffIdentifiersCount;
- (unint64_t)hash;
- (unint64_t)prioritizedSenderIdentitiesCount;
- (unint64_t)protoSupportedHandleTypesCount;
- (unsigned)maximumCallGroups;
- (unsigned)maximumCallsPerCallGroup;
- (unsigned)protoSupportedHandleTypeAtIndex:(unint64_t)a3;
- (unsigned)protoSupportedHandleTypes;
- (void)addEmergencyHandles:(id)a3;
- (void)addEmergencyLabeledHandles:(id)a3;
- (void)addHandoffIdentifier:(id)a3;
- (void)addPrioritizedSenderIdentities:(id)a3;
- (void)addProtoSupportedHandleType:(unsigned int)a3;
- (void)clearEmergencyHandles;
- (void)clearEmergencyLabeledHandles;
- (void)clearHandoffIdentifiers;
- (void)clearPrioritizedSenderIdentities;
- (void)clearProtoSupportedHandleTypes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleURLString:(id)a3;
- (void)setEmergencyHandles:(id)a3;
- (void)setEmergencyLabeledHandles:(id)a3;
- (void)setEmergencyTUHandles:(id)a3;
- (void)setEmergencyTULabeledHandles:(id)a3;
- (void)setHandoffIdentifiers:(id)a3;
- (void)setHasMaximumCallGroups:(BOOL)a3;
- (void)setHasMaximumCallsPerCallGroup:(BOOL)a3;
- (void)setHasSupportsAudioAndVideo:(BOOL)a3;
- (void)setHasSupportsAudioOnly:(BOOL)a3;
- (void)setHasSupportsEmergency:(BOOL)a3;
- (void)setHasSupportsRecents:(BOOL)a3;
- (void)setHasSupportsVoicemail:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setMaximumCallGroups:(unsigned int)a3;
- (void)setMaximumCallsPerCallGroup:(unsigned int)a3;
- (void)setOriginalRingtoneSoundURLString:(id)a3;
- (void)setPrioritizedSenderIdentities:(id)a3;
- (void)setPrioritizedTUSenderIdentities:(id)a3;
- (void)setProtoSupportedHandleTypes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRingtoneSoundURLString:(id)a3;
- (void)setSupportedHandleTypes:(id)a3;
- (void)setSupportsAudioAndVideo:(BOOL)a3;
- (void)setSupportsAudioOnly:(BOOL)a3;
- (void)setSupportsEmergency:(BOOL)a3;
- (void)setSupportsRecents:(BOOL)a3;
- (void)setSupportsVoicemail:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCallProvider

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CSDMessagingCallProvider;
  [(CSDMessagingCallProvider *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasLocalizedName
{
  return self->_localizedName != 0;
}

- (BOOL)hasBundleURLString
{
  return self->_bundleURLString != 0;
}

- (void)setMaximumCallGroups:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maximumCallGroups = a3;
}

- (void)setHasMaximumCallGroups:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaximumCallGroups
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMaximumCallsPerCallGroup:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maximumCallsPerCallGroup = a3;
}

- (void)setHasMaximumCallsPerCallGroup:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaximumCallsPerCallGroup
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSupportsAudioOnly:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_supportsAudioOnly = a3;
}

- (void)setHasSupportsAudioOnly:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsAudioOnly
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSupportsAudioAndVideo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportsAudioAndVideo = a3;
}

- (void)setHasSupportsAudioAndVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsAudioAndVideo
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSupportsEmergency:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_supportsEmergency = a3;
}

- (void)setHasSupportsEmergency:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSupportsEmergency
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSupportsVoicemail:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_supportsVoicemail = a3;
}

- (void)setHasSupportsVoicemail:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSupportsVoicemail
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasRingtoneSoundURLString
{
  return self->_ringtoneSoundURLString != 0;
}

- (BOOL)hasOriginalRingtoneSoundURLString
{
  return self->_originalRingtoneSoundURLString != 0;
}

- (void)clearHandoffIdentifiers
{
}

- (void)addHandoffIdentifier:(id)a3
{
  id v4 = a3;
  handoffIdentifiers = self->_handoffIdentifiers;
  id v8 = v4;
  if (!handoffIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_handoffIdentifiers;
    self->_handoffIdentifiers = v6;

    id v4 = v8;
    handoffIdentifiers = self->_handoffIdentifiers;
  }
  [(NSMutableArray *)handoffIdentifiers addObject:v4];
}

- (unint64_t)handoffIdentifiersCount
{
  return (unint64_t)[(NSMutableArray *)self->_handoffIdentifiers count];
}

- (id)handoffIdentifierAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_handoffIdentifiers objectAtIndex:a3];
}

+ (Class)handoffIdentifierType
{
  return (Class)objc_opt_class();
}

- (unint64_t)protoSupportedHandleTypesCount
{
  return self->_protoSupportedHandleTypes.count;
}

- (unsigned)protoSupportedHandleTypes
{
  return self->_protoSupportedHandleTypes.list;
}

- (void)clearProtoSupportedHandleTypes
{
}

- (void)addProtoSupportedHandleType:(unsigned int)a3
{
}

- (unsigned)protoSupportedHandleTypeAtIndex:(unint64_t)a3
{
  p_protoSupportedHandleTypes = &self->_protoSupportedHandleTypes;
  unint64_t count = self->_protoSupportedHandleTypes.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_protoSupportedHandleTypes->list[a3];
}

- (void)setProtoSupportedHandleTypes:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)clearEmergencyLabeledHandles
{
}

- (void)addEmergencyLabeledHandles:(id)a3
{
  id v4 = a3;
  emergencyLabeledHandles = self->_emergencyLabeledHandles;
  id v8 = v4;
  if (!emergencyLabeledHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_emergencyLabeledHandles;
    self->_emergencyLabeledHandles = v6;

    id v4 = v8;
    emergencyLabeledHandles = self->_emergencyLabeledHandles;
  }
  [(NSMutableArray *)emergencyLabeledHandles addObject:v4];
}

- (unint64_t)emergencyLabeledHandlesCount
{
  return (unint64_t)[(NSMutableArray *)self->_emergencyLabeledHandles count];
}

- (id)emergencyLabeledHandlesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_emergencyLabeledHandles objectAtIndex:a3];
}

+ (Class)emergencyLabeledHandlesType
{
  return (Class)objc_opt_class();
}

- (void)setSupportsRecents:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_supportsRecents = a3;
}

- (void)setHasSupportsRecents:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSupportsRecents
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)clearPrioritizedSenderIdentities
{
}

- (void)addPrioritizedSenderIdentities:(id)a3
{
  id v4 = a3;
  prioritizedSenderIdentities = self->_prioritizedSenderIdentities;
  id v8 = v4;
  if (!prioritizedSenderIdentities)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_prioritizedSenderIdentities;
    self->_prioritizedSenderIdentities = v6;

    id v4 = v8;
    prioritizedSenderIdentities = self->_prioritizedSenderIdentities;
  }
  [(NSMutableArray *)prioritizedSenderIdentities addObject:v4];
}

- (unint64_t)prioritizedSenderIdentitiesCount
{
  return (unint64_t)[(NSMutableArray *)self->_prioritizedSenderIdentities count];
}

- (id)prioritizedSenderIdentitiesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_prioritizedSenderIdentities objectAtIndex:a3];
}

+ (Class)prioritizedSenderIdentitiesType
{
  return (Class)objc_opt_class();
}

- (void)clearEmergencyHandles
{
}

- (void)addEmergencyHandles:(id)a3
{
  id v4 = a3;
  emergencyHandles = self->_emergencyHandles;
  id v8 = v4;
  if (!emergencyHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_emergencyHandles;
    self->_emergencyHandles = v6;

    id v4 = v8;
    emergencyHandles = self->_emergencyHandles;
  }
  [(NSMutableArray *)emergencyHandles addObject:v4];
}

- (unint64_t)emergencyHandlesCount
{
  return (unint64_t)[(NSMutableArray *)self->_emergencyHandles count];
}

- (id)emergencyHandlesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_emergencyHandles objectAtIndex:a3];
}

+ (Class)emergencyHandlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingCallProvider;
  char v3 = [(CSDMessagingCallProvider *)&v7 description];
  id v4 = [(CSDMessagingCallProvider *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  localizedName = self->_localizedName;
  if (localizedName) {
    [v4 setObject:localizedName forKey:@"localizedName"];
  }
  bundleURLString = self->_bundleURLString;
  if (bundleURLString) {
    [v4 setObject:bundleURLString forKey:@"bundleURLString"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v38 = +[NSNumber numberWithUnsignedInt:self->_maximumCallGroups];
    [v4 setObject:v38 forKey:@"maximumCallGroups"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_56;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v39 = +[NSNumber numberWithUnsignedInt:self->_maximumCallsPerCallGroup];
  [v4 setObject:v39 forKey:@"maximumCallsPerCallGroup"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_57;
  }
LABEL_56:
  v40 = +[NSNumber numberWithBool:self->_supportsAudioOnly];
  [v4 setObject:v40 forKey:@"supportsAudioOnly"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_58;
  }
LABEL_57:
  v41 = +[NSNumber numberWithBool:self->_supportsAudioAndVideo];
  [v4 setObject:v41 forKey:@"supportsAudioAndVideo"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_58:
  v42 = +[NSNumber numberWithBool:self->_supportsEmergency];
  [v4 setObject:v42 forKey:@"supportsEmergency"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    v9 = +[NSNumber numberWithBool:self->_supportsVoicemail];
    [v4 setObject:v9 forKey:@"supportsVoicemail"];
  }
LABEL_14:
  ringtoneSoundURLString = self->_ringtoneSoundURLString;
  if (ringtoneSoundURLString) {
    [v4 setObject:ringtoneSoundURLString forKey:@"ringtoneSoundURLString"];
  }
  originalRingtoneSoundURLString = self->_originalRingtoneSoundURLString;
  if (originalRingtoneSoundURLString) {
    [v4 setObject:originalRingtoneSoundURLString forKey:@"originalRingtoneSoundURLString"];
  }
  handoffIdentifiers = self->_handoffIdentifiers;
  if (handoffIdentifiers) {
    [v4 setObject:handoffIdentifiers forKey:@"handoffIdentifier"];
  }
  v13 = PBRepeatedUInt32NSArray();
  [v4 setObject:v13 forKey:@"protoSupportedHandleType"];

  if ([(NSMutableArray *)self->_emergencyLabeledHandles count])
  {
    id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_emergencyLabeledHandles, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v15 = self->_emergencyLabeledHandles;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v52;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v52 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v51 + 1) + 8 * i) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"emergencyLabeledHandles"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v21 = +[NSNumber numberWithBool:self->_supportsRecents];
    [v4 setObject:v21 forKey:@"supportsRecents"];
  }
  if ([(NSMutableArray *)self->_prioritizedSenderIdentities count])
  {
    id v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_prioritizedSenderIdentities, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v23 = self->_prioritizedSenderIdentities;
    id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v48;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v48 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v25);
    }

    [v4 setObject:v22 forKey:@"prioritizedSenderIdentities"];
  }
  if ([(NSMutableArray *)self->_emergencyHandles count])
  {
    id v29 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_emergencyHandles, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v30 = self->_emergencyHandles;
    id v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v44;
      do
      {
        for (k = 0; k != v32; k = (char *)k + 1)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * (void)k), "dictionaryRepresentation", (void)v43);
          [v29 addObject:v35];
        }
        id v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v32);
    }

    [v4 setObject:v29 forKey:@"emergencyHandles"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008DC20(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_localizedName) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleURLString) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_56;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_13:
  }
    PBDataWriterWriteBOOLField();
LABEL_14:
  if (self->_ringtoneSoundURLString) {
    PBDataWriterWriteStringField();
  }
  if (self->_originalRingtoneSoundURLString) {
    PBDataWriterWriteStringField();
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v6 = self->_handoffIdentifiers;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v8);
  }

  if (self->_protoSupportedHandleTypes.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v11;
    }
    while (v11 < self->_protoSupportedHandleTypes.count);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v12 = self->_emergencyLabeledHandles;
  v13 = (char *)[(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      id v14 = (char *)[(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v14);
  }

  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = self->_prioritizedSenderIdentities;
  uint64_t v18 = (char *)[(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v18)
  {
    v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
      }
      v19 = (char *)[(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v19);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = self->_emergencyHandles;
  v23 = (char *)[(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
      }
      id v24 = (char *)[(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }

  if (self->_bundleIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v25 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v25;
  }
  if (self->_localizedName)
  {
    objc_msgSend(v25, "setLocalizedName:");
    id v4 = v25;
  }
  if (self->_bundleURLString)
  {
    objc_msgSend(v25, "setBundleURLString:");
    id v4 = v25;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 22) = self->_maximumCallGroups;
    v4[128] |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_47;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 23) = self->_maximumCallsPerCallGroup;
  v4[128] |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  v4[121] = self->_supportsAudioOnly;
  v4[128] |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  v4[120] = self->_supportsAudioAndVideo;
  v4[128] |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_49:
  v4[122] = self->_supportsEmergency;
  v4[128] |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    v4[124] = self->_supportsVoicemail;
    v4[128] |= 0x40u;
  }
LABEL_14:
  if (self->_ringtoneSoundURLString) {
    objc_msgSend(v25, "setRingtoneSoundURLString:");
  }
  if (self->_originalRingtoneSoundURLString) {
    objc_msgSend(v25, "setOriginalRingtoneSoundURLString:");
  }
  if ([(CSDMessagingCallProvider *)self handoffIdentifiersCount])
  {
    [v25 clearHandoffIdentifiers];
    unint64_t v6 = [(CSDMessagingCallProvider *)self handoffIdentifiersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CSDMessagingCallProvider *)self handoffIdentifierAtIndex:i];
        [v25 addHandoffIdentifier:v9];
      }
    }
  }
  if ([(CSDMessagingCallProvider *)self protoSupportedHandleTypesCount])
  {
    [v25 clearProtoSupportedHandleTypes];
    unint64_t v10 = [(CSDMessagingCallProvider *)self protoSupportedHandleTypesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        objc_msgSend(v25, "addProtoSupportedHandleType:", -[CSDMessagingCallProvider protoSupportedHandleTypeAtIndex:](self, "protoSupportedHandleTypeAtIndex:", j));
    }
  }
  if ([(CSDMessagingCallProvider *)self emergencyLabeledHandlesCount])
  {
    [v25 clearEmergencyLabeledHandles];
    unint64_t v13 = [(CSDMessagingCallProvider *)self emergencyLabeledHandlesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        id v16 = [(CSDMessagingCallProvider *)self emergencyLabeledHandlesAtIndex:k];
        [v25 addEmergencyLabeledHandles:v16];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v25[123] = self->_supportsRecents;
    v25[128] |= 0x20u;
  }
  if ([(CSDMessagingCallProvider *)self prioritizedSenderIdentitiesCount])
  {
    [v25 clearPrioritizedSenderIdentities];
    unint64_t v17 = [(CSDMessagingCallProvider *)self prioritizedSenderIdentitiesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(CSDMessagingCallProvider *)self prioritizedSenderIdentitiesAtIndex:m];
        [v25 addPrioritizedSenderIdentities:v20];
      }
    }
  }
  if ([(CSDMessagingCallProvider *)self emergencyHandlesCount])
  {
    [v25 clearEmergencyHandles];
    unint64_t v21 = [(CSDMessagingCallProvider *)self emergencyHandlesCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        id v24 = [(CSDMessagingCallProvider *)self emergencyHandlesAtIndex:n];
        [v25 addEmergencyHandles:v24];
      }
    }
  }
  if (self->_bundleIdentifier) {
    objc_msgSend(v25, "setBundleIdentifier:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v7 = (void *)v5[9];
  v5[9] = v6;

  id v8 = [(NSString *)self->_localizedName copyWithZone:a3];
  uint64_t v9 = (void *)v5[10];
  v5[10] = v8;

  id v10 = [(NSString *)self->_bundleURLString copyWithZone:a3];
  unint64_t v11 = (void *)v5[5];
  v5[5] = v10;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 22) = self->_maximumCallGroups;
    *((unsigned char *)v5 + 128) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 23) = self->_maximumCallsPerCallGroup;
  *((unsigned char *)v5 + 128) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((unsigned char *)v5 + 121) = self->_supportsAudioOnly;
  *((unsigned char *)v5 + 128) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)v5 + 120) = self->_supportsAudioAndVideo;
  *((unsigned char *)v5 + 128) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_43:
  *((unsigned char *)v5 + 122) = self->_supportsEmergency;
  *((unsigned char *)v5 + 128) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    *((unsigned char *)v5 + 124) = self->_supportsVoicemail;
    *((unsigned char *)v5 + 128) |= 0x40u;
  }
LABEL_8:
  id v13 = [(NSString *)self->_ringtoneSoundURLString copyWithZone:a3];
  unint64_t v14 = (void *)v5[14];
  v5[14] = v13;

  id v15 = [(NSString *)self->_originalRingtoneSoundURLString copyWithZone:a3];
  id v16 = (void *)v5[12];
  v5[12] = v15;

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  unint64_t v17 = self->_handoffIdentifiers;
  id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v57 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v56 + 1) + 8 * i) copyWithZone:a3];
        [v5 addHandoffIdentifier:v22];
      }
      id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v56 objects:v63 count:16];
    }
    while (v19);
  }

  PBRepeatedUInt32Copy();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v23 = self->_emergencyLabeledHandles;
  id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v25; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v53 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = [*(id *)(*((void *)&v52 + 1) + 8 * (void)j) copyWithZone:a3];
        [v5 addEmergencyLabeledHandles:v28];
      }
      id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v25);
  }

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((unsigned char *)v5 + 123) = self->_supportsRecents;
    *((unsigned char *)v5 + 128) |= 0x20u;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v29 = self->_prioritizedSenderIdentities;
  id v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v31; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v49 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)k) copyWithZone:a3];
        [v5 addPrioritizedSenderIdentities:v34];
      }
      id v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v31);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v35 = self->_emergencyHandles;
  id v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v37; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(v35);
        }
        id v40 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * (void)m), "copyWithZone:", a3, (void)v44);
        [v5 addEmergencyHandles:v40];
      }
      id v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }
    while (v37);
  }

  id v41 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  long long v42 = (void *)v5[4];
  v5[4] = v41;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_73;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_73;
    }
  }
  localizedName = self->_localizedName;
  if ((unint64_t)localizedName | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](localizedName, "isEqual:")) {
      goto LABEL_73;
    }
  }
  bundleURLString = self->_bundleURLString;
  if ((unint64_t)bundleURLString | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](bundleURLString, "isEqual:")) {
      goto LABEL_73;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 128) & 1) == 0 || self->_maximumCallGroups != *((_DWORD *)v4 + 22)) {
      goto LABEL_73;
    }
  }
  else if (*((unsigned char *)v4 + 128))
  {
    goto LABEL_73;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 2) == 0 || self->_maximumCallsPerCallGroup != *((_DWORD *)v4 + 23)) {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 2) != 0)
  {
    goto LABEL_73;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 8) == 0) {
      goto LABEL_73;
    }
    if (self->_supportsAudioOnly)
    {
      if (!*((unsigned char *)v4 + 121)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 121))
    {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 8) != 0)
  {
    goto LABEL_73;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 4) == 0) {
      goto LABEL_73;
    }
    if (self->_supportsAudioAndVideo)
    {
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 120))
    {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 4) != 0)
  {
    goto LABEL_73;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 0x10) == 0) {
      goto LABEL_73;
    }
    if (self->_supportsEmergency)
    {
      if (!*((unsigned char *)v4 + 122)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 122))
    {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 0x10) != 0)
  {
    goto LABEL_73;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 0x40) == 0) {
      goto LABEL_73;
    }
    if (self->_supportsVoicemail)
    {
      if (!*((unsigned char *)v4 + 124)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 124))
    {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 0x40) != 0)
  {
    goto LABEL_73;
  }
  ringtoneSoundURLString = self->_ringtoneSoundURLString;
  if ((unint64_t)ringtoneSoundURLString | *((void *)v4 + 14)
    && !-[NSString isEqual:](ringtoneSoundURLString, "isEqual:"))
  {
    goto LABEL_73;
  }
  originalRingtoneSoundURLString = self->_originalRingtoneSoundURLString;
  if ((unint64_t)originalRingtoneSoundURLString | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](originalRingtoneSoundURLString, "isEqual:")) {
      goto LABEL_73;
    }
  }
  handoffIdentifiers = self->_handoffIdentifiers;
  if ((unint64_t)handoffIdentifiers | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](handoffIdentifiers, "isEqual:")) {
      goto LABEL_73;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_73;
  }
  emergencyLabeledHandles = self->_emergencyLabeledHandles;
  if ((unint64_t)emergencyLabeledHandles | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](emergencyLabeledHandles, "isEqual:")) {
      goto LABEL_73;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 0x20) != 0)
    {
      if (self->_supportsRecents)
      {
        if (!*((unsigned char *)v4 + 123)) {
          goto LABEL_73;
        }
        goto LABEL_67;
      }
      if (!*((unsigned char *)v4 + 123)) {
        goto LABEL_67;
      }
    }
LABEL_73:
    unsigned __int8 v15 = 0;
    goto LABEL_74;
  }
  if ((*((unsigned char *)v4 + 128) & 0x20) != 0) {
    goto LABEL_73;
  }
LABEL_67:
  prioritizedSenderIdentities = self->_prioritizedSenderIdentities;
  if ((unint64_t)prioritizedSenderIdentities | *((void *)v4 + 13)
    && !-[NSMutableArray isEqual:](prioritizedSenderIdentities, "isEqual:"))
  {
    goto LABEL_73;
  }
  emergencyHandles = self->_emergencyHandles;
  if ((unint64_t)emergencyHandles | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](emergencyHandles, "isEqual:")) {
      goto LABEL_73;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 4)) {
    unsigned __int8 v15 = -[NSString isEqual:](bundleIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v15 = 1;
  }
LABEL_74:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v22 = [(NSString *)self->_identifier hash];
  NSUInteger v21 = [(NSString *)self->_localizedName hash];
  NSUInteger v20 = [(NSString *)self->_bundleURLString hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v19 = 2654435761 * self->_maximumCallGroups;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v18 = 2654435761 * self->_maximumCallsPerCallGroup;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v16 = 2654435761 * self->_supportsAudioOnly;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v3 = 2654435761 * self->_supportsAudioAndVideo;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v4 = 2654435761 * self->_supportsEmergency;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v5 = 2654435761 * self->_supportsVoicemail;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
LABEL_14:
  NSUInteger v6 = [(NSString *)self->_ringtoneSoundURLString hash];
  NSUInteger v7 = [(NSString *)self->_originalRingtoneSoundURLString hash];
  unint64_t v8 = (unint64_t)[(NSMutableArray *)self->_handoffIdentifiers hash];
  uint64_t v9 = PBRepeatedUInt32Hash();
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_emergencyLabeledHandles hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v11 = 2654435761 * self->_supportsRecents;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  unint64_t v13 = (unint64_t)[(NSMutableArray *)self->_prioritizedSenderIdentities hash];
  unint64_t v14 = v13 ^ (unint64_t)[(NSMutableArray *)self->_emergencyHandles hash];
  return v12 ^ v14 ^ [(NSString *)self->_bundleIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 9)) {
    -[CSDMessagingCallProvider setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v4 + 10)) {
    -[CSDMessagingCallProvider setLocalizedName:](self, "setLocalizedName:");
  }
  if (*((void *)v4 + 5)) {
    -[CSDMessagingCallProvider setBundleURLString:](self, "setBundleURLString:");
  }
  char v5 = *((unsigned char *)v4 + 128);
  if (v5)
  {
    self->_maximumCallGroups = *((_DWORD *)v4 + 22);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 128);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_maximumCallsPerCallGroup = *((_DWORD *)v4 + 23);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 128);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_supportsAudioOnly = *((unsigned char *)v4 + 121);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 128);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_supportsAudioAndVideo = *((unsigned char *)v4 + 120);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 128);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_58:
  self->_supportsEmergency = *((unsigned char *)v4 + 122);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 128) & 0x40) != 0)
  {
LABEL_13:
    self->_supportsVoicemail = *((unsigned char *)v4 + 124);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_14:
  if (*((void *)v4 + 14)) {
    -[CSDMessagingCallProvider setRingtoneSoundURLString:](self, "setRingtoneSoundURLString:");
  }
  if (*((void *)v4 + 12)) {
    -[CSDMessagingCallProvider setOriginalRingtoneSoundURLString:](self, "setOriginalRingtoneSoundURLString:");
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = *((id *)v4 + 8);
  id v7 = [v6 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CSDMessagingCallProvider *)self addHandoffIdentifier:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v8);
  }

  uint64_t v11 = (char *)[v4 protoSupportedHandleTypesCount];
  if (v11)
  {
    NSUInteger v12 = v11;
    for (uint64_t j = 0; j != v12; ++j)
      -[CSDMessagingCallProvider addProtoSupportedHandleType:](self, "addProtoSupportedHandleType:", [v4 protoSupportedHandleTypeAtIndex:j]);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = *((id *)v4 + 7);
  id v15 = [v14 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v16; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        [(CSDMessagingCallProvider *)self addEmergencyLabeledHandles:*(void *)(*((void *)&v37 + 1) + 8 * (void)k)];
      }
      id v16 = [v14 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v16);
  }

  if ((*((unsigned char *)v4 + 128) & 0x20) != 0)
  {
    self->_supportsRecents = *((unsigned char *)v4 + 123);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = *((id *)v4 + 13);
  id v20 = [v19 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t m = 0; m != v21; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        [(CSDMessagingCallProvider *)self addPrioritizedSenderIdentities:*(void *)(*((void *)&v33 + 1) + 8 * (void)m)];
      }
      id v21 = [v19 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v21);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v24 = *((id *)v4 + 6);
  id v25 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t n = 0; n != v26; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        -[CSDMessagingCallProvider addEmergencyHandles:](self, "addEmergencyHandles:", *(void *)(*((void *)&v29 + 1) + 8 * (void)n), (void)v29);
      }
      id v26 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v26);
  }

  if (*((void *)v4 + 4)) {
    -[CSDMessagingCallProvider setBundleIdentifier:](self, "setBundleIdentifier:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)bundleURLString
{
  return self->_bundleURLString;
}

- (void)setBundleURLString:(id)a3
{
}

- (unsigned)maximumCallGroups
{
  return self->_maximumCallGroups;
}

- (unsigned)maximumCallsPerCallGroup
{
  return self->_maximumCallsPerCallGroup;
}

- (BOOL)supportsAudioOnly
{
  return self->_supportsAudioOnly;
}

- (BOOL)supportsAudioAndVideo
{
  return self->_supportsAudioAndVideo;
}

- (BOOL)supportsEmergency
{
  return self->_supportsEmergency;
}

- (BOOL)supportsVoicemail
{
  return self->_supportsVoicemail;
}

- (NSString)ringtoneSoundURLString
{
  return self->_ringtoneSoundURLString;
}

- (void)setRingtoneSoundURLString:(id)a3
{
}

- (NSString)originalRingtoneSoundURLString
{
  return self->_originalRingtoneSoundURLString;
}

- (void)setOriginalRingtoneSoundURLString:(id)a3
{
}

- (NSMutableArray)handoffIdentifiers
{
  return self->_handoffIdentifiers;
}

- (void)setHandoffIdentifiers:(id)a3
{
}

- (NSMutableArray)emergencyLabeledHandles
{
  return self->_emergencyLabeledHandles;
}

- (void)setEmergencyLabeledHandles:(id)a3
{
}

- (BOOL)supportsRecents
{
  return self->_supportsRecents;
}

- (NSMutableArray)prioritizedSenderIdentities
{
  return self->_prioritizedSenderIdentities;
}

- (void)setPrioritizedSenderIdentities:(id)a3
{
}

- (NSMutableArray)emergencyHandles
{
  return self->_emergencyHandles;
}

- (void)setEmergencyHandles:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringtoneSoundURLString, 0);
  objc_storeStrong((id *)&self->_prioritizedSenderIdentities, 0);
  objc_storeStrong((id *)&self->_originalRingtoneSoundURLString, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_handoffIdentifiers, 0);
  objc_storeStrong((id *)&self->_emergencyLabeledHandles, 0);
  objc_storeStrong((id *)&self->_emergencyHandles, 0);
  objc_storeStrong((id *)&self->_bundleURLString, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (CSDMessagingCallProvider)initWithProvider:(id)a3
{
  id v4 = a3;
  char v5 = [(CSDMessagingCallProvider *)self init];
  if (v5)
  {
    id v6 = [v4 identifier];
    [(CSDMessagingCallProvider *)v5 setIdentifier:v6];

    id v7 = [v4 localizedName];
    [(CSDMessagingCallProvider *)v5 setLocalizedName:v7];

    id v8 = [v4 handoffIdentifiers];
    id v9 = [v8 mutableCopy];
    [(CSDMessagingCallProvider *)v5 setHandoffIdentifiers:v9];

    unint64_t v10 = [v4 bundleURL];
    uint64_t v11 = [v10 absoluteString];
    [(CSDMessagingCallProvider *)v5 setBundleURLString:v11];

    NSUInteger v12 = [v4 bundleIdentifier];
    [(CSDMessagingCallProvider *)v5 setBundleIdentifier:v12];

    unint64_t v13 = [v4 ringtoneSoundURL];
    id v14 = [v13 absoluteString];
    [(CSDMessagingCallProvider *)v5 setRingtoneSoundURLString:v14];

    id v15 = [v4 originalRingtoneSoundURL];
    id v16 = [v15 absoluteString];
    [(CSDMessagingCallProvider *)v5 setOriginalRingtoneSoundURLString:v16];

    -[CSDMessagingCallProvider setMaximumCallGroups:](v5, "setMaximumCallGroups:", [v4 maximumCallGroups]);
    -[CSDMessagingCallProvider setMaximumCallsPerCallGroup:](v5, "setMaximumCallsPerCallGroup:", [v4 maximumCallsPerCallGroup]);
    -[CSDMessagingCallProvider setSupportsAudioOnly:](v5, "setSupportsAudioOnly:", [v4 supportsAudioOnly]);
    -[CSDMessagingCallProvider setSupportsAudioAndVideo:](v5, "setSupportsAudioAndVideo:", [v4 supportsAudioAndVideo]);
    -[CSDMessagingCallProvider setSupportsEmergency:](v5, "setSupportsEmergency:", [v4 supportsEmergency]);
    -[CSDMessagingCallProvider setSupportsVoicemail:](v5, "setSupportsVoicemail:", [v4 supportsVoicemail]);
    -[CSDMessagingCallProvider setSupportsRecents:](v5, "setSupportsRecents:", [v4 supportsRecents]);
    uint64_t v17 = [v4 supportedHandleTypes];
    [(CSDMessagingCallProvider *)v5 setSupportedHandleTypes:v17];

    uint64_t v18 = [v4 emergencyHandles];
    [(CSDMessagingCallProvider *)v5 setEmergencyTUHandles:v18];

    id v19 = [v4 emergencyLabeledHandles];
    [(CSDMessagingCallProvider *)v5 setEmergencyTULabeledHandles:v19];

    id v20 = [v4 prioritizedSenderIdentities];
    [(CSDMessagingCallProvider *)v5 setPrioritizedTUSenderIdentities:v20];
  }
  return v5;
}

- (TUCallProvider)provider
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 138412290;
    long long v36 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing TUCallProvider from %@", (uint8_t *)&v35, 0xCu);
  }

  id v4 = objc_alloc((Class)TUCallProvider);
  char v5 = [(CSDMessagingCallProvider *)self identifier];
  id v6 = [v4 initWithIdentifier:v5];

  id v7 = [(CSDMessagingCallProvider *)self localizedName];
  [v6 setLocalizedName:v7];

  id v8 = [(CSDMessagingCallProvider *)self bundleURLString];
  if (v8)
  {
    id v9 = [(CSDMessagingCallProvider *)self bundleURLString];
    unint64_t v10 = +[NSURL URLWithString:v9];
    [v6 setBundleURL:v10];
  }
  else
  {
    [v6 setBundleURL:0];
  }

  uint64_t v11 = [v6 bundleURL];
  unsigned int v12 = [v11 isFileURL];

  if (!v12) {
    goto LABEL_10;
  }
  unint64_t v13 = [v6 bundleURL];
  id v14 = +[NSBundle bundleWithURL:v13];

  id v15 = [v14 bundleIdentifier];
  id v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v6 bundleURL];
    int v35 = 138412546;
    long long v36 = v17;
    __int16 v37 = 2112;
    long long v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Bundle for bundleURL: %@ is %@", (uint8_t *)&v35, 0x16u);
  }
  if (!v15)
  {
LABEL_10:
    id v15 = [(CSDMessagingCallProvider *)self bundleIdentifier];

    if (v15)
    {
      uint64_t v18 = [(CSDMessagingCallProvider *)self bundleIdentifier];
      id v19 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v18 allowPlaceholder:0 error:0];

      id v15 = [(CSDMessagingCallProvider *)self bundleIdentifier];
      if (v19)
      {
        id v20 = [v19 URL];
        [v6 setBundleURL:v20];
      }
      id v21 = sub_100008DCC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [(CSDMessagingCallProvider *)self bundleIdentifier];
        int v35 = 138412546;
        long long v36 = v22;
        __int16 v37 = 2112;
        long long v38 = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Bundle for provider bundle ID: %@ bundle: %@", (uint8_t *)&v35, 0x16u);
      }
    }
  }
  [v6 setBundleIdentifier:v15];
  v23 = [(CSDMessagingCallProvider *)self handoffIdentifiers];
  [v6 setHandoffIdentifiers:v23];

  id v24 = [(CSDMessagingCallProvider *)self ringtoneSoundURLString];
  if (v24)
  {
    id v25 = [(CSDMessagingCallProvider *)self ringtoneSoundURLString];
    id v26 = +[NSURL URLWithString:v25];
    [v6 setRingtoneSoundURL:v26];
  }
  else
  {
    [v6 setRingtoneSoundURL:0];
  }

  uint64_t v27 = [(CSDMessagingCallProvider *)self originalRingtoneSoundURLString];
  if (v27)
  {
    id v28 = [(CSDMessagingCallProvider *)self originalRingtoneSoundURLString];
    long long v29 = +[NSURL URLWithString:v28];
    [v6 setOriginalRingtoneSoundURL:v29];
  }
  else
  {
    [v6 setOriginalRingtoneSoundURL:0];
  }

  objc_msgSend(v6, "setMaximumCallGroups:", -[CSDMessagingCallProvider maximumCallGroups](self, "maximumCallGroups"));
  objc_msgSend(v6, "setMaximumCallsPerCallGroup:", -[CSDMessagingCallProvider maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup"));
  objc_msgSend(v6, "setSupportsAudioOnly:", -[CSDMessagingCallProvider supportsAudioOnly](self, "supportsAudioOnly"));
  objc_msgSend(v6, "setSupportsAudioAndVideo:", -[CSDMessagingCallProvider supportsAudioAndVideo](self, "supportsAudioAndVideo"));
  objc_msgSend(v6, "setSupportsEmergency:", -[CSDMessagingCallProvider supportsEmergency](self, "supportsEmergency"));
  objc_msgSend(v6, "setSupportsVoicemail:", -[CSDMessagingCallProvider supportsVoicemail](self, "supportsVoicemail"));
  objc_msgSend(v6, "setSupportsRecents:", -[CSDMessagingCallProvider supportsRecents](self, "supportsRecents"));
  long long v30 = [(CSDMessagingCallProvider *)self supportedHandleTypes];
  [v6 setSupportedHandleTypes:v30];

  long long v31 = [(CSDMessagingCallProvider *)self emergencyTUHandles];
  [v6 setEmergencyHandles:v31];

  long long v32 = [(CSDMessagingCallProvider *)self emergencyTULabeledHandles];
  [v6 setEmergencyLabeledHandles:v32];

  long long v33 = [(CSDMessagingCallProvider *)self prioritizedTUSenderIdentities];
  [v6 setPrioritizedSenderIdentities:v33];

  return (TUCallProvider *)v6;
}

- (NSSet)supportedHandleTypes
{
  uint64_t v3 = +[NSMutableSet setWithCapacity:[(CSDMessagingCallProvider *)self protoSupportedHandleTypesCount]];
  if ([(CSDMessagingCallProvider *)self protoSupportedHandleTypesCount])
  {
    unint64_t v4 = 0;
    do
    {
      char v5 = +[NSNumber numberWithInteger:[(CSDMessagingCallProvider *)self protoSupportedHandleTypeAtIndex:v4]];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(CSDMessagingCallProvider *)self protoSupportedHandleTypesCount]);
  }
  id v6 = [v3 copy];

  return (NSSet *)v6;
}

- (void)setSupportedHandleTypes:(id)a3
{
  id v4 = a3;
  [(CSDMessagingCallProvider *)self clearProtoSupportedHandleTypes];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CSDMessagingCallProvider addProtoSupportedHandleType:](self, "addProtoSupportedHandleType:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "unsignedIntValue", (void)v10));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSArray)emergencyTUHandles
{
  uint64_t v3 = [(CSDMessagingCallProvider *)self emergencyHandles];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(CSDMessagingCallProvider *)self emergencyHandles];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "tuHandle", v16);
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          long long v13 = sub_100008DCC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot create emergencyTUHandle from CSDMessagingHandle %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  id v14 = [v4 copy];

  return (NSArray *)v14;
}

- (void)setEmergencyTUHandles:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = +[CSDMessagingHandle handleWithTUHandle:](CSDMessagingHandle, "handleWithTUHandle:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
        [v5 addObject:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(CSDMessagingCallProvider *)self setEmergencyHandles:v5];
}

- (NSArray)emergencyTULabeledHandles
{
  uint64_t v3 = [(CSDMessagingCallProvider *)self emergencyLabeledHandles];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(CSDMessagingCallProvider *)self emergencyLabeledHandles];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "tuLabeledHandle", v16);
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          long long v13 = sub_100008DCC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot create emergencyTULabeledHandle from CSDMessagingLabeledHandle %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  id v14 = [v4 copy];

  return (NSArray *)v14;
}

- (void)setEmergencyTULabeledHandles:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = +[CSDMessagingLabeledHandle handleWithTULabeledHandle:](CSDMessagingLabeledHandle, "handleWithTULabeledHandle:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
        [v5 addObject:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(CSDMessagingCallProvider *)self setEmergencyLabeledHandles:v5];
}

- (NSOrderedSet)prioritizedTUSenderIdentities
{
  uint64_t v3 = [(CSDMessagingCallProvider *)self prioritizedSenderIdentities];
  id v4 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v3 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CSDMessagingCallProvider *)self prioritizedSenderIdentities];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) tuSenderIdentity];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return (NSOrderedSet *)v11;
}

- (void)setPrioritizedTUSenderIdentities:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        long long v12 = [CSDMessagingSenderIdentity alloc];
        long long v13 = -[CSDMessagingSenderIdentity initWithTUSenderIdentity:](v12, "initWithTUSenderIdentity:", v11, (void)v14);
        [v5 addObject:v13];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(CSDMessagingCallProvider *)self setPrioritizedSenderIdentities:v5];
}

@end
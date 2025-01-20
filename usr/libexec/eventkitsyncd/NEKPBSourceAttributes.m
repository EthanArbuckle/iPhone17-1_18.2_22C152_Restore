@interface NEKPBSourceAttributes
- (BOOL)allowsCalendarAddDeleteModify;
- (BOOL)allowsEvents;
- (BOOL)allowsTasks;
- (BOOL)hasAccountPersistentID;
- (BOOL)hasAllowsCalendarAddDeleteModify;
- (BOOL)hasAllowsEvents;
- (BOOL)hasAllowsTasks;
- (BOOL)hasConstraintsDescriptionPath;
- (BOOL)hasCreatorBundleID;
- (BOOL)hasCreatorCodeSigningIdentity;
- (BOOL)hasDefaultAlarmOffset;
- (BOOL)hasExternalID;
- (BOOL)hasExternalModificationTag;
- (BOOL)hasIsBirthdayStore;
- (BOOL)hasIsEnabled;
- (BOOL)hasIsFacebook;
- (BOOL)hasIsLocalStore;
- (BOOL)hasName;
- (BOOL)hasOnlyCreatorCanModify;
- (BOOL)hasSnoozeAlarmRequiresDetach;
- (BOOL)hasSupportsAlarmAcknowledgedDate;
- (BOOL)hasSupportsSharedCalendars;
- (BOOL)hasType;
- (BOOL)hasUsesSelfAttendee;
- (BOOL)isBirthdayStore;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFacebook;
- (BOOL)isLocalStore;
- (BOOL)onlyCreatorCanModify;
- (BOOL)readFrom:(id)a3;
- (BOOL)snoozeAlarmRequiresDetach;
- (BOOL)supportsAlarmAcknowledgedDate;
- (BOOL)supportsSharedCalendars;
- (BOOL)usesSelfAttendee;
- (NSString)accountPersistentID;
- (NSString)constraintsDescriptionPath;
- (NSString)creatorBundleID;
- (NSString)creatorCodeSigningIdentity;
- (NSString)externalID;
- (NSString)externalModificationTag;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)defaultAlarmOffset;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountPersistentID:(id)a3;
- (void)setAllowsCalendarAddDeleteModify:(BOOL)a3;
- (void)setAllowsEvents:(BOOL)a3;
- (void)setAllowsTasks:(BOOL)a3;
- (void)setConstraintsDescriptionPath:(id)a3;
- (void)setCreatorBundleID:(id)a3;
- (void)setCreatorCodeSigningIdentity:(id)a3;
- (void)setDefaultAlarmOffset:(unsigned int)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setHasAllowsCalendarAddDeleteModify:(BOOL)a3;
- (void)setHasAllowsEvents:(BOOL)a3;
- (void)setHasAllowsTasks:(BOOL)a3;
- (void)setHasDefaultAlarmOffset:(BOOL)a3;
- (void)setHasIsBirthdayStore:(BOOL)a3;
- (void)setHasIsEnabled:(BOOL)a3;
- (void)setHasIsFacebook:(BOOL)a3;
- (void)setHasIsLocalStore:(BOOL)a3;
- (void)setHasOnlyCreatorCanModify:(BOOL)a3;
- (void)setHasSnoozeAlarmRequiresDetach:(BOOL)a3;
- (void)setHasSupportsAlarmAcknowledgedDate:(BOOL)a3;
- (void)setHasSupportsSharedCalendars:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasUsesSelfAttendee:(BOOL)a3;
- (void)setIsBirthdayStore:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsFacebook:(BOOL)a3;
- (void)setIsLocalStore:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOnlyCreatorCanModify:(BOOL)a3;
- (void)setSnoozeAlarmRequiresDetach:(BOOL)a3;
- (void)setSupportsAlarmAcknowledgedDate:(BOOL)a3;
- (void)setSupportsSharedCalendars:(BOOL)a3;
- (void)setType:(unsigned int)a3;
- (void)setUsesSelfAttendee:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBSourceAttributes

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setDefaultAlarmOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_defaultAlarmOffset = a3;
}

- (void)setHasDefaultAlarmOffset:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDefaultAlarmOffset
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isEnabled = a3;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsFacebook:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isFacebook = a3;
}

- (void)setHasIsFacebook:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsFacebook
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setUsesSelfAttendee:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_usesSelfAttendee = a3;
}

- (void)setHasUsesSelfAttendee:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasUsesSelfAttendee
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasConstraintsDescriptionPath
{
  return self->_constraintsDescriptionPath != 0;
}

- (BOOL)hasExternalID
{
  return self->_externalID != 0;
}

- (BOOL)hasExternalModificationTag
{
  return self->_externalModificationTag != 0;
}

- (BOOL)hasCreatorBundleID
{
  return self->_creatorBundleID != 0;
}

- (BOOL)hasCreatorCodeSigningIdentity
{
  return self->_creatorCodeSigningIdentity != 0;
}

- (BOOL)hasAccountPersistentID
{
  return self->_accountPersistentID != 0;
}

- (void)setSupportsSharedCalendars:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_supportsSharedCalendars = a3;
}

- (void)setHasSupportsSharedCalendars:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSupportsSharedCalendars
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setAllowsTasks:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_allowsTasks = a3;
}

- (void)setHasAllowsTasks:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAllowsTasks
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAllowsEvents:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_allowsEvents = a3;
}

- (void)setHasAllowsEvents:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAllowsEvents
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAllowsCalendarAddDeleteModify:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_allowsCalendarAddDeleteModify = a3;
}

- (void)setHasAllowsCalendarAddDeleteModify:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAllowsCalendarAddDeleteModify
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setOnlyCreatorCanModify:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_onlyCreatorCanModify = a3;
}

- (void)setHasOnlyCreatorCanModify:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasOnlyCreatorCanModify
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSnoozeAlarmRequiresDetach:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_snoozeAlarmRequiresDetach = a3;
}

- (void)setHasSnoozeAlarmRequiresDetach:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSnoozeAlarmRequiresDetach
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSupportsAlarmAcknowledgedDate:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_supportsAlarmAcknowledgedDate = a3;
}

- (void)setHasSupportsAlarmAcknowledgedDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSupportsAlarmAcknowledgedDate
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setIsLocalStore:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isLocalStore = a3;
}

- (void)setHasIsLocalStore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsLocalStore
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsBirthdayStore:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isBirthdayStore = a3;
}

- (void)setHasIsBirthdayStore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsBirthdayStore
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBSourceAttributes;
  __int16 v3 = [(NEKPBSourceAttributes *)&v7 description];
  v4 = [(NEKPBSourceAttributes *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v17 = +[NSNumber numberWithUnsignedInt:self->_defaultAlarmOffset];
    [v4 setObject:v17 forKey:@"defaultAlarmOffset"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_36;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  v18 = +[NSNumber numberWithUnsignedInt:self->_type];
  [v4 setObject:v18 forKey:@"type"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  v19 = +[NSNumber numberWithBool:self->_isEnabled];
  [v4 setObject:v19 forKey:@"isEnabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_37:
  v20 = +[NSNumber numberWithBool:self->_isFacebook];
  [v4 setObject:v20 forKey:@"isFacebook"];

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_8:
    objc_super v7 = +[NSNumber numberWithBool:self->_usesSelfAttendee];
    [v4 setObject:v7 forKey:@"usesSelfAttendee"];
  }
LABEL_9:
  constraintsDescriptionPath = self->_constraintsDescriptionPath;
  if (constraintsDescriptionPath) {
    [v4 setObject:constraintsDescriptionPath forKey:@"constraintsDescriptionPath"];
  }
  externalID = self->_externalID;
  if (externalID) {
    [v4 setObject:externalID forKey:@"externalID"];
  }
  externalModificationTag = self->_externalModificationTag;
  if (externalModificationTag) {
    [v4 setObject:externalModificationTag forKey:@"externalModificationTag"];
  }
  creatorBundleID = self->_creatorBundleID;
  if (creatorBundleID) {
    [v4 setObject:creatorBundleID forKey:@"creatorBundleID"];
  }
  creatorCodeSigningIdentity = self->_creatorCodeSigningIdentity;
  if (creatorCodeSigningIdentity) {
    [v4 setObject:creatorCodeSigningIdentity forKey:@"creatorCodeSigningIdentity"];
  }
  accountPersistentID = self->_accountPersistentID;
  if (accountPersistentID) {
    [v4 setObject:accountPersistentID forKey:@"accountPersistentID"];
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x1000) != 0)
  {
    v21 = +[NSNumber numberWithBool:self->_supportsSharedCalendars];
    [v4 setObject:v21 forKey:@"supportsSharedCalendars"];

    __int16 v14 = (__int16)self->_has;
    if ((v14 & 0x10) == 0)
    {
LABEL_23:
      if ((v14 & 8) == 0) {
        goto LABEL_24;
      }
      goto LABEL_41;
    }
  }
  else if ((v14 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  v22 = +[NSNumber numberWithBool:self->_allowsTasks];
  [v4 setObject:v22 forKey:@"allowsTasks"];

  __int16 v14 = (__int16)self->_has;
  if ((v14 & 8) == 0)
  {
LABEL_24:
    if ((v14 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_42;
  }
LABEL_41:
  v23 = +[NSNumber numberWithBool:self->_allowsEvents];
  [v4 setObject:v23 forKey:@"allowsEvents"];

  __int16 v14 = (__int16)self->_has;
  if ((v14 & 4) == 0)
  {
LABEL_25:
    if ((v14 & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_43;
  }
LABEL_42:
  v24 = +[NSNumber numberWithBool:self->_allowsCalendarAddDeleteModify];
  [v4 setObject:v24 forKey:@"allowsCalendarAddDeleteModify"];

  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x200) == 0)
  {
LABEL_26:
    if ((v14 & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_44;
  }
LABEL_43:
  v25 = +[NSNumber numberWithBool:self->_onlyCreatorCanModify];
  [v4 setObject:v25 forKey:@"onlyCreatorCanModify"];

  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x400) == 0)
  {
LABEL_27:
    if ((v14 & 0x800) == 0) {
      goto LABEL_28;
    }
    goto LABEL_45;
  }
LABEL_44:
  v26 = +[NSNumber numberWithBool:self->_snoozeAlarmRequiresDetach];
  [v4 setObject:v26 forKey:@"snoozeAlarmRequiresDetach"];

  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x800) == 0)
  {
LABEL_28:
    if ((v14 & 0x100) == 0) {
      goto LABEL_29;
    }
    goto LABEL_46;
  }
LABEL_45:
  v27 = +[NSNumber numberWithBool:self->_supportsAlarmAcknowledgedDate];
  [v4 setObject:v27 forKey:@"supportsAlarmAcknowledgedDate"];

  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x100) == 0)
  {
LABEL_29:
    if ((v14 & 0x20) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_46:
  v28 = +[NSNumber numberWithBool:self->_isLocalStore];
  [v4 setObject:v28 forKey:@"isLocalStore"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_30:
    v15 = +[NSNumber numberWithBool:self->_isBirthdayStore];
    [v4 setObject:v15 forKey:@"isBirthdayStore"];
  }
LABEL_31:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100033B48((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_36;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_37:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_9:
  if (self->_constraintsDescriptionPath)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_externalID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_externalModificationTag)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_creatorBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_creatorCodeSigningIdentity)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_accountPersistentID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_23:
      if ((v6 & 8) == 0) {
        goto LABEL_24;
      }
      goto LABEL_41;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_24:
    if ((v6 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_25:
    if ((v6 & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_26:
    if ((v6 & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_27:
    if ((v6 & 0x800) == 0) {
      goto LABEL_28;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_28:
    if ((v6 & 0x100) == 0) {
      goto LABEL_29;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_29:
    if ((v6 & 0x20) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_30:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_31:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_name)
  {
    [v4 setName:];
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 10) = self->_defaultAlarmOffset;
    *((_WORD *)v4 + 44) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_36;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 18) = self->_type;
  *((_WORD *)v4 + 44) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((unsigned char *)v4 + 80) = self->_isEnabled;
  *((_WORD *)v4 + 44) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_37:
  *((unsigned char *)v4 + 81) = self->_isFacebook;
  *((_WORD *)v4 + 44) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 87) = self->_usesSelfAttendee;
    *((_WORD *)v4 + 44) |= 0x2000u;
  }
LABEL_9:
  if (self->_constraintsDescriptionPath)
  {
    [v7 setConstraintsDescriptionPath:];
    id v4 = v7;
  }
  if (self->_externalID)
  {
    [v7 setExternalID:];
    id v4 = v7;
  }
  if (self->_externalModificationTag)
  {
    [v7 setExternalModificationTag:];
    id v4 = v7;
  }
  if (self->_creatorBundleID)
  {
    [v7 setCreatorBundleID:];
    id v4 = v7;
  }
  if (self->_creatorCodeSigningIdentity)
  {
    [v7 setCreatorCodeSigningIdentity:];
    id v4 = v7;
  }
  if (self->_accountPersistentID)
  {
    [v7 setAccountPersistentID:];
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
  {
    *((unsigned char *)v4 + 86) = self->_supportsSharedCalendars;
    *((_WORD *)v4 + 44) |= 0x1000u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_23:
      if ((v6 & 8) == 0) {
        goto LABEL_24;
      }
      goto LABEL_41;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  *((unsigned char *)v4 + 78) = self->_allowsTasks;
  *((_WORD *)v4 + 44) |= 0x10u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_24:
    if ((v6 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((unsigned char *)v4 + 77) = self->_allowsEvents;
  *((_WORD *)v4 + 44) |= 8u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_25:
    if ((v6 & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)v4 + 76) = self->_allowsCalendarAddDeleteModify;
  *((_WORD *)v4 + 44) |= 4u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_26:
    if ((v6 & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((unsigned char *)v4 + 83) = self->_onlyCreatorCanModify;
  *((_WORD *)v4 + 44) |= 0x200u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_27:
    if ((v6 & 0x800) == 0) {
      goto LABEL_28;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((unsigned char *)v4 + 84) = self->_snoozeAlarmRequiresDetach;
  *((_WORD *)v4 + 44) |= 0x400u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_28:
    if ((v6 & 0x100) == 0) {
      goto LABEL_29;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((unsigned char *)v4 + 85) = self->_supportsAlarmAcknowledgedDate;
  *((_WORD *)v4 + 44) |= 0x800u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_29:
    if ((v6 & 0x20) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_46:
  *((unsigned char *)v4 + 82) = self->_isLocalStore;
  *((_WORD *)v4 + 44) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_30:
    *((unsigned char *)v4 + 79) = self->_isBirthdayStore;
    *((_WORD *)v4 + 44) |= 0x20u;
  }
LABEL_31:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_name copyWithZone:a3];
  id v7 = (void *)v5[8];
  v5[8] = v6;

  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 10) = self->_defaultAlarmOffset;
    *((_WORD *)v5 + 44) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 18) = self->_type;
  *((_WORD *)v5 + 44) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v5 + 80) = self->_isEnabled;
  *((_WORD *)v5 + 44) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_21:
  *((unsigned char *)v5 + 81) = self->_isFacebook;
  *((_WORD *)v5 + 44) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    *((unsigned char *)v5 + 87) = self->_usesSelfAttendee;
    *((_WORD *)v5 + 44) |= 0x2000u;
  }
LABEL_7:
  id v9 = [(NSString *)self->_constraintsDescriptionPath copyWithZone:a3];
  v10 = (void *)v5[2];
  v5[2] = v9;

  id v11 = [(NSString *)self->_externalID copyWithZone:a3];
  v12 = (void *)v5[6];
  v5[6] = v11;

  id v13 = [(NSString *)self->_externalModificationTag copyWithZone:a3];
  __int16 v14 = (void *)v5[7];
  v5[7] = v13;

  id v15 = [(NSString *)self->_creatorBundleID copyWithZone:a3];
  v16 = (void *)v5[3];
  v5[3] = v15;

  id v17 = [(NSString *)self->_creatorCodeSigningIdentity copyWithZone:a3];
  v18 = (void *)v5[4];
  v5[4] = v17;

  id v19 = [(NSString *)self->_accountPersistentID copyWithZone:a3];
  v20 = (void *)v5[1];
  v5[1] = v19;

  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x1000) != 0)
  {
    *((unsigned char *)v5 + 86) = self->_supportsSharedCalendars;
    *((_WORD *)v5 + 44) |= 0x1000u;
    __int16 v21 = (__int16)self->_has;
    if ((v21 & 0x10) == 0)
    {
LABEL_9:
      if ((v21 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_25;
    }
  }
  else if ((v21 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v5 + 78) = self->_allowsTasks;
  *((_WORD *)v5 + 44) |= 0x10u;
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 8) == 0)
  {
LABEL_10:
    if ((v21 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)v5 + 77) = self->_allowsEvents;
  *((_WORD *)v5 + 44) |= 8u;
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 4) == 0)
  {
LABEL_11:
    if ((v21 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((unsigned char *)v5 + 76) = self->_allowsCalendarAddDeleteModify;
  *((_WORD *)v5 + 44) |= 4u;
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x200) == 0)
  {
LABEL_12:
    if ((v21 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((unsigned char *)v5 + 83) = self->_onlyCreatorCanModify;
  *((_WORD *)v5 + 44) |= 0x200u;
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x400) == 0)
  {
LABEL_13:
    if ((v21 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((unsigned char *)v5 + 84) = self->_snoozeAlarmRequiresDetach;
  *((_WORD *)v5 + 44) |= 0x400u;
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x800) == 0)
  {
LABEL_14:
    if ((v21 & 0x100) == 0) {
      goto LABEL_15;
    }
LABEL_30:
    *((unsigned char *)v5 + 82) = self->_isLocalStore;
    *((_WORD *)v5 + 44) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x20) == 0) {
      return v5;
    }
    goto LABEL_16;
  }
LABEL_29:
  *((unsigned char *)v5 + 85) = self->_supportsAlarmAcknowledgedDate;
  *((_WORD *)v5 + 44) |= 0x800u;
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x100) != 0) {
    goto LABEL_30;
  }
LABEL_15:
  if ((v21 & 0x20) != 0)
  {
LABEL_16:
    *((unsigned char *)v5 + 79) = self->_isBirthdayStore;
    *((_WORD *)v5 + 44) |= 0x20u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_117;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_117;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 44);
  if (has)
  {
    if ((v7 & 1) == 0 || self->_defaultAlarmOffset != *((_DWORD *)v4 + 10)) {
      goto LABEL_117;
    }
  }
  else if (v7)
  {
    goto LABEL_117;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_type != *((_DWORD *)v4 + 18)) {
      goto LABEL_117;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_117;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0) {
      goto LABEL_117;
    }
    if (self->_isEnabled)
    {
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 80))
    {
      goto LABEL_117;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_117;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_117;
    }
    if (self->_isFacebook)
    {
      if (!*((unsigned char *)v4 + 81)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 81))
    {
      goto LABEL_117;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x2000) == 0) {
      goto LABEL_117;
    }
    if (self->_usesSelfAttendee)
    {
      if (!*((unsigned char *)v4 + 87)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 87))
    {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x2000) != 0)
  {
    goto LABEL_117;
  }
  constraintsDescriptionPath = self->_constraintsDescriptionPath;
  if ((unint64_t)constraintsDescriptionPath | *((void *)v4 + 2)
    && !-[NSString isEqual:](constraintsDescriptionPath, "isEqual:"))
  {
    goto LABEL_117;
  }
  externalID = self->_externalID;
  if ((unint64_t)externalID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](externalID, "isEqual:")) {
      goto LABEL_117;
    }
  }
  externalModificationTag = self->_externalModificationTag;
  if ((unint64_t)externalModificationTag | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](externalModificationTag, "isEqual:")) {
      goto LABEL_117;
    }
  }
  creatorBundleID = self->_creatorBundleID;
  if ((unint64_t)creatorBundleID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](creatorBundleID, "isEqual:")) {
      goto LABEL_117;
    }
  }
  creatorCodeSigningIdentity = self->_creatorCodeSigningIdentity;
  if ((unint64_t)creatorCodeSigningIdentity | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](creatorCodeSigningIdentity, "isEqual:")) {
      goto LABEL_117;
    }
  }
  accountPersistentID = self->_accountPersistentID;
  if ((unint64_t)accountPersistentID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountPersistentID, "isEqual:")) {
      goto LABEL_117;
    }
  }
  __int16 v14 = (__int16)self->_has;
  __int16 v15 = *((_WORD *)v4 + 44);
  if ((v14 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x1000) == 0) {
      goto LABEL_117;
    }
    if (self->_supportsSharedCalendars)
    {
      if (!*((unsigned char *)v4 + 86)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 86))
    {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x1000) != 0)
  {
    goto LABEL_117;
  }
  if ((v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0) {
      goto LABEL_117;
    }
    if (self->_allowsTasks)
    {
      if (!*((unsigned char *)v4 + 78)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 78))
    {
      goto LABEL_117;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_117;
  }
  if ((v14 & 8) != 0)
  {
    if ((v15 & 8) == 0) {
      goto LABEL_117;
    }
    if (self->_allowsEvents)
    {
      if (!*((unsigned char *)v4 + 77)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 77))
    {
      goto LABEL_117;
    }
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_117;
  }
  if ((v14 & 4) != 0)
  {
    if ((v15 & 4) == 0) {
      goto LABEL_117;
    }
    if (self->_allowsCalendarAddDeleteModify)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 76))
    {
      goto LABEL_117;
    }
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x200) == 0) {
      goto LABEL_117;
    }
    if (self->_onlyCreatorCanModify)
    {
      if (!*((unsigned char *)v4 + 83)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 83))
    {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x200) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x400) == 0) {
      goto LABEL_117;
    }
    if (self->_snoozeAlarmRequiresDetach)
    {
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 84))
    {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x400) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x800) == 0) {
      goto LABEL_117;
    }
    if (self->_supportsAlarmAcknowledgedDate)
    {
      if (!*((unsigned char *)v4 + 85)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 85))
    {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x800) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x100) == 0) {
      goto LABEL_117;
    }
    if (self->_isLocalStore)
    {
      if (!*((unsigned char *)v4 + 82)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 82))
    {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
    goto LABEL_117;
  }
  if ((v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) != 0)
    {
      if (self->_isBirthdayStore)
      {
        if (!*((unsigned char *)v4 + 79)) {
          goto LABEL_117;
        }
      }
      else if (*((unsigned char *)v4 + 79))
      {
        goto LABEL_117;
      }
      BOOL v16 = 1;
      goto LABEL_118;
    }
LABEL_117:
    BOOL v16 = 0;
    goto LABEL_118;
  }
  BOOL v16 = (v15 & 0x20) == 0;
LABEL_118:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v27 = [(NSString *)self->_name hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v26 = 2654435761 * self->_defaultAlarmOffset;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v25 = 2654435761 * self->_type;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v23 = 2654435761 * self->_isEnabled;
    if ((has & 0x80) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v4 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v23 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v4 = 2654435761 * self->_isFacebook;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_usesSelfAttendee;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v5 = 0;
LABEL_12:
  NSUInteger v6 = [(NSString *)self->_constraintsDescriptionPath hash];
  NSUInteger v7 = [(NSString *)self->_externalID hash];
  NSUInteger v8 = [(NSString *)self->_externalModificationTag hash];
  NSUInteger v9 = [(NSString *)self->_creatorBundleID hash];
  NSUInteger v10 = [(NSString *)self->_creatorCodeSigningIdentity hash];
  NSUInteger v11 = [(NSString *)self->_accountPersistentID hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x1000) != 0)
  {
    uint64_t v13 = 2654435761 * self->_supportsSharedCalendars;
    if ((v12 & 0x10) != 0)
    {
LABEL_14:
      uint64_t v14 = 2654435761 * self->_allowsTasks;
      if ((v12 & 8) != 0) {
        goto LABEL_15;
      }
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((v12 & 0x10) != 0) {
      goto LABEL_14;
    }
  }
  uint64_t v14 = 0;
  if ((v12 & 8) != 0)
  {
LABEL_15:
    uint64_t v15 = 2654435761 * self->_allowsEvents;
    if ((v12 & 4) != 0) {
      goto LABEL_16;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v15 = 0;
  if ((v12 & 4) != 0)
  {
LABEL_16:
    uint64_t v16 = 2654435761 * self->_allowsCalendarAddDeleteModify;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v16 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_17:
    uint64_t v17 = 2654435761 * self->_onlyCreatorCanModify;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v17 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_18:
    uint64_t v18 = 2654435761 * self->_snoozeAlarmRequiresDetach;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_19;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v18 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_19:
    uint64_t v19 = 2654435761 * self->_supportsAlarmAcknowledgedDate;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_20;
    }
LABEL_29:
    uint64_t v20 = 0;
    if ((v12 & 0x20) != 0) {
      goto LABEL_21;
    }
LABEL_30:
    uint64_t v21 = 0;
    return v26 ^ v27 ^ v25 ^ v24 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_28:
  uint64_t v19 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_29;
  }
LABEL_20:
  uint64_t v20 = 2654435761 * self->_isLocalStore;
  if ((v12 & 0x20) == 0) {
    goto LABEL_30;
  }
LABEL_21:
  uint64_t v21 = 2654435761 * self->_isBirthdayStore;
  return v26 ^ v27 ^ v25 ^ v24 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 8))
  {
    -[NEKPBSourceAttributes setName:](self, "setName:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 44);
  if (v5)
  {
    self->_defaultAlarmOffset = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_36;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_type = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_isEnabled = *((unsigned char *)v4 + 80);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_37:
  self->_isFacebook = *((unsigned char *)v4 + 81);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 44) & 0x2000) != 0)
  {
LABEL_8:
    self->_usesSelfAttendee = *((unsigned char *)v4 + 87);
    *(_WORD *)&self->_has |= 0x2000u;
  }
LABEL_9:
  if (*((void *)v4 + 2))
  {
    -[NEKPBSourceAttributes setConstraintsDescriptionPath:](self, "setConstraintsDescriptionPath:");
    id v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[NEKPBSourceAttributes setExternalID:](self, "setExternalID:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[NEKPBSourceAttributes setExternalModificationTag:](self, "setExternalModificationTag:");
    id v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[NEKPBSourceAttributes setCreatorBundleID:](self, "setCreatorBundleID:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[NEKPBSourceAttributes setCreatorCodeSigningIdentity:](self, "setCreatorCodeSigningIdentity:");
    id v4 = v7;
  }
  if (*((void *)v4 + 1))
  {
    -[NEKPBSourceAttributes setAccountPersistentID:](self, "setAccountPersistentID:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x1000) != 0)
  {
    self->_supportsSharedCalendars = *((unsigned char *)v4 + 86);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v6 = *((_WORD *)v4 + 44);
    if ((v6 & 0x10) == 0)
    {
LABEL_23:
      if ((v6 & 8) == 0) {
        goto LABEL_24;
      }
      goto LABEL_41;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  self->_allowsTasks = *((unsigned char *)v4 + 78);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 8) == 0)
  {
LABEL_24:
    if ((v6 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_allowsEvents = *((unsigned char *)v4 + 77);
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 4) == 0)
  {
LABEL_25:
    if ((v6 & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_allowsCalendarAddDeleteModify = *((unsigned char *)v4 + 76);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x200) == 0)
  {
LABEL_26:
    if ((v6 & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_onlyCreatorCanModify = *((unsigned char *)v4 + 83);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x400) == 0)
  {
LABEL_27:
    if ((v6 & 0x800) == 0) {
      goto LABEL_28;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_snoozeAlarmRequiresDetach = *((unsigned char *)v4 + 84);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x800) == 0)
  {
LABEL_28:
    if ((v6 & 0x100) == 0) {
      goto LABEL_29;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_supportsAlarmAcknowledgedDate = *((unsigned char *)v4 + 85);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x100) == 0)
  {
LABEL_29:
    if ((v6 & 0x20) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_46:
  self->_isLocalStore = *((unsigned char *)v4 + 82);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 44) & 0x20) != 0)
  {
LABEL_30:
    self->_isBirthdayStore = *((unsigned char *)v4 + 79);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_31:
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unsigned)defaultAlarmOffset
{
  return self->_defaultAlarmOffset;
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isFacebook
{
  return self->_isFacebook;
}

- (BOOL)usesSelfAttendee
{
  return self->_usesSelfAttendee;
}

- (NSString)constraintsDescriptionPath
{
  return self->_constraintsDescriptionPath;
}

- (void)setConstraintsDescriptionPath:(id)a3
{
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
}

- (NSString)creatorBundleID
{
  return self->_creatorBundleID;
}

- (void)setCreatorBundleID:(id)a3
{
}

- (NSString)creatorCodeSigningIdentity
{
  return self->_creatorCodeSigningIdentity;
}

- (void)setCreatorCodeSigningIdentity:(id)a3
{
}

- (NSString)accountPersistentID
{
  return self->_accountPersistentID;
}

- (void)setAccountPersistentID:(id)a3
{
}

- (BOOL)supportsSharedCalendars
{
  return self->_supportsSharedCalendars;
}

- (BOOL)allowsTasks
{
  return self->_allowsTasks;
}

- (BOOL)allowsEvents
{
  return self->_allowsEvents;
}

- (BOOL)allowsCalendarAddDeleteModify
{
  return self->_allowsCalendarAddDeleteModify;
}

- (BOOL)onlyCreatorCanModify
{
  return self->_onlyCreatorCanModify;
}

- (BOOL)snoozeAlarmRequiresDetach
{
  return self->_snoozeAlarmRequiresDetach;
}

- (BOOL)supportsAlarmAcknowledgedDate
{
  return self->_supportsAlarmAcknowledgedDate;
}

- (BOOL)isLocalStore
{
  return self->_isLocalStore;
}

- (BOOL)isBirthdayStore
{
  return self->_isBirthdayStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_creatorCodeSigningIdentity, 0);
  objc_storeStrong((id *)&self->_creatorBundleID, 0);
  objc_storeStrong((id *)&self->_constraintsDescriptionPath, 0);

  objc_storeStrong((id *)&self->_accountPersistentID, 0);
}

@end
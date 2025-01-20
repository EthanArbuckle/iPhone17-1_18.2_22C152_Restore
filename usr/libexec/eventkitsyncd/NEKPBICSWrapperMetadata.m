@interface NEKPBICSWrapperMetadata
- (BOOL)hasAttendeeStatus;
- (BOOL)hasEntityType;
- (BOOL)hasExternalID;
- (BOOL)hasInvitationChangedPropertyFlagAttendeeComment;
- (BOOL)hasInvitationChangedPropertyFlagAttendeeStatus;
- (BOOL)hasInvitationChangedPropertyFlagDate;
- (BOOL)hasInvitationChangedPropertyFlagLocation;
- (BOOL)hasInvitationChangedPropertyFlagTime;
- (BOOL)hasInvitationChangedPropertyFlagTitle;
- (BOOL)hasInvitationStatus;
- (BOOL)hasLocationPredictionState;
- (BOOL)hasProperInvitationStatus;
- (BOOL)hasSelfAttendeeEmail;
- (BOOL)hasSelfAttendeeUUID;
- (BOOL)hasSelfOrganizerEmail;
- (BOOL)hasSelfOrganizerUUID;
- (BOOL)hasStartDate;
- (BOOL)invitationChangedPropertyFlagAttendeeComment;
- (BOOL)invitationChangedPropertyFlagAttendeeStatus;
- (BOOL)invitationChangedPropertyFlagDate;
- (BOOL)invitationChangedPropertyFlagLocation;
- (BOOL)invitationChangedPropertyFlagTime;
- (BOOL)invitationChangedPropertyFlagTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)externalID;
- (NSString)selfAttendeeEmail;
- (NSString)selfAttendeeUUID;
- (NSString)selfOrganizerEmail;
- (NSString)selfOrganizerUUID;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)attendeeStatus;
- (unint64_t)entityType;
- (unint64_t)hash;
- (unint64_t)invitationStatus;
- (unint64_t)locationPredictionState;
- (unint64_t)properInvitationStatus;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttendeeStatus:(unint64_t)a3;
- (void)setEntityType:(unint64_t)a3;
- (void)setExternalID:(id)a3;
- (void)setHasAttendeeStatus:(BOOL)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setHasInvitationChangedPropertyFlagAttendeeComment:(BOOL)a3;
- (void)setHasInvitationChangedPropertyFlagAttendeeStatus:(BOOL)a3;
- (void)setHasInvitationChangedPropertyFlagDate:(BOOL)a3;
- (void)setHasInvitationChangedPropertyFlagLocation:(BOOL)a3;
- (void)setHasInvitationChangedPropertyFlagTime:(BOOL)a3;
- (void)setHasInvitationChangedPropertyFlagTitle:(BOOL)a3;
- (void)setHasInvitationStatus:(BOOL)a3;
- (void)setHasLocationPredictionState:(BOOL)a3;
- (void)setHasProperInvitationStatus:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setInvitationChangedPropertyFlagAttendeeComment:(BOOL)a3;
- (void)setInvitationChangedPropertyFlagAttendeeStatus:(BOOL)a3;
- (void)setInvitationChangedPropertyFlagDate:(BOOL)a3;
- (void)setInvitationChangedPropertyFlagLocation:(BOOL)a3;
- (void)setInvitationChangedPropertyFlagTime:(BOOL)a3;
- (void)setInvitationChangedPropertyFlagTitle:(BOOL)a3;
- (void)setInvitationStatus:(unint64_t)a3;
- (void)setLocationPredictionState:(unint64_t)a3;
- (void)setProperInvitationStatus:(unint64_t)a3;
- (void)setSelfAttendeeEmail:(id)a3;
- (void)setSelfAttendeeUUID:(id)a3;
- (void)setSelfOrganizerEmail:(id)a3;
- (void)setSelfOrganizerUUID:(id)a3;
- (void)setStartDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBICSWrapperMetadata

- (BOOL)hasSelfAttendeeEmail
{
  return self->_selfAttendeeEmail != 0;
}

- (void)setInvitationStatus:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_invitationStatus = a3;
}

- (void)setHasInvitationStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInvitationStatus
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setEntityType:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_entityType = a3;
}

- (void)setHasEntityType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasEntityType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setInvitationChangedPropertyFlagDate:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_invitationChangedPropertyFlagDate = a3;
}

- (void)setHasInvitationChangedPropertyFlagDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasInvitationChangedPropertyFlagDate
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setInvitationChangedPropertyFlagTime:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_invitationChangedPropertyFlagTime = a3;
}

- (void)setHasInvitationChangedPropertyFlagTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasInvitationChangedPropertyFlagTime
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setInvitationChangedPropertyFlagTitle:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_invitationChangedPropertyFlagTitle = a3;
}

- (void)setHasInvitationChangedPropertyFlagTitle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasInvitationChangedPropertyFlagTitle
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setInvitationChangedPropertyFlagLocation:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_invitationChangedPropertyFlagLocation = a3;
}

- (void)setHasInvitationChangedPropertyFlagLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasInvitationChangedPropertyFlagLocation
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setInvitationChangedPropertyFlagAttendeeComment:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_invitationChangedPropertyFlagAttendeeComment = a3;
}

- (void)setHasInvitationChangedPropertyFlagAttendeeComment:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasInvitationChangedPropertyFlagAttendeeComment
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setInvitationChangedPropertyFlagAttendeeStatus:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_invitationChangedPropertyFlagAttendeeStatus = a3;
}

- (void)setHasInvitationChangedPropertyFlagAttendeeStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasInvitationChangedPropertyFlagAttendeeStatus
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasSelfAttendeeUUID
{
  return self->_selfAttendeeUUID != 0;
}

- (BOOL)hasSelfOrganizerEmail
{
  return self->_selfOrganizerEmail != 0;
}

- (BOOL)hasSelfOrganizerUUID
{
  return self->_selfOrganizerUUID != 0;
}

- (BOOL)hasExternalID
{
  return self->_externalID != 0;
}

- (void)setAttendeeStatus:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_attendeeStatus = a3;
}

- (void)setHasAttendeeStatus:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAttendeeStatus
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLocationPredictionState:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_locationPredictionState = a3;
}

- (void)setHasLocationPredictionState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLocationPredictionState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setProperInvitationStatus:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_properInvitationStatus = a3;
}

- (void)setHasProperInvitationStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasProperInvitationStatus
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setStartDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasStartDate
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBICSWrapperMetadata;
  __int16 v3 = [(NEKPBICSWrapperMetadata *)&v7 description];
  v4 = [(NEKPBICSWrapperMetadata *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  selfAttendeeEmail = self->_selfAttendeeEmail;
  if (selfAttendeeEmail) {
    [v3 setObject:selfAttendeeEmail forKey:@"selfAttendeeEmail"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v15 = +[NSNumber numberWithUnsignedLongLong:self->_invitationStatus];
    [v4 setObject:v15 forKey:@"invitationStatus"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x100) == 0) {
        goto LABEL_6;
      }
      goto LABEL_30;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  v16 = +[NSNumber numberWithUnsignedLongLong:self->_entityType];
  [v4 setObject:v16 forKey:@"entityType"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  v17 = +[NSNumber numberWithBool:self->_invitationChangedPropertyFlagDate];
  [v4 setObject:v17 forKey:@"invitationChangedPropertyFlagDate"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  v18 = +[NSNumber numberWithBool:self->_invitationChangedPropertyFlagTime];
  [v4 setObject:v18 forKey:@"invitationChangedPropertyFlagTime"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  v19 = +[NSNumber numberWithBool:self->_invitationChangedPropertyFlagTitle];
  [v4 setObject:v19 forKey:@"invitationChangedPropertyFlagTitle"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  v20 = +[NSNumber numberWithBool:self->_invitationChangedPropertyFlagLocation];
  [v4 setObject:v20 forKey:@"invitationChangedPropertyFlagLocation"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_34:
  v21 = +[NSNumber numberWithBool:self->_invitationChangedPropertyFlagAttendeeComment];
  [v4 setObject:v21 forKey:@"invitationChangedPropertyFlagAttendeeComment"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_11:
    objc_super v7 = +[NSNumber numberWithBool:self->_invitationChangedPropertyFlagAttendeeStatus];
    [v4 setObject:v7 forKey:@"invitationChangedPropertyFlagAttendeeStatus"];
  }
LABEL_12:
  selfAttendeeUUID = self->_selfAttendeeUUID;
  if (selfAttendeeUUID) {
    [v4 setObject:selfAttendeeUUID forKey:@"selfAttendeeUUID"];
  }
  selfOrganizerEmail = self->_selfOrganizerEmail;
  if (selfOrganizerEmail) {
    [v4 setObject:selfOrganizerEmail forKey:@"selfOrganizerEmail"];
  }
  selfOrganizerUUID = self->_selfOrganizerUUID;
  if (selfOrganizerUUID) {
    [v4 setObject:selfOrganizerUUID forKey:@"selfOrganizerUUID"];
  }
  externalID = self->_externalID;
  if (externalID) {
    [v4 setObject:externalID forKey:@"externalID"];
  }
  __int16 v12 = (__int16)self->_has;
  if (v12)
  {
    v22 = +[NSNumber numberWithUnsignedLongLong:self->_attendeeStatus];
    [v4 setObject:v22 forKey:@"attendeeStatus"];

    __int16 v12 = (__int16)self->_has;
    if ((v12 & 8) == 0)
    {
LABEL_22:
      if ((v12 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_38;
    }
  }
  else if ((v12 & 8) == 0)
  {
    goto LABEL_22;
  }
  v23 = +[NSNumber numberWithUnsignedLongLong:self->_locationPredictionState];
  [v4 setObject:v23 forKey:@"locationPredictionState"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x10) == 0)
  {
LABEL_23:
    if ((v12 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_38:
  v24 = +[NSNumber numberWithUnsignedLongLong:self->_properInvitationStatus];
  [v4 setObject:v24 forKey:@"properInvitationStatus"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_24:
    v13 = +[NSNumber numberWithDouble:self->_startDate];
    [v4 setObject:v13 forKey:@"startDate"];
  }
LABEL_25:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004A018((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_selfAttendeeEmail)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x100) == 0) {
        goto LABEL_6;
      }
      goto LABEL_30;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_12:
  if (self->_selfAttendeeUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_selfOrganizerEmail)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_selfOrganizerUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_externalID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if (v6)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_22:
      if ((v6 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_38;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_23:
    if ((v6 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_24:
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
LABEL_25:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_selfAttendeeEmail)
  {
    [v4 setSelfAttendeeEmail:];
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_invitationStatus;
    *((_WORD *)v4 + 52) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x100) == 0) {
        goto LABEL_6;
      }
      goto LABEL_30;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = self->_entityType;
  *((_WORD *)v4 + 52) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((unsigned char *)v4 + 98) = self->_invitationChangedPropertyFlagDate;
  *((_WORD *)v4 + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((unsigned char *)v4 + 100) = self->_invitationChangedPropertyFlagTime;
  *((_WORD *)v4 + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((unsigned char *)v4 + 101) = self->_invitationChangedPropertyFlagTitle;
  *((_WORD *)v4 + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((unsigned char *)v4 + 99) = self->_invitationChangedPropertyFlagLocation;
  *((_WORD *)v4 + 52) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_34:
  *((unsigned char *)v4 + 96) = self->_invitationChangedPropertyFlagAttendeeComment;
  *((_WORD *)v4 + 52) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 97) = self->_invitationChangedPropertyFlagAttendeeStatus;
    *((_WORD *)v4 + 52) |= 0x80u;
  }
LABEL_12:
  if (self->_selfAttendeeUUID)
  {
    [v7 setSelfAttendeeUUID:];
    id v4 = v7;
  }
  if (self->_selfOrganizerEmail)
  {
    [v7 setSelfOrganizerEmail:];
    id v4 = v7;
  }
  if (self->_selfOrganizerUUID)
  {
    [v7 setSelfOrganizerUUID:];
    id v4 = v7;
  }
  if (self->_externalID)
  {
    [v7 setExternalID:];
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if (v6)
  {
    *((void *)v4 + 1) = self->_attendeeStatus;
    *((_WORD *)v4 + 52) |= 1u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_22:
      if ((v6 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_38;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_22;
  }
  *((void *)v4 + 4) = self->_locationPredictionState;
  *((_WORD *)v4 + 52) |= 8u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_23:
    if ((v6 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_38:
  *((void *)v4 + 5) = self->_properInvitationStatus;
  *((_WORD *)v4 + 52) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_24:
    *((void *)v4 + 6) = *(void *)&self->_startDate;
    *((_WORD *)v4 + 52) |= 0x20u;
  }
LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_selfAttendeeEmail copyWithZone:a3];
  id v7 = (void *)v5[8];
  v5[8] = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v5[3] = self->_invitationStatus;
    *((_WORD *)v5 + 52) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = self->_entityType;
  *((_WORD *)v5 + 52) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)v5 + 98) = self->_invitationChangedPropertyFlagDate;
  *((_WORD *)v5 + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)v5 + 100) = self->_invitationChangedPropertyFlagTime;
  *((_WORD *)v5 + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v5 + 101) = self->_invitationChangedPropertyFlagTitle;
  *((_WORD *)v5 + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)v5 + 99) = self->_invitationChangedPropertyFlagLocation;
  *((_WORD *)v5 + 52) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_22:
  *((unsigned char *)v5 + 96) = self->_invitationChangedPropertyFlagAttendeeComment;
  *((_WORD *)v5 + 52) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    *((unsigned char *)v5 + 97) = self->_invitationChangedPropertyFlagAttendeeStatus;
    *((_WORD *)v5 + 52) |= 0x80u;
  }
LABEL_10:
  id v9 = [(NSString *)self->_selfAttendeeUUID copyWithZone:a3];
  v10 = (void *)v5[9];
  v5[9] = v9;

  id v11 = [(NSString *)self->_selfOrganizerEmail copyWithZone:a3];
  __int16 v12 = (void *)v5[10];
  v5[10] = v11;

  id v13 = [(NSString *)self->_selfOrganizerUUID copyWithZone:a3];
  v14 = (void *)v5[11];
  v5[11] = v13;

  id v15 = [(NSString *)self->_externalID copyWithZone:a3];
  v16 = (void *)v5[7];
  v5[7] = v15;

  __int16 v17 = (__int16)self->_has;
  if (v17)
  {
    v5[1] = self->_attendeeStatus;
    *((_WORD *)v5 + 52) |= 1u;
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 8) == 0)
    {
LABEL_12:
      if ((v17 & 0x10) == 0) {
        goto LABEL_13;
      }
LABEL_26:
      v5[5] = self->_properInvitationStatus;
      *((_WORD *)v5 + 52) |= 0x10u;
      if ((*(_WORD *)&self->_has & 0x20) == 0) {
        return v5;
      }
      goto LABEL_14;
    }
  }
  else if ((v17 & 8) == 0)
  {
    goto LABEL_12;
  }
  v5[4] = self->_locationPredictionState;
  *((_WORD *)v5 + 52) |= 8u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x10) != 0) {
    goto LABEL_26;
  }
LABEL_13:
  if ((v17 & 0x20) != 0)
  {
LABEL_14:
    v5[6] = *(void *)&self->_startDate;
    *((_WORD *)v5 + 52) |= 0x20u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_90;
  }
  selfAttendeeEmail = self->_selfAttendeeEmail;
  if ((unint64_t)selfAttendeeEmail | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](selfAttendeeEmail, "isEqual:")) {
      goto LABEL_90;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 52);
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_invitationStatus != *((void *)v4 + 3)) {
      goto LABEL_90;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_entityType != *((void *)v4 + 2)) {
      goto LABEL_90;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x100) == 0) {
      goto LABEL_90;
    }
    if (self->_invitationChangedPropertyFlagDate)
    {
      if (!*((unsigned char *)v4 + 98)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 98))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x100) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x400) == 0) {
      goto LABEL_90;
    }
    if (self->_invitationChangedPropertyFlagTime)
    {
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 100))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x400) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x800) == 0) {
      goto LABEL_90;
    }
    if (self->_invitationChangedPropertyFlagTitle)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x800) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x200) == 0) {
      goto LABEL_90;
    }
    if (self->_invitationChangedPropertyFlagLocation)
    {
      if (!*((unsigned char *)v4 + 99)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 99))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x200) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0) {
      goto LABEL_90;
    }
    if (self->_invitationChangedPropertyFlagAttendeeComment)
    {
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 96))
    {
      goto LABEL_90;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) != 0)
    {
      if (self->_invitationChangedPropertyFlagAttendeeStatus)
      {
        if (!*((unsigned char *)v4 + 97)) {
          goto LABEL_90;
        }
        goto LABEL_62;
      }
      if (!*((unsigned char *)v4 + 97)) {
        goto LABEL_62;
      }
    }
LABEL_90:
    BOOL v14 = 0;
    goto LABEL_91;
  }
  if ((v7 & 0x80) != 0) {
    goto LABEL_90;
  }
LABEL_62:
  selfAttendeeUUID = self->_selfAttendeeUUID;
  if ((unint64_t)selfAttendeeUUID | *((void *)v4 + 9)
    && !-[NSString isEqual:](selfAttendeeUUID, "isEqual:"))
  {
    goto LABEL_90;
  }
  selfOrganizerEmail = self->_selfOrganizerEmail;
  if ((unint64_t)selfOrganizerEmail | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](selfOrganizerEmail, "isEqual:")) {
      goto LABEL_90;
    }
  }
  selfOrganizerUUID = self->_selfOrganizerUUID;
  if ((unint64_t)selfOrganizerUUID | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](selfOrganizerUUID, "isEqual:")) {
      goto LABEL_90;
    }
  }
  externalID = self->_externalID;
  if ((unint64_t)externalID | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](externalID, "isEqual:")) {
      goto LABEL_90;
    }
  }
  __int16 v12 = (__int16)self->_has;
  __int16 v13 = *((_WORD *)v4 + 52);
  if (v12)
  {
    if ((v13 & 1) == 0 || self->_attendeeStatus != *((void *)v4 + 1)) {
      goto LABEL_90;
    }
  }
  else if (v13)
  {
    goto LABEL_90;
  }
  if ((v12 & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_locationPredictionState != *((void *)v4 + 4)) {
      goto LABEL_90;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_90;
  }
  if ((v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_properInvitationStatus != *((void *)v4 + 5)) {
      goto LABEL_90;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_90;
  }
  if ((v12 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_startDate != *((double *)v4 + 6)) {
      goto LABEL_90;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = (v13 & 0x20) == 0;
  }
LABEL_91:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v27 = [(NSString *)self->_selfAttendeeEmail hash];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    unint64_t v26 = 2654435761u * self->_invitationStatus;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v25 = 2654435761u * self->_entityType;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v26 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v25 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v24 = 2654435761 * self->_invitationChangedPropertyFlagDate;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v24 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    uint64_t v23 = 2654435761 * self->_invitationChangedPropertyFlagTime;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v23 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    uint64_t v22 = 2654435761 * self->_invitationChangedPropertyFlagTitle;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v22 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    uint64_t v21 = 2654435761 * self->_invitationChangedPropertyFlagLocation;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v19 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v21 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v19 = 2654435761 * self->_invitationChangedPropertyFlagAttendeeComment;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v4 = 2654435761 * self->_invitationChangedPropertyFlagAttendeeStatus;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v4 = 0;
LABEL_18:
  NSUInteger v5 = [(NSString *)self->_selfAttendeeUUID hash];
  NSUInteger v6 = [(NSString *)self->_selfOrganizerEmail hash];
  NSUInteger v7 = [(NSString *)self->_selfOrganizerUUID hash];
  NSUInteger v8 = [(NSString *)self->_externalID hash];
  __int16 v9 = (__int16)self->_has;
  if (v9)
  {
    unint64_t v10 = 2654435761u * self->_attendeeStatus;
    if ((v9 & 8) != 0)
    {
LABEL_20:
      unint64_t v11 = 2654435761u * self->_locationPredictionState;
      if ((v9 & 0x10) != 0) {
        goto LABEL_21;
      }
LABEL_28:
      unint64_t v12 = 0;
      if ((v9 & 0x20) != 0) {
        goto LABEL_22;
      }
LABEL_29:
      unint64_t v17 = 0;
      return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v17;
    }
  }
  else
  {
    unint64_t v10 = 0;
    if ((v9 & 8) != 0) {
      goto LABEL_20;
    }
  }
  unint64_t v11 = 0;
  if ((v9 & 0x10) == 0) {
    goto LABEL_28;
  }
LABEL_21:
  unint64_t v12 = 2654435761u * self->_properInvitationStatus;
  if ((v9 & 0x20) == 0) {
    goto LABEL_29;
  }
LABEL_22:
  double startDate = self->_startDate;
  double v14 = -startDate;
  if (startDate >= 0.0) {
    double v14 = self->_startDate;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0) {
      v17 += (unint64_t)v16;
    }
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 8))
  {
    -[NEKPBICSWrapperMetadata setSelfAttendeeEmail:](self, "setSelfAttendeeEmail:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 4) != 0)
  {
    self->_invitationStatus = *((void *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
    __int16 v5 = *((_WORD *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x100) == 0) {
        goto LABEL_6;
      }
      goto LABEL_30;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_entityType = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_invitationChangedPropertyFlagDate = *((unsigned char *)v4 + 98);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x400) == 0)
  {
LABEL_7:
    if ((v5 & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_invitationChangedPropertyFlagTime = *((unsigned char *)v4 + 100);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x800) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_invitationChangedPropertyFlagTitle = *((unsigned char *)v4 + 101);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_invitationChangedPropertyFlagLocation = *((unsigned char *)v4 + 99);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_34:
  self->_invitationChangedPropertyFlagAttendeeComment = *((unsigned char *)v4 + 96);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 52) & 0x80) != 0)
  {
LABEL_11:
    self->_invitationChangedPropertyFlagAttendeeStatus = *((unsigned char *)v4 + 97);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_12:
  if (*((void *)v4 + 9))
  {
    -[NEKPBICSWrapperMetadata setSelfAttendeeUUID:](self, "setSelfAttendeeUUID:");
    id v4 = v7;
  }
  if (*((void *)v4 + 10))
  {
    -[NEKPBICSWrapperMetadata setSelfOrganizerEmail:](self, "setSelfOrganizerEmail:");
    id v4 = v7;
  }
  if (*((void *)v4 + 11))
  {
    -[NEKPBICSWrapperMetadata setSelfOrganizerUUID:](self, "setSelfOrganizerUUID:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[NEKPBICSWrapperMetadata setExternalID:](self, "setExternalID:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 52);
  if (v6)
  {
    self->_attendeeStatus = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 52);
    if ((v6 & 8) == 0)
    {
LABEL_22:
      if ((v6 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_38;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_22;
  }
  self->_locationPredictionState = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x10) == 0)
  {
LABEL_23:
    if ((v6 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_38:
  self->_properInvitationStatus = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 52) & 0x20) != 0)
  {
LABEL_24:
    self->_double startDate = *((double *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_25:
}

- (NSString)selfAttendeeEmail
{
  return self->_selfAttendeeEmail;
}

- (void)setSelfAttendeeEmail:(id)a3
{
}

- (unint64_t)invitationStatus
{
  return self->_invitationStatus;
}

- (unint64_t)entityType
{
  return self->_entityType;
}

- (BOOL)invitationChangedPropertyFlagDate
{
  return self->_invitationChangedPropertyFlagDate;
}

- (BOOL)invitationChangedPropertyFlagTime
{
  return self->_invitationChangedPropertyFlagTime;
}

- (BOOL)invitationChangedPropertyFlagTitle
{
  return self->_invitationChangedPropertyFlagTitle;
}

- (BOOL)invitationChangedPropertyFlagLocation
{
  return self->_invitationChangedPropertyFlagLocation;
}

- (BOOL)invitationChangedPropertyFlagAttendeeComment
{
  return self->_invitationChangedPropertyFlagAttendeeComment;
}

- (BOOL)invitationChangedPropertyFlagAttendeeStatus
{
  return self->_invitationChangedPropertyFlagAttendeeStatus;
}

- (NSString)selfAttendeeUUID
{
  return self->_selfAttendeeUUID;
}

- (void)setSelfAttendeeUUID:(id)a3
{
}

- (NSString)selfOrganizerEmail
{
  return self->_selfOrganizerEmail;
}

- (void)setSelfOrganizerEmail:(id)a3
{
}

- (NSString)selfOrganizerUUID
{
  return self->_selfOrganizerUUID;
}

- (void)setSelfOrganizerUUID:(id)a3
{
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
}

- (unint64_t)attendeeStatus
{
  return self->_attendeeStatus;
}

- (unint64_t)locationPredictionState
{
  return self->_locationPredictionState;
}

- (unint64_t)properInvitationStatus
{
  return self->_properInvitationStatus;
}

- (double)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfOrganizerUUID, 0);
  objc_storeStrong((id *)&self->_selfOrganizerEmail, 0);
  objc_storeStrong((id *)&self->_selfAttendeeUUID, 0);
  objc_storeStrong((id *)&self->_selfAttendeeEmail, 0);

  objc_storeStrong((id *)&self->_externalID, 0);
}

@end
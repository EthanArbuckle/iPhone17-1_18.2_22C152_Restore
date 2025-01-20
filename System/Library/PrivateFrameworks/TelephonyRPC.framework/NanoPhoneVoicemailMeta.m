@interface NanoPhoneVoicemailMeta
+ (id)voicemailWithMessage:(id)a3;
+ (id)voicemailWithSYContext:(id)a3;
+ (id)xpcObjectAsArray:(id)a3;
- (BOOL)hasCallbackNumber;
- (BOOL)hasDataPath;
- (BOOL)hasDate;
- (BOOL)hasDuration;
- (BOOL)hasFlags;
- (BOOL)hasIdentifier;
- (BOOL)hasNphReceiverISOCountryCode;
- (BOOL)hasProviderID;
- (BOOL)hasReceiverDestinationID;
- (BOOL)hasRemoteUID;
- (BOOL)hasSender;
- (BOOL)hasVoicemailBody;
- (BOOL)hasVoicemailTranscript;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)callbackNumber;
- (NSString)dataPath;
- (NSString)description;
- (NSString)nphReceiverISOCountryCode;
- (NSString)providerID;
- (NSString)receiverDestinationID;
- (NSString)sender;
- (NanoPhoneVoicemailBody)voicemailBody;
- (NanoPhoneVoicemailMeta)initWithVoicemail:(id)a3;
- (NanoPhoneVoicemailMeta)initWithVoicemailMessage:(id)a3;
- (NanoPhoneVoicemailTranscript)voicemailTranscript;
- (double)date;
- (id)amrDataPath;
- (id)asXpcObject;
- (id)contextWithSyncOperation:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)syncId;
- (id)voicemailDescription;
- (int)duration;
- (int)flags;
- (int)syncOperation;
- (int64_t)identifier;
- (int64_t)remoteUID;
- (int64_t)voicemailNumber;
- (unint64_t)hash;
- (void)attachToXpcObject:(id)a3;
- (void)clearVoicemailBody;
- (void)copyTo:(id)a3;
- (void)loadVoicemailBodyIfNeeded;
- (void)mergeFrom:(id)a3;
- (void)setCallbackNumber:(id)a3;
- (void)setDataPath:(id)a3;
- (void)setDate:(double)a3;
- (void)setDuration:(int)a3;
- (void)setFlags:(int)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasRemoteUID:(BOOL)a3;
- (void)setIdentifier:(int64_t)a3;
- (void)setNphReceiverISOCountryCode:(id)a3;
- (void)setProviderID:(id)a3;
- (void)setReceiverDestinationID:(id)a3;
- (void)setRemoteUID:(int64_t)a3;
- (void)setSender:(id)a3;
- (void)setVoicemailBody:(id)a3;
- (void)setVoicemailNumber:(int64_t)a3;
- (void)setVoicemailTranscript:(id)a3;
- (void)writeTo:(id)a3;
- (void)writeVoicemailBody;
@end

@implementation NanoPhoneVoicemailMeta

- (void)setIdentifier:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIdentifier
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRemoteUID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_remoteUID = a3;
}

- (void)setHasRemoteUID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRemoteUID
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (BOOL)hasCallbackNumber
{
  return self->_callbackNumber != 0;
}

- (void)setDuration:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasDataPath
{
  return self->_dataPath != 0;
}

- (void)setFlags:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFlags
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasVoicemailBody
{
  return self->_voicemailBody != 0;
}

- (BOOL)hasVoicemailTranscript
{
  return self->_voicemailTranscript != 0;
}

- (BOOL)hasReceiverDestinationID
{
  return self->_receiverDestinationID != 0;
}

- (BOOL)hasNphReceiverISOCountryCode
{
  return self->_nphReceiverISOCountryCode != 0;
}

- (BOOL)hasProviderID
{
  return self->_providerID != 0;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NanoPhoneVoicemailMeta;
  v4 = [(NanoPhoneVoicemailMeta *)&v8 description];
  v5 = [(NanoPhoneVoicemailMeta(Wrapper) *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithLongLong:self->_voicemailNumber];
  [v3 setObject:v4 forKey:@"voicemailNumber"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v20 = [NSNumber numberWithLongLong:self->_identifier];
    [v3 setObject:v20 forKey:@"identifier"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v21 = [NSNumber numberWithLongLong:self->_remoteUID];
  [v3 setObject:v21 forKey:@"remoteUID"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v6 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v6 forKey:@"date"];
  }
LABEL_5:
  sender = self->_sender;
  if (sender) {
    [v3 setObject:sender forKey:@"sender"];
  }
  callbackNumber = self->_callbackNumber;
  if (callbackNumber) {
    [v3 setObject:callbackNumber forKey:@"callbackNumber"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_duration];
    [v3 setObject:v9 forKey:@"duration"];
  }
  dataPath = self->_dataPath;
  if (dataPath) {
    [v3 setObject:dataPath forKey:@"dataPath"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v11 = [NSNumber numberWithInt:self->_flags];
    [v3 setObject:v11 forKey:@"flags"];
  }
  voicemailBody = self->_voicemailBody;
  if (voicemailBody)
  {
    v13 = [(NanoPhoneVoicemailBody *)voicemailBody dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"voicemailBody"];
  }
  voicemailTranscript = self->_voicemailTranscript;
  if (voicemailTranscript)
  {
    v15 = [(NanoPhoneVoicemailTranscript *)voicemailTranscript dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"voicemailTranscript"];
  }
  receiverDestinationID = self->_receiverDestinationID;
  if (receiverDestinationID) {
    [v3 setObject:receiverDestinationID forKey:@"receiverDestinationID"];
  }
  nphReceiverISOCountryCode = self->_nphReceiverISOCountryCode;
  if (nphReceiverISOCountryCode) {
    [v3 setObject:nphReceiverISOCountryCode forKey:@"nph_receiverISOCountryCode"];
  }
  providerID = self->_providerID;
  if (providerID) {
    [v3 setObject:providerID forKey:@"providerID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NanoPhoneVoicemailMetaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  v5 = v6;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    v5 = v6;
  }
  if (self->_sender)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_callbackNumber)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }
  if (self->_dataPath)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }
  if (self->_voicemailBody)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_voicemailTranscript)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_receiverDestinationID)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_nphReceiverISOCountryCode)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_providerID)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[4] = self->_voicemailNumber;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_identifier;
    *((unsigned char *)v4 + 112) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_remoteUID;
  *((unsigned char *)v4 + 112) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[1] = *(void *)&self->_date;
    *((unsigned char *)v4 + 112) |= 1u;
  }
LABEL_5:
  id v6 = v4;
  if (self->_sender)
  {
    objc_msgSend(v4, "setSender:");
    v4 = v6;
  }
  if (self->_callbackNumber)
  {
    objc_msgSend(v6, "setCallbackNumber:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_duration;
    *((unsigned char *)v4 + 112) |= 8u;
  }
  if (self->_dataPath)
  {
    objc_msgSend(v6, "setDataPath:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_flags;
    *((unsigned char *)v4 + 112) |= 0x10u;
  }
  if (self->_voicemailBody)
  {
    objc_msgSend(v6, "setVoicemailBody:");
    v4 = v6;
  }
  if (self->_voicemailTranscript)
  {
    objc_msgSend(v6, "setVoicemailTranscript:");
    v4 = v6;
  }
  if (self->_receiverDestinationID)
  {
    objc_msgSend(v6, "setReceiverDestinationID:");
    v4 = v6;
  }
  if (self->_nphReceiverISOCountryCode)
  {
    objc_msgSend(v6, "setNphReceiverISOCountryCode:");
    v4 = v6;
  }
  if (self->_providerID)
  {
    objc_msgSend(v6, "setProviderID:");
    v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  *(void *)(v5 + 32) = self->_voicemailNumber;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_identifier;
    *(unsigned char *)(v5 + 112) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 24) = self->_remoteUID;
  *(unsigned char *)(v5 + 112) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 112) |= 1u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_sender copyWithZone:a3];
  v9 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v8;

  uint64_t v10 = [(NSString *)self->_callbackNumber copyWithZone:a3];
  v11 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v10;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_duration;
    *(unsigned char *)(v6 + 112) |= 8u;
  }
  uint64_t v12 = [(NSString *)self->_dataPath copyWithZone:a3];
  v13 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v12;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_flags;
    *(unsigned char *)(v6 + 112) |= 0x10u;
  }
  id v14 = [(NanoPhoneVoicemailBody *)self->_voicemailBody copyWithZone:a3];
  v15 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v14;

  id v16 = [(NanoPhoneVoicemailTranscript *)self->_voicemailTranscript copyWithZone:a3];
  v17 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v16;

  uint64_t v18 = [(NSString *)self->_receiverDestinationID copyWithZone:a3];
  v19 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v18;

  uint64_t v20 = [(NSString *)self->_nphReceiverISOCountryCode copyWithZone:a3];
  v21 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v20;

  uint64_t v22 = [(NSString *)self->_providerID copyWithZone:a3];
  v23 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v22;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_voicemailNumber != *((void *)v4 + 4))
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 2) == 0 || self->_identifier != *((void *)v4 + 2)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 2) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 4) == 0 || self->_remoteUID != *((void *)v4 + 3)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 4) != 0)
  {
    goto LABEL_45;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_45;
    }
  }
  else if (*((unsigned char *)v4 + 112))
  {
    goto LABEL_45;
  }
  sender = self->_sender;
  if ((unint64_t)sender | *((void *)v4 + 11) && !-[NSString isEqual:](sender, "isEqual:")) {
    goto LABEL_45;
  }
  callbackNumber = self->_callbackNumber;
  if ((unint64_t)callbackNumber | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](callbackNumber, "isEqual:")) {
      goto LABEL_45;
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 8) == 0 || self->_duration != *((_DWORD *)v4 + 14)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 8) != 0)
  {
    goto LABEL_45;
  }
  dataPath = self->_dataPath;
  if ((unint64_t)dataPath | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](dataPath, "isEqual:"))
    {
LABEL_45:
      char v14 = 0;
      goto LABEL_46;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 0x10) == 0 || self->_flags != *((_DWORD *)v4 + 15)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 0x10) != 0)
  {
    goto LABEL_45;
  }
  voicemailBody = self->_voicemailBody;
  if ((unint64_t)voicemailBody | *((void *)v4 + 12)
    && !-[NanoPhoneVoicemailBody isEqual:](voicemailBody, "isEqual:"))
  {
    goto LABEL_45;
  }
  voicemailTranscript = self->_voicemailTranscript;
  if ((unint64_t)voicemailTranscript | *((void *)v4 + 13))
  {
    if (!-[NanoPhoneVoicemailTranscript isEqual:](voicemailTranscript, "isEqual:")) {
      goto LABEL_45;
    }
  }
  receiverDestinationID = self->_receiverDestinationID;
  if ((unint64_t)receiverDestinationID | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](receiverDestinationID, "isEqual:")) {
      goto LABEL_45;
    }
  }
  nphReceiverISOCountryCode = self->_nphReceiverISOCountryCode;
  if ((unint64_t)nphReceiverISOCountryCode | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](nphReceiverISOCountryCode, "isEqual:")) {
      goto LABEL_45;
    }
  }
  providerID = self->_providerID;
  if ((unint64_t)providerID | *((void *)v4 + 9)) {
    char v14 = -[NSString isEqual:](providerID, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_46:

  return v14;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_identifier;
  }
  else {
    uint64_t v3 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v4 = 2654435761 * self->_remoteUID;
  }
  else {
    uint64_t v4 = 0;
  }
  int64_t voicemailNumber = self->_voicemailNumber;
  if (*(unsigned char *)&self->_has)
  {
    double date = self->_date;
    double v8 = -date;
    if (date >= 0.0) {
      double v8 = self->_date;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_sender hash];
  NSUInteger v12 = [(NSString *)self->_callbackNumber hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v13 = 2654435761 * self->_duration;
  }
  else {
    uint64_t v13 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_dataPath hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v15 = 2654435761 * self->_flags;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = v3 ^ v4 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ (2654435761 * voicemailNumber);
  unint64_t v17 = v15 ^ [(NanoPhoneVoicemailBody *)self->_voicemailBody hash];
  unint64_t v18 = v17 ^ [(NanoPhoneVoicemailTranscript *)self->_voicemailTranscript hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_receiverDestinationID hash];
  NSUInteger v20 = v19 ^ [(NSString *)self->_nphReceiverISOCountryCode hash];
  return v16 ^ v20 ^ [(NSString *)self->_providerID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  self->_int64_t voicemailNumber = *((void *)v4 + 4);
  char v6 = *((unsigned char *)v4 + 112);
  if ((v6 & 2) != 0)
  {
    self->_identifier = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 112);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_remoteUID = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 112))
  {
LABEL_4:
    self->_double date = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  id v11 = v4;
  if (*((void *)v4 + 11))
  {
    -[NanoPhoneVoicemailMeta setSender:](self, "setSender:");
    id v5 = v11;
  }
  if (*((void *)v5 + 5))
  {
    -[NanoPhoneVoicemailMeta setCallbackNumber:](self, "setCallbackNumber:");
    id v5 = v11;
  }
  if ((*((unsigned char *)v5 + 112) & 8) != 0)
  {
    self->_duration = *((_DWORD *)v5 + 14);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v5 + 6))
  {
    -[NanoPhoneVoicemailMeta setDataPath:](self, "setDataPath:");
    id v5 = v11;
  }
  if ((*((unsigned char *)v5 + 112) & 0x10) != 0)
  {
    self->_flags = *((_DWORD *)v5 + 15);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  voicemailBody = self->_voicemailBody;
  uint64_t v8 = *((void *)v5 + 12);
  if (voicemailBody)
  {
    if (!v8) {
      goto LABEL_24;
    }
    -[NanoPhoneVoicemailBody mergeFrom:](voicemailBody, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_24;
    }
    -[NanoPhoneVoicemailMeta setVoicemailBody:](self, "setVoicemailBody:");
  }
  id v5 = v11;
LABEL_24:
  voicemailTranscript = self->_voicemailTranscript;
  uint64_t v10 = *((void *)v5 + 13);
  if (voicemailTranscript)
  {
    if (!v10) {
      goto LABEL_30;
    }
    -[NanoPhoneVoicemailTranscript mergeFrom:](voicemailTranscript, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_30;
    }
    -[NanoPhoneVoicemailMeta setVoicemailTranscript:](self, "setVoicemailTranscript:");
  }
  id v5 = v11;
LABEL_30:
  if (*((void *)v5 + 10))
  {
    -[NanoPhoneVoicemailMeta setReceiverDestinationID:](self, "setReceiverDestinationID:");
    id v5 = v11;
  }
  if (*((void *)v5 + 8))
  {
    -[NanoPhoneVoicemailMeta setNphReceiverISOCountryCode:](self, "setNphReceiverISOCountryCode:");
    id v5 = v11;
  }
  if (*((void *)v5 + 9)) {
    -[NanoPhoneVoicemailMeta setProviderID:](self, "setProviderID:");
  }
  MEMORY[0x270F9A758]();
}

- (int64_t)voicemailNumber
{
  return self->_voicemailNumber;
}

- (void)setVoicemailNumber:(int64_t)a3
{
  self->_int64_t voicemailNumber = a3;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (int64_t)remoteUID
{
  return self->_remoteUID;
}

- (double)date
{
  return self->_date;
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSString)callbackNumber
{
  return self->_callbackNumber;
}

- (void)setCallbackNumber:(id)a3
{
}

- (int)duration
{
  return self->_duration;
}

- (NSString)dataPath
{
  return self->_dataPath;
}

- (void)setDataPath:(id)a3
{
}

- (int)flags
{
  return self->_flags;
}

- (NanoPhoneVoicemailBody)voicemailBody
{
  return self->_voicemailBody;
}

- (void)setVoicemailBody:(id)a3
{
}

- (NanoPhoneVoicemailTranscript)voicemailTranscript
{
  return self->_voicemailTranscript;
}

- (void)setVoicemailTranscript:(id)a3
{
}

- (NSString)receiverDestinationID
{
  return self->_receiverDestinationID;
}

- (void)setReceiverDestinationID:(id)a3
{
}

- (NSString)nphReceiverISOCountryCode
{
  return self->_nphReceiverISOCountryCode;
}

- (void)setNphReceiverISOCountryCode:(id)a3
{
}

- (NSString)providerID
{
  return self->_providerID;
}

- (void)setProviderID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicemailTranscript, 0);
  objc_storeStrong((id *)&self->_voicemailBody, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_receiverDestinationID, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_nphReceiverISOCountryCode, 0);
  objc_storeStrong((id *)&self->_dataPath, 0);
  objc_storeStrong((id *)&self->_callbackNumber, 0);
}

- (NanoPhoneVoicemailMeta)initWithVoicemailMessage:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NanoPhoneVoicemailMeta;
  id v5 = [(NanoPhoneVoicemailMeta *)&v18 init];
  if (v5)
  {
    char v6 = [v4 callbackDestinationID];
    [(NanoPhoneVoicemailMeta *)v5 setCallbackNumber:v6];

    v7 = [v4 senderDestinationID];
    [(NanoPhoneVoicemailMeta *)v5 setSender:v7];

    uint64_t v8 = [v4 receiverDestinationID];
    [(NanoPhoneVoicemailMeta *)v5 setReceiverDestinationID:v8];

    -[NanoPhoneVoicemailMeta setRemoteUID:](v5, "setRemoteUID:", [v4 remoteUID]);
    [v4 date];
    -[NanoPhoneVoicemailMeta setDate:](v5, "setDate:");
    [v4 duration];
    [(NanoPhoneVoicemailMeta *)v5 setDuration:(int)v9];
    -[NanoPhoneVoicemailMeta setFlags:](v5, "setFlags:", [v4 flags]);
    -[NanoPhoneVoicemailMeta setIdentifier:](v5, "setIdentifier:", [v4 identifier]);
    -[NanoPhoneVoicemailMeta setVoicemailNumber:](v5, "setVoicemailNumber:", [v4 remoteUID]);
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"/var/mobile/Library/Voicemail/%lld.amr", -[NanoPhoneVoicemailMeta voicemailNumber](v5, "voicemailNumber"));
    [(NanoPhoneVoicemailMeta *)v5 setDataPath:v10];

    id v11 = [NanoPhoneVoicemailBody alloc];
    NSUInteger v12 = [v4 audio];
    uint64_t v13 = [(NanoPhoneVoicemailBody *)v11 initWithAudioMessage:v12 voicemailNumber:[(NanoPhoneVoicemailMeta *)v5 voicemailNumber]];
    [(NanoPhoneVoicemailMeta *)v5 setVoicemailBody:v13];

    NSUInteger v14 = [NanoPhoneVoicemailTranscript alloc];
    uint64_t v15 = [v4 transcript];
    uint64_t v16 = [(NanoPhoneVoicemailTranscript *)v14 initWithTranscriptMessage:v15 voicemailNumber:[(NanoPhoneVoicemailMeta *)v5 voicemailNumber]];
    [(NanoPhoneVoicemailMeta *)v5 setVoicemailTranscript:v16];
  }
  return v5;
}

- (NanoPhoneVoicemailMeta)initWithVoicemail:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NanoPhoneVoicemailMeta;
  id v5 = [(NanoPhoneVoicemailMeta *)&v25 init];
  char v6 = v5;
  if (!v4 || !v5) {
    goto LABEL_16;
  }
  -[NanoPhoneVoicemailMeta setVoicemailNumber:](v5, "setVoicemailNumber:", [v4 identifier]);
  -[NanoPhoneVoicemailMeta setIdentifier:](v6, "setIdentifier:", [v4 identifier]);
  -[NanoPhoneVoicemailMeta setRemoteUID:](v6, "setRemoteUID:", [v4 remoteUID]);
  v7 = [v4 date];
  [v7 timeIntervalSinceReferenceDate];
  -[NanoPhoneVoicemailMeta setDate:](v6, "setDate:");

  if ([v4 hasCallbackNumber])
  {
    uint64_t v8 = [v4 callbackDestinationID];

    if (v8)
    {
      uint64_t v9 = [v4 callbackDestinationID];
LABEL_9:
      uint64_t v10 = (void *)v9;
      goto LABEL_10;
    }
    uint64_t v10 = [v4 senderDestinationID];

    if (v10)
    {
      uint64_t v9 = [v4 senderDestinationID];
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_10:
  [(NanoPhoneVoicemailMeta *)v6 setCallbackNumber:v10];
  [(NanoPhoneVoicemailMeta *)v6 setSender:v10];
  [v4 duration];
  [(NanoPhoneVoicemailMeta *)v6 setDuration:(int)v11];
  NSUInteger v12 = [v4 dataURL];
  uint64_t v13 = [v12 path];
  [(NanoPhoneVoicemailMeta *)v6 setDataPath:v13];

  NSUInteger v14 = [v4 receiverDestinationID];
  [(NanoPhoneVoicemailMeta *)v6 setReceiverDestinationID:v14];

  uint64_t v15 = [v4 receiverISOCountryCode];
  [(NanoPhoneVoicemailMeta *)v6 setNphReceiverISOCountryCode:v15];

  int v16 = [v4 isRead];
  if ([v4 isDataAvailable]) {
    int v17 = 2;
  }
  else {
    int v17 = 0;
  }
  -[NanoPhoneVoicemailMeta setFlags:](v6, "setFlags:", v17 | v16 | (4 * ([v4 mailboxType] == 3)) | (8 * (objc_msgSend(v4, "mailboxType") == 3)) | ((objc_msgSend(v4, "mailboxType") == 2) << 7) | ((objc_msgSend(v4, "transcriptionState") == 3) << 8) | ((objc_msgSend(v4, "transcriptionState") == 2) << 9));
  if ([v4 transcriptionState] == 3)
  {
    objc_super v18 = objc_opt_new();
    [(NanoPhoneVoicemailMeta *)v6 setVoicemailTranscript:v18];

    uint64_t v19 = [v4 identifier];
    NSUInteger v20 = [(NanoPhoneVoicemailMeta *)v6 voicemailTranscript];
    [v20 setVoicemailNumber:v19];

    v21 = [v4 transcript];
    uint64_t v22 = [v21 transcriptionString];
    v23 = [(NanoPhoneVoicemailMeta *)v6 voicemailTranscript];
    [v23 setTranscriptionString:v22];
  }
LABEL_16:

  return v6;
}

+ (id)voicemailWithSYContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"kNPHVoiceMailMetaContextMetaData"];
  if (v4)
  {
    id v5 = [[NanoPhoneVoicemailMeta alloc] initWithData:v4];
    char v6 = [v3 objectForKey:@"kNPHVoiceMailMetaContextMetaWrapperOperation"];
    uint64_t v7 = [v6 intValue];

    uint64_t v8 = [NSNumber numberWithInt:v7];
    objc_setAssociatedObject(v5, @"kNPHVoiceMailMetaContextMetaWrapperOperation", v8, (void *)3);
  }
  else
  {
    id v5 = objc_alloc_init(NanoPhoneVoicemailMeta);
  }

  return v5;
}

- (int)syncOperation
{
  v2 = objc_getAssociatedObject(self, @"kNPHVoiceMailMetaContextMetaWrapperOperation");
  id v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (id)contextWithSyncOperation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_opt_new();
  char v6 = (void *)[(NanoPhoneVoicemailMeta *)self copy];
  [v6 setVoicemailBody:0];
  uint64_t v7 = [v6 data];
  [v5 setObject:v7 forKey:@"kNPHVoiceMailMetaContextMetaData"];

  uint64_t v8 = [NSNumber numberWithInt:v3];
  [v5 setObject:v8 forKey:@"kNPHVoiceMailMetaContextMetaWrapperOperation"];

  return v5;
}

+ (id)voicemailWithMessage:(id)a3
{
  size_t length = 0;
  data = xpc_dictionary_get_data(a3, "NanoTelephonyVoicemail", &length);
  if (data) {
    BOOL v4 = length == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    char v6 = objc_alloc_init(NanoPhoneVoicemailMeta);
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", data);
    char v6 = [[NanoPhoneVoicemailMeta alloc] initWithData:v5];
  }
  return v6;
}

- (id)asXpcObject
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = [(NanoPhoneVoicemailMeta *)self data];
  xpc_dictionary_set_data(v3, "NanoTelephonyVoicemail", (const void *)[v4 bytes], objc_msgSend(v4, "length"));

  return v3;
}

- (void)attachToXpcObject:(id)a3
{
  id v4 = a3;
  id v5 = [(NanoPhoneVoicemailMeta *)self data];
  xpc_dictionary_set_data(v4, "NanoTelephonyVoicemail", (const void *)[v5 bytes], objc_msgSend(v5, "length"));
}

+ (id)xpcObjectAsArray:(id)a3
{
  size_t length = 0;
  data = xpc_dictionary_get_data(a3, "NanoVoicemailArray", &length);
  if (data) {
    BOOL v4 = length == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    id v5 = [MEMORY[0x263EFF8C0] array];
  }
  else
  {
    char v6 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", data);
    id v12 = 0;
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v6 error:&v12];
    id v8 = v12;
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = nph_general_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[NanoPhoneVoicemailMeta(Wrapper) xpcObjectAsArray:]();
      }
    }
    id v5 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithCoder:v7];
  }
  return v5;
}

- (void)loadVoicemailBodyIfNeeded
{
  if ([(NanoPhoneVoicemailMeta *)self hasVoicemailBody])
  {
    xpc_object_t v3 = (void *)MEMORY[0x263EFF8F8];
    BOOL v4 = [(NanoPhoneVoicemailMeta *)self amrDataPath];
    id v6 = [v3 dataWithContentsOfFile:v4];

    if (v6)
    {
      id v5 = [(NanoPhoneVoicemailMeta *)self voicemailBody];
      [v5 setVoicemailRecording:v6];
    }
    else
    {
      [(NanoPhoneVoicemailMeta *)self setFlags:[(NanoPhoneVoicemailMeta *)self flags] & 0xFFFFFFFDLL];
    }
  }
}

- (void)clearVoicemailBody
{
  id v2 = [(NanoPhoneVoicemailMeta *)self voicemailBody];
  [v2 setVoicemailRecording:0];
}

- (void)writeVoicemailBody
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = [(NanoPhoneVoicemailMeta *)self voicemailBody];
  BOOL v4 = [v3 voicemailRecording];

  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[NanoPhoneVoicemailMeta(Wrapper) writeVoicemailBody]";
    __int16 v13 = 2112;
    NSUInteger v14 = v4;
    _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s: voicemailRecording: %@", buf, 0x16u);
  }

  if (v4)
  {
    id v6 = [(NanoPhoneVoicemailMeta *)self dataPath];
    id v10 = 0;
    char v7 = [v4 writeToFile:v6 options:0x40000000 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0)
    {
      uint64_t v9 = nph_general_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[NanoPhoneVoicemailMeta(Wrapper) writeVoicemailBody]();
      }
    }
  }
}

- (id)voicemailDescription
{
  xpc_object_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NanoPhoneVoicemailMeta;
  BOOL v4 = [(NanoPhoneVoicemailMeta *)&v8 description];
  id v5 = [(NanoPhoneVoicemailMeta(Wrapper) *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)syncId
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lld", self->_identifier);
}

- (id)amrDataPath
{
  id v2 = self;
  sub_23466C658();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_234673918();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

@end
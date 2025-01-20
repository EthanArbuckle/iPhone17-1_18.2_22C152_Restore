@interface VMVoicemailMessage
- (BOOL)hasAudio;
- (BOOL)hasCallbackDestinationID;
- (BOOL)hasDataURL;
- (BOOL)hasDate;
- (BOOL)hasDuration;
- (BOOL)hasFlags;
- (BOOL)hasIdentifier;
- (BOOL)hasProtocolVersion;
- (BOOL)hasReceiverDestinationID;
- (BOOL)hasReceiverLabelID;
- (BOOL)hasRemoteUID;
- (BOOL)hasSenderDestinationID;
- (BOOL)hasTranscript;
- (BOOL)hasTranscriptionURL;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)callbackDestinationID;
- (NSString)dataURL;
- (NSString)receiverDestinationID;
- (NSString)receiverLabelID;
- (NSString)senderDestinationID;
- (NSString)transcriptionURL;
- (NSString)uuid;
- (VMAudioMessage)audio;
- (VMTranscriptMessage)transcript;
- (double)date;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)flags;
- (unsigned)identifier;
- (unsigned)protocolVersion;
- (unsigned)remoteUID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudio:(id)a3;
- (void)setCallbackDestinationID:(id)a3;
- (void)setDataURL:(id)a3;
- (void)setDate:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setHasRemoteUID:(BOOL)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setProtocolVersion:(unsigned int)a3;
- (void)setReceiverDestinationID:(id)a3;
- (void)setReceiverLabelID:(id)a3;
- (void)setRemoteUID:(unsigned int)a3;
- (void)setSenderDestinationID:(id)a3;
- (void)setTranscript:(id)a3;
- (void)setTranscriptionURL:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VMVoicemailMessage

- (void)setRemoteUID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_remoteUID = a3;
}

- (void)setHasRemoteUID:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRemoteUID
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIdentifier
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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

- (BOOL)hasSenderDestinationID
{
  return self->_senderDestinationID != 0;
}

- (BOOL)hasCallbackDestinationID
{
  return self->_callbackDestinationID != 0;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasDataURL
{
  return self->_dataURL != 0;
}

- (void)setFlags:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFlags
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTranscriptionURL
{
  return self->_transcriptionURL != 0;
}

- (BOOL)hasTranscript
{
  return self->_transcript != 0;
}

- (BOOL)hasAudio
{
  return self->_audio != 0;
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasProtocolVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasReceiverDestinationID
{
  return self->_receiverDestinationID != 0;
}

- (BOOL)hasReceiverLabelID
{
  return self->_receiverLabelID != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VMVoicemailMessage;
  v4 = [(VMVoicemailMessage *)&v8 description];
  v5 = [(VMVoicemailMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v21 = [NSNumber numberWithUnsignedInt:self->_remoteUID];
    [v3 setObject:v21 forKey:@"remoteUID"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v22 = [NSNumber numberWithUnsignedInt:self->_identifier];
  [v3 setObject:v22 forKey:@"identifier"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v5 forKey:@"date"];
  }
LABEL_5:
  senderDestinationID = self->_senderDestinationID;
  if (senderDestinationID) {
    [v3 setObject:senderDestinationID forKey:@"senderDestinationID"];
  }
  callbackDestinationID = self->_callbackDestinationID;
  if (callbackDestinationID) {
    [v3 setObject:callbackDestinationID forKey:@"callbackDestinationID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_duration];
    [v3 setObject:v8 forKey:@"duration"];
  }
  dataURL = self->_dataURL;
  if (dataURL) {
    [v3 setObject:dataURL forKey:@"dataURL"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_flags];
    [v3 setObject:v10 forKey:@"flags"];
  }
  transcriptionURL = self->_transcriptionURL;
  if (transcriptionURL) {
    [v3 setObject:transcriptionURL forKey:@"transcriptionURL"];
  }
  transcript = self->_transcript;
  if (transcript)
  {
    v13 = [(VMTranscriptMessage *)transcript dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"transcript"];
  }
  audio = self->_audio;
  if (audio)
  {
    v15 = [(VMAudioMessage *)audio dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"audio"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v16 = [NSNumber numberWithUnsignedInt:self->_protocolVersion];
    [v3 setObject:v16 forKey:@"protocolVersion"];
  }
  receiverDestinationID = self->_receiverDestinationID;
  if (receiverDestinationID) {
    [v3 setObject:receiverDestinationID forKey:@"receiverDestinationID"];
  }
  receiverLabelID = self->_receiverLabelID;
  if (receiverLabelID) {
    [v3 setObject:receiverLabelID forKey:@"receiverLabelID"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VMVoicemailMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_senderDestinationID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_callbackDestinationID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_dataURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_transcriptionURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_transcript)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_audio)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_receiverDestinationID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_receiverLabelID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[20] = self->_remoteUID;
    *((unsigned char *)v4 + 120) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_identifier;
  *((unsigned char *)v4 + 120) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)v4 + 1) = *(void *)&self->_date;
    *((unsigned char *)v4 + 120) |= 1u;
  }
LABEL_5:
  id v6 = v4;
  if (self->_senderDestinationID)
  {
    objc_msgSend(v4, "setSenderDestinationID:");
    id v4 = v6;
  }
  if (self->_callbackDestinationID)
  {
    objc_msgSend(v6, "setCallbackDestinationID:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_duration;
    *((unsigned char *)v4 + 120) |= 2u;
  }
  if (self->_dataURL)
  {
    objc_msgSend(v6, "setDataURL:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[12] = self->_flags;
    *((unsigned char *)v4 + 120) |= 4u;
  }
  if (self->_transcriptionURL)
  {
    objc_msgSend(v6, "setTranscriptionURL:");
    id v4 = v6;
  }
  if (self->_transcript)
  {
    objc_msgSend(v6, "setTranscript:");
    id v4 = v6;
  }
  if (self->_audio)
  {
    objc_msgSend(v6, "setAudio:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[14] = self->_protocolVersion;
    *((unsigned char *)v4 + 120) |= 0x10u;
  }
  if (self->_receiverDestinationID)
  {
    objc_msgSend(v6, "setReceiverDestinationID:");
    id v4 = v6;
  }
  if (self->_receiverLabelID)
  {
    objc_msgSend(v6, "setReceiverLabelID:");
    id v4 = v6;
  }
  if (self->_uuid)
  {
    objc_msgSend(v6, "setUuid:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_remoteUID;
    *(unsigned char *)(v5 + 120) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 52) = self->_identifier;
  *(unsigned char *)(v5 + 120) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 120) |= 1u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_senderDestinationID copyWithZone:a3];
  v9 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v8;

  uint64_t v10 = [(NSString *)self->_callbackDestinationID copyWithZone:a3];
  v11 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_duration;
    *(unsigned char *)(v6 + 120) |= 2u;
  }
  uint64_t v12 = [(NSString *)self->_dataURL copyWithZone:a3];
  v13 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v12;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_flags;
    *(unsigned char *)(v6 + 120) |= 4u;
  }
  uint64_t v14 = [(NSString *)self->_transcriptionURL copyWithZone:a3];
  v15 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v14;

  id v16 = [(VMTranscriptMessage *)self->_transcript copyWithZone:a3];
  v17 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v16;

  id v18 = [(VMAudioMessage *)self->_audio copyWithZone:a3];
  v19 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v18;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_protocolVersion;
    *(unsigned char *)(v6 + 120) |= 0x10u;
  }
  uint64_t v20 = [(NSString *)self->_receiverDestinationID copyWithZone:a3];
  v21 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v20;

  uint64_t v22 = [(NSString *)self->_receiverLabelID copyWithZone:a3];
  v23 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v22;

  uint64_t v24 = [(NSString *)self->_uuid copyWithZone:a3];
  v25 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v24;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 0x20) == 0 || self->_remoteUID != *((_DWORD *)v4 + 20)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 0x20) != 0)
  {
    goto LABEL_51;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 8) == 0 || self->_identifier != *((_DWORD *)v4 + 13)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 8) != 0)
  {
    goto LABEL_51;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 120) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_51;
    }
  }
  else if (*((unsigned char *)v4 + 120))
  {
    goto LABEL_51;
  }
  senderDestinationID = self->_senderDestinationID;
  if ((unint64_t)senderDestinationID | *((void *)v4 + 11)
    && !-[NSString isEqual:](senderDestinationID, "isEqual:"))
  {
    goto LABEL_51;
  }
  callbackDestinationID = self->_callbackDestinationID;
  if ((unint64_t)callbackDestinationID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](callbackDestinationID, "isEqual:")) {
      goto LABEL_51;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 2) == 0 || self->_duration != *((double *)v4 + 2)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 2) != 0)
  {
    goto LABEL_51;
  }
  dataURL = self->_dataURL;
  if ((unint64_t)dataURL | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](dataURL, "isEqual:"))
    {
LABEL_51:
      char v15 = 0;
      goto LABEL_52;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 4) == 0 || self->_flags != *((_DWORD *)v4 + 12)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 4) != 0)
  {
    goto LABEL_51;
  }
  transcriptionURL = self->_transcriptionURL;
  if ((unint64_t)transcriptionURL | *((void *)v4 + 13)
    && !-[NSString isEqual:](transcriptionURL, "isEqual:"))
  {
    goto LABEL_51;
  }
  transcript = self->_transcript;
  if ((unint64_t)transcript | *((void *)v4 + 12))
  {
    if (!-[VMTranscriptMessage isEqual:](transcript, "isEqual:")) {
      goto LABEL_51;
    }
  }
  audio = self->_audio;
  if ((unint64_t)audio | *((void *)v4 + 3))
  {
    if (!-[VMAudioMessage isEqual:](audio, "isEqual:")) {
      goto LABEL_51;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 0x10) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 14)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 0x10) != 0)
  {
    goto LABEL_51;
  }
  receiverDestinationID = self->_receiverDestinationID;
  if ((unint64_t)receiverDestinationID | *((void *)v4 + 9)
    && !-[NSString isEqual:](receiverDestinationID, "isEqual:"))
  {
    goto LABEL_51;
  }
  receiverLabelID = self->_receiverLabelID;
  if ((unint64_t)receiverLabelID | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](receiverLabelID, "isEqual:")) {
      goto LABEL_51;
    }
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 14)) {
    char v15 = -[NSString isEqual:](uuid, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_52:

  return v15;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    uint64_t v25 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v24 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v7 = 0;
    goto LABEL_13;
  }
  uint64_t v25 = 2654435761 * self->_remoteUID;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v24 = 2654435761 * self->_identifier;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double date = self->_date;
  double v4 = -date;
  if (date >= 0.0) {
    double v4 = self->_date;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
LABEL_13:
  NSUInteger v23 = [(NSString *)self->_senderDestinationID hash];
  NSUInteger v8 = [(NSString *)self->_callbackDestinationID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double duration = self->_duration;
    double v11 = -duration;
    if (duration >= 0.0) {
      double v11 = self->_duration;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_dataURL hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_flags;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v16 = [(NSString *)self->_transcriptionURL hash];
  unint64_t v17 = [(VMTranscriptMessage *)self->_transcript hash];
  unint64_t v18 = [(VMAudioMessage *)self->_audio hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v19 = 2654435761 * self->_protocolVersion;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v20 = v24 ^ v25 ^ v7 ^ v23 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(NSString *)self->_receiverDestinationID hash];
  NSUInteger v21 = [(NSString *)self->_receiverLabelID hash];
  return v20 ^ v21 ^ [(NSString *)self->_uuid hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 120);
  if ((v6 & 0x20) != 0)
  {
    self->_remoteUID = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)v4 + 120);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_identifier = *((_DWORD *)v4 + 13);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 120))
  {
LABEL_4:
    self->_double date = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  id v11 = v4;
  if (*((void *)v4 + 11))
  {
    -[VMVoicemailMessage setSenderDestinationID:](self, "setSenderDestinationID:");
    id v5 = v11;
  }
  if (*((void *)v5 + 4))
  {
    -[VMVoicemailMessage setCallbackDestinationID:](self, "setCallbackDestinationID:");
    id v5 = v11;
  }
  if ((*((unsigned char *)v5 + 120) & 2) != 0)
  {
    self->_double duration = *((double *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 5))
  {
    -[VMVoicemailMessage setDataURL:](self, "setDataURL:");
    id v5 = v11;
  }
  if ((*((unsigned char *)v5 + 120) & 4) != 0)
  {
    self->_flags = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 13))
  {
    -[VMVoicemailMessage setTranscriptionURL:](self, "setTranscriptionURL:");
    id v5 = v11;
  }
  transcript = self->_transcript;
  uint64_t v8 = *((void *)v5 + 12);
  if (transcript)
  {
    if (!v8) {
      goto LABEL_26;
    }
    -[VMTranscriptMessage mergeFrom:](transcript, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_26;
    }
    -[VMVoicemailMessage setTranscript:](self, "setTranscript:");
  }
  id v5 = v11;
LABEL_26:
  audio = self->_audio;
  uint64_t v10 = *((void *)v5 + 3);
  if (audio)
  {
    if (!v10) {
      goto LABEL_32;
    }
    -[VMAudioMessage mergeFrom:](audio, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_32;
    }
    -[VMVoicemailMessage setAudio:](self, "setAudio:");
  }
  id v5 = v11;
LABEL_32:
  if ((*((unsigned char *)v5 + 120) & 0x10) != 0)
  {
    self->_protocolVersion = *((_DWORD *)v5 + 14);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v5 + 9))
  {
    -[VMVoicemailMessage setReceiverDestinationID:](self, "setReceiverDestinationID:");
    id v5 = v11;
  }
  if (*((void *)v5 + 8))
  {
    -[VMVoicemailMessage setReceiverLabelID:](self, "setReceiverLabelID:");
    id v5 = v11;
  }
  if (*((void *)v5 + 14)) {
    -[VMVoicemailMessage setUuid:](self, "setUuid:");
  }
  MEMORY[0x270F9A758]();
}

- (unsigned)remoteUID
{
  return self->_remoteUID;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (double)date
{
  return self->_date;
}

- (NSString)senderDestinationID
{
  return self->_senderDestinationID;
}

- (void)setSenderDestinationID:(id)a3
{
}

- (NSString)callbackDestinationID
{
  return self->_callbackDestinationID;
}

- (void)setCallbackDestinationID:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (NSString)dataURL
{
  return self->_dataURL;
}

- (void)setDataURL:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)transcriptionURL
{
  return self->_transcriptionURL;
}

- (void)setTranscriptionURL:(id)a3
{
}

- (VMTranscriptMessage)transcript
{
  return self->_transcript;
}

- (void)setTranscript:(id)a3
{
}

- (VMAudioMessage)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)receiverDestinationID
{
  return self->_receiverDestinationID;
}

- (void)setReceiverDestinationID:(id)a3
{
}

- (NSString)receiverLabelID
{
  return self->_receiverLabelID;
}

- (void)setReceiverLabelID:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_transcriptionURL, 0);
  objc_storeStrong((id *)&self->_transcript, 0);
  objc_storeStrong((id *)&self->_senderDestinationID, 0);
  objc_storeStrong((id *)&self->_receiverDestinationID, 0);
  objc_storeStrong((id *)&self->_receiverLabelID, 0);
  objc_storeStrong((id *)&self->_dataURL, 0);
  objc_storeStrong((id *)&self->_callbackDestinationID, 0);
  objc_storeStrong((id *)&self->_audio, 0);
}

@end
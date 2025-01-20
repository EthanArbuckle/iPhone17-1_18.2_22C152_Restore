@interface NRPBTermsEvent
- (BOOL)hasAcknowledgedDeviceName;
- (BOOL)hasAcknowledgedDeviceSerialNumber;
- (BOOL)hasDisplayDeviceName;
- (BOOL)hasDisplayDeviceSerialNumber;
- (BOOL)hasDocumentationID;
- (BOOL)hasEventDate;
- (BOOL)hasEventType;
- (BOOL)hasLoggingProcessName;
- (BOOL)hasPresentationLocation;
- (BOOL)hasPresentationReason;
- (BOOL)hasTermsText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)termsText;
- (NSString)acknowledgedDeviceName;
- (NSString)acknowledgedDeviceSerialNumber;
- (NSString)displayDeviceName;
- (NSString)displayDeviceSerialNumber;
- (NSString)documentationID;
- (NSString)loggingProcessName;
- (NSString)presentationReason;
- (double)eventDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)eventType;
- (int)presentationLocation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAcknowledgedDeviceName:(id)a3;
- (void)setAcknowledgedDeviceSerialNumber:(id)a3;
- (void)setDisplayDeviceName:(id)a3;
- (void)setDisplayDeviceSerialNumber:(id)a3;
- (void)setDocumentationID:(id)a3;
- (void)setEventDate:(double)a3;
- (void)setEventType:(int)a3;
- (void)setHasEventDate:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasPresentationLocation:(BOOL)a3;
- (void)setLoggingProcessName:(id)a3;
- (void)setPresentationLocation:(int)a3;
- (void)setPresentationReason:(id)a3;
- (void)setTermsText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRPBTermsEvent

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasTermsText
{
  return self->_termsText != 0;
}

- (BOOL)hasDocumentationID
{
  return self->_documentationID != 0;
}

- (BOOL)hasPresentationReason
{
  return self->_presentationReason != 0;
}

- (void)setPresentationLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_presentationLocation = a3;
}

- (void)setHasPresentationLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPresentationLocation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAcknowledgedDeviceName
{
  return self->_acknowledgedDeviceName != 0;
}

- (BOOL)hasAcknowledgedDeviceSerialNumber
{
  return self->_acknowledgedDeviceSerialNumber != 0;
}

- (BOOL)hasDisplayDeviceName
{
  return self->_displayDeviceName != 0;
}

- (BOOL)hasDisplayDeviceSerialNumber
{
  return self->_displayDeviceSerialNumber != 0;
}

- (void)setEventDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventDate = a3;
}

- (void)setHasEventDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLoggingProcessName
{
  return self->_loggingProcessName != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NRPBTermsEvent;
  v4 = [(NRPBTermsEvent *)&v8 description];
  v5 = [(NRPBTermsEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithInt:self->_eventType];
    [v3 setObject:v4 forKey:@"eventType"];
  }
  termsText = self->_termsText;
  if (termsText) {
    [v3 setObject:termsText forKey:@"termsText"];
  }
  documentationID = self->_documentationID;
  if (documentationID) {
    [v3 setObject:documentationID forKey:@"documentationID"];
  }
  presentationReason = self->_presentationReason;
  if (presentationReason) {
    [v3 setObject:presentationReason forKey:@"presentationReason"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_presentationLocation];
    [v3 setObject:v8 forKey:@"presentationLocation"];
  }
  acknowledgedDeviceName = self->_acknowledgedDeviceName;
  if (acknowledgedDeviceName) {
    [v3 setObject:acknowledgedDeviceName forKey:@"acknowledgedDeviceName"];
  }
  acknowledgedDeviceSerialNumber = self->_acknowledgedDeviceSerialNumber;
  if (acknowledgedDeviceSerialNumber) {
    [v3 setObject:acknowledgedDeviceSerialNumber forKey:@"acknowledgedDeviceSerialNumber"];
  }
  displayDeviceName = self->_displayDeviceName;
  if (displayDeviceName) {
    [v3 setObject:displayDeviceName forKey:@"displayDeviceName"];
  }
  displayDeviceSerialNumber = self->_displayDeviceSerialNumber;
  if (displayDeviceSerialNumber) {
    [v3 setObject:displayDeviceSerialNumber forKey:@"displayDeviceSerialNumber"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v13 = [NSNumber numberWithDouble:self->_eventDate];
    [v3 setObject:v13 forKey:@"eventDate"];
  }
  loggingProcessName = self->_loggingProcessName;
  if (loggingProcessName) {
    [v3 setObject:loggingProcessName forKey:@"loggingProcessName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBTermsEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_termsText)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_documentationID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_presentationReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_acknowledgedDeviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_acknowledgedDeviceSerialNumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_displayDeviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_displayDeviceSerialNumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_loggingProcessName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[14] = self->_eventType;
    *((unsigned char *)v4 + 96) |= 2u;
  }
  id v5 = v4;
  if (self->_termsText)
  {
    objc_msgSend(v4, "setTermsText:");
    id v4 = v5;
  }
  if (self->_documentationID)
  {
    objc_msgSend(v5, "setDocumentationID:");
    id v4 = v5;
  }
  if (self->_presentationReason)
  {
    objc_msgSend(v5, "setPresentationReason:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[18] = self->_presentationLocation;
    *((unsigned char *)v4 + 96) |= 4u;
  }
  if (self->_acknowledgedDeviceName)
  {
    objc_msgSend(v5, "setAcknowledgedDeviceName:");
    id v4 = v5;
  }
  if (self->_acknowledgedDeviceSerialNumber)
  {
    objc_msgSend(v5, "setAcknowledgedDeviceSerialNumber:");
    id v4 = v5;
  }
  if (self->_displayDeviceName)
  {
    objc_msgSend(v5, "setDisplayDeviceName:");
    id v4 = v5;
  }
  if (self->_displayDeviceSerialNumber)
  {
    objc_msgSend(v5, "setDisplayDeviceSerialNumber:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_eventDate;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  if (self->_loggingProcessName)
  {
    objc_msgSend(v5, "setLoggingProcessName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_eventType;
    *(unsigned char *)(v5 + 96) |= 2u;
  }
  uint64_t v7 = [(NSData *)self->_termsText copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v7;

  uint64_t v9 = [(NSString *)self->_documentationID copyWithZone:a3];
  v10 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v9;

  uint64_t v11 = [(NSString *)self->_presentationReason copyWithZone:a3];
  v12 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v11;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_presentationLocation;
    *(unsigned char *)(v6 + 96) |= 4u;
  }
  uint64_t v13 = [(NSString *)self->_acknowledgedDeviceName copyWithZone:a3];
  v14 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v13;

  uint64_t v15 = [(NSString *)self->_acknowledgedDeviceSerialNumber copyWithZone:a3];
  v16 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v15;

  uint64_t v17 = [(NSString *)self->_displayDeviceName copyWithZone:a3];
  v18 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v17;

  uint64_t v19 = [(NSString *)self->_displayDeviceSerialNumber copyWithZone:a3];
  v20 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v19;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v6 + 8) = self->_eventDate;
    *(unsigned char *)(v6 + 96) |= 1u;
  }
  uint64_t v21 = [(NSString *)self->_loggingProcessName copyWithZone:a3];
  v22 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v21;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 14)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
LABEL_33:
    char v13 = 0;
    goto LABEL_34;
  }
  termsText = self->_termsText;
  if ((unint64_t)termsText | *((void *)v4 + 11) && !-[NSData isEqual:](termsText, "isEqual:")) {
    goto LABEL_33;
  }
  documentationID = self->_documentationID;
  if ((unint64_t)documentationID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](documentationID, "isEqual:")) {
      goto LABEL_33;
    }
  }
  presentationReason = self->_presentationReason;
  if ((unint64_t)presentationReason | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](presentationReason, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_presentationLocation != *((_DWORD *)v4 + 18)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    goto LABEL_33;
  }
  acknowledgedDeviceName = self->_acknowledgedDeviceName;
  if ((unint64_t)acknowledgedDeviceName | *((void *)v4 + 2)
    && !-[NSString isEqual:](acknowledgedDeviceName, "isEqual:"))
  {
    goto LABEL_33;
  }
  acknowledgedDeviceSerialNumber = self->_acknowledgedDeviceSerialNumber;
  if ((unint64_t)acknowledgedDeviceSerialNumber | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](acknowledgedDeviceSerialNumber, "isEqual:")) {
      goto LABEL_33;
    }
  }
  displayDeviceName = self->_displayDeviceName;
  if ((unint64_t)displayDeviceName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayDeviceName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  displayDeviceSerialNumber = self->_displayDeviceSerialNumber;
  if ((unint64_t)displayDeviceSerialNumber | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](displayDeviceSerialNumber, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_eventDate != *((double *)v4 + 1)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_33;
  }
  loggingProcessName = self->_loggingProcessName;
  if ((unint64_t)loggingProcessName | *((void *)v4 + 8)) {
    char v13 = -[NSString isEqual:](loggingProcessName, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_34:

  return v13;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v17 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v16 = [(NSData *)self->_termsText hash];
  NSUInteger v3 = [(NSString *)self->_documentationID hash];
  NSUInteger v4 = [(NSString *)self->_presentationReason hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v5 = 2654435761 * self->_presentationLocation;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_acknowledgedDeviceName hash];
  NSUInteger v7 = [(NSString *)self->_acknowledgedDeviceSerialNumber hash];
  NSUInteger v8 = [(NSString *)self->_displayDeviceName hash];
  NSUInteger v9 = [(NSString *)self->_displayDeviceSerialNumber hash];
  if (*(unsigned char *)&self->_has)
  {
    double eventDate = self->_eventDate;
    double v12 = -eventDate;
    if (eventDate >= 0.0) {
      double v12 = self->_eventDate;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSString *)self->_loggingProcessName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v5 = v4;
  if (*((void *)v4 + 11))
  {
    -[NRPBTermsEvent setTermsText:](self, "setTermsText:");
    id v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[NRPBTermsEvent setDocumentationID:](self, "setDocumentationID:");
    id v4 = v5;
  }
  if (*((void *)v4 + 10))
  {
    -[NRPBTermsEvent setPresentationReason:](self, "setPresentationReason:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    self->_presentationLocation = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 2))
  {
    -[NRPBTermsEvent setAcknowledgedDeviceName:](self, "setAcknowledgedDeviceName:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NRPBTermsEvent setAcknowledgedDeviceSerialNumber:](self, "setAcknowledgedDeviceSerialNumber:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NRPBTermsEvent setDisplayDeviceName:](self, "setDisplayDeviceName:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[NRPBTermsEvent setDisplayDeviceSerialNumber:](self, "setDisplayDeviceSerialNumber:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 96))
  {
    self->_double eventDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 8))
  {
    -[NRPBTermsEvent setLoggingProcessName:](self, "setLoggingProcessName:");
    id v4 = v5;
  }
}

- (int)eventType
{
  return self->_eventType;
}

- (NSData)termsText
{
  return self->_termsText;
}

- (void)setTermsText:(id)a3
{
}

- (NSString)documentationID
{
  return self->_documentationID;
}

- (void)setDocumentationID:(id)a3
{
}

- (NSString)presentationReason
{
  return self->_presentationReason;
}

- (void)setPresentationReason:(id)a3
{
}

- (int)presentationLocation
{
  return self->_presentationLocation;
}

- (NSString)acknowledgedDeviceName
{
  return self->_acknowledgedDeviceName;
}

- (void)setAcknowledgedDeviceName:(id)a3
{
}

- (NSString)acknowledgedDeviceSerialNumber
{
  return self->_acknowledgedDeviceSerialNumber;
}

- (void)setAcknowledgedDeviceSerialNumber:(id)a3
{
}

- (NSString)displayDeviceName
{
  return self->_displayDeviceName;
}

- (void)setDisplayDeviceName:(id)a3
{
}

- (NSString)displayDeviceSerialNumber
{
  return self->_displayDeviceSerialNumber;
}

- (void)setDisplayDeviceSerialNumber:(id)a3
{
}

- (double)eventDate
{
  return self->_eventDate;
}

- (NSString)loggingProcessName
{
  return self->_loggingProcessName;
}

- (void)setLoggingProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsText, 0);
  objc_storeStrong((id *)&self->_presentationReason, 0);
  objc_storeStrong((id *)&self->_loggingProcessName, 0);
  objc_storeStrong((id *)&self->_documentationID, 0);
  objc_storeStrong((id *)&self->_displayDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_displayDeviceName, 0);
  objc_storeStrong((id *)&self->_acknowledgedDeviceSerialNumber, 0);

  objc_storeStrong((id *)&self->_acknowledgedDeviceName, 0);
}

@end
@interface PDURLSessionProxySessionMessage
- (BOOL)hasIdsPriority;
- (BOOL)hasLaunchUUID;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSessionIdentifier;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)launchUUID;
- (NSString)sessionIdentifier;
- (NSString)uuidString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)idsPriority;
- (unint64_t)hash;
- (unint64_t)sequenceNumber;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIdsPriority:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setIdsPriority:(int64_t)a3;
- (void)setLaunchUUID:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setUuidString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxySessionMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_storeStrong((id *)&self->_launchUUID, 0);
}

- (void)setLaunchUUID:(id)a3
{
}

- (NSString)launchUUID
{
  return self->_launchUUID;
}

- (int64_t)idsPriority
{
  return self->_idsPriority;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setUuidString:(id)a3
{
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[PDURLSessionProxySessionMessage setSessionIdentifier:](self, "setSessionIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[PDURLSessionProxySessionMessage setUuidString:](self, "setUuidString:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_sequenceNumber = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 48);
  }
  if (v5)
  {
    self->_idsPriority = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[PDURLSessionProxySessionMessage setLaunchUUID:](self, "setLaunchUUID:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_uuidString hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_sequenceNumber;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_launchUUID hash];
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_idsPriority;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_launchUUID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  sessionIdentifier = self->_sessionIdentifier;
  if ((unint64_t)sessionIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionIdentifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_sequenceNumber != *((void *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_18:
    unsigned __int8 v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_idsPriority != *((void *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_18;
  }
  launchUUID = self->_launchUUID;
  if ((unint64_t)launchUUID | *((void *)v4 + 3)) {
    unsigned __int8 v8 = -[NSString isEqual:](launchUUID, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_19:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_uuidString copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = self->_sequenceNumber;
    *((unsigned char *)v5 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[1] = self->_idsPriority;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v11 = [(NSString *)self->_launchUUID copyWithZone:a3];
  v12 = (void *)v5[3];
  v5[3] = v11;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sessionIdentifier)
  {
    [v4 setSessionIdentifier:];
    id v4 = v6;
  }
  if (self->_uuidString)
  {
    [v6 setUuidString:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_sequenceNumber;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_idsPriority;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_launchUUID)
  {
    [v6 setLaunchUUID:];
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sessionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_uuidString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_launchUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006494C((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v3 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
  }
  uuidString = self->_uuidString;
  if (uuidString) {
    [v4 setObject:uuidString forKey:@"uuidString"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    id v8 = +[NSNumber numberWithUnsignedLongLong:self->_sequenceNumber];
    [v4 setObject:v8 forKey:@"sequenceNumber"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = +[NSNumber numberWithLongLong:self->_idsPriority];
    [v4 setObject:v9 forKey:@"idsPriority"];
  }
  launchUUID = self->_launchUUID;
  if (launchUUID) {
    [v4 setObject:launchUUID forKey:@"launchUUID"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxySessionMessage;
  NSUInteger v3 = [(PDURLSessionProxySessionMessage *)&v7 description];
  id v4 = [(PDURLSessionProxySessionMessage *)self dictionaryRepresentation];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasLaunchUUID
{
  return self->_launchUUID != 0;
}

- (BOOL)hasIdsPriority
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIdsPriority:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIdsPriority:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_idsPriority = a3;
}

- (BOOL)hasSequenceNumber
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sequenceNumber = a3;
}

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

@end
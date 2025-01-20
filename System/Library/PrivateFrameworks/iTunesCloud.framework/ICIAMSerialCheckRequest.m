@interface ICIAMSerialCheckRequest
- (BOOL)hasDSID;
- (BOOL)hasDeviceID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)deviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)dSID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDSID:(int64_t)a3;
- (void)setDeviceID:(id)a3;
- (void)setHasDSID:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMSerialCheckRequest

- (void).cxx_destruct
{
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (int64_t)dSID
{
  return self->_dSID;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[3])
  {
    self->_dSID = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    v5 = v4;
    -[ICIAMSerialCheckRequest setDeviceID:](self, "setDeviceID:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_dSID;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_deviceID hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_dSID != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  deviceID = self->_deviceID;
  if ((unint64_t)deviceID | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](deviceID, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_dSID;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_deviceID copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_dSID;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_deviceID)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setDeviceID:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_deviceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMSerialCheckRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_dSID];
    [v3 setObject:v4 forKey:@"DSID"];
  }
  deviceID = self->_deviceID;
  if (deviceID) {
    [v3 setObject:deviceID forKey:@"deviceID"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMSerialCheckRequest;
  id v4 = [(ICIAMSerialCheckRequest *)&v8 description];
  id v5 = [(ICIAMSerialCheckRequest *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDeviceID
{
  return self->_deviceID != 0;
}

- (BOOL)hasDSID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDSID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDSID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dSID = a3;
}

@end
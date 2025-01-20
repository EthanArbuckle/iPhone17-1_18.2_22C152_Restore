@interface _MRPlaybackSessionRequestProtobuf
- (BOOL)hasIdentifier;
- (BOOL)hasLength;
- (BOOL)hasLocation;
- (BOOL)hasRequestID;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (NSString)requestID;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)length;
- (int)location;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLength:(BOOL)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLength:(int)a3;
- (void)setLocation:(int)a3;
- (void)setRequestID:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackSessionRequestProtobuf

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_location = a3;
}

- (void)setHasLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLength:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_length = a3;
}

- (void)setHasLength:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackSessionRequestProtobuf;
  v4 = [(_MRPlaybackSessionRequestProtobuf *)&v8 description];
  v5 = [(_MRPlaybackSessionRequestProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  requestID = self->_requestID;
  if (requestID) {
    [v3 setObject:requestID forKey:@"requestID"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_location];
    [v4 setObject:v8 forKey:@"location"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithInt:self->_length];
    [v4 setObject:v9 forKey:@"length"];
  }
  type = self->_type;
  if (type) {
    [v4 setObject:type forKey:@"type"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_requestID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_requestID)
  {
    objc_msgSend(v4, "setRequestID:");
    id v4 = v6;
  }
  if (self->_identifier)
  {
    objc_msgSend(v6, "setIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_location;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_length;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_type)
  {
    objc_msgSend(v6, "setType:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestID copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_location;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_length;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_type copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:")) {
      goto LABEL_18;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_location != *((_DWORD *)v4 + 5)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_length != *((_DWORD *)v4 + 4)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_18;
  }
  type = self->_type;
  if ((unint64_t)type | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](type, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestID hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_location;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_type hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_length;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_type hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[_MRPlaybackSessionRequestProtobuf setRequestID:](self, "setRequestID:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[_MRPlaybackSessionRequestProtobuf setIdentifier:](self, "setIdentifier:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_location = v4[5];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if (v5)
  {
    self->_length = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[_MRPlaybackSessionRequestProtobuf setType:](self, "setType:");
    NSUInteger v4 = v6;
  }
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)location
{
  return self->_location;
}

- (int)length
{
  return self->_length;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
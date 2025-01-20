@interface AWDSpringBoardSOSAlertResponse
- (BOOL)hasResponse;
- (BOOL)hasTimestamp;
- (BOOL)hasUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)response;
- (NSString)uUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setResponse:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSpringBoardSOSAlertResponse

- (void)dealloc
{
  [(AWDSpringBoardSOSAlertResponse *)self setResponse:0];
  [(AWDSpringBoardSOSAlertResponse *)self setUUID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSOSAlertResponse;
  [(AWDSpringBoardSOSAlertResponse *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (BOOL)hasUUID
{
  return self->_uUID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSOSAlertResponse;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSpringBoardSOSAlertResponse description](&v3, sel_description), -[AWDSpringBoardSOSAlertResponse dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  response = self->_response;
  if (response) {
    [v3 setObject:response forKey:@"response"];
  }
  uUID = self->_uUID;
  if (uUID) {
    [v3 setObject:uUID forKey:@"UUID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardSOSAlertResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_response) {
    PBDataWriterWriteStringField();
  }
  if (self->_uUID)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if (self->_response) {
    [a3 setResponse:];
  }
  if (self->_uUID)
  {
    [a3 setUUID:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_response copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSString *)self->_uUID copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    response = self->_response;
    if (!((unint64_t)response | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](response, "isEqual:")) != 0)
    {
      uUID = self->_uUID;
      if ((unint64_t)uUID | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NSString isEqual:](uUID, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_response hash] ^ v3;
  return v4 ^ [(NSString *)self->_uUID hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 32))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDSpringBoardSOSAlertResponse setResponse:](self, "setResponse:");
  }
  if (*((void *)a3 + 3))
  {
    -[AWDSpringBoardSOSAlertResponse setUUID:](self, "setUUID:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSString)uUID
{
  return self->_uUID;
}

- (void)setUUID:(id)a3
{
}

@end
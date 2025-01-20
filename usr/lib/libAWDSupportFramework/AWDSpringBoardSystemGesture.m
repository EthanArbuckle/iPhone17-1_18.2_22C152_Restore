@interface AWDSpringBoardSystemGesture
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)hasUserInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)type;
- (NSString)userInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSpringBoardSystemGesture

- (void)dealloc
{
  [(AWDSpringBoardSystemGesture *)self setType:0];
  [(AWDSpringBoardSystemGesture *)self setUserInfo:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSystemGesture;
  [(AWDSpringBoardSystemGesture *)&v3 dealloc];
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

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSystemGesture;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSpringBoardSystemGesture description](&v3, sel_description), -[AWDSpringBoardSystemGesture dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  type = self->_type;
  if (type) {
    [v3 setObject:type forKey:@"type"];
  }
  userInfo = self->_userInfo;
  if (userInfo) {
    [v3 setObject:userInfo forKey:@"userInfo"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardSystemGestureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_type) {
    PBDataWriterWriteStringField();
  }
  if (self->_userInfo)
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
  if (self->_type) {
    [a3 setType:];
  }
  if (self->_userInfo)
  {
    [a3 setUserInfo:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_type copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSString *)self->_userInfo copyWithZone:a3];
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
    type = self->_type;
    if (!((unint64_t)type | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](type, "isEqual:")) != 0)
    {
      userInfo = self->_userInfo;
      if ((unint64_t)userInfo | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NSString isEqual:](userInfo, "isEqual:");
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
  NSUInteger v4 = [(NSString *)self->_type hash] ^ v3;
  return v4 ^ [(NSString *)self->_userInfo hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 32))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDSpringBoardSystemGesture setType:](self, "setType:");
  }
  if (*((void *)a3 + 3))
  {
    -[AWDSpringBoardSystemGesture setUserInfo:](self, "setUserInfo:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

@end
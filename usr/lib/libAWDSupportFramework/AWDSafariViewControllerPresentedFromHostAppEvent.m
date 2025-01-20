@interface AWDSafariViewControllerPresentedFromHostAppEvent
- (BOOL)hasHostAppBundleID;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)hostAppBundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHostAppBundleID:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariViewControllerPresentedFromHostAppEvent

- (void)dealloc
{
  [(AWDSafariViewControllerPresentedFromHostAppEvent *)self setHostAppBundleID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariViewControllerPresentedFromHostAppEvent;
  [(AWDSafariViewControllerPresentedFromHostAppEvent *)&v3 dealloc];
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

- (BOOL)hasHostAppBundleID
{
  return self->_hostAppBundleID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariViewControllerPresentedFromHostAppEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariViewControllerPresentedFromHostAppEvent description](&v3, sel_description), -[AWDSafariViewControllerPresentedFromHostAppEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  hostAppBundleID = self->_hostAppBundleID;
  if (hostAppBundleID) {
    [v3 setObject:hostAppBundleID forKey:@"hostAppBundleID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariViewControllerPresentedFromHostAppEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_hostAppBundleID)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 24) |= 1u;
  }
  hostAppBundleID = self->_hostAppBundleID;
  if (hostAppBundleID) {
    [a3 setHostAppBundleID:hostAppBundleID];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init]
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 24) |= 1u;
  }

  v6[2] = [(NSString *)self->_hostAppBundleID copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    hostAppBundleID = self->_hostAppBundleID;
    if ((unint64_t)hostAppBundleID | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSString isEqual:](hostAppBundleID, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(NSString *)self->_hostAppBundleID hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 24))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDSafariViewControllerPresentedFromHostAppEvent setHostAppBundleID:](self, "setHostAppBundleID:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)hostAppBundleID
{
  return self->_hostAppBundleID;
}

- (void)setHostAppBundleID:(id)a3
{
}

@end
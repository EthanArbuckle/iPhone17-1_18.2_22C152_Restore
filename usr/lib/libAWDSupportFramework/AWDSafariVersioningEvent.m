@interface AWDSafariVersioningEvent
- (BOOL)hasTimestamp;
- (BOOL)hasVariant;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)variantAsString:(int)a3;
- (int)StringAsVariant:(id)a3;
- (int)variant;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVariant:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVariant:(int)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariVersioningEvent

- (void)dealloc
{
  [(AWDSafariVersioningEvent *)self setVersion:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariVersioningEvent;
  [(AWDSafariVersioningEvent *)&v3 dealloc];
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

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (int)variant
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_variant;
  }
  else {
    return 0;
  }
}

- (void)setVariant:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_variant = a3;
}

- (void)setHasVariant:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVariant
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)variantAsString:(int)a3
{
  if (!a3) {
    return @"CONSUMER";
  }
  if (a3 == 1) {
    return @"STP";
  }
  return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsVariant:(id)a3
{
  if ([a3 isEqualToString:@"CONSUMER"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"STP"];
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariVersioningEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariVersioningEvent description](&v3, sel_description), -[AWDSafariVersioningEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  version = self->_version;
  if (version) {
    [v3 setObject:version forKey:@"version"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int variant = self->_variant;
    if (variant)
    {
      if (variant == 1) {
        v6 = @"STP";
      }
      else {
        v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_variant];
      }
    }
    else
    {
      v6 = @"CONSUMER";
    }
    [v3 setObject:v6 forKey:@"variant"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariVersioningEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_version) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if (self->_version) {
    [a3 setVersion:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_variant;
    *((unsigned char *)a3 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_version copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_variant;
    *(unsigned char *)(v6 + 32) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    version = self->_version;
    if ((unint64_t)version | *((void *)a3 + 3))
    {
      int v5 = -[NSString isEqual:](version, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_variant != *((_DWORD *)a3 + 4)) {
        goto LABEL_14;
      }
      LOBYTE(v5) = 1;
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
  NSUInteger v4 = [(NSString *)self->_version hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_variant;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 32))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDSafariVersioningEvent setVersion:](self, "setVersion:");
  }
  if ((*((unsigned char *)a3 + 32) & 2) != 0)
  {
    self->_int variant = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

@end
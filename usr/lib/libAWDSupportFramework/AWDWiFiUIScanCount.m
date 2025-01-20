@interface AWDWiFiUIScanCount
- (BOOL)hasMax;
- (BOOL)hasSection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)section;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)max;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasMax:(BOOL)a3;
- (void)setMax:(unsigned int)a3;
- (void)setSection:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiUIScanCount

- (void)dealloc
{
  [(AWDWiFiUIScanCount *)self setSection:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIScanCount;
  [(AWDWiFiUIScanCount *)&v3 dealloc];
}

- (BOOL)hasSection
{
  return self->_section != 0;
}

- (void)setMax:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_max = a3;
}

- (void)setHasMax:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMax
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIScanCount;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiUIScanCount description](&v3, sel_description), -[AWDWiFiUIScanCount dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  section = self->_section;
  if (section) {
    [v3 setObject:section forKey:@"section"];
  }
  if (*(unsigned char *)&self->_has) {
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_max] forKey:@"max"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiUIScanCountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_section) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_section) {
    [a3 setSection:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_max;
    *((unsigned char *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 16) = [(NSString *)self->_section copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_max;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    section = self->_section;
    if (!((unint64_t)section | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](section, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) != 0 && self->_max == *((_DWORD *)a3 + 2);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_section hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_max;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[AWDWiFiUIScanCount setSection:](self, "setSection:");
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_max = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (unsigned)max
{
  return self->_max;
}

@end
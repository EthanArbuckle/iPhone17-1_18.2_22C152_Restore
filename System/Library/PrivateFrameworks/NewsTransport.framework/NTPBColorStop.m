@interface NTPBColorStop
- (BOOL)hasColor;
- (BOOL)hasLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)location;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setColor:(id)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setLocation:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBColorStop

- (void)dealloc
{
  [(NTPBColorStop *)self setColor:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBColorStop;
  [(NTPBColorStop *)&v3 dealloc];
}

- (BOOL)hasColor
{
  return self->_color != 0;
}

- (void)setLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_location = a3;
}

- (void)setHasLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBColorStop;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBColorStop description](&v3, sel_description), -[NTPBColorStop dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  color = self->_color;
  if (color) {
    [v3 setObject:color forKey:@"color"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_location), @"location");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBColorStopReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_color) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 8) = [(NSString *)self->_color copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_location;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    color = self->_color;
    if (!((unint64_t)color | *((void *)a3 + 1)) || (int v5 = -[NSString isEqual:](color, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) != 0 && self->_location == *((_DWORD *)a3 + 4);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_color hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_location;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBColorStop setColor:](self, "setColor:");
  }
  if (*((unsigned char *)a3 + 20))
  {
    self->_location = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (int)location
{
  return self->_location;
}

@end
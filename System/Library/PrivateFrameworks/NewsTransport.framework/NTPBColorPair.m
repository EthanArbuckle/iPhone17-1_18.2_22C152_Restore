@interface NTPBColorPair
- (BOOL)hasDark;
- (BOOL)hasLight;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)dark;
- (NSString)light;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDark:(id)a3;
- (void)setLight:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBColorPair

- (void)dealloc
{
  [(NTPBColorPair *)self setLight:0];
  [(NTPBColorPair *)self setDark:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBColorPair;
  [(NTPBColorPair *)&v3 dealloc];
}

- (BOOL)hasLight
{
  return self->_light != 0;
}

- (BOOL)hasDark
{
  return self->_dark != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBColorPair;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBColorPair description](&v3, sel_description), -[NTPBColorPair dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  light = self->_light;
  if (light) {
    [v3 setObject:light forKey:@"light"];
  }
  dark = self->_dark;
  if (dark) {
    [v4 setObject:dark forKey:@"dark"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBColorPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_light) {
    PBDataWriterWriteStringField();
  }
  if (self->_dark)
  {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[2] = (id)[(NSString *)self->_light copyWithZone:a3];
  v5[1] = (id)[(NSString *)self->_dark copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    light = self->_light;
    if (!((unint64_t)light | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](light, "isEqual:")) != 0)
    {
      dark = self->_dark;
      if ((unint64_t)dark | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NSString isEqual:](dark, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_light hash];
  return [(NSString *)self->_dark hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[NTPBColorPair setLight:](self, "setLight:");
  }
  if (*((void *)a3 + 1))
  {
    -[NTPBColorPair setDark:](self, "setDark:");
  }
}

- (NSString)light
{
  return self->_light;
}

- (void)setLight:(id)a3
{
}

- (NSString)dark
{
  return self->_dark;
}

- (void)setDark:(id)a3
{
}

@end
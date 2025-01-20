@interface NTPBColorGradientPair
- (BOOL)hasDark;
- (BOOL)hasLight;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NTPBColorGradient)dark;
- (NTPBColorGradient)light;
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

@implementation NTPBColorGradientPair

- (void)dealloc
{
  [(NTPBColorGradientPair *)self setLight:0];
  [(NTPBColorGradientPair *)self setDark:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBColorGradientPair;
  [(NTPBColorGradientPair *)&v3 dealloc];
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
  v3.super_class = (Class)NTPBColorGradientPair;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBColorGradientPair description](&v3, sel_description), -[NTPBColorGradientPair dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  light = self->_light;
  if (light) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBColorGradient dictionaryRepresentation](light, "dictionaryRepresentation"), @"light");
  }
  dark = self->_dark;
  if (dark) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBColorGradient dictionaryRepresentation](dark, "dictionaryRepresentation"), @"dark");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBColorGradientPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_light) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dark)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[2] = [(NTPBColorGradient *)self->_light copyWithZone:a3];
  v5[1] = [(NTPBColorGradient *)self->_dark copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    light = self->_light;
    if (!((unint64_t)light | *((void *)a3 + 2))
      || (int v5 = -[NTPBColorGradient isEqual:](light, "isEqual:")) != 0)
    {
      dark = self->_dark;
      if ((unint64_t)dark | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NTPBColorGradient isEqual:](dark, "isEqual:");
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
  unint64_t v3 = [(NTPBColorGradient *)self->_light hash];
  return [(NTPBColorGradient *)self->_dark hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  light = self->_light;
  uint64_t v6 = *((void *)a3 + 2);
  if (light)
  {
    if (v6) {
      -[NTPBColorGradient mergeFrom:](light, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBColorGradientPair setLight:](self, "setLight:");
  }
  dark = self->_dark;
  uint64_t v8 = *((void *)a3 + 1);
  if (dark)
  {
    if (v8)
    {
      -[NTPBColorGradient mergeFrom:](dark, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBColorGradientPair setDark:](self, "setDark:");
  }
}

- (NTPBColorGradient)light
{
  return self->_light;
}

- (void)setLight:(id)a3
{
}

- (NTPBColorGradient)dark
{
  return self->_dark;
}

- (void)setDark:(id)a3
{
}

@end
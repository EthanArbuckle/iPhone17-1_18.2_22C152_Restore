@interface AWDWiFiLTECoexCounters
- (AWDWiFiLTECoexBin)heavyLTECoexBin;
- (AWDWiFiLTECoexBin)lightLTECoexBin;
- (AWDWiFiLTECoexBin)noLTECoexBin;
- (BOOL)hasHeavyLTECoexBin;
- (BOOL)hasLightLTECoexBin;
- (BOOL)hasNoLTECoexBin;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHeavyLTECoexBin:(id)a3;
- (void)setLightLTECoexBin:(id)a3;
- (void)setNoLTECoexBin:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiLTECoexCounters

- (void)dealloc
{
  [(AWDWiFiLTECoexCounters *)self setNoLTECoexBin:0];
  [(AWDWiFiLTECoexCounters *)self setLightLTECoexBin:0];
  [(AWDWiFiLTECoexCounters *)self setHeavyLTECoexBin:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLTECoexCounters;
  [(AWDWiFiLTECoexCounters *)&v3 dealloc];
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

- (BOOL)hasNoLTECoexBin
{
  return self->_noLTECoexBin != 0;
}

- (BOOL)hasLightLTECoexBin
{
  return self->_lightLTECoexBin != 0;
}

- (BOOL)hasHeavyLTECoexBin
{
  return self->_heavyLTECoexBin != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLTECoexCounters;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiLTECoexCounters description](&v3, sel_description), -[AWDWiFiLTECoexCounters dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  noLTECoexBin = self->_noLTECoexBin;
  if (noLTECoexBin) {
    [v3 setObject:-[AWDWiFiLTECoexBin dictionaryRepresentation](noLTECoexBin, "dictionaryRepresentation") forKey:@"noLTECoexBin"];
  }
  lightLTECoexBin = self->_lightLTECoexBin;
  if (lightLTECoexBin) {
    [v3 setObject: -[AWDWiFiLTECoexBin dictionaryRepresentation](lightLTECoexBin, "dictionaryRepresentation") forKey:@"lightLTECoexBin"];
  }
  heavyLTECoexBin = self->_heavyLTECoexBin;
  if (heavyLTECoexBin) {
    [v3 setObject:-[AWDWiFiLTECoexBin dictionaryRepresentation](heavyLTECoexBin, "dictionaryRepresentation") forKey:@"heavyLTECoexBin"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiLTECoexCountersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_noLTECoexBin) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lightLTECoexBin) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_heavyLTECoexBin)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if (self->_noLTECoexBin) {
    [a3 setNoLTECoexBin:];
  }
  if (self->_lightLTECoexBin) {
    [a3 setLightLTECoexBin:];
  }
  if (self->_heavyLTECoexBin)
  {
    [a3 setHeavyLTECoexBin:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
  }

  *(void *)(v6 + 32) = [(AWDWiFiLTECoexBin *)self->_noLTECoexBin copyWithZone:a3];
  *(void *)(v6 + 24) = [(AWDWiFiLTECoexBin *)self->_lightLTECoexBin copyWithZone:a3];

  *(void *)(v6 + 16) = [(AWDWiFiLTECoexBin *)self->_heavyLTECoexBin copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    noLTECoexBin = self->_noLTECoexBin;
    if (!((unint64_t)noLTECoexBin | *((void *)a3 + 4))
      || (int v5 = -[AWDWiFiLTECoexBin isEqual:](noLTECoexBin, "isEqual:")) != 0)
    {
      lightLTECoexBin = self->_lightLTECoexBin;
      if (!((unint64_t)lightLTECoexBin | *((void *)a3 + 3))
        || (int v5 = -[AWDWiFiLTECoexBin isEqual:](lightLTECoexBin, "isEqual:")) != 0)
      {
        heavyLTECoexBin = self->_heavyLTECoexBin;
        if ((unint64_t)heavyLTECoexBin | *((void *)a3 + 2))
        {
          LOBYTE(v5) = -[AWDWiFiLTECoexBin isEqual:](heavyLTECoexBin, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
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
  unint64_t v4 = [(AWDWiFiLTECoexBin *)self->_noLTECoexBin hash] ^ v3;
  unint64_t v5 = [(AWDWiFiLTECoexBin *)self->_lightLTECoexBin hash];
  return v4 ^ v5 ^ [(AWDWiFiLTECoexBin *)self->_heavyLTECoexBin hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 40))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  noLTECoexBin = self->_noLTECoexBin;
  uint64_t v6 = *((void *)a3 + 4);
  if (noLTECoexBin)
  {
    if (v6) {
      -[AWDWiFiLTECoexBin mergeFrom:](noLTECoexBin, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDWiFiLTECoexCounters setNoLTECoexBin:](self, "setNoLTECoexBin:");
  }
  lightLTECoexBin = self->_lightLTECoexBin;
  uint64_t v8 = *((void *)a3 + 3);
  if (lightLTECoexBin)
  {
    if (v8) {
      -[AWDWiFiLTECoexBin mergeFrom:](lightLTECoexBin, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[AWDWiFiLTECoexCounters setLightLTECoexBin:](self, "setLightLTECoexBin:");
  }
  heavyLTECoexBin = self->_heavyLTECoexBin;
  uint64_t v10 = *((void *)a3 + 2);
  if (heavyLTECoexBin)
  {
    if (v10)
    {
      -[AWDWiFiLTECoexBin mergeFrom:](heavyLTECoexBin, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[AWDWiFiLTECoexCounters setHeavyLTECoexBin:](self, "setHeavyLTECoexBin:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWiFiLTECoexBin)noLTECoexBin
{
  return self->_noLTECoexBin;
}

- (void)setNoLTECoexBin:(id)a3
{
}

- (AWDWiFiLTECoexBin)lightLTECoexBin
{
  return self->_lightLTECoexBin;
}

- (void)setLightLTECoexBin:(id)a3
{
}

- (AWDWiFiLTECoexBin)heavyLTECoexBin
{
  return self->_heavyLTECoexBin;
}

- (void)setHeavyLTECoexBin:(id)a3
{
}

@end
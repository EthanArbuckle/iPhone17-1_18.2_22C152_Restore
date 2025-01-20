@interface AWDWiFiNWActivityMpduLost
- (AWDWiFiNWActivityMpduWME)bALost;
- (AWDWiFiNWActivityMpduWME)nonBALost;
- (BOOL)hasBALost;
- (BOOL)hasNonBALost;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBALost:(id)a3;
- (void)setNonBALost:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityMpduLost

- (void)dealloc
{
  [(AWDWiFiNWActivityMpduLost *)self setBALost:0];
  [(AWDWiFiNWActivityMpduLost *)self setNonBALost:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityMpduLost;
  [(AWDWiFiNWActivityMpduLost *)&v3 dealloc];
}

- (BOOL)hasBALost
{
  return self->_bALost != 0;
}

- (BOOL)hasNonBALost
{
  return self->_nonBALost != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityMpduLost;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityMpduLost description](&v3, sel_description), -[AWDWiFiNWActivityMpduLost dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  bALost = self->_bALost;
  if (bALost) {
    [v3 setObject:[[-[AWDWiFiNWActivityMpduWME dictionaryRepresentation](bALost, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"BALost"];
  }
  nonBALost = self->_nonBALost;
  if (nonBALost) {
    [v3 setObject:-[AWDWiFiNWActivityMpduWME dictionaryRepresentation](nonBALost, "dictionaryRepresentation") forKey:@"nonBALost"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityMpduLostReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_bALost) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_nonBALost)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_bALost) {
    [a3 setBALost:];
  }
  if (self->_nonBALost)
  {
    [a3 setNonBALost:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(AWDWiFiNWActivityMpduWME *)self->_bALost copyWithZone:a3];
  v5[2] = [(AWDWiFiNWActivityMpduWME *)self->_nonBALost copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    bALost = self->_bALost;
    if (!((unint64_t)bALost | *((void *)a3 + 1))
      || (int v5 = -[AWDWiFiNWActivityMpduWME isEqual:](bALost, "isEqual:")) != 0)
    {
      nonBALost = self->_nonBALost;
      if ((unint64_t)nonBALost | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[AWDWiFiNWActivityMpduWME isEqual:](nonBALost, "isEqual:");
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
  unint64_t v3 = [(AWDWiFiNWActivityMpduWME *)self->_bALost hash];
  return [(AWDWiFiNWActivityMpduWME *)self->_nonBALost hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  bALost = self->_bALost;
  uint64_t v6 = *((void *)a3 + 1);
  if (bALost)
  {
    if (v6) {
      -[AWDWiFiNWActivityMpduWME mergeFrom:](bALost, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDWiFiNWActivityMpduLost setBALost:](self, "setBALost:");
  }
  nonBALost = self->_nonBALost;
  uint64_t v8 = *((void *)a3 + 2);
  if (nonBALost)
  {
    if (v8)
    {
      -[AWDWiFiNWActivityMpduWME mergeFrom:](nonBALost, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[AWDWiFiNWActivityMpduLost setNonBALost:](self, "setNonBALost:");
  }
}

- (AWDWiFiNWActivityMpduWME)bALost
{
  return self->_bALost;
}

- (void)setBALost:(id)a3
{
}

- (AWDWiFiNWActivityMpduWME)nonBALost
{
  return self->_nonBALost;
}

- (void)setNonBALost:(id)a3
{
}

@end
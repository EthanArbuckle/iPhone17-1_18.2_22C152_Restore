@interface NTPBPaywallDescription
- (BOOL)hasChannelPaywall;
- (BOOL)hasHardPaywall;
- (BOOL)hasLeakyPaywall;
- (BOOL)hasPromotionalPaywall;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)channelPaywall;
- (NSString)hardPaywall;
- (NSString)leakyPaywall;
- (NSString)promotionalPaywall;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChannelPaywall:(id)a3;
- (void)setHardPaywall:(id)a3;
- (void)setLeakyPaywall:(id)a3;
- (void)setPromotionalPaywall:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPaywallDescription

- (void)dealloc
{
  [(NTPBPaywallDescription *)self setChannelPaywall:0];
  [(NTPBPaywallDescription *)self setLeakyPaywall:0];
  [(NTPBPaywallDescription *)self setPromotionalPaywall:0];
  [(NTPBPaywallDescription *)self setHardPaywall:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPaywallDescription;
  [(NTPBPaywallDescription *)&v3 dealloc];
}

- (BOOL)hasChannelPaywall
{
  return self->_channelPaywall != 0;
}

- (BOOL)hasLeakyPaywall
{
  return self->_leakyPaywall != 0;
}

- (BOOL)hasPromotionalPaywall
{
  return self->_promotionalPaywall != 0;
}

- (BOOL)hasHardPaywall
{
  return self->_hardPaywall != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPaywallDescription;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPaywallDescription description](&v3, sel_description), -[NTPBPaywallDescription dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  channelPaywall = self->_channelPaywall;
  if (channelPaywall) {
    [v3 setObject:channelPaywall forKey:@"channelPaywall"];
  }
  leakyPaywall = self->_leakyPaywall;
  if (leakyPaywall) {
    [v4 setObject:leakyPaywall forKey:@"leakyPaywall"];
  }
  promotionalPaywall = self->_promotionalPaywall;
  if (promotionalPaywall) {
    [v4 setObject:promotionalPaywall forKey:@"promotionalPaywall"];
  }
  hardPaywall = self->_hardPaywall;
  if (hardPaywall) {
    [v4 setObject:hardPaywall forKey:@"hardPaywall"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaywallDescriptionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_channelPaywall) {
    PBDataWriterWriteStringField();
  }
  if (self->_leakyPaywall) {
    PBDataWriterWriteStringField();
  }
  if (self->_promotionalPaywall) {
    PBDataWriterWriteStringField();
  }
  if (self->_hardPaywall)
  {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)[(NSString *)self->_channelPaywall copyWithZone:a3];
  v5[3] = (id)[(NSString *)self->_leakyPaywall copyWithZone:a3];

  v5[4] = (id)[(NSString *)self->_promotionalPaywall copyWithZone:a3];
  v5[2] = (id)[(NSString *)self->_hardPaywall copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    channelPaywall = self->_channelPaywall;
    if (!((unint64_t)channelPaywall | *((void *)a3 + 1))
      || (int v5 = -[NSString isEqual:](channelPaywall, "isEqual:")) != 0)
    {
      leakyPaywall = self->_leakyPaywall;
      if (!((unint64_t)leakyPaywall | *((void *)a3 + 3))
        || (int v5 = -[NSString isEqual:](leakyPaywall, "isEqual:")) != 0)
      {
        promotionalPaywall = self->_promotionalPaywall;
        if (!((unint64_t)promotionalPaywall | *((void *)a3 + 4))
          || (int v5 = -[NSString isEqual:](promotionalPaywall, "isEqual:")) != 0)
        {
          hardPaywall = self->_hardPaywall;
          if ((unint64_t)hardPaywall | *((void *)a3 + 2))
          {
            LOBYTE(v5) = -[NSString isEqual:](hardPaywall, "isEqual:");
          }
          else
          {
            LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_channelPaywall hash];
  NSUInteger v4 = [(NSString *)self->_leakyPaywall hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_promotionalPaywall hash];
  return v4 ^ v5 ^ [(NSString *)self->_hardPaywall hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBPaywallDescription setChannelPaywall:](self, "setChannelPaywall:");
  }
  if (*((void *)a3 + 3)) {
    -[NTPBPaywallDescription setLeakyPaywall:](self, "setLeakyPaywall:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBPaywallDescription setPromotionalPaywall:](self, "setPromotionalPaywall:");
  }
  if (*((void *)a3 + 2))
  {
    -[NTPBPaywallDescription setHardPaywall:](self, "setHardPaywall:");
  }
}

- (NSString)channelPaywall
{
  return self->_channelPaywall;
}

- (void)setChannelPaywall:(id)a3
{
}

- (NSString)leakyPaywall
{
  return self->_leakyPaywall;
}

- (void)setLeakyPaywall:(id)a3
{
}

- (NSString)promotionalPaywall
{
  return self->_promotionalPaywall;
}

- (void)setPromotionalPaywall:(id)a3
{
}

- (NSString)hardPaywall
{
  return self->_hardPaywall;
}

- (void)setHardPaywall:(id)a3
{
}

@end
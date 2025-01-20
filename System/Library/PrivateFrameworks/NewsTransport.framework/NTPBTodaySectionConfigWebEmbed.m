@interface NTPBTodaySectionConfigWebEmbed
- (BOOL)hasPreferredSlotAllocation;
- (BOOL)hasUrlString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)urlString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)preferredSlotAllocation;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasPreferredSlotAllocation:(BOOL)a3;
- (void)setPreferredSlotAllocation:(unint64_t)a3;
- (void)setUrlString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodaySectionConfigWebEmbed

- (void)dealloc
{
  [(NTPBTodaySectionConfigWebEmbed *)self setUrlString:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigWebEmbed;
  [(NTPBTodaySectionConfigWebEmbed *)&v3 dealloc];
}

- (BOOL)hasUrlString
{
  return self->_urlString != 0;
}

- (void)setPreferredSlotAllocation:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_preferredSlotAllocation = a3;
}

- (void)setHasPreferredSlotAllocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPreferredSlotAllocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigWebEmbed;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBTodaySectionConfigWebEmbed description](&v3, sel_description), -[NTPBTodaySectionConfigWebEmbed dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  urlString = self->_urlString;
  if (urlString) {
    [v3 setObject:urlString forKey:@"url_string"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_preferredSlotAllocation), @"preferred_slot_allocation");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodaySectionConfigWebEmbedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_urlString) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 16) = [(NSString *)self->_urlString copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_preferredSlotAllocation;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    urlString = self->_urlString;
    if (!((unint64_t)urlString | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](urlString, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) != 0 && self->_preferredSlotAllocation == *((void *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_urlString hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_preferredSlotAllocation;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[NTPBTodaySectionConfigWebEmbed setUrlString:](self, "setUrlString:");
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_preferredSlotAllocation = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (unint64_t)preferredSlotAllocation
{
  return self->_preferredSlotAllocation;
}

@end
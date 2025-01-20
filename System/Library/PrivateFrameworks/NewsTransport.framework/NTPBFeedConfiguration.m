@interface NTPBFeedConfiguration
- (BOOL)hasFreeAFeedID;
- (BOOL)hasFreeBFeedID;
- (BOOL)hasFreeCFeedID;
- (BOOL)hasPaidAFeedID;
- (BOOL)hasPaidBFeedID;
- (BOOL)hasPaidCFeedID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)freeAFeedID;
- (NSString)freeBFeedID;
- (NSString)freeCFeedID;
- (NSString)paidAFeedID;
- (NSString)paidBFeedID;
- (NSString)paidCFeedID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFreeAFeedID:(id)a3;
- (void)setFreeBFeedID:(id)a3;
- (void)setFreeCFeedID:(id)a3;
- (void)setPaidAFeedID:(id)a3;
- (void)setPaidBFeedID:(id)a3;
- (void)setPaidCFeedID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBFeedConfiguration

- (void)dealloc
{
  [(NTPBFeedConfiguration *)self setFreeAFeedID:0];
  [(NTPBFeedConfiguration *)self setFreeBFeedID:0];
  [(NTPBFeedConfiguration *)self setFreeCFeedID:0];
  [(NTPBFeedConfiguration *)self setPaidAFeedID:0];
  [(NTPBFeedConfiguration *)self setPaidBFeedID:0];
  [(NTPBFeedConfiguration *)self setPaidCFeedID:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedConfiguration;
  [(NTPBFeedConfiguration *)&v3 dealloc];
}

- (BOOL)hasFreeAFeedID
{
  return self->_freeAFeedID != 0;
}

- (BOOL)hasFreeBFeedID
{
  return self->_freeBFeedID != 0;
}

- (BOOL)hasFreeCFeedID
{
  return self->_freeCFeedID != 0;
}

- (BOOL)hasPaidAFeedID
{
  return self->_paidAFeedID != 0;
}

- (BOOL)hasPaidBFeedID
{
  return self->_paidBFeedID != 0;
}

- (BOOL)hasPaidCFeedID
{
  return self->_paidCFeedID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedConfiguration;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBFeedConfiguration description](&v3, sel_description), -[NTPBFeedConfiguration dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  freeAFeedID = self->_freeAFeedID;
  if (freeAFeedID) {
    [v3 setObject:freeAFeedID forKey:@"free_a_feed_ID"];
  }
  freeBFeedID = self->_freeBFeedID;
  if (freeBFeedID) {
    [v4 setObject:freeBFeedID forKey:@"free_b_feed_ID"];
  }
  freeCFeedID = self->_freeCFeedID;
  if (freeCFeedID) {
    [v4 setObject:freeCFeedID forKey:@"free_c_feed_ID"];
  }
  paidAFeedID = self->_paidAFeedID;
  if (paidAFeedID) {
    [v4 setObject:paidAFeedID forKey:@"paid_a_feed_ID"];
  }
  paidBFeedID = self->_paidBFeedID;
  if (paidBFeedID) {
    [v4 setObject:paidBFeedID forKey:@"paid_b_feed_ID"];
  }
  paidCFeedID = self->_paidCFeedID;
  if (paidCFeedID) {
    [v4 setObject:paidCFeedID forKey:@"paid_c_feed_ID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_freeAFeedID) {
    PBDataWriterWriteStringField();
  }
  if (self->_freeBFeedID) {
    PBDataWriterWriteStringField();
  }
  if (self->_freeCFeedID) {
    PBDataWriterWriteStringField();
  }
  if (self->_paidAFeedID) {
    PBDataWriterWriteStringField();
  }
  if (self->_paidBFeedID) {
    PBDataWriterWriteStringField();
  }
  if (self->_paidCFeedID)
  {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)[(NSString *)self->_freeAFeedID copyWithZone:a3];
  v5[2] = (id)[(NSString *)self->_freeBFeedID copyWithZone:a3];

  v5[3] = (id)[(NSString *)self->_freeCFeedID copyWithZone:a3];
  v5[4] = (id)[(NSString *)self->_paidAFeedID copyWithZone:a3];

  v5[5] = (id)[(NSString *)self->_paidBFeedID copyWithZone:a3];
  v5[6] = (id)[(NSString *)self->_paidCFeedID copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    freeAFeedID = self->_freeAFeedID;
    if (!((unint64_t)freeAFeedID | *((void *)a3 + 1))
      || (int v5 = -[NSString isEqual:](freeAFeedID, "isEqual:")) != 0)
    {
      freeBFeedID = self->_freeBFeedID;
      if (!((unint64_t)freeBFeedID | *((void *)a3 + 2))
        || (int v5 = -[NSString isEqual:](freeBFeedID, "isEqual:")) != 0)
      {
        freeCFeedID = self->_freeCFeedID;
        if (!((unint64_t)freeCFeedID | *((void *)a3 + 3))
          || (int v5 = -[NSString isEqual:](freeCFeedID, "isEqual:")) != 0)
        {
          paidAFeedID = self->_paidAFeedID;
          if (!((unint64_t)paidAFeedID | *((void *)a3 + 4))
            || (int v5 = -[NSString isEqual:](paidAFeedID, "isEqual:")) != 0)
          {
            paidBFeedID = self->_paidBFeedID;
            if (!((unint64_t)paidBFeedID | *((void *)a3 + 5))
              || (int v5 = -[NSString isEqual:](paidBFeedID, "isEqual:")) != 0)
            {
              paidCFeedID = self->_paidCFeedID;
              if ((unint64_t)paidCFeedID | *((void *)a3 + 6))
              {
                LOBYTE(v5) = -[NSString isEqual:](paidCFeedID, "isEqual:");
              }
              else
              {
                LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_freeAFeedID hash];
  NSUInteger v4 = [(NSString *)self->_freeBFeedID hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_freeCFeedID hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_paidAFeedID hash];
  NSUInteger v7 = [(NSString *)self->_paidBFeedID hash];
  return v6 ^ v7 ^ [(NSString *)self->_paidCFeedID hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBFeedConfiguration setFreeAFeedID:](self, "setFreeAFeedID:");
  }
  if (*((void *)a3 + 2)) {
    -[NTPBFeedConfiguration setFreeBFeedID:](self, "setFreeBFeedID:");
  }
  if (*((void *)a3 + 3)) {
    -[NTPBFeedConfiguration setFreeCFeedID:](self, "setFreeCFeedID:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBFeedConfiguration setPaidAFeedID:](self, "setPaidAFeedID:");
  }
  if (*((void *)a3 + 5)) {
    -[NTPBFeedConfiguration setPaidBFeedID:](self, "setPaidBFeedID:");
  }
  if (*((void *)a3 + 6))
  {
    -[NTPBFeedConfiguration setPaidCFeedID:](self, "setPaidCFeedID:");
  }
}

- (NSString)freeAFeedID
{
  return self->_freeAFeedID;
}

- (void)setFreeAFeedID:(id)a3
{
}

- (NSString)freeBFeedID
{
  return self->_freeBFeedID;
}

- (void)setFreeBFeedID:(id)a3
{
}

- (NSString)freeCFeedID
{
  return self->_freeCFeedID;
}

- (void)setFreeCFeedID:(id)a3
{
}

- (NSString)paidAFeedID
{
  return self->_paidAFeedID;
}

- (void)setPaidAFeedID:(id)a3
{
}

- (NSString)paidBFeedID
{
  return self->_paidBFeedID;
}

- (void)setPaidBFeedID:(id)a3
{
}

- (NSString)paidCFeedID
{
  return self->_paidCFeedID;
}

- (void)setPaidCFeedID:(id)a3
{
}

@end
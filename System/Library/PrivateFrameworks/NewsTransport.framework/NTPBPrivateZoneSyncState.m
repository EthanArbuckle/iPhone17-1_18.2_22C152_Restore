@interface NTPBPrivateZoneSyncState
- (BOOL)hasChangeToken;
- (BOOL)hasLastCleanDate;
- (BOOL)hasLastDirtyDate;
- (BOOL)hasZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)changeToken;
- (NSString)zoneName;
- (NTPBDate)lastCleanDate;
- (NTPBDate)lastDirtyDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChangeToken:(id)a3;
- (void)setLastCleanDate:(id)a3;
- (void)setLastDirtyDate:(id)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPrivateZoneSyncState

- (void)dealloc
{
  [(NTPBPrivateZoneSyncState *)self setZoneName:0];
  [(NTPBPrivateZoneSyncState *)self setChangeToken:0];
  [(NTPBPrivateZoneSyncState *)self setLastCleanDate:0];
  [(NTPBPrivateZoneSyncState *)self setLastDirtyDate:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPrivateZoneSyncState;
  [(NTPBPrivateZoneSyncState *)&v3 dealloc];
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (BOOL)hasChangeToken
{
  return self->_changeToken != 0;
}

- (BOOL)hasLastCleanDate
{
  return self->_lastCleanDate != 0;
}

- (BOOL)hasLastDirtyDate
{
  return self->_lastDirtyDate != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPrivateZoneSyncState;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPrivateZoneSyncState description](&v3, sel_description), -[NTPBPrivateZoneSyncState dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  zoneName = self->_zoneName;
  if (zoneName) {
    [v3 setObject:zoneName forKey:@"zone_name"];
  }
  changeToken = self->_changeToken;
  if (changeToken) {
    [v4 setObject:changeToken forKey:@"change_token"];
  }
  lastCleanDate = self->_lastCleanDate;
  if (lastCleanDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastCleanDate, "dictionaryRepresentation"), @"last_clean_date");
  }
  lastDirtyDate = self->_lastDirtyDate;
  if (lastDirtyDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastDirtyDate, "dictionaryRepresentation"), @"last_dirty_date");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPrivateZoneSyncStateReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_zoneName) {
    PBDataWriterWriteStringField();
  }
  if (self->_changeToken) {
    PBDataWriterWriteDataField();
  }
  if (self->_lastCleanDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lastDirtyDate)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[4] = (id)[(NSString *)self->_zoneName copyWithZone:a3];
  v5[1] = (id)[(NSData *)self->_changeToken copyWithZone:a3];

  v5[2] = [(NTPBDate *)self->_lastCleanDate copyWithZone:a3];
  v5[3] = [(NTPBDate *)self->_lastDirtyDate copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    zoneName = self->_zoneName;
    if (!((unint64_t)zoneName | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](zoneName, "isEqual:")) != 0)
    {
      changeToken = self->_changeToken;
      if (!((unint64_t)changeToken | *((void *)a3 + 1))
        || (int v5 = -[NSData isEqual:](changeToken, "isEqual:")) != 0)
      {
        lastCleanDate = self->_lastCleanDate;
        if (!((unint64_t)lastCleanDate | *((void *)a3 + 2))
          || (int v5 = -[NTPBDate isEqual:](lastCleanDate, "isEqual:")) != 0)
        {
          lastDirtyDate = self->_lastDirtyDate;
          if ((unint64_t)lastDirtyDate | *((void *)a3 + 3))
          {
            LOBYTE(v5) = -[NTPBDate isEqual:](lastDirtyDate, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_zoneName hash];
  uint64_t v4 = [(NSData *)self->_changeToken hash] ^ v3;
  unint64_t v5 = [(NTPBDate *)self->_lastCleanDate hash];
  return v4 ^ v5 ^ [(NTPBDate *)self->_lastDirtyDate hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 4)) {
    -[NTPBPrivateZoneSyncState setZoneName:](self, "setZoneName:");
  }
  if (*((void *)a3 + 1)) {
    -[NTPBPrivateZoneSyncState setChangeToken:](self, "setChangeToken:");
  }
  lastCleanDate = self->_lastCleanDate;
  uint64_t v6 = *((void *)a3 + 2);
  if (lastCleanDate)
  {
    if (v6) {
      -[NTPBDate mergeFrom:](lastCleanDate, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBPrivateZoneSyncState setLastCleanDate:](self, "setLastCleanDate:");
  }
  lastDirtyDate = self->_lastDirtyDate;
  uint64_t v8 = *((void *)a3 + 3);
  if (lastDirtyDate)
  {
    if (v8)
    {
      -[NTPBDate mergeFrom:](lastDirtyDate, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBPrivateZoneSyncState setLastDirtyDate:](self, "setLastDirtyDate:");
  }
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSData)changeToken
{
  return self->_changeToken;
}

- (void)setChangeToken:(id)a3
{
}

- (NTPBDate)lastCleanDate
{
  return self->_lastCleanDate;
}

- (void)setLastCleanDate:(id)a3
{
}

- (NTPBDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (void)setLastDirtyDate:(id)a3
{
}

@end
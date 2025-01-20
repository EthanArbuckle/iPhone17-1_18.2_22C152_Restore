@interface NTPBPrivateRecordSyncState
- (BOOL)hasLastCleanDate;
- (BOOL)hasLastDirtyDate;
- (BOOL)hasRecordName;
- (BOOL)hasRecordZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)recordName;
- (NSString)recordZoneName;
- (NTPBDate)lastCleanDate;
- (NTPBDate)lastDirtyDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setLastCleanDate:(id)a3;
- (void)setLastDirtyDate:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setRecordZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPrivateRecordSyncState

- (void)dealloc
{
  [(NTPBPrivateRecordSyncState *)self setRecordName:0];
  [(NTPBPrivateRecordSyncState *)self setRecordZoneName:0];
  [(NTPBPrivateRecordSyncState *)self setLastCleanDate:0];
  [(NTPBPrivateRecordSyncState *)self setLastDirtyDate:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPrivateRecordSyncState;
  [(NTPBPrivateRecordSyncState *)&v3 dealloc];
}

- (BOOL)hasRecordName
{
  return self->_recordName != 0;
}

- (BOOL)hasRecordZoneName
{
  return self->_recordZoneName != 0;
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
  v3.super_class = (Class)NTPBPrivateRecordSyncState;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPrivateRecordSyncState description](&v3, sel_description), -[NTPBPrivateRecordSyncState dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  recordName = self->_recordName;
  if (recordName) {
    [v3 setObject:recordName forKey:@"record_name"];
  }
  recordZoneName = self->_recordZoneName;
  if (recordZoneName) {
    [v4 setObject:recordZoneName forKey:@"record_zone_name"];
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
  return NTPBPrivateRecordSyncStateReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_recordName) {
    PBDataWriterWriteStringField();
  }
  if (self->_recordZoneName) {
    PBDataWriterWriteStringField();
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

  v5[3] = (id)[(NSString *)self->_recordName copyWithZone:a3];
  v5[4] = (id)[(NSString *)self->_recordZoneName copyWithZone:a3];

  v5[1] = [(NTPBDate *)self->_lastCleanDate copyWithZone:a3];
  v5[2] = [(NTPBDate *)self->_lastDirtyDate copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    recordName = self->_recordName;
    if (!((unint64_t)recordName | *((void *)a3 + 3))
      || (int v5 = -[NSString isEqual:](recordName, "isEqual:")) != 0)
    {
      recordZoneName = self->_recordZoneName;
      if (!((unint64_t)recordZoneName | *((void *)a3 + 4))
        || (int v5 = -[NSString isEqual:](recordZoneName, "isEqual:")) != 0)
      {
        lastCleanDate = self->_lastCleanDate;
        if (!((unint64_t)lastCleanDate | *((void *)a3 + 1))
          || (int v5 = -[NTPBDate isEqual:](lastCleanDate, "isEqual:")) != 0)
        {
          lastDirtyDate = self->_lastDirtyDate;
          if ((unint64_t)lastDirtyDate | *((void *)a3 + 2))
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
  NSUInteger v3 = [(NSString *)self->_recordName hash];
  NSUInteger v4 = [(NSString *)self->_recordZoneName hash] ^ v3;
  unint64_t v5 = [(NTPBDate *)self->_lastCleanDate hash];
  return v4 ^ v5 ^ [(NTPBDate *)self->_lastDirtyDate hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[NTPBPrivateRecordSyncState setRecordName:](self, "setRecordName:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBPrivateRecordSyncState setRecordZoneName:](self, "setRecordZoneName:");
  }
  lastCleanDate = self->_lastCleanDate;
  uint64_t v6 = *((void *)a3 + 1);
  if (lastCleanDate)
  {
    if (v6) {
      -[NTPBDate mergeFrom:](lastCleanDate, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBPrivateRecordSyncState setLastCleanDate:](self, "setLastCleanDate:");
  }
  lastDirtyDate = self->_lastDirtyDate;
  uint64_t v8 = *((void *)a3 + 2);
  if (lastDirtyDate)
  {
    if (v8)
    {
      -[NTPBDate mergeFrom:](lastDirtyDate, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBPrivateRecordSyncState setLastDirtyDate:](self, "setLastDirtyDate:");
  }
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
}

- (NSString)recordZoneName
{
  return self->_recordZoneName;
}

- (void)setRecordZoneName:(id)a3
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
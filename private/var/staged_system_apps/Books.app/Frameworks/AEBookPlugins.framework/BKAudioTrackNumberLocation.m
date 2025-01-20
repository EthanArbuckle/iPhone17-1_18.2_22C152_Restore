@interface BKAudioTrackNumberLocation
- (BKAudioTrackNumberLocation)initWithOrdinal:(int64_t)a3 offset:(double)a4 persistentID:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)stringValue;
- (unint64_t)hash;
- (unint64_t)persistentID;
@end

@implementation BKAudioTrackNumberLocation

- (BKAudioTrackNumberLocation)initWithOrdinal:(int64_t)a3 offset:(double)a4 persistentID:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)BKAudioTrackNumberLocation;
  result = [(BKAudioLocation *)&v7 initWithOrdinal:a3 offset:a4];
  if (result) {
    result->_persistentID = a5;
  }
  return result;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)BKAudioTrackNumberLocation;
  unint64_t v3 = [(BKAudioLocation *)&v7 hash];
  v4 = +[NSNumber numberWithUnsignedLongLong:self->_persistentID];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v7.receiver = self,
        v7.super_class = (Class)BKAudioTrackNumberLocation,
        [(BKAudioLocation *)&v7 isEqual:v4])
    && [v4 persistentID] == self->_persistentID;

  return v5;
}

- (id)stringValue
{
  v6.receiver = self;
  v6.super_class = (Class)BKAudioTrackNumberLocation;
  unint64_t v3 = [(BKAudioLocation *)&v6 stringValue];
  id v4 = +[NSString stringWithFormat:@"{ %@, persistentID:%llu }", v3, self->_persistentID];

  return v4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)BKAudioTrackNumberLocation;
  unint64_t v3 = [(BKAudioLocation *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@, persistentID:%llu", v3, self->_persistentID];

  return v4;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

@end
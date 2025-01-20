@interface VUIBookmark
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBeenPlayed;
- (BOOL)hasBeenRented;
- (BOOL)hasFakeTimestamp;
- (BOOL)hasRemoteData;
- (BOOL)isMarkedAsUnwatched;
- (NSDate)bookmarkTimestamp;
- (VUIBookmark)init;
- (VUIBookmark)initWithCoder:(id)a3;
- (VUIBookmark)initWithKey:(id)a3;
- (VUIBookmarkKey)key;
- (double)bookmarkTime;
- (id)_copyWithResultClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)playCount;
- (void)_setBookmarkTimeWithoutUpdatingTimestamp:(double)a3;
- (void)_setBookmarkTimestamp:(id)a3;
- (void)_setHasBeenPlayed:(BOOL)a3;
- (void)_setHasBeenRented:(BOOL)a3;
- (void)_setIsMarkedAsUnwatched:(BOOL)a3;
- (void)_setPlayCount:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHasFakeTimestamp:(BOOL)a3;
@end

@implementation VUIBookmark

- (VUIBookmark)initWithKey:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)VUIBookmark;
    v6 = [(VUIBookmark *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_key, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (VUIBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Coder must allow keyed coding."];
  }
  v13.receiver = self;
  v13.super_class = (Class)VUIBookmark;
  id v5 = [(VUIBookmark *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TVSBookmark.Key"];
    key = v5->_key;
    v5->_key = (VUIBookmarkKey *)v6;

    [v4 decodeDoubleForKey:@"TVSBookmark.BookmarkTime"];
    v5->_bookmarkTime = v8;
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TVSBookmark.BookmarkTimestamp"];
    uint64_t v10 = [v9 copy];
    bookmarkTimestamp = v5->_bookmarkTimestamp;
    v5->_bookmarkTimestamp = (NSDate *)v10;

    v5->_playCount = [v4 decodeIntegerForKey:@"TVSBookmark.PlayCount"];
    v5->_hasBeenPlayed = [v4 decodeBoolForKey:@"TVSBookmark.HasBeenPlayed"];
    v5->_hasBeenRented = [v4 decodeBoolForKey:@"TVSBookmark.HasBeenRented"];
    v5->_isMarkedAsUnwatched = [v4 decodeBoolForKey:@"TVSBookmark.IsMarkedAsUnwatched"];
    v5->_hasFakeTimestamp = [v4 decodeBoolForKey:@"TVSBookmark.HasFakeTimestamp"];
  }

  return v5;
}

- (VUIBookmark)init
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (([v6 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Coder must allow keyed coding."];
  }
  id v4 = [(VUIBookmark *)self key];
  [v6 encodeObject:v4 forKey:@"TVSBookmark.Key"];

  [(VUIBookmark *)self bookmarkTime];
  objc_msgSend(v6, "encodeDouble:forKey:", @"TVSBookmark.BookmarkTime");
  id v5 = [(VUIBookmark *)self bookmarkTimestamp];
  [v6 encodeObject:v5 forKey:@"TVSBookmark.BookmarkTimestamp"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[VUIBookmark playCount](self, "playCount"), @"TVSBookmark.PlayCount");
  objc_msgSend(v6, "encodeBool:forKey:", -[VUIBookmark hasBeenPlayed](self, "hasBeenPlayed"), @"TVSBookmark.HasBeenPlayed");
  objc_msgSend(v6, "encodeBool:forKey:", -[VUIBookmark hasBeenRented](self, "hasBeenRented"), @"TVSBookmark.HasBeenRented");
  objc_msgSend(v6, "encodeBool:forKey:", -[VUIBookmark isMarkedAsUnwatched](self, "isMarkedAsUnwatched"), @"TVSBookmark.IsMarkedAsUnwatched");
  objc_msgSend(v6, "encodeBool:forKey:", -[VUIBookmark hasFakeTimestamp](self, "hasFakeTimestamp"), @"TVSBookmark.HasFakeTimestamp");
}

- (id)_copyWithResultClass:(Class)a3
{
  uint64_t v4 = [[a3 alloc] initWithKey:self->_key];
  *(double *)(v4 + 24) = self->_bookmarkTime;
  objc_storeStrong((id *)(v4 + 32), self->_bookmarkTimestamp);
  *(unsigned char *)(v4 + 11) = self->_hasFakeTimestamp;
  *(void *)(v4 + 40) = self->_playCount;
  *(unsigned char *)(v4 + 8) = self->_hasBeenPlayed;
  *(unsigned char *)(v4 + 9) = self->_hasBeenRented;
  *(unsigned char *)(v4 + 10) = self->_isMarkedAsUnwatched;
  return (id)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(VUIBookmark *)self isMemberOfClass:objc_opt_class()])
  {
    return self;
  }
  else
  {
    uint64_t v4 = objc_opt_class();
    return [(VUIBookmark *)self _copyWithResultClass:v4];
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(VUIBookmark *)self _copyWithResultClass:v4];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)VUIBookmark;
  uint64_t v4 = [(VUIBookmark *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@: key=[%@], bookmarkTime=%f, playCount=%d, hasBeenPlayed=%d, hasBeenRented=%d, isMarkedAsUnwatched=%d, bookmarkTimestamp=%@", v4, self->_key, *(void *)&self->_bookmarkTime, self->_playCount, self->_hasBeenPlayed, self->_hasBeenRented, self->_isMarkedAsUnwatched, self->_bookmarkTimestamp];

  return v5;
}

- (void)_setBookmarkTimeWithoutUpdatingTimestamp:(double)a3
{
  self->_bookmarkTime = a3;
}

- (void)_setBookmarkTimestamp:(id)a3
{
}

- (void)_setPlayCount:(unint64_t)a3
{
  self->_playCount = a3;
}

- (void)_setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
}

- (void)_setHasBeenRented:(BOOL)a3
{
  self->_hasBeenRented = a3;
}

- (void)_setIsMarkedAsUnwatched:(BOOL)a3
{
  self->_isMarkedAsUnwatched = a3;
}

- (BOOL)hasRemoteData
{
  v2 = [(VUIBookmark *)self bookmarkTimestamp];
  BOOL v3 = v2 != 0;

  return v3;
}

- (VUIBookmarkKey)key
{
  return self->_key;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (NSDate)bookmarkTimestamp
{
  return self->_bookmarkTimestamp;
}

- (unint64_t)playCount
{
  return self->_playCount;
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (BOOL)hasBeenRented
{
  return self->_hasBeenRented;
}

- (BOOL)isMarkedAsUnwatched
{
  return self->_isMarkedAsUnwatched;
}

- (BOOL)hasFakeTimestamp
{
  return self->_hasFakeTimestamp;
}

- (void)setHasFakeTimestamp:(BOOL)a3
{
  self->_hasFakeTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkTimestamp, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
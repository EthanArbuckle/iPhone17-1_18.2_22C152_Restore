@interface ML3AlbumGroupingIdentifier
- (BOOL)compilation;
- (BOOL)isEqual:(id)a3;
- (ML3AlbumGroupingIdentifier)initWithAlbumArtistPersistentID:(int64_t)a3 groupingKey:(id)a4 feedURL:(id)a5 seasonNumber:(int64_t)a6 compilation:(BOOL)a7;
- (NSData)groupingKey;
- (NSData)keyValue;
- (NSString)feedURL;
- (id)description;
- (int64_t)albumArtistPersistentID;
- (int64_t)seasonNumber;
- (unint64_t)hash;
- (void)setKeyValue:(id)a3;
@end

@implementation ML3AlbumGroupingIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValue, 0);
  objc_storeStrong((id *)&self->_feedURL, 0);

  objc_storeStrong((id *)&self->_groupingKey, 0);
}

- (void)setKeyValue:(id)a3
{
}

- (BOOL)compilation
{
  return self->_compilation;
}

- (int64_t)seasonNumber
{
  return self->_seasonNumber;
}

- (NSString)feedURL
{
  return self->_feedURL;
}

- (NSData)groupingKey
{
  return self->_groupingKey;
}

- (int64_t)albumArtistPersistentID
{
  return self->_albumArtistPersistentID;
}

- (NSData)keyValue
{
  return self->_keyValue;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_feedURL length];
  uint64_t v4 = [(NSData *)self->_groupingKey hash];
  if (v3) {
    int64_t v5 = [(NSString *)self->_feedURL hash];
  }
  else {
    int64_t v5 = self->_seasonNumber ^ self->_albumArtistPersistentID;
  }
  return v5 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(NSString *)self->_feedURL length])
    {
      int64_t v5 = (void *)v4[4];
      v6 = self->_feedURL;
      v7 = v5;
      if (v6 == v7)
      {

        goto LABEL_12;
      }
      v8 = v7;
      int v9 = [(NSString *)v6 isEqual:v7];

      if (v9)
      {
LABEL_12:
        v14 = (void *)v4[3];
        v11 = self->_groupingKey;
        v12 = v14;
        if (v11 != v12)
        {
LABEL_13:
          v15 = v12;
          char v13 = [(NSData *)v11 isEqual:v12];
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:
        char v13 = 1;
        v15 = v11;
        goto LABEL_15;
      }
    }
    else if (self->_albumArtistPersistentID == v4[2] && self->_seasonNumber == v4[5])
    {
      v10 = (void *)v4[3];
      v11 = self->_groupingKey;
      v12 = v10;
      if (v11 != v12) {
        goto LABEL_13;
      }
      goto LABEL_14;
    }
  }
  char v13 = 0;
LABEL_16:

  return v13;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)ML3AlbumGroupingIdentifier;
  NSUInteger v3 = [(ML3AlbumGroupingIdentifier *)&v8 description];
  uint64_t v4 = v3;
  if (self->_compilation) {
    int64_t v5 = @"YES";
  }
  else {
    int64_t v5 = @"NO";
  }
  v6 = [v3 stringByAppendingFormat:@", albumArtistPersistentID=%lld, groupingKey=%@, feedURL=%@, seasonNumber=%ld, compilation=%@", *(_OWORD *)&self->_albumArtistPersistentID, self->_feedURL, self->_seasonNumber, v5];

  return v6;
}

- (ML3AlbumGroupingIdentifier)initWithAlbumArtistPersistentID:(int64_t)a3 groupingKey:(id)a4 feedURL:(id)a5 seasonNumber:(int64_t)a6 compilation:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ML3AlbumGroupingIdentifier;
  v15 = [(ML3AlbumGroupingIdentifier *)&v21 init];
  v16 = v15;
  if (v15)
  {
    v15->_albumArtistPersistentID = a3;
    objc_storeStrong((id *)&v15->_groupingKey, a4);
    objc_storeStrong((id *)&v16->_feedURL, a5);
    v16->_seasonNumber = a6;
    v16->_compilation = a7;
    v17 = [MEMORY[0x1E4F1CA58] data];
    [v17 appendBytes:"<<" length:2];
    [v17 appendBytes:&v16->_albumArtistPersistentID length:8];
    [v17 appendBytes:"<<" length:2];
    [v17 appendData:v16->_groupingKey];
    [v17 appendBytes:"<<" length:2];
    objc_msgSend(v17, "appendBytes:length:", -[NSString UTF8String](v16->_feedURL, "UTF8String"), strlen(-[NSString UTF8String](v16->_feedURL, "UTF8String")));
    [v17 appendBytes:"<<" length:2];
    [v17 appendBytes:&v16->_seasonNumber length:8];
    uint64_t v18 = [v17 copy];
    keyValue = v16->_keyValue;
    v16->_keyValue = (NSData *)v18;
  }
  return v16;
}

@end
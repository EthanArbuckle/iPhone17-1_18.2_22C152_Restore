@interface PCMediaRemoteIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)mediaRemoteID;
- (PCMediaRemoteIdentifier)initWithCoder:(id)a3;
- (PCMediaRemoteIdentifier)initWithIdentifier:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PCMediaRemoteIdentifier

- (id)description
{
  v2 = NSString;
  mediaRemoteID = self->_mediaRemoteID;
  int64_t v4 = [(PCDeviceIdentifier *)self assetType];
  if ((unint64_t)(v4 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_26443DE78[v4 - 1];
  }
  v6 = [v2 stringWithFormat:@"<mrID=%@, type=%@>", mediaRemoteID, v5];

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_mediaRemoteID hash];
}

- (PCMediaRemoteIdentifier)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCMediaRemoteIdentifier;
  v6 = [(PCDeviceIdentifier *)&v9 initWithDeviceName:@"HomePod"];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaRemoteID, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 mediaRemoteID];
    mediaRemoteID = self->_mediaRemoteID;
    v8 = v6;
    objc_super v9 = mediaRemoteID;
    if (v8 == v9)
    {
    }
    else
    {
      v10 = v9;
      if ((v8 == 0) == (v9 != 0))
      {

LABEL_10:
        BOOL v12 = 0;
        goto LABEL_11;
      }
      int v11 = [(NSString *)v8 isEqual:v9];

      if (!v11) {
        goto LABEL_10;
      }
    }
    uint64_t v13 = [v5 assetType];
    BOOL v12 = v13 == [(PCDeviceIdentifier *)self assetType];
LABEL_11:

    goto LABEL_12;
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PCMediaRemoteIdentifier;
  [(PCDeviceIdentifier *)&v6 encodeWithCoder:v4];
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID) {
    [v4 encodeObject:mediaRemoteID forKey:@"mrid"];
  }
}

- (PCMediaRemoteIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PCMediaRemoteIdentifier;
  id v5 = [(PCDeviceIdentifier *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_super v6 = v5;
  }

  return v5;
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (void).cxx_destruct
{
}

@end
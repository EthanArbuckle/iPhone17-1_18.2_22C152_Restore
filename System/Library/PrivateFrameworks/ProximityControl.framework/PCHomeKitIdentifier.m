@interface PCHomeKitIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSUUID)accessoryID;
- (NSUUID)homeID;
- (PCHomeKitIdentifier)initWithAccessoryID:(id)a3 homeID:(id)a4;
- (PCHomeKitIdentifier)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PCHomeKitIdentifier

- (id)description
{
  v3 = NSString;
  accessoryID = self->_accessoryID;
  homeID = self->_homeID;
  int64_t v6 = [(PCDeviceIdentifier *)self assetType];
  if ((unint64_t)(v6 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_26443E0F0[v6 - 1];
  }
  v8 = [(PCDeviceIdentifier *)self deviceName];
  v9 = [v3 stringWithFormat:@"<acsID=%@, homeID=%@, type=%@ name=%@>", accessoryID, homeID, v7, v8];

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_accessoryID hash];
  return [(NSUUID *)self->_homeID hash] ^ v3;
}

- (PCHomeKitIdentifier)initWithAccessoryID:(id)a3 homeID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PCHomeKitIdentifier;
  v9 = [(PCDeviceIdentifier *)&v12 initWithDeviceName:@"HomePod"];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryID, a3);
    objc_storeStrong((id *)&v10->_homeID, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [v5 accessoryID];
    accessoryID = self->_accessoryID;
    id v8 = v6;
    v9 = accessoryID;
    if (v8 == v9)
    {
    }
    else
    {
      v10 = v9;
      if ((v8 == 0) == (v9 != 0)) {
        goto LABEL_12;
      }
      int v11 = [(NSUUID *)v8 isEqual:v9];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [v5 homeID];
    homeID = self->_homeID;
    id v8 = v13;
    v15 = homeID;
    if (v8 == v15)
    {

LABEL_15:
      uint64_t v17 = [v5 assetType];
      BOOL v12 = v17 == [(PCDeviceIdentifier *)self assetType];
      goto LABEL_16;
    }
    v10 = v15;
    if ((v8 == 0) != (v15 != 0))
    {
      int v16 = [(NSUUID *)v8 isEqual:v15];

      if (v16) {
        goto LABEL_15;
      }
LABEL_13:
      BOOL v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
LABEL_12:

    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PCHomeKitIdentifier;
  [(PCDeviceIdentifier *)&v7 encodeWithCoder:v4];
  accessoryID = self->_accessoryID;
  if (accessoryID) {
    [v4 encodeObject:accessoryID forKey:@"aid"];
  }
  homeID = self->_homeID;
  if (homeID) {
    [v4 encodeObject:homeID forKey:@"hid"];
  }
}

- (PCHomeKitIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PCHomeKitIdentifier;
  id v5 = [(PCDeviceIdentifier *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    int64_t v6 = v5;
  }

  return v5;
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (NSUUID)homeID
{
  return self->_homeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
}

@end
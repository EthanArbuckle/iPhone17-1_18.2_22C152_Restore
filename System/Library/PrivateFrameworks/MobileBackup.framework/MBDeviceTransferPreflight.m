@interface MBDeviceTransferPreflight
+ (BOOL)supportsSecureCoding;
- (MBDeviceTransferPreflight)init;
- (MBDeviceTransferPreflight)initWithCoder:(id)a3;
- (NSDictionary)appleIDs;
- (NSString)activeAppleID;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)sourceDeviceDataSize;
- (unint64_t)sourcePurgeableSpaceSize;
- (unint64_t)targetDeviceFreeSpaceSize;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveAppleID:(id)a3;
- (void)setAppleIDs:(id)a3;
- (void)setSourceDeviceDataSize:(unint64_t)a3;
- (void)setSourcePurgeableSpaceSize:(unint64_t)a3;
- (void)setTargetDeviceFreeSpaceSize:(unint64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation MBDeviceTransferPreflight

- (MBDeviceTransferPreflight)init
{
  v6.receiver = self;
  v6.super_class = (Class)MBDeviceTransferPreflight;
  v2 = [(MBDeviceTransferPreflight *)&v6 init];
  if (v2)
  {
    uint64_t v3 = MBRandomUUID();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBDeviceTransferPreflight)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MBDeviceTransferPreflight;
  v5 = [(MBDeviceTransferPreflight *)&v15 init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    [(MBDeviceTransferPreflight *)v5 setUuid:v6];

    -[MBDeviceTransferPreflight setSourceDeviceDataSize:](v5, "setSourceDeviceDataSize:", [v4 decodeInt64ForKey:@"sourceDeviceDataSize"]);
    -[MBDeviceTransferPreflight setTargetDeviceFreeSpaceSize:](v5, "setTargetDeviceFreeSpaceSize:", [v4 decodeIntegerForKey:@"targetDeviceFreeSpaceSize"]);
    -[MBDeviceTransferPreflight setSourcePurgeableSpaceSize:](v5, "setSourcePurgeableSpaceSize:", [v4 decodeIntegerForKey:@"sourcePurgeableSpaceSize"]);
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"appleIDs"];
    [(MBDeviceTransferPreflight *)v5 setAppleIDs:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeAppleID"];
    [(MBDeviceTransferPreflight *)v5 setActiveAppleID:v13];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MBDeviceTransferPreflight *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[MBDeviceTransferPreflight sourceDeviceDataSize](self, "sourceDeviceDataSize"), @"sourceDeviceDataSize");
  objc_msgSend(v4, "encodeInt64:forKey:", -[MBDeviceTransferPreflight targetDeviceFreeSpaceSize](self, "targetDeviceFreeSpaceSize"), @"targetDeviceFreeSpaceSize");
  objc_msgSend(v4, "encodeInt64:forKey:", -[MBDeviceTransferPreflight sourcePurgeableSpaceSize](self, "sourcePurgeableSpaceSize"), @"sourcePurgeableSpaceSize");
  objc_super v6 = [(MBDeviceTransferPreflight *)self appleIDs];
  [v4 encodeObject:v6 forKey:@"appleIDs"];

  id v7 = [(MBDeviceTransferPreflight *)self activeAppleID];
  [v4 encodeObject:v7 forKey:@"activeAppleID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(MBDeviceTransferPreflight *)self uuid];
  objc_super v6 = (void *)[v5 copy];
  [v4 setUuid:v6];

  objc_msgSend(v4, "setSourceDeviceDataSize:", -[MBDeviceTransferPreflight sourceDeviceDataSize](self, "sourceDeviceDataSize"));
  objc_msgSend(v4, "setTargetDeviceFreeSpaceSize:", -[MBDeviceTransferPreflight targetDeviceFreeSpaceSize](self, "targetDeviceFreeSpaceSize"));
  objc_msgSend(v4, "setSourcePurgeableSpaceSize:", -[MBDeviceTransferPreflight sourcePurgeableSpaceSize](self, "sourcePurgeableSpaceSize"));
  id v7 = [(MBDeviceTransferPreflight *)self appleIDs];
  [v4 setAppleIDs:v7];

  uint64_t v8 = [(MBDeviceTransferPreflight *)self activeAppleID];
  [v4 setActiveAppleID:v8];

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  objc_super v6 = [(MBDeviceTransferPreflight *)self uuid];
  objc_msgSend(v3, "stringWithFormat:", @"<%s: %p; uuid=%@, sourceDeviceDataSize=%llu, sourcePurgeableSpaceSize=%llu, targetDeviceFreeSpaceSize=%llu>",
    Name,
    self,
    v6,
    [(MBDeviceTransferPreflight *)self sourceDeviceDataSize],
    [(MBDeviceTransferPreflight *)self sourcePurgeableSpaceSize],
  id v7 = [(MBDeviceTransferPreflight *)self targetDeviceFreeSpaceSize]);

  return v7;
}

- (unint64_t)sourceDeviceDataSize
{
  return self->_sourceDeviceDataSize;
}

- (void)setSourceDeviceDataSize:(unint64_t)a3
{
  self->_sourceDeviceDataSize = a3;
}

- (unint64_t)targetDeviceFreeSpaceSize
{
  return self->_targetDeviceFreeSpaceSize;
}

- (void)setTargetDeviceFreeSpaceSize:(unint64_t)a3
{
  self->_targetDeviceFreeSpaceSize = a3;
}

- (unint64_t)sourcePurgeableSpaceSize
{
  return self->_sourcePurgeableSpaceSize;
}

- (void)setSourcePurgeableSpaceSize:(unint64_t)a3
{
  self->_sourcePurgeableSpaceSize = a3;
}

- (NSString)activeAppleID
{
  return self->_activeAppleID;
}

- (void)setActiveAppleID:(id)a3
{
}

- (NSDictionary)appleIDs
{
  return self->_appleIDs;
}

- (void)setAppleIDs:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_appleIDs, 0);
  objc_storeStrong((id *)&self->_activeAppleID, 0);
}

@end
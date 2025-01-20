@interface PKCloudRecordCloudStoreZoneShareLock
+ (BOOL)supportsSecureCoding;
- (PKCloudRecordCloudStoreZoneShareLock)initWithCoder:(id)a3;
- (PKCloudStoreZoneShareLock)cloudStoreZoneShareLock;
- (id)_descriptionWithIncludeItem:(BOOL)a3;
- (id)description;
- (id)descriptionWithItem:(BOOL)a3;
- (id)item;
- (int64_t)compare:(id)a3;
- (void)applyCloudRecordObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudStoreZoneShareLock:(id)a3;
@end

@implementation PKCloudRecordCloudStoreZoneShareLock

- (id)item
{
  return self->_cloudStoreZoneShareLock;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordCloudStoreZoneShareLock)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordCloudStoreZoneShareLock;
  v5 = [(PKCloudRecordObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudStoreZoneShareLock"];
    cloudStoreZoneShareLock = v5->_cloudStoreZoneShareLock;
    v5->_cloudStoreZoneShareLock = (PKCloudStoreZoneShareLock *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCloudRecordCloudStoreZoneShareLock;
  id v4 = a3;
  [(PKCloudRecordObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_cloudStoreZoneShareLock, @"cloudStoreZoneShareLock", v5.receiver, v5.super_class);
}

- (int64_t)compare:(id)a3
{
  cloudStoreZoneShareLock = self->_cloudStoreZoneShareLock;
  id v4 = a3;
  objc_super v5 = [(PKCloudStoreZoneShareLock *)cloudStoreZoneShareLock originDeviceIdentifier];
  uint64_t v6 = [v4 cloudStoreZoneShareLock];

  v7 = [v6 originDeviceIdentifier];
  int64_t v8 = [v5 compare:v7];

  return v8;
}

- (id)descriptionWithItem:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = -[PKCloudRecordCloudStoreZoneShareLock _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordCloudStoreZoneShareLock;
  uint64_t v6 = [(PKCloudRecordObject *)&v8 descriptionWithItem:v3];
  [v5 appendFormat:@"\n%@", v6];

  return v5;
}

- (id)description
{
  BOOL v3 = [(PKCloudRecordCloudStoreZoneShareLock *)self _descriptionWithIncludeItem:0];
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordCloudStoreZoneShareLock;
  id v4 = [(PKCloudRecordObject *)&v6 description];
  [v3 appendFormat:@"\n%@", v4];

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [MEMORY[0x1E4F28E78] string];
  objc_super v6 = v5;
  if (self->_cloudStoreZoneShareLock)
  {
    if (v3) {
      [v5 appendFormat:@"cloudStoreZoneShareLock: %@\n", self->_cloudStoreZoneShareLock];
    }
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", @"No associated cloudStoreZoneShareLock in database\n", v8);
  }
  return v6;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCloudRecordCloudStoreZoneShareLock;
    [(PKCloudRecordObject *)&v10 applyCloudRecordObject:v4];
    id v5 = v4;
    objc_super v6 = v5;
    if (!self->_cloudStoreZoneShareLock)
    {
      v7 = [v5 cloudStoreZoneShareLock];

      if (v7)
      {
        uint64_t v8 = [v6 cloudStoreZoneShareLock];
        cloudStoreZoneShareLock = self->_cloudStoreZoneShareLock;
        self->_cloudStoreZoneShareLock = v8;
      }
    }
  }
}

- (PKCloudStoreZoneShareLock)cloudStoreZoneShareLock
{
  return self->_cloudStoreZoneShareLock;
}

- (void)setCloudStoreZoneShareLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
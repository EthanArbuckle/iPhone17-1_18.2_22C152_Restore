@interface PLPhotoLibraryAttributesChanges
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChanges;
- (NSNumber)cloudResourcePrefetchModeValue;
- (NSNumber)enableCloudSyncValue;
- (NSString)name;
- (NSString)userDescription;
- (PLPhotoLibraryAttributesChanges)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudResourcePrefetchModeValue:(id)a3;
- (void)setEnableCloudSyncValue:(id)a3;
- (void)setName:(id)a3;
- (void)setUserDescription:(id)a3;
@end

@implementation PLPhotoLibraryAttributesChanges

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudResourcePrefetchModeValue, 0);
  objc_storeStrong((id *)&self->_enableCloudSyncValue, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setCloudResourcePrefetchModeValue:(id)a3
{
}

- (NSNumber)cloudResourcePrefetchModeValue
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEnableCloudSyncValue:(id)a3
{
}

- (NSNumber)enableCloudSyncValue
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserDescription:(id)a3
{
}

- (NSString)userDescription
{
  return self->_userDescription;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)hasChanges
{
  return self->_name
      || self->_userDescription
      || self->_enableCloudSyncValue
      || self->_cloudResourcePrefetchModeValue != 0;
}

- (PLPhotoLibraryAttributesChanges)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLPhotoLibraryAttributesChanges;
  v5 = [(PLPhotoLibraryAttributesChanges *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userDescription"];
    userDescription = v5->_userDescription;
    v5->_userDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enableCloudSyncValue"];
    enableCloudSyncValue = v5->_enableCloudSyncValue;
    v5->_enableCloudSyncValue = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudResourcePrefetchModeValue"];
    cloudResourcePrefetchModeValue = v5->_cloudResourcePrefetchModeValue;
    v5->_cloudResourcePrefetchModeValue = (NSNumber *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_userDescription forKey:@"userDescription"];
  [v5 encodeObject:self->_enableCloudSyncValue forKey:@"enableCloudSyncValue"];
  [v5 encodeObject:self->_cloudResourcePrefetchModeValue forKey:@"cloudResourcePrefetchModeValue"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
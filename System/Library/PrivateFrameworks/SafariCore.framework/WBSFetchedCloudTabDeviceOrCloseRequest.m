@interface WBSFetchedCloudTabDeviceOrCloseRequest
+ (BOOL)supportsSecureCoding;
- (NSDictionary)deviceOrCloseRequestDictionary;
- (NSString)uuidString;
- (WBSFetchedCloudTabDeviceOrCloseRequest)init;
- (WBSFetchedCloudTabDeviceOrCloseRequest)initWithCoder:(id)a3;
- (WBSFetchedCloudTabDeviceOrCloseRequest)initWithUUIDString:(id)a3 deviceOrCloseRequestDictionary:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSFetchedCloudTabDeviceOrCloseRequest

- (WBSFetchedCloudTabDeviceOrCloseRequest)init
{
  return 0;
}

- (WBSFetchedCloudTabDeviceOrCloseRequest)initWithUUIDString:(id)a3 deviceOrCloseRequestDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSFetchedCloudTabDeviceOrCloseRequest;
  v8 = [(WBSFetchedCloudTabDeviceOrCloseRequest *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    uuidString = v8->_uuidString;
    v8->_uuidString = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    deviceOrCloseRequestDictionary = v8->_deviceOrCloseRequestDictionary;
    v8->_deviceOrCloseRequestDictionary = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSFetchedCloudTabDeviceOrCloseRequest)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuidString"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:5];
  v8 = objc_msgSend(v6, "setWithArray:", v7, v12, v13, v14, v15);

  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"deviceOrCloseRequestDictionary"];

  v10 = [(WBSFetchedCloudTabDeviceOrCloseRequest *)self initWithUUIDString:v5 deviceOrCloseRequestDictionary:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  uuidString = self->_uuidString;
  id v5 = a3;
  [v5 encodeObject:uuidString forKey:@"uuidString"];
  [v5 encodeObject:self->_deviceOrCloseRequestDictionary forKey:@"deviceOrCloseRequestDictionary"];
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (NSDictionary)deviceOrCloseRequestDictionary
{
  return self->_deviceOrCloseRequestDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOrCloseRequestDictionary, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end
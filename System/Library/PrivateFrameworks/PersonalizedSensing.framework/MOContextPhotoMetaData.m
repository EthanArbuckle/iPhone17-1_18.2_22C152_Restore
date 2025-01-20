@interface MOContextPhotoMetaData
+ (BOOL)supportsSecureCoding;
- (MOContextPhotoMetaData)init;
- (MOContextPhotoMetaData)initWithCoder:(id)a3;
- (MOContextPhotoMetaData)initWithPhotoAssetIdentifier:(id)a3;
- (NSString)photoAssetIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOContextPhotoMetaData

- (MOContextPhotoMetaData)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOContextPhotoMetaData;
  return [(MOContextPhotoMetaData *)&v3 init];
}

- (MOContextPhotoMetaData)initWithPhotoAssetIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MOContextPhotoMetaData;
  v6 = [(MOContextPhotoMetaData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoAssetIdentifier, a3);
    v8 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_259147000, v8, OS_LOG_TYPE_INFO, "PhotoMetaData photoAssetIdentifier,%@", buf, 0xCu);
    }
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MOContextPhotoMetaData alloc];
  id v5 = [(MOContextPhotoMetaData *)self photoAssetIdentifier];
  v6 = [(MOContextPhotoMetaData *)v4 initWithPhotoAssetIdentifier:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MOContextPhotoMetaData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoAssetIdentifier"];

  v6 = [(MOContextPhotoMetaData *)self initWithPhotoAssetIdentifier:v5];
  return v6;
}

- (NSString)photoAssetIdentifier
{
  return self->_photoAssetIdentifier;
}

- (void).cxx_destruct
{
}

@end
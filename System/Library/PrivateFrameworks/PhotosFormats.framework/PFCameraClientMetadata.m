@interface PFCameraClientMetadata
+ (BOOL)supportsSecureCoding;
- (AVCapturePhotoPrivateClientMetadata)privateClientMetadata;
- (NSArray)contactIDsInProximity;
- (NSDictionary)sharedLibraryDiagnostics;
- (PFCameraClientMetadata)initWithCoder:(id)a3;
- (PFCameraClientMetadata)initWithPrivateClientMetadata:(id)a3 contactIDsInProximity:(id)a4 sharedLibraryMode:(int64_t)a5;
- (int64_t)sharedLibraryMode;
- (void)encodeWithCoder:(id)a3;
- (void)setContactIDsInProximity:(id)a3;
- (void)setPrivateClientMetadata:(id)a3;
- (void)setSharedLibraryDiagnostics:(id)a3;
- (void)setSharedLibraryMode:(int64_t)a3;
@end

@implementation PFCameraClientMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryDiagnostics, 0);
  objc_storeStrong((id *)&self->_contactIDsInProximity, 0);

  objc_storeStrong((id *)&self->_privateClientMetadata, 0);
}

- (void)setSharedLibraryDiagnostics:(id)a3
{
}

- (NSDictionary)sharedLibraryDiagnostics
{
  return self->_sharedLibraryDiagnostics;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  self->_sharedLibraryMode = a3;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (void)setContactIDsInProximity:(id)a3
{
}

- (NSArray)contactIDsInProximity
{
  return self->_contactIDsInProximity;
}

- (void)setPrivateClientMetadata:(id)a3
{
}

- (AVCapturePhotoPrivateClientMetadata)privateClientMetadata
{
  return self->_privateClientMetadata;
}

- (PFCameraClientMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PFCameraClientMetadata *)self init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"privateClientMetadata"];
    privateClientMetadata = v5->_privateClientMetadata;
    v5->_privateClientMetadata = (AVCapturePhotoPrivateClientMetadata *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"contactIDsInProximity"];
    contactIDsInProximity = v5->_contactIDsInProximity;
    v5->_contactIDsInProximity = (NSArray *)v12;

    v5->_sharedLibraryMode = [v4 decodeIntegerForKey:@"sharedLibraryMode"];
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"sharedLibraryDiagnostics"];
    sharedLibraryDiagnostics = v5->_sharedLibraryDiagnostics;
    v5->_sharedLibraryDiagnostics = (NSDictionary *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  privateClientMetadata = self->_privateClientMetadata;
  id v5 = a3;
  [v5 encodeObject:privateClientMetadata forKey:@"privateClientMetadata"];
  [v5 encodeObject:self->_contactIDsInProximity forKey:@"contactIDsInProximity"];
  [v5 encodeInteger:self->_sharedLibraryMode forKey:@"sharedLibraryMode"];
  [v5 encodeObject:self->_sharedLibraryDiagnostics forKey:@"sharedLibraryDiagnostics"];
}

- (PFCameraClientMetadata)initWithPrivateClientMetadata:(id)a3 contactIDsInProximity:(id)a4 sharedLibraryMode:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PFCameraClientMetadata;
  v11 = [(PFCameraClientMetadata *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_privateClientMetadata, a3);
    uint64_t v13 = [v10 copy];
    contactIDsInProximity = v12->_contactIDsInProximity;
    v12->_contactIDsInProximity = (NSArray *)v13;

    v12->_sharedLibraryMode = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
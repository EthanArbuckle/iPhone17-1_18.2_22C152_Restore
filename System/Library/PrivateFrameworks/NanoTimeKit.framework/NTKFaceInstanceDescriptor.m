@interface NTKFaceInstanceDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)faceJSONRepresentation;
- (NSString)resourceDirectory;
- (NSUUID)nrDeviceUUID;
- (NTKFaceInstanceDescriptor)initWithCoder:(id)a3;
- (NTKFaceInstanceDescriptor)initWithJSONRepresentation:(id)a3 nrDeviceUUID:(id)a4 resourceDirectory:(id)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKFaceInstanceDescriptor

- (NTKFaceInstanceDescriptor)initWithJSONRepresentation:(id)a3 nrDeviceUUID:(id)a4 resourceDirectory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NTKFaceInstanceDescriptor;
  v11 = [(NTKFaceInstanceDescriptor *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    faceJSONRepresentation = v11->_faceJSONRepresentation;
    v11->_faceJSONRepresentation = (NSData *)v12;

    objc_storeStrong((id *)&v11->_nrDeviceUUID, a4);
    uint64_t v14 = [v10 copy];
    resourceDirectory = v11->_resourceDirectory;
    v11->_resourceDirectory = (NSString *)v14;
  }
  return v11;
}

- (unint64_t)hash
{
  v3 = [(NTKFaceInstanceDescriptor *)self faceJSONRepresentation];
  uint64_t v4 = [v3 hash];
  v5 = [(NTKFaceInstanceDescriptor *)self resourceDirectory];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(NTKFaceInstanceDescriptor *)self nrDeviceUUID];
  unint64_t v8 = v6 ^ (16 * [v7 hash]);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 nrDeviceUUID];
    v7 = [(NTKFaceInstanceDescriptor *)self nrDeviceUUID];
    if (NTKEqualObjects(v7, v6))
    {
      unint64_t v8 = [v5 faceJSONRepresentation];
      id v9 = [(NTKFaceInstanceDescriptor *)self faceJSONRepresentation];
      if (NTKEqualObjects(v9, v8))
      {
        id v10 = [v5 resourceDirectory];
        v11 = [(NTKFaceInstanceDescriptor *)self resourceDirectory];
        char v12 = NTKEqualObjects(v11, v10);
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKFaceInstanceDescriptor *)self faceJSONRepresentation];
  [v4 encodeObject:v5 forKey:@"faceJSONRepresentation"];

  uint64_t v6 = [(NTKFaceInstanceDescriptor *)self resourceDirectory];
  [v4 encodeObject:v6 forKey:@"resourceDirectory"];

  id v7 = [(NTKFaceInstanceDescriptor *)self nrDeviceUUID];
  [v4 encodeObject:v7 forKey:@"nrDeviceUUID"];
}

- (NTKFaceInstanceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceJSONRepresentation"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nrDeviceUUID"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resourceDirectory"];

  unint64_t v8 = [(NTKFaceInstanceDescriptor *)self initWithJSONRepresentation:v5 nrDeviceUUID:v6 resourceDirectory:v7];
  return v8;
}

- (NSData)faceJSONRepresentation
{
  return self->_faceJSONRepresentation;
}

- (NSUUID)nrDeviceUUID
{
  return self->_nrDeviceUUID;
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceDirectory, 0);
  objc_storeStrong((id *)&self->_nrDeviceUUID, 0);

  objc_storeStrong((id *)&self->_faceJSONRepresentation, 0);
}

@end
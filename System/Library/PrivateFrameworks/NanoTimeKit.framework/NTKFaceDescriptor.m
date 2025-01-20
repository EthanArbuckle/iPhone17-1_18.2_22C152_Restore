@interface NTKFaceDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isAvailableForDevice:(id)a3;
- (BOOL)isEqual:(id)a3;
- (Class)faceClass;
- (NSString)bundleIdentifier;
- (NTKFaceDescriptor)initWithBundleIdentifier:(id)a3;
- (NTKFaceDescriptor)initWithCoder:(id)a3;
- (NTKFaceDescriptor)initWithFaceStyle:(int64_t)a3;
- (id)_initWithFaceStyle:(int64_t)a3 bundleIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)faceStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)faceClass;
@end

@implementation NTKFaceDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithFaceStyle:(int64_t)a3 bundleIdentifier:(id)a4
{
  if (a3 == 44) {
    v4 = [(NTKFaceDescriptor *)self initWithBundleIdentifier:a4];
  }
  else {
    v4 = -[NTKFaceDescriptor initWithFaceStyle:](self, "initWithFaceStyle:", a3, a4);
  }
  v5 = v4;

  return v5;
}

- (NTKFaceDescriptor)initWithFaceStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKFaceDescriptor;
  v4 = [(NTKFaceDescriptor *)&v8 init];
  v5 = v4;
  if (v4)
  {
    bundleIdentifier = v4->_bundleIdentifier;
    v4->_faceStyle = a3;
    v4->_bundleIdentifier = 0;
  }
  return v5;
}

- (NTKFaceDescriptor)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKFaceDescriptor;
  v5 = [(NTKFaceDescriptor *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_faceStyle = 44;
    uint64_t v7 = [v4 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;
  }
  return v6;
}

- (NTKFaceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"faceStyle"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];

  uint64_t v7 = [(NTKFaceDescriptor *)self _initWithFaceStyle:v5 bundleIdentifier:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NTKFaceDescriptor faceStyle](self, "faceStyle"), @"faceStyle");
  id v5 = [(NTKFaceDescriptor *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(NTKFaceDescriptor *)self faceStyle];
  v6 = [(NTKFaceDescriptor *)self bundleIdentifier];
  uint64_t v7 = (void *)[v4 _initWithFaceStyle:v5 bundleIdentifier:v6];

  return v7;
}

- (BOOL)isAvailableForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKFaceDescriptor *)self faceStyle];
  if (v5 == 44)
  {
    v6 = [(NTKFaceDescriptor *)self bundleIdentifier];
    uint64_t v7 = +[NTKFaceBundleManager sharedManager];
    objc_super v8 = [v7 faceBundleForBundleIdentifier:v6 onDevice:v4];

    char IsAvailable = v8 != 0;
  }
  else
  {
    char IsAvailable = NTKFaceStyleIsAvailable(v5, v4);
  }

  return IsAvailable;
}

- (unint64_t)hash
{
  int64_t v3 = [(NTKFaceDescriptor *)self faceStyle];
  id v4 = [(NTKFaceDescriptor *)self bundleIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int64_t v5 = -[NTKFaceDescriptor faceStyle](self, "faceStyle"), v5 == [v4 faceStyle]))
  {
    v6 = [(NTKFaceDescriptor *)self bundleIdentifier];
    uint64_t v7 = [v4 bundleIdentifier];
    char v8 = NTKEqualObjects(v6, v7);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  int64_t v3 = [(NTKFaceDescriptor *)self faceStyle];
  id v4 = NSString;
  int64_t v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (v3 == 44) {
    [(NTKFaceDescriptor *)self bundleIdentifier];
  }
  else {
  uint64_t v7 = NTKFaceStyleDescription([(NTKFaceDescriptor *)self faceStyle]);
  }
  char v8 = [v4 stringWithFormat:@"<%@: %p, %@>", v6, self, v7];

  return v8;
}

- (Class)faceClass
{
  int64_t v3 = [MEMORY[0x1E4F19A30] currentDevice];
  int64_t v4 = [(NTKFaceDescriptor *)self faceStyle];
  if (v4 == 44)
  {
    int64_t v5 = [(NTKFaceDescriptor *)self bundleIdentifier];
    if (v5)
    {
      v6 = +[NTKFaceBundleManager sharedManager];
      uint64_t v7 = [v6 faceBundleForBundleIdentifier:v5 onDevice:v3];

      char v8 = [v7 faceClass];
    }
    else
    {
      v9 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[NTKFaceDescriptor faceClass]();
      }

      char v8 = 0;
    }
  }
  else
  {
    char v8 = +[NTKFace _faceClassForStyle:v4 onDevice:v3];
  }

  return (Class)v8;
}

- (int64_t)faceStyle
{
  return self->_faceStyle;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

- (void)faceClass
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Bundle ID is nil for descriptor %@", v2, v3, v4, v5, v6);
}

@end
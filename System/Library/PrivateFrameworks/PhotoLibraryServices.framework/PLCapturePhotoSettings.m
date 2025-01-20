@interface PLCapturePhotoSettings
+ (BOOL)supportsSecureCoding;
+ (id)photoSettingsWithPhotoSettings:(id)a3;
- (AVCaptureDeferredPhotoSettings)photoSettings;
- (NSString)description;
- (PLCapturePhotoSettings)initWithCoder:(id)a3;
- (PLCapturePhotoSettings)initWithPhotoSettings:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPhotoSettings:(id)a3;
@end

@implementation PLCapturePhotoSettings

- (PLCapturePhotoSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLCapturePhotoSettings;
  v5 = [(PLCapturePhotoSettings *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"photoSettings"];
    photoSettings = v5->_photoSettings;
    v5->_photoSettings = (AVCaptureDeferredPhotoSettings *)v11;

    v13 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoSettings, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_photoSettings forKey:@"photoSettings"];
}

- (AVCaptureDeferredPhotoSettings)photoSettings
{
  return (AVCaptureDeferredPhotoSettings *)objc_getProperty(self, a2, 16, 1);
}

+ (id)photoSettingsWithPhotoSettings:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)[objc_alloc((Class)a1) initWithPhotoSettings:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (PLCapturePhotoSettings)initWithPhotoSettings:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLCapturePhotoSettings;
  uint64_t v6 = [(PLCapturePhotoSettings *)&v12 init];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = [v7 UUIDString];
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v8;

    objc_storeStrong((id *)&v6->_photoSettings, a3);
    v10 = v6;
  }

  return v6;
}

- (void)setPhotoSettings:(id)a3
{
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PLCapturePhotoSettings;
  id v4 = [(PLCapturePhotoSettings *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ uuid: %@, photoSettings: %@", v4, self->_uuid, self->_photoSettings];

  return (NSString *)v5;
}

@end
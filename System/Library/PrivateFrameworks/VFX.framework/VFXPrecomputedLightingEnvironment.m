@interface VFXPrecomputedLightingEnvironment
+ (BOOL)supportsSecureCoding;
- (NSData)irradianceData;
- (NSData)radianceData;
- (VFXPrecomputedLightingEnvironment)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setIrradianceData:(id)a3;
- (void)setRadianceData:(id)a3;
@end

@implementation VFXPrecomputedLightingEnvironment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VFXPrecomputedLightingEnvironment)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXPrecomputedLightingEnvironment;
  v4 = [(VFXPrecomputedLightingEnvironment *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_radianceData = (NSData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"radiance");
    uint64_t v7 = objc_opt_class();
    v4->_irradianceData = (NSData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"irradiance");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_radianceData, @"radiance");
  irradianceData = self->_irradianceData;

  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)irradianceData, @"irradiance");
}

- (void)dealloc
{
  valuePtr = self;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"kCFXNotificationPrecomputedLightingEnvironmentWillDie", v3, 0, 1u);
  CFRelease(v3);

  v5.receiver = self;
  v5.super_class = (Class)VFXPrecomputedLightingEnvironment;
  [(VFXPrecomputedLightingEnvironment *)&v5 dealloc];
}

- (NSData)radianceData
{
  return self->_radianceData;
}

- (void)setRadianceData:(id)a3
{
}

- (NSData)irradianceData
{
  return self->_irradianceData;
}

- (void)setIrradianceData:(id)a3
{
}

@end
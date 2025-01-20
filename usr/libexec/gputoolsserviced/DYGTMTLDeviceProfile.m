@interface DYGTMTLDeviceProfile
+ (BOOL)supportsSecureCoding;
- (DYGTMTLDeviceProfile)initWithCoder:(id)a3;
- (MTLDevice)device;
- (NSArray)supportedFeatureSets;
- (NSArray)supportedGPUFamilies;
- (NSDictionary)defaultSamplePositions;
- (NSString)name;
- (unint64_t)streamRef;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultSamplePositions:(id)a3;
- (void)setDevice:(id)a3;
- (void)setName:(id)a3;
- (void)setStreamRef:(unint64_t)a3;
- (void)setSupportedFeatureSets:(id)a3;
- (void)setSupportedGPUFamilies:(id)a3;
@end

@implementation DYGTMTLDeviceProfile

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYGTMTLDeviceProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DYGTMTLDeviceProfile;
  v5 = [(DYGTMTLDeviceProfile *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_streamRef = (unint64_t)[v4 decodeInt64ForKey:@"streamRef"];
    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"supportedFeatureSets"];
    supportedFeatureSets = v5->_supportedFeatureSets;
    v5->_supportedFeatureSets = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"supportedGPUFamilies"];
    supportedGPUFamilies = v5->_supportedGPUFamilies;
    v5->_supportedGPUFamilies = (NSArray *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"defaultSamplePositions"];
    defaultSamplePositions = v5->_defaultSamplePositions;
    v5->_defaultSamplePositions = (NSDictionary *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeInt64:self->_streamRef forKey:@"streamRef"];
  [v5 encodeObject:self->_supportedFeatureSets forKey:@"supportedFeatureSets"];
  [v5 encodeObject:self->_supportedGPUFamilies forKey:@"supportedGPUFamilies"];
  [v5 encodeObject:self->_defaultSamplePositions forKey:@"defaultSamplePositions"];
}

- (NSArray)supportedFeatureSets
{
  return self->_supportedFeatureSets;
}

- (void)setSupportedFeatureSets:(id)a3
{
}

- (NSArray)supportedGPUFamilies
{
  return self->_supportedGPUFamilies;
}

- (void)setSupportedGPUFamilies:(id)a3
{
}

- (NSDictionary)defaultSamplePositions
{
  return self->_defaultSamplePositions;
}

- (void)setDefaultSamplePositions:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  self->_device = (MTLDevice *)a3;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_defaultSamplePositions, 0);
  objc_storeStrong((id *)&self->_supportedGPUFamilies, 0);

  objc_storeStrong((id *)&self->_supportedFeatureSets, 0);
}

@end
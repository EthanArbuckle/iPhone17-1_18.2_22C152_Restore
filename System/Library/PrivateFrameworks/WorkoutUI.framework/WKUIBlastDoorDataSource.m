@interface WKUIBlastDoorDataSource
+ (BOOL)supportsSecureCoding;
+ (id)dataFromSourceFromData:(id)a3;
- (BOOL)isIndoor;
- (NSString)configurationName;
- (WKUIBlastDoorDataSource)initWithActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 configurationType:(int64_t)a5 configurationName:(id)a6 goalTypeIdentifier:(unint64_t)a7;
- (WKUIBlastDoorDataSource)initWithCoder:(id)a3;
- (id)description;
- (int64_t)configurationType;
- (unint64_t)activityType;
- (unint64_t)goalTypeIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WKUIBlastDoorDataSource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)dataFromSourceFromData:(id)a3
{
  return +[NLWorkoutConfigurationImageGenerator createBlastDoorDataSourceFromData:a3];
}

- (WKUIBlastDoorDataSource)initWithActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 configurationType:(int64_t)a5 configurationName:(id)a6 goalTypeIdentifier:(unint64_t)a7
{
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WKUIBlastDoorDataSource;
  v14 = [(WKUIBlastDoorDataSource *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_isIndoor = a4;
    v14->_activityType = a3;
    v14->_configurationType = a5;
    objc_storeStrong((id *)&v14->_configurationName, a6);
    v15->_goalTypeIdentifier = a7;
  }

  return v15;
}

- (WKUIBlastDoorDataSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WKUIBlastDoorDataSource;
  v5 = [(WKUIBlastDoorDataSource *)&v15 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_activityType);
    v5->_activityType = [v4 decodeIntegerForKey:v6];

    v7 = NSStringFromSelector(sel_isIndoor);
    v5->_isIndoor = [v4 decodeBoolForKey:v7];

    v8 = NSStringFromSelector(sel_configurationType);
    v5->_configurationType = [v4 decodeIntegerForKey:v8];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_configurationName);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    configurationName = v5->_configurationName;
    v5->_configurationName = (NSString *)v11;

    id v13 = NSStringFromSelector(sel_goalTypeIdentifier);
    v5->_goalTypeIdentifier = [v4 decodeIntegerForKey:v13];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(WKUIBlastDoorDataSource *)self activityType];
  v6 = NSStringFromSelector(sel_activityType);
  [v4 encodeInteger:v5 forKey:v6];

  BOOL v7 = [(WKUIBlastDoorDataSource *)self isIndoor];
  v8 = NSStringFromSelector(sel_isIndoor);
  [v4 encodeBool:v7 forKey:v8];

  int64_t v9 = [(WKUIBlastDoorDataSource *)self configurationType];
  v10 = NSStringFromSelector(sel_configurationType);
  [v4 encodeInteger:v9 forKey:v10];

  uint64_t v11 = [(WKUIBlastDoorDataSource *)self configurationName];
  v12 = NSStringFromSelector(sel_configurationName);
  [v4 encodeObject:v11 forKey:v12];

  unint64_t v13 = [(WKUIBlastDoorDataSource *)self goalTypeIdentifier];
  NSStringFromSelector(sel_goalTypeIdentifier);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v13 forKey:v14];
}

- (unint64_t)hash
{
  unint64_t v3 = 31 * [(WKUIBlastDoorDataSource *)self activityType];
  unint64_t v4 = v3 + [(WKUIBlastDoorDataSource *)self isIndoor];
  int64_t v5 = [(WKUIBlastDoorDataSource *)self configurationType] - v4 + 32 * v4;
  v6 = [(WKUIBlastDoorDataSource *)self configurationName];
  uint64_t v7 = [v6 hash] - v5 + 32 * v5;

  return [(WKUIBlastDoorDataSource *)self goalTypeIdentifier] - v7 + 32 * v7 + 486695567;
}

- (id)description
{
  unint64_t v3 = (void *)MEMORY[0x263F089D8];
  unint64_t v4 = (objc_class *)objc_opt_class();
  int64_t v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p>\n", v5, self];

  objc_msgSend(v6, "appendFormat:", @"activityType: %lu\n", -[WKUIBlastDoorDataSource activityType](self, "activityType"));
  BOOL v7 = [(WKUIBlastDoorDataSource *)self isIndoor];
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  [v6 appendFormat:@"isIndoor: %@\n", v8];
  objc_msgSend(v6, "appendFormat:", @"configurationType: %ld\n", -[WKUIBlastDoorDataSource configurationType](self, "configurationType"));
  int64_t v9 = [(WKUIBlastDoorDataSource *)self configurationName];
  [v6 appendFormat:@"configurationName: %@\n", v9];

  objc_msgSend(v6, "appendFormat:", @"goalTypeIdentifier: %lu\n", -[WKUIBlastDoorDataSource goalTypeIdentifier](self, "goalTypeIdentifier"));
  return v6;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (unint64_t)goalTypeIdentifier
{
  return self->_goalTypeIdentifier;
}

- (void).cxx_destruct
{
}

@end
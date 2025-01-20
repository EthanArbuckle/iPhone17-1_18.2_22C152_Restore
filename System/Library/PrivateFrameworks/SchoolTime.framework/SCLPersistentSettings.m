@interface SCLPersistentSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isManualSchoolModeEnabled;
- (SCLPersistentSettings)init;
- (SCLPersistentSettings)initWithCoder:(id)a3;
- (SCLScheduleSettings)scheduleSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setManualSchoolModeEnabled:(BOOL)a3;
- (void)setScheduleSettings:(id)a3;
@end

@implementation SCLPersistentSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLPersistentSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCLPersistentSettings;
  v2 = [(SCLPersistentSettings *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SCLScheduleSettings);
    scheduleSettings = v2->_scheduleSettings;
    v2->_scheduleSettings = v3;
  }
  return v2;
}

- (SCLPersistentSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCLPersistentSettings;
  v5 = [(SCLPersistentSettings *)&v9 init];
  if (v5)
  {
    v5->_manualSchoolModeEnabled = [v4 decodeBoolForKey:@"manualSchoolModeEnabled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduleSettings"];
    scheduleSettings = v5->_scheduleSettings;
    v5->_scheduleSettings = (SCLScheduleSettings *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  scheduleSettings = self->_scheduleSettings;
  id v5 = a3;
  [v5 encodeObject:scheduleSettings forKey:@"scheduleSettings"];
  [v5 encodeBool:self->_manualSchoolModeEnabled forKey:@"manualSchoolModeEnabled"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SCLPersistentSettings);
  [(SCLPersistentSettings *)v4 setManualSchoolModeEnabled:[(SCLPersistentSettings *)self isManualSchoolModeEnabled]];
  id v5 = [(SCLPersistentSettings *)self scheduleSettings];
  uint64_t v6 = (void *)[v5 copy];
  [(SCLPersistentSettings *)v4 setScheduleSettings:v6];

  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SCLScheduleSettings *)self->_scheduleSettings hash];
  return v3 ^ [(SCLPersistentSettings *)self isManualSchoolModeEnabled];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCLPersistentSettings *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v6 = [(SCLPersistentSettings *)v5 isManualSchoolModeEnabled];
      if (v6 == [(SCLPersistentSettings *)self isManualSchoolModeEnabled])
      {
        v8 = [(SCLPersistentSettings *)v5 scheduleSettings];
        objc_super v9 = [(SCLPersistentSettings *)self scheduleSettings];
        if (v8 == v9)
        {
          char v7 = 1;
        }
        else
        {
          v10 = [(SCLPersistentSettings *)v5 scheduleSettings];
          v11 = [(SCLPersistentSettings *)self scheduleSettings];
          char v7 = [v10 isEqual:v11];
        }
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (SCLScheduleSettings)scheduleSettings
{
  return self->_scheduleSettings;
}

- (void)setScheduleSettings:(id)a3
{
}

- (BOOL)isManualSchoolModeEnabled
{
  return self->_manualSchoolModeEnabled;
}

- (void)setManualSchoolModeEnabled:(BOOL)a3
{
  self->_manualSchoolModeEnabled = a3;
}

- (void).cxx_destruct
{
}

@end
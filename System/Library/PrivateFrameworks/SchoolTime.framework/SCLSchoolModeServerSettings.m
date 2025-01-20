@interface SCLSchoolModeServerSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isLoaded;
- (SCLScheduleSettings)scheduleSettings;
- (SCLSchoolModeServerSettings)initWithCoder:(id)a3;
- (SCLSchoolModeServerSettings)initWithSettings:(id)a3;
- (SCLState)state;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLoaded:(BOOL)a3;
- (void)setScheduleSettings:(id)a3;
- (void)setState:(id)a3;
@end

@implementation SCLSchoolModeServerSettings

- (void)encodeWithCoder:(id)a3
{
  scheduleSettings = self->_scheduleSettings;
  id v5 = a3;
  [v5 encodeObject:scheduleSettings forKey:@"scheduleSettings"];
  [v5 encodeObject:self->_state forKey:@"state"];
  [v5 encodeBool:self->_loaded forKey:@"loaded"];
}

- (SCLSchoolModeServerSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLSchoolModeServerSettings;
  id v5 = [(SCLSchoolModeServerSettings *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduleSettings"];
    scheduleSettings = v5->_scheduleSettings;
    v5->_scheduleSettings = (SCLScheduleSettings *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    state = v5->_state;
    v5->_state = (SCLState *)v8;

    v5->_loaded = [v4 decodeBoolForKey:@"loaded"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithSettings:self];
}

- (SCLSchoolModeServerSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCLSchoolModeServerSettings;
  id v5 = [(SCLSchoolModeServerSettings *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 scheduleSettings];
    [(SCLSchoolModeServerSettings *)v5 setScheduleSettings:v6];

    v7 = [v4 state];
    [(SCLSchoolModeServerSettings *)v5 setState:v7];

    -[SCLSchoolModeServerSettings setLoaded:](v5, "setLoaded:", [v4 isLoaded]);
  }

  return v5;
}

- (SCLScheduleSettings)scheduleSettings
{
  return self->_scheduleSettings;
}

- (void)setScheduleSettings:(id)a3
{
}

- (SCLState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_scheduleSettings, 0);
}

@end
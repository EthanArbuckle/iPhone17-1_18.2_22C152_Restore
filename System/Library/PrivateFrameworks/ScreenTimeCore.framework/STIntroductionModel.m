@interface STIntroductionModel
+ (BOOL)supportsSecureCoding;
- (NSDateComponents)downtimeEndTime;
- (NSDateComponents)downtimeStartTime;
- (NSDictionary)restrictions;
- (NSNumber)isAppAndWebsiteActivityEnabled;
- (NSNumber)isCommunicationSafetyEnabled;
- (NSNumber)isEyeReliefEnabled;
- (NSString)passcode;
- (STIntroductionModel)initWithAppAndWebsiteActivityEnabled:(id)a3 downtimeStartTime:(id)a4 downtimeEndTime:(id)a5 restrictions:(id)a6 passcode:(id)a7 communicationSafetyEnabled:(id)a8 eyeReliefEnabled:(id)a9;
- (STIntroductionModel)initWithCoder:(id)a3;
- (int64_t)imageGenerationRestriction;
- (void)encodeWithCoder:(id)a3;
- (void)setDowntimeEndTime:(id)a3;
- (void)setDowntimeStartTime:(id)a3;
- (void)setImageGenerationRestriction:(int64_t)a3;
- (void)setIsAppAndWebsiteActivityEnabled:(id)a3;
- (void)setIsCommunicationSafetyEnabled:(id)a3;
- (void)setIsEyeReliefEnabled:(id)a3;
- (void)setPasscode:(id)a3;
- (void)setRestrictions:(id)a3;
@end

@implementation STIntroductionModel

- (STIntroductionModel)initWithAppAndWebsiteActivityEnabled:(id)a3 downtimeStartTime:(id)a4 downtimeEndTime:(id)a5 restrictions:(id)a6 passcode:(id)a7 communicationSafetyEnabled:(id)a8 eyeReliefEnabled:(id)a9
{
  v15 = (NSNumber *)a3;
  v16 = (NSNumber *)a8;
  v17 = (NSNumber *)a9;
  v37.receiver = self;
  v37.super_class = (Class)STIntroductionModel;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = [(STIntroductionModel *)&v37 init];
  isAppAndWebsiteActivityEnabled = v22->_isAppAndWebsiteActivityEnabled;
  v22->_isAppAndWebsiteActivityEnabled = v15;
  v24 = v15;

  uint64_t v25 = objc_msgSend(v21, "copy", v37.receiver, v37.super_class);
  downtimeStartTime = v22->_downtimeStartTime;
  v22->_downtimeStartTime = (NSDateComponents *)v25;

  uint64_t v27 = [v20 copy];
  downtimeEndTime = v22->_downtimeEndTime;
  v22->_downtimeEndTime = (NSDateComponents *)v27;

  uint64_t v29 = [v19 copy];
  restrictions = v22->_restrictions;
  v22->_restrictions = (NSDictionary *)v29;

  uint64_t v31 = [v18 copy];
  passcode = v22->_passcode;
  v22->_passcode = (NSString *)v31;

  isCommunicationSafetyEnabled = v22->_isCommunicationSafetyEnabled;
  v22->_isCommunicationSafetyEnabled = v16;
  v34 = v16;

  isEyeReliefEnabled = v22->_isEyeReliefEnabled;
  v22->_isEyeReliefEnabled = v17;

  return v22;
}

- (STIntroductionModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppAndWebsiteActivity"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DowntimeStartTime"];
  v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DowntimeEndTime"];
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Restrictions"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Passcode"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CommunicationSafety"];
  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EyeRelief"];
  v30.receiver = self;
  v30.super_class = (Class)STIntroductionModel;
  v15 = [(STIntroductionModel *)&v30 init];
  uint64_t v29 = v5;
  objc_storeStrong((id *)&v15->_isAppAndWebsiteActivityEnabled, v5);
  uint64_t v16 = [v6 copy];
  downtimeStartTime = v15->_downtimeStartTime;
  v15->_downtimeStartTime = (NSDateComponents *)v16;

  uint64_t v18 = [v28 copy];
  downtimeEndTime = v15->_downtimeEndTime;
  v15->_downtimeEndTime = (NSDateComponents *)v18;

  uint64_t v20 = [v11 copy];
  restrictions = v15->_restrictions;
  v15->_restrictions = (NSDictionary *)v20;

  if (_os_feature_enabled_impl() && _os_feature_enabled_impl()) {
    v15->_imageGenerationRestriction = [v4 decodeInt64ForKey:@"ImageGenerationRestriction"];
  }
  uint64_t v22 = [v12 copy];
  passcode = v15->_passcode;
  v15->_passcode = (NSString *)v22;

  isCommunicationSafetyEnabled = v15->_isCommunicationSafetyEnabled;
  v15->_isCommunicationSafetyEnabled = v13;
  uint64_t v25 = v13;

  isEyeReliefEnabled = v15->_isEyeReliefEnabled;
  v15->_isEyeReliefEnabled = (NSNumber *)v14;

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_isAppAndWebsiteActivityEnabled forKey:@"AppAndWebsiteActivity"];
  [v4 encodeObject:self->_downtimeStartTime forKey:@"DowntimeStartTime"];
  [v4 encodeObject:self->_downtimeEndTime forKey:@"DowntimeEndTime"];
  [v4 encodeObject:self->_restrictions forKey:@"Restrictions"];
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl()) {
    [v4 encodeInt64:self->_imageGenerationRestriction forKey:@"ImageGenerationRestriction"];
  }
  [v4 encodeObject:self->_passcode forKey:@"Passcode"];
  [v4 encodeObject:self->_isCommunicationSafetyEnabled forKey:@"CommunicationSafety"];
  [v4 encodeObject:self->_isEyeReliefEnabled forKey:@"EyeRelief"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)isAppAndWebsiteActivityEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIsAppAndWebsiteActivityEnabled:(id)a3
{
}

- (NSDateComponents)downtimeStartTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDowntimeStartTime:(id)a3
{
}

- (NSDateComponents)downtimeEndTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDowntimeEndTime:(id)a3
{
}

- (NSDictionary)restrictions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRestrictions:(id)a3
{
}

- (int64_t)imageGenerationRestriction
{
  return self->_imageGenerationRestriction;
}

- (void)setImageGenerationRestriction:(int64_t)a3
{
  self->_imageGenerationRestriction = a3;
}

- (NSString)passcode
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPasscode:(id)a3
{
}

- (NSNumber)isCommunicationSafetyEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIsCommunicationSafetyEnabled:(id)a3
{
}

- (NSNumber)isEyeReliefEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIsEyeReliefEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEyeReliefEnabled, 0);
  objc_storeStrong((id *)&self->_isCommunicationSafetyEnabled, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_downtimeEndTime, 0);
  objc_storeStrong((id *)&self->_downtimeStartTime, 0);
  objc_storeStrong((id *)&self->_isAppAndWebsiteActivityEnabled, 0);
}

@end
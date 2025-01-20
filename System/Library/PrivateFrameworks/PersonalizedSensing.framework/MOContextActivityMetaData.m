@interface MOContextActivityMetaData
+ (BOOL)supportsSecureCoding;
- (MOContextActivityMetaData)init;
- (MOContextActivityMetaData)initWithActivityType:(id)a3 activityDuration:(id)a4;
- (MOContextActivityMetaData)initWithCoder:(id)a3;
- (NSDateInterval)activityDuration;
- (NSString)activityType;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOContextActivityMetaData

- (MOContextActivityMetaData)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOContextActivityMetaData;
  return [(MOContextActivityMetaData *)&v3 init];
}

- (MOContextActivityMetaData)initWithActivityType:(id)a3 activityDuration:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MOContextActivityMetaData;
  v9 = [(MOContextActivityMetaData *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityType, a3);
    objc_storeStrong((id *)&v10->_activityDuration, a4);
    v11 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_259147000, v11, OS_LOG_TYPE_INFO, "ActivityMetaData activityType,%@,activityDuration,%@", buf, 0x16u);
    }
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MOContextActivityMetaData alloc];
  v5 = [(MOContextActivityMetaData *)self activityType];
  v6 = [(MOContextActivityMetaData *)self activityDuration];
  id v7 = [(MOContextActivityMetaData *)v4 initWithActivityType:v5 activityDuration:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  activityType = self->_activityType;
  id v5 = a3;
  [v5 encodeObject:activityType forKey:@"activityType"];
  [v5 encodeObject:self->_activityDuration forKey:@"activityDuration"];
}

- (MOContextActivityMetaData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityDuration"];

  id v7 = [(MOContextActivityMetaData *)self initWithActivityType:v5 activityDuration:v6];
  return v7;
}

- (NSDateInterval)activityDuration
{
  return self->_activityDuration;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityDuration, 0);
}

@end
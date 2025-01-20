@interface MOContextLocationMetaData
+ (BOOL)supportsSecureCoding;
- (MOContextLocationMetaData)init;
- (MOContextLocationMetaData)initWithCoder:(id)a3;
- (MOContextLocationMetaData)initWithPlace:(id)a3 city:(id)a4;
- (MOContextLocationMetaData)initWithPlace:(id)a3 city:(id)a4 visitTimeWindow:(id)a5;
- (NSDateInterval)visitTimeWindow;
- (NSString)city;
- (NSString)place;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOContextLocationMetaData

- (MOContextLocationMetaData)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOContextLocationMetaData;
  return [(MOContextLocationMetaData *)&v3 init];
}

- (MOContextLocationMetaData)initWithPlace:(id)a3 city:(id)a4 visitTimeWindow:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MOContextLocationMetaData;
  v12 = [(MOContextLocationMetaData *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_place, a3);
    objc_storeStrong((id *)&v13->_city, a4);
    objc_storeStrong((id *)&v13->_visitTimeWindow, a5);
    v14 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_259147000, v14, OS_LOG_TYPE_INFO, "LocationMetaData place,%@,city,%@,visitTimeWindow,%@", buf, 0x20u);
    }
  }
  return v13;
}

- (MOContextLocationMetaData)initWithPlace:(id)a3 city:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOContextLocationMetaData;
  id v9 = [(MOContextLocationMetaData *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_place, a3);
    objc_storeStrong((id *)&v10->_city, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MOContextLocationMetaData alloc];
  v5 = [(MOContextLocationMetaData *)self place];
  v6 = [(MOContextLocationMetaData *)self city];
  id v7 = [(MOContextLocationMetaData *)self visitTimeWindow];
  id v8 = [(MOContextLocationMetaData *)v4 initWithPlace:v5 city:v6 visitTimeWindow:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  place = self->_place;
  id v5 = a3;
  [v5 encodeObject:place forKey:@"place"];
  [v5 encodeObject:self->_city forKey:@"city"];
  [v5 encodeObject:self->_visitTimeWindow forKey:@"visitTimeWindow"];
}

- (MOContextLocationMetaData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"place"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"city"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visitTimeWindow"];

  id v8 = [(MOContextLocationMetaData *)self initWithPlace:v5 city:v6 visitTimeWindow:v7];
  return v8;
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = [(MOContextLocationMetaData *)self place];
  id v5 = [v4 mask];
  v6 = [(MOContextLocationMetaData *)self city];
  id v7 = [v6 mask];
  id v8 = [(MOContextLocationMetaData *)self visitTimeWindow];
  id v9 = [v3 stringWithFormat:@"place, %@, city, %@, visit time window %@", v5, v7, v8];

  return v9;
}

- (NSDateInterval)visitTimeWindow
{
  return self->_visitTimeWindow;
}

- (NSString)place
{
  return self->_place;
}

- (NSString)city
{
  return self->_city;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_visitTimeWindow, 0);
}

@end
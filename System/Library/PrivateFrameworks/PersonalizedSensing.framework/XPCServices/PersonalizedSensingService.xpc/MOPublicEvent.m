@interface MOPublicEvent
+ (BOOL)supportsSecureCoding;
- (MOPublicEvent)initWithCoder:(id)a3;
- (MOPublicEvent)initWithEventDictionary:(id)a3;
- (MOPublicEvent)initWithName:(id)a3 performers:(id)a4 venue:(id)a5;
- (NSArray)performers;
- (NSString)name;
- (NSString)venue;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setPerformers:(id)a3;
- (void)setVenue:(id)a3;
@end

@implementation MOPublicEvent

- (MOPublicEvent)initWithName:(id)a3 performers:(id)a4 venue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MOPublicEvent;
  v11 = [(MOPublicEvent *)&v19 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    name = v11->_name;
    v11->_name = v12;

    v14 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v9 copyItems:1];
    performers = v11->_performers;
    v11->_performers = v14;

    v16 = (NSString *)[v10 copy];
    venue = v11->_venue;
    v11->_venue = v16;
  }
  return v11;
}

- (MOPublicEvent)initWithEventDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"name"];
  v6 = [v4 objectForKey:@"performers"];
  v7 = [v4 objectForKey:@"venue"];

  if (v5)
  {
    self = [(MOPublicEvent *)self initWithName:v5 performers:v6 venue:v7];
    id v8 = self;
  }
  else
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MOPublicEvent initWithEventDictionary:](v9);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = [(MOPublicEvent *)self name];
  id v4 = [v3 UTF8String];
  v5 = [(MOPublicEvent *)self performers];
  v6 = [(MOPublicEvent *)self venue];
  v7 = +[NSString stringWithFormat:@"<MOPublicEvent name, %s, performers, %@, venue, %@, >", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_performers forKey:@"performers"];
  [v5 encodeObject:self->_venue forKey:@"venue"];
}

- (MOPublicEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"performers"];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"venue"];

  id v10 = [(MOPublicEvent *)self initWithName:v5 performers:v8 venue:v9];
  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)performers
{
  return self->_performers;
}

- (void)setPerformers:(id)a3
{
}

- (NSString)venue
{
  return self->_venue;
}

- (void)setVenue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venue, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithEventDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", v1, 2u);
}

@end
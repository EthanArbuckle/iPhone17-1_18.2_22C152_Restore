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
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v9 copyItems:1];
    performers = v11->_performers;
    v11->_performers = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    venue = v11->_venue;
    v11->_venue = (NSString *)v16;
  }
  return v11;
}

- (MOPublicEvent)initWithEventDictionary:(id)a3
{
  id v5 = a3;
  v6 = [v5 objectForKey:@"name"];
  v7 = [v5 objectForKey:@"performers"];
  id v8 = [v5 objectForKey:@"venue"];

  if (v6)
  {
    self = [(MOPublicEvent *)self initWithName:v6 performers:v7 venue:v8];
    id v9 = self;
  }
  else
  {
    id v10 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MOPublicEvent initWithEventDictionary:](v10);
    }

    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MOEventExtendedAtrributes.m" lineNumber:47 description:@"Invalid parameter not satisfying: name"];

    id v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(MOPublicEvent *)self name];
  uint64_t v5 = [v4 UTF8String];
  v6 = [(MOPublicEvent *)self performers];
  v7 = [(MOPublicEvent *)self venue];
  id v8 = [v3 stringWithFormat:@"<MOPublicEvent name, %s, performers, %@, venue, %@, >", v5, v6, v7];

  return v8;
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
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"performers"];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"venue"];

  v11 = [(MOPublicEvent *)self initWithName:v5 performers:v9 venue:v10];
  return v11;
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
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", v1, 2u);
}

@end
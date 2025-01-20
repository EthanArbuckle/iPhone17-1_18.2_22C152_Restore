@interface NFValueAddedServiceCard
+ (BOOL)supportsSecureCoding;
- (BOOL)userInterventionRequired;
- (NFValueAddedServiceCard)initWithCoder:(id)a3;
- (NSData)data;
- (NSData)identifier;
- (NSData)token;
- (id)asDictionary;
- (id)description;
- (int)type;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setToken:(id)a3;
- (void)setType:(int)a3;
- (void)setUserInterventionRequired:(BOOL)a3;
@end

@implementation NFValueAddedServiceCard

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v7.receiver = self;
  v7.super_class = (Class)NFValueAddedServiceCard;
  v4 = [(NFValueAddedServiceCard *)&v7 description];
  id v5 = [v3 initWithFormat:@"%@ { merchantID=%@ type=%d token=%@ passData=%@ userInterventionRequired=%d }", v4, self->_identifier, self->_type, self->_token, self->_data, self->_userInterventionRequired];

  return v5;
}

- (id)asDictionary
{
  id v3 = objc_alloc((Class)NSMutableDictionary);
  identifier = self->_identifier;
  id v5 = +[NSNumber numberWithInt:self->_type];
  token = self->_token;
  data = self->_data;
  v8 = +[NSNumber numberWithBool:self->_userInterventionRequired];
  id v9 = [v3 initWithObjectsAndKeys:identifier, @"merchantID", v5, @"type", token, @"token", data, @"passData", v8, @"userInterventionRequired", 0];

  return v9;
}

- (NFValueAddedServiceCard)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFValueAddedServiceCard;
  id v5 = [(NFValueAddedServiceCard *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v6;

    v5->_type = [v4 decodeInt32ForKey:@"type"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    token = v5->_token;
    v5->_token = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v10;

    v5->_userInterventionRequired = [v4 decodeBoolForKey:@"userInterventionRequired"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInt32:self->_type forKey:@"type"];
  [v5 encodeObject:self->_token forKey:@"token"];
  [v5 encodeObject:self->_data forKey:@"data"];
  [v5 encodeBool:self->_userInterventionRequired forKey:@"userInterventionRequired"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIdentifier:(id)a3
{
  id v9 = a3;
  id v4 = [v9 length];
  if ((unint64_t)v4 > 0x1F)
  {
    uint64_t v8 = (NSData *)v9;
    identifier = self->_identifier;
    self->_identifier = v8;
  }
  else
  {
    id v5 = v4;
    uint64_t v6 = (NSData *)[v9 mutableCopy];
    [(NSData *)v6 increaseLengthBy:32 - (void)v5];
    identifier = self->_identifier;
    self->_identifier = v6;
  }
}

- (NSData)identifier
{
  return self->_identifier;
}

- (BOOL)userInterventionRequired
{
  return self->_userInterventionRequired;
}

- (void)setUserInterventionRequired:(BOOL)a3
{
  self->_userInterventionRequired = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSData)token
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setToken:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
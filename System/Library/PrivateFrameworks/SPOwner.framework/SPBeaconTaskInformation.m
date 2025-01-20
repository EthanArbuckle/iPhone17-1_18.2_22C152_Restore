@interface SPBeaconTaskInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastUpdated;
- (NSError)error;
- (NSString)name;
- (NSUUID)commandIdentifier;
- (SPBeaconTaskInformation)initWithCoder:(id)a3;
- (SPBeaconTaskInformation)initWithName:(id)a3 lastUpdated:(id)a4 error:(id)a5 state:(int64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCommandIdentifier:(id)a3;
- (void)setError:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setName:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation SPBeaconTaskInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconTaskInformation)initWithName:(id)a3 lastUpdated:(id)a4 error:(id)a5 state:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SPBeaconTaskInformation;
  v13 = [(SPBeaconTaskInformation *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(SPBeaconTaskInformation *)v13 setName:v10];
    [(SPBeaconTaskInformation *)v14 setLastUpdated:v11];
    [(SPBeaconTaskInformation *)v14 setError:v12];
    [(SPBeaconTaskInformation *)v14 setState:a6];
    v15 = [MEMORY[0x1E4F29128] UUID];
    [(SPBeaconTaskInformation *)v14 setCommandIdentifier:v15];
  }
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPBeaconTaskInformation alloc];
  v5 = [(SPBeaconTaskInformation *)self name];
  v6 = [(SPBeaconTaskInformation *)self lastUpdated];
  v7 = [(SPBeaconTaskInformation *)self error];
  v8 = [(SPBeaconTaskInformation *)v4 initWithName:v5 lastUpdated:v6 error:v7 state:[(SPBeaconTaskInformation *)self state]];

  v9 = [(SPBeaconTaskInformation *)self commandIdentifier];
  [(SPBeaconTaskInformation *)v8 setCommandIdentifier:v9];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPBeaconTaskInformation *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(SPBeaconTaskInformation *)self lastUpdated];
  [v4 encodeObject:v6 forKey:@"lastUpdated"];

  v7 = [(SPBeaconTaskInformation *)self error];
  [v4 encodeObject:v7 forKey:@"error"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPBeaconTaskInformation state](self, "state"), @"state");
  id v8 = [(SPBeaconTaskInformation *)self commandIdentifier];
  [v4 encodeObject:v8 forKey:@"commandIdentifier"];
}

- (SPBeaconTaskInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
  lastUpdated = self->_lastUpdated;
  self->_lastUpdated = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  error = self->_error;
  self->_error = v9;

  self->_state = [v4 decodeIntegerForKey:@"state"];
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"commandIdentifier"];

  commandIdentifier = self->_commandIdentifier;
  self->_commandIdentifier = v11;

  return self;
}

- (id)debugDescription
{
  int64_t v3 = [(SPBeaconTaskInformation *)self state];
  if ((unint64_t)(v3 + 1) > 6) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *((void *)&off_1E601B730 + v3 + 1);
  }
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = [(SPBeaconTaskInformation *)self name];
  id v8 = [(SPBeaconTaskInformation *)self commandIdentifier];
  v9 = [(SPBeaconTaskInformation *)self error];
  id v10 = [v5 stringWithFormat:@"<%@: %p %@ %@ state: %@ error: %@>", v6, self, v7, v8, v4, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SPBeaconTaskInformation *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SPBeaconTaskInformation *)self commandIdentifier];
      v7 = [(SPBeaconTaskInformation *)v5 commandIdentifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(SPBeaconTaskInformation *)self commandIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSUUID)commandIdentifier
{
  return self->_commandIdentifier;
}

- (void)setCommandIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
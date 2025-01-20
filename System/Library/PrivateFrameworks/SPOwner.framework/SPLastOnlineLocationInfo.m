@interface SPLastOnlineLocationInfo
+ (BOOL)supportsSecureCoding;
- (NSDate)timestamp;
- (NSDate)updatedOn;
- (SPLastOnlineLocationInfo)initWithCoder:(id)a3;
- (SPLastOnlineLocationInfo)initWithDate:(id)a3 updatedOn:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUpdatedOn:(id)a3;
@end

@implementation SPLastOnlineLocationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeObject:timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_updatedOn forKey:@"updatedOn"];
}

- (SPLastOnlineLocationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  timestamp = self->_timestamp;
  self->_timestamp = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updatedOn"];

  updatedOn = self->_updatedOn;
  self->_updatedOn = v7;

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  id v5 = [(SPLastOnlineLocationInfo *)self timestamp];
  [v4 setTimestamp:v5];

  v6 = [(SPLastOnlineLocationInfo *)self updatedOn];
  [v4 setUpdatedOn:v6];

  return v4;
}

- (SPLastOnlineLocationInfo)initWithDate:(id)a3 updatedOn:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPLastOnlineLocationInfo;
  v9 = [(SPLastOnlineLocationInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timestamp, a3);
    objc_storeStrong((id *)&v10->_updatedOn, a4);
  }

  return v10;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSDate)updatedOn
{
  return self->_updatedOn;
}

- (void)setUpdatedOn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedOn, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
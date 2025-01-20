@interface SPLostModeInfo
+ (BOOL)supportsSecureCoding;
- (NSDate)timestamp;
- (NSString)email;
- (NSString)message;
- (NSString)phoneNumber;
- (SPLostModeInfo)initWithCoder:(id)a3;
- (SPLostModeInfo)initWithMessage:(id)a3 email:(id)a4 phoneNumber:(id)a5 timestamp:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEmail:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation SPLostModeInfo

- (SPLostModeInfo)initWithMessage:(id)a3 email:(id)a4 phoneNumber:(id)a5 timestamp:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SPLostModeInfo;
  v15 = [(SPLostModeInfo *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_message, a3);
    objc_storeStrong((id *)&v16->_phoneNumber, a5);
    objc_storeStrong((id *)&v16->_timestamp, a6);
    objc_storeStrong((id *)&v16->_email, a4);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPLostModeInfo alloc];
  v5 = [(SPLostModeInfo *)self message];
  v6 = [(SPLostModeInfo *)self email];
  v7 = [(SPLostModeInfo *)self phoneNumber];
  v8 = [(SPLostModeInfo *)self timestamp];
  v9 = [(SPLostModeInfo *)v4 initWithMessage:v5 email:v6 phoneNumber:v7 timestamp:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeObject:timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_message forKey:@"message"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v5 encodeObject:self->_email forKey:@"email"];
}

- (SPLostModeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  timestamp = self->_timestamp;
  self->_timestamp = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
  message = self->_message;
  self->_message = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v9;

  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"email"];

  email = self->_email;
  self->_email = v11;

  return self;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
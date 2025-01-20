@interface ATXMicroLocationTrigger
+ (BOOL)supportsSecureCoding;
- (ATXMicroLocationTrigger)initWithCoder:(id)a3;
- (ATXMicroLocationTrigger)initWithLocationUUID:(id)a3;
- (NSString)uuid;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXMicroLocationTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 11;
}

- (ATXMicroLocationTrigger)initWithLocationUUID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXMicroLocationTrigger;
  v6 = [(ATXMicroLocationTrigger *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uuid, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXMicroLocationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"microLocationUUID"];

  v6 = [(ATXMicroLocationTrigger *)self initWithLocationUUID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end
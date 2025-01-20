@interface AUNotificationRequest
+ (BOOL)supportsSecureCoding;
- (AUNotificationRequest)initWithCoder:(id)a3;
- (NSString)accessoryName;
- (id)initUnplugReplugNotificationWithAccessoryName:(id)a3;
- (int64_t)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation AUNotificationRequest

- (id)initUnplugReplugNotificationWithAccessoryName:(id)a3
{
  if (!a3) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AUNotificationRequest;
  v4 = [(AUNotificationRequest *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = 1;
    v4->_accessoryName = (NSString *)[a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AUNotificationRequest;
  [(AUNotificationRequest *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_accessoryName forKey:@"accessoryName"];
  int64_t type = self->_type;
  [a3 encodeInteger:type forKey:@"type"];
}

- (AUNotificationRequest)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AUNotificationRequest;
  v4 = [(AUNotificationRequest *)&v6 init];
  if (v4)
  {
    v4->_accessoryName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"accessoryName"), "copy");
    v4->_int64_t type = [a3 decodeIntegerForKey:@"type"];
  }
  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
}

@end
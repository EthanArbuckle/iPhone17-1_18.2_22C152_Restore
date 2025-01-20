@interface ULCustomLoiConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isInRoomDetectionEnabled;
- (ULCustomLoiConfiguration)initWithCoder:(id)a3;
- (ULCustomLoiConfiguration)initWithEnableInRoomDetection:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIsInRoomDetectionEnabled:(BOOL)a3;
@end

@implementation ULCustomLoiConfiguration

- (ULCustomLoiConfiguration)initWithEnableInRoomDetection:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ULCustomLoiConfiguration;
  v4 = [(ULCustomLoiConfiguration *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ULCustomLoiConfiguration *)v4 setIsInRoomDetectionEnabled:v3];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL isInRoomDetectionEnabled = self->_isInRoomDetectionEnabled;

  return (id)[v4 initWithEnableInRoomDetection:isInRoomDetectionEnabled];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ULCustomLoiConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULCustomLoiConfiguration;
  v5 = [(ULCustomLoiConfiguration *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isInRoomDetectionEnabled"];
    objc_super v7 = v6;
    if (v6)
    {
      char v8 = [(ULCustomLoiConfiguration *)v6 BOOLValue];

      v5->_BOOL isInRoomDetectionEnabled = v8;
      objc_super v7 = v5;
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL v3 = NSNumber;
  BOOL isInRoomDetectionEnabled = self->_isInRoomDetectionEnabled;
  id v5 = a3;
  id v6 = [v3 numberWithBool:isInRoomDetectionEnabled];
  [v5 encodeObject:v6 forKey:@"isInRoomDetectionEnabled"];
}

- (BOOL)isInRoomDetectionEnabled
{
  return self->_isInRoomDetectionEnabled;
}

- (void)setIsInRoomDetectionEnabled:(BOOL)a3
{
  self->_BOOL isInRoomDetectionEnabled = a3;
}

@end
@interface PKContactFieldConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)contactFieldConfigurationWithDictionary:(id)a3;
- (PKContactFieldConfiguration)init;
- (PKContactFieldConfiguration)initWithCoder:(id)a3;
- (PKContactFieldConfiguration)initWithType:(int64_t)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKContactFieldConfiguration

+ (id)contactFieldConfigurationWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 PKStringForKey:@"type"];
  if ([@"text" isEqualToString:v4])
  {

    v5 = off_1E56D6E48;
LABEL_5:
    v7 = (void *)[objc_alloc(*v5) initWithDictionary:v3];
    goto LABEL_7;
  }
  char v6 = [@"picker" isEqualToString:v4];

  if (v6)
  {
    v5 = off_1E56D6758;
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (PKContactFieldConfiguration)init
{
  return 0;
}

- (PKContactFieldConfiguration)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKContactFieldConfiguration;
  result = [(PKContactFieldConfiguration *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (id)description
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  v4 = v3;
  int64_t type = self->_type;
  char v6 = @"unknown";
  if (type == 2) {
    char v6 = @"picker";
  }
  if (type == 1) {
    v7 = @"text";
  }
  else {
    v7 = v6;
  }
  [v3 appendFormat:@"%@: '%@'; ", @"type", v7];
  [v4 appendFormat:@">"];
  v8 = (void *)[v4 copy];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKContactFieldConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKContactFieldConfiguration;
  objc_super v5 = [(PKContactFieldConfiguration *)&v7 init];
  if (v5) {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

@end
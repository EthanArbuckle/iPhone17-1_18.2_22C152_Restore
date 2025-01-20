@interface PKApplicationMessageContent
+ (BOOL)supportsSecureCoding;
- (PKApplicationMessageAction)action;
- (PKApplicationMessageContent)init;
- (PKApplicationMessageContent)initWithCoder:(id)a3;
- (PKApplicationMessageContentDefault)contentTypeDefault;
- (PKApplicationMessageGroupDescriptor)group;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationMessageContent

- (PKApplicationMessageContent)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageContent)initWithCoder:(id)a3
{
  id v4 = a3;
  if (![v4 decodeIntegerForKey:@"type"]
    && objc_opt_class()
    && (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!self
      || (v13.receiver = self,
          v13.super_class = (Class)PKApplicationMessageContent,
          (v8 = [(PKApplicationMessageContent *)&v13 init]) == 0))
    {
      self = 0;
      goto LABEL_11;
    }
    self = v8;
    v8->_type = 0;
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"group"];
    group = self->_group;
    self->_group = v9;

    if (self->_group)
    {
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
      action = self->_action;
      self->_action = v11;

LABEL_11:
      self = self;
      v6 = self;
      goto LABEL_3;
    }
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKApplicationMessageContent" code:0 userInfo:0];
  [v4 failWithError:v5];

  v6 = 0;
LABEL_3:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_group forKey:@"group"];
  [v5 encodeObject:self->_action forKey:@"action"];
}

- (PKApplicationMessageContentDefault)contentTypeDefault
{
  if (self->_type) {
    self = 0;
  }
  return (PKApplicationMessageContentDefault *)self;
}

- (int64_t)type
{
  return self->_type;
}

- (PKApplicationMessageGroupDescriptor)group
{
  return self->_group;
}

- (PKApplicationMessageAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
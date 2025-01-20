@interface PKSharingChannelDescriptor
+ (BOOL)supportsSecureCoding;
- (PKSharingChannelDescriptor)init;
- (PKSharingChannelDescriptor)initWithCoder:(id)a3;
- (id)_initWithType:(unint64_t)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKSharingChannelDescriptor

- (PKSharingChannelDescriptor)init
{
  return 0;
}

- (id)_initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKSharingChannelDescriptor;
  id result = [(PKSharingChannelDescriptor *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingChannelDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKSharingChannelDescriptor;
  objc_super v5 = [(PKSharingChannelDescriptor *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v6 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  unint64_t type = self->_type;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInteger:type];
  [v5 encodeObject:v6 forKey:@"type"];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

@end
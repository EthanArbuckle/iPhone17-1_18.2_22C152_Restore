@interface TCMPSGraphNodeHandle
+ (BOOL)supportsSecureCoding;
+ (id)handleWithLabel:(id)a3;
- (BOOL)isEqual:(id)a3;
- (TCMPSGraphNodeHandle)initWithCoder:(id)a3;
- (TCMPSGraphNodeHandle)initWithLabel:(id)a3;
- (id)label;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TCMPSGraphNodeHandle

+ (id)handleWithLabel:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithLabel:v4];

  return v5;
}

- (TCMPSGraphNodeHandle)initWithLabel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCMPSGraphNodeHandle;
  v6 = [(TCMPSGraphNodeHandle *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_label, a3);
    v8 = v7;
  }

  return v7;
}

- (id)label
{
  return self->_label;
}

- (BOOL)isEqual:(id)a3
{
  label = self->_label;
  id v4 = [a3 label];
  LOBYTE(label) = [(NSString *)label isEqual:v4];

  return (char)label;
}

- (TCMPSGraphNodeHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCMPSGraphNodeHandle;
  id v5 = [(TCMPSGraphNodeHandle *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TCMPSGraphNodeHandleLabel"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end
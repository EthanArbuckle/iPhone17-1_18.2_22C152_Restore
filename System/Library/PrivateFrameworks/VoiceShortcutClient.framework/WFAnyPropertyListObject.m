@interface WFAnyPropertyListObject
+ (BOOL)supportsSecureCoding;
+ (id)objectWithPropertyListObject:(id)a3;
- (WFAnyPropertyListObject)initWithCoder:(id)a3;
- (WFAnyPropertyListObject)initWithPropertyListObject:(id)a3;
- (WFPropertyListObject)propertyListObject;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAnyPropertyListObject

- (void).cxx_destruct
{
}

- (WFPropertyListObject)propertyListObject
{
  return self->_propertyListObject;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAnyPropertyListObject *)self propertyListObject];
  [v4 encodeObject:v5 forKey:@"propertyListObject"];
}

- (WFAnyPropertyListObject)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"propertyListObject"];

  if (v12)
  {
    self = [(WFAnyPropertyListObject *)self initWithPropertyListObject:v12];
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (WFAnyPropertyListObject)initWithPropertyListObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFPropertyListObject.m", 35, @"Invalid parameter not satisfying: %@", @"propertyListObject" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFAnyPropertyListObject;
  uint64_t v6 = [(WFAnyPropertyListObject *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copyWithZone:0];
    propertyListObject = v6->_propertyListObject;
    v6->_propertyListObject = (WFPropertyListObject *)v7;

    uint64_t v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithPropertyListObject:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)[objc_alloc((Class)a1) initWithPropertyListObject:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

@end
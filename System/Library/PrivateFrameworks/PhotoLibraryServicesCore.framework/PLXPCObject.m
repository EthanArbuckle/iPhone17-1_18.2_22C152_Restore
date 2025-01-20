@interface PLXPCObject
+ (BOOL)supportsSecureCoding;
+ (_xpc_type_s)type;
- (OS_xpc_object)object;
- (PLXPCObject)initWithCoder:(id)a3;
- (PLXPCObject)initWithXPCObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLXPCObject

- (PLXPCObject)initWithXPCObject:(id)a3
{
  id v5 = a3;
  v6 = [(PLXPCObject *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_object, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_xpc_type_s)type
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void).cxx_destruct
{
}

- (OS_xpc_object)object
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8, 1);
}

- (PLXPCObject)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", objc_msgSend((id)objc_opt_class(), "type"), @"_xpcObject");
  }
  else
  {
    id v5 = 0;
  }
  v6 = [(PLXPCObject *)self initWithXPCObject:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self->_object)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 encodeXPCObject:self->_object forKey:@"_xpcObject"];
    }
  }
}

@end
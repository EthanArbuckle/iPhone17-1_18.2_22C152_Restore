@interface PKXPCObject
+ (BOOL)supportsSecureCoding;
+ (id)object:(id)a3;
- (OS_xpc_object)object;
- (PKXPCObject)initWithCoder:(id)a3;
- (PKXPCObject)initWithObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation PKXPCObject

+ (id)object:(id)a3
{
  id v3 = a3;
  v4 = [[PKXPCObject alloc] initWithObject:v3];

  return v4;
}

- (PKXPCObject)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKXPCObject;
  v5 = [(PKXPCObject *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PKXPCObject *)v5 setObject:v4];
  }

  return v6;
}

- (PKXPCObject)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"This object may only be decoded by an NSXPCCoder."];
  }
  v9.receiver = self;
  v9.super_class = (Class)PKXPCObject;
  v5 = [(PKXPCObject *)&v9 init];
  if (!v5
    || ([v4 decodeXPCObjectForKey:@"PlugInKit.object"],
        v6 = objc_claimAutoreleasedReturnValue(),
        [(PKXPCObject *)v5 setObject:v6],
        v6,
        [(PKXPCObject *)v5 object],
        v7 = (PKXPCObject *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v7 = v5;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"This object may only be decoded by an NSXPCCoder."];
  }
  id v4 = [(PKXPCObject *)self object];
  [v5 encodeXPCObject:v4 forKey:@"PlugInKit.object"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OS_xpc_object)object
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
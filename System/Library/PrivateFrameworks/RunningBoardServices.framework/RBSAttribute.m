@interface RBSAttribute
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (RBSAttribute)init;
- (RBSAttribute)initWithRBSXPCCoder:(id)a3;
- (id)_init;
@end

@implementation RBSAttribute

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (RBSAttribute)initWithRBSXPCCoder:(id)a3
{
  uint64_t v3 = self;
  if ([(RBSAttribute *)self isMemberOfClass:objc_opt_class()])
  {
    v4 = rbs_assertion_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[RBSAttribute initWithRBSXPCCoder:](v4);
    }

    v5 = 0;
  }
  else
  {
    uint64_t v3 = (RBSAttribute *)[(RBSAttribute *)v3 _init];
    v5 = v3;
  }

  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)RBSAttribute;
  return [(RBSAttribute *)&v3 init];
}

- (RBSAttribute)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSAttribute.m" lineNumber:17 description:@"-init is not allowed on RBSAttribute"];

  return 0;
}

- (NSString)description
{
  id v2 = [NSString alloc];
  objc_super v3 = [(id)objc_opt_class() description];
  v4 = (void *)[v2 initWithFormat:@"<%@>", v3];

  return (NSString *)v4;
}

- (void)initWithRBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_191FE8000, log, OS_LOG_TYPE_FAULT, "RBSAttribute initialized without valid subclass", v1, 2u);
}

@end
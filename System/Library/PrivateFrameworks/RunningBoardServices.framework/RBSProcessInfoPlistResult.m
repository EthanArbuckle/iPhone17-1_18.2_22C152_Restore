@interface RBSProcessInfoPlistResult
+ (BOOL)supportsRBSXPCSecureCoding;
- (RBSProcessInfoPlistResult)initWithRBSXPCCoder:(id)a3;
- (id)value;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation RBSProcessInfoPlistResult

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessInfoPlistResult)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSProcessInfoPlistResult;
  v5 = [(RBSProcessInfoPlistResult *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"_value"];
    uint64_t v7 = RBSXPCUnpackObject(v6);
    id value = v5->_value;
    v5->_id value = (id)v7;
  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id value = self->_value;
  id v4 = a3;
  RBSXPCPackObject(value);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeXPCObject:v5 forKey:@"_value"];
}

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return self->_value;
}

@end
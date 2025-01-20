@interface RBSRequest
+ (BOOL)supportsRBSXPCSecureCoding;
- (RBSRequest)init;
- (id)_init;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSRequest

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)RBSRequest;
  return [(RBSRequest *)&v3 init];
}

- (RBSRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSRequest.m" lineNumber:23 description:@"-init is not allowed on RBSRequest"];

  return 0;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t v5 = objc_opt_class();
  MEMORY[0x1F40E7228](self, a2, v5);
}

@end
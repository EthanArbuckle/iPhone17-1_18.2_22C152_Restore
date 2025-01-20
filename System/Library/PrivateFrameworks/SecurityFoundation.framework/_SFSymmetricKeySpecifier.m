@interface _SFSymmetricKeySpecifier
- (int64_t)keyLengthInBytes;
@end

@implementation _SFSymmetricKeySpecifier

- (void).cxx_destruct
{
}

- (int64_t)keyLengthInBytes
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"SFKey.m", 223, @"%@ key specifiers are not yet supported", v6 object file lineNumber description];

  return 0;
}

@end
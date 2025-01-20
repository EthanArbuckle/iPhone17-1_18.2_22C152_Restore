@interface NSFileHandle(BSXPCSecureCoding)
+ (uint64_t)supportsBSXPCSecureCoding;
- (id)initWithBSXPCCoder:()BSXPCSecureCoding;
- (void)encodeWithBSXPCCoder:()BSXPCSecureCoding;
@end

@implementation NSFileHandle(BSXPCSecureCoding)

+ (uint64_t)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:()BSXPCSecureCoding
{
  id v4 = a3;
  id v5 = xpc_fd_create([a1 fileDescriptor]);
  [v4 encodeXPCObject:v5 forKey:@"fileDescriptor"];
}

- (id)initWithBSXPCCoder:()BSXPCSecureCoding
{
  id v4 = [a3 decodeXPCObjectOfType:MEMORY[0x263EF8728] forKey:@"fileDescriptor"];
  id v5 = v4;
  if (v4)
  {
    a1 = (id)[a1 initWithFileDescriptor:xpc_fd_dup(v4) closeOnDealloc:1];
    id v6 = a1;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end
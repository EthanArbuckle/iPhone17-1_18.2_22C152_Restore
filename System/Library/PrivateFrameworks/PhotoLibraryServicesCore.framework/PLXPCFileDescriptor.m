@interface PLXPCFileDescriptor
+ (_xpc_type_s)type;
@end

@implementation PLXPCFileDescriptor

+ (_xpc_type_s)type
{
  return (_xpc_type_s *)MEMORY[0x1E4F145B0];
}

@end
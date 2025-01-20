@interface PLXPCShMemObject
+ (_xpc_type_s)type;
@end

@implementation PLXPCShMemObject

+ (_xpc_type_s)type
{
  return (_xpc_type_s *)MEMORY[0x1E4F145E8];
}

@end
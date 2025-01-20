@interface PLXPCDictionary
+ (_xpc_type_s)type;
@end

@implementation PLXPCDictionary

+ (_xpc_type_s)type
{
  return (_xpc_type_s *)MEMORY[0x1E4F14590];
}

@end
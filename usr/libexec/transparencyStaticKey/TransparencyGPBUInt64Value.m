@interface TransparencyGPBUInt64Value
+ (id)descriptor;
@end

@implementation TransparencyGPBUInt64Value

+ (id)descriptor
{
  id result = (id)qword_1000A7428;
  if (!qword_1000A7428)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBUInt64Value messageName:@"UInt64Value" fileDescription:off_1000A5748 fields:&off_1000A57A0 fieldCount:1 storageSize:16 flags:v3];
    qword_1000A7428 = (uint64_t)result;
  }
  return result;
}

@end
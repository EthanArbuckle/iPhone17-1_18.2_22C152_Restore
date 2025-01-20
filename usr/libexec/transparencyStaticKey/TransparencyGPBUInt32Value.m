@interface TransparencyGPBUInt32Value
+ (id)descriptor;
@end

@implementation TransparencyGPBUInt32Value

+ (id)descriptor
{
  id result = (id)qword_1000A7438;
  if (!qword_1000A7438)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBUInt32Value messageName:@"UInt32Value" fileDescription:off_1000A5748 fields:&off_1000A57E0 fieldCount:1 storageSize:8 flags:v3];
    qword_1000A7438 = (uint64_t)result;
  }
  return result;
}

@end
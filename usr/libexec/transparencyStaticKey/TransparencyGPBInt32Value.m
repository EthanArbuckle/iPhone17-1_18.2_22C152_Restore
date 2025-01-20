@interface TransparencyGPBInt32Value
+ (id)descriptor;
@end

@implementation TransparencyGPBInt32Value

+ (id)descriptor
{
  id result = (id)qword_1000A7430;
  if (!qword_1000A7430)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBInt32Value messageName:@"Int32Value" fileDescription:off_1000A5748 fields:&off_1000A57C0 fieldCount:1 storageSize:8 flags:v3];
    qword_1000A7430 = (uint64_t)result;
  }
  return result;
}

@end
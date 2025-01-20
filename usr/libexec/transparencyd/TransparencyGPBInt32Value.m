@interface TransparencyGPBInt32Value
+ (id)descriptor;
@end

@implementation TransparencyGPBInt32Value

+ (id)descriptor
{
  id result = (id)qword_10032EC18;
  if (!qword_10032EC18)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBInt32Value messageName:@"Int32Value" fileDescription:off_100323D98 fields:&off_100323E10 fieldCount:1 storageSize:8 flags:v3];
    qword_10032EC18 = (uint64_t)result;
  }
  return result;
}

@end
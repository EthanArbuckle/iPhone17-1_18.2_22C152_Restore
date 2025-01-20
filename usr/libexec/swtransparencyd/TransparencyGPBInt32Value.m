@interface TransparencyGPBInt32Value
+ (id)descriptor;
@end

@implementation TransparencyGPBInt32Value

+ (id)descriptor
{
  id result = (id)qword_1001621E0;
  if (!qword_1001621E0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBInt32Value messageName:@"Int32Value" fileDescription:off_10015AE08 fields:&off_10015AE80 fieldCount:1 storageSize:8 flags:v3];
    qword_1001621E0 = (uint64_t)result;
  }
  return result;
}

@end
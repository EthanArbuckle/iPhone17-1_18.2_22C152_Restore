@interface SignedObject
+ (id)descriptor;
@end

@implementation SignedObject

+ (id)descriptor
{
  id result = (id)qword_10015B208;
  if (!qword_10015B208)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:SignedObject messageName:@"SignedObject" fileDescription:&unk_1001560A0 fields:&off_100156158 fieldCount:2 storageSize:24 flags:v3];
    qword_10015B208 = (uint64_t)result;
  }
  return result;
}

@end
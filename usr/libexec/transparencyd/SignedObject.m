@interface SignedObject
+ (id)descriptor;
@end

@implementation SignedObject

+ (id)descriptor
{
  id result = (id)qword_10032EDA0;
  if (!qword_10032EDA0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:SignedObject messageName:@"SignedObject" fileDescription:&unk_100324E10 fields:&off_100324EC8 fieldCount:2 storageSize:24 flags:v3];
    qword_10032EDA0 = (uint64_t)result;
  }
  return result;
}

@end
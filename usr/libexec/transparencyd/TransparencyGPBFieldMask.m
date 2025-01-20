@interface TransparencyGPBFieldMask
+ (id)descriptor;
@end

@implementation TransparencyGPBFieldMask

+ (id)descriptor
{
  id result = (id)qword_10032EB48;
  if (!qword_10032EB48)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBFieldMask messageName:@"FieldMask" fileDescription:off_1003237F8 fields:&off_1003237D8 fieldCount:1 storageSize:16 flags:v3];
    qword_10032EB48 = (uint64_t)result;
  }
  return result;
}

@end
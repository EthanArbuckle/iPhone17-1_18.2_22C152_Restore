@interface TransparencyGPBFieldMask
+ (id)descriptor;
@end

@implementation TransparencyGPBFieldMask

+ (id)descriptor
{
  id result = (id)qword_1000A7458;
  if (!qword_1000A7458)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBFieldMask messageName:@"FieldMask" fileDescription:off_1000A5880 fields:&off_1000A5860 fieldCount:1 storageSize:16 flags:v3];
    qword_1000A7458 = (uint64_t)result;
  }
  return result;
}

@end
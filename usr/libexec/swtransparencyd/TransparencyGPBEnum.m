@interface TransparencyGPBEnum
+ (id)descriptor;
@end

@implementation TransparencyGPBEnum

+ (id)descriptor
{
  id result = (id)qword_100162198;
  if (!qword_100162198)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBEnum messageName:@"Enum" fileDescription:off_10015AB50 fields:&off_10015ACA8 fieldCount:5 storageSize:40 flags:v3];
    qword_100162198 = (uint64_t)result;
  }
  return result;
}

@end
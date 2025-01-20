@interface TransparencyGPBType
+ (id)descriptor;
@end

@implementation TransparencyGPBType

+ (id)descriptor
{
  id result = (id)qword_100162188;
  if (!qword_100162188)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBType messageName:@"Type" fileDescription:off_10015AB50 fields:&off_10015AA90 fieldCount:6 storageSize:48 flags:v3];
    qword_100162188 = (uint64_t)result;
  }
  return result;
}

@end
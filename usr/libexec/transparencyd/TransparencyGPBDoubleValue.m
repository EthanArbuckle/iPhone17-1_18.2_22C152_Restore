@interface TransparencyGPBDoubleValue
+ (id)descriptor;
@end

@implementation TransparencyGPBDoubleValue

+ (id)descriptor
{
  id result = (id)qword_10032EBF8;
  if (!qword_10032EBF8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBDoubleValue messageName:@"DoubleValue" fileDescription:off_100323D98 fields:&off_100323D78 fieldCount:1 storageSize:16 flags:v3];
    qword_10032EBF8 = (uint64_t)result;
  }
  return result;
}

@end
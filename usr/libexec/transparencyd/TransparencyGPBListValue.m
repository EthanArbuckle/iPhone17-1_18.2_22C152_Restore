@interface TransparencyGPBListValue
+ (id)descriptor;
@end

@implementation TransparencyGPBListValue

+ (id)descriptor
{
  id result = (id)qword_10032EB98;
  if (!qword_10032EB98)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBListValue messageName:@"ListValue" fileDescription:off_1003238C8 fields:&off_1003239A8 fieldCount:1 storageSize:16 flags:v3];
    qword_10032EB98 = (uint64_t)result;
  }
  return result;
}

@end
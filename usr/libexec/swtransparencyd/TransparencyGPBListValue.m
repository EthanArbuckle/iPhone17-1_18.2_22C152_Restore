@interface TransparencyGPBListValue
+ (id)descriptor;
@end

@implementation TransparencyGPBListValue

+ (id)descriptor
{
  id result = (id)qword_100162160;
  if (!qword_100162160)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBListValue messageName:@"ListValue" fileDescription:off_10015A938 fields:&off_10015AA18 fieldCount:1 storageSize:16 flags:v3];
    qword_100162160 = (uint64_t)result;
  }
  return result;
}

@end
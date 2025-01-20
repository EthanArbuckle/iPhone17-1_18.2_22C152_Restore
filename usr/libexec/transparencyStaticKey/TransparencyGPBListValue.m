@interface TransparencyGPBListValue
+ (id)descriptor;
@end

@implementation TransparencyGPBListValue

+ (id)descriptor
{
  id result = (id)qword_1000A7630;
  if (!qword_1000A7630)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBListValue messageName:@"ListValue" fileDescription:off_1000A69C8 fields:&off_1000A6AA8 fieldCount:1 storageSize:16 flags:v3];
    qword_1000A7630 = (uint64_t)result;
  }
  return result;
}

@end
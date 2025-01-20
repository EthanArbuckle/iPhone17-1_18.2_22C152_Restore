@interface TransparencyGPBField
+ (id)descriptor;
@end

@implementation TransparencyGPBField

+ (id)descriptor
{
  id v2 = (id)qword_1000A7568;
  if (!qword_1000A7568)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBField messageName:@"Field" fileDescription:off_1000A5F70 fields:&off_1000A5F88 fieldCount:10 storageSize:64 flags:v4];
    [v2 setupExtraTextInfo:&unk_100085618];
    qword_1000A7568 = (uint64_t)v2;
  }
  return v2;
}

@end
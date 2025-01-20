@interface TransparencyGPBMethod
+ (id)descriptor;
@end

@implementation TransparencyGPBMethod

+ (id)descriptor
{
  id v2 = (id)qword_1000A75A8;
  if (!qword_1000A75A8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBMethod messageName:@"Method" fileDescription:off_1000A6468 fields:&off_1000A6480 fieldCount:7 storageSize:40 flags:v4];
    [v2 setupExtraTextInfo:&unk_100085620];
    qword_1000A75A8 = (uint64_t)v2;
  }
  return v2;
}

@end
@interface Signature
+ (id)descriptor;
@end

@implementation Signature

+ (id)descriptor
{
  id v2 = (id)qword_10015B200;
  if (!qword_10015B200)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:Signature messageName:@"Signature" fileDescription:&unk_1001560A0 fields:&off_1001560F8 fieldCount:3 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A1E9];
    qword_10015B200 = (uint64_t)v2;
  }
  return v2;
}

@end
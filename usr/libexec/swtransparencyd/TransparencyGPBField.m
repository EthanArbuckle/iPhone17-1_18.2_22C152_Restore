@interface TransparencyGPBField
+ (id)descriptor;
@end

@implementation TransparencyGPBField

+ (id)descriptor
{
  id v2 = (id)qword_100162190;
  if (!qword_100162190)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBField messageName:@"Field" fileDescription:off_10015AB50 fields:&off_10015AB68 fieldCount:10 storageSize:64 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010E720];
    qword_100162190 = (uint64_t)v2;
  }
  return v2;
}

@end
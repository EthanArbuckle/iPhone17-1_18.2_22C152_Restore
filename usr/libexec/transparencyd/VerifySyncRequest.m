@interface VerifySyncRequest
+ (id)descriptor;
@end

@implementation VerifySyncRequest

+ (id)descriptor
{
  id v2 = (id)qword_10032ECD8;
  if (!qword_10032ECD8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:VerifySyncRequest messageName:@"VerifySyncRequest" fileDescription:&unk_100324200 fields:&off_100324680 fieldCount:8 storageSize:56 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AF7C];
    qword_10032ECD8 = (uint64_t)v2;
  }
  return v2;
}

@end
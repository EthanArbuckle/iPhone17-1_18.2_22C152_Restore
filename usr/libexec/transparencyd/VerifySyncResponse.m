@interface VerifySyncResponse
+ (id)descriptor;
@end

@implementation VerifySyncResponse

+ (id)descriptor
{
  id v2 = (id)qword_10032ECE8;
  if (!qword_10032ECE8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:VerifySyncResponse messageName:@"VerifySyncResponse" fileDescription:&unk_100324200 fields:&off_100324880 fieldCount:3 storageSize:16 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AF6C];
    qword_10032ECE8 = (uint64_t)v2;
  }
  return v2;
}

@end
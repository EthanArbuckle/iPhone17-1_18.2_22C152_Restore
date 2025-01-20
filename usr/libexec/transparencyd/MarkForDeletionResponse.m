@interface MarkForDeletionResponse
+ (id)descriptor;
@end

@implementation MarkForDeletionResponse

+ (id)descriptor
{
  id v2 = (id)qword_10032ECC8;
  if (!qword_10032ECC8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:MarkForDeletionResponse messageName:@"MarkForDeletionResponse" fileDescription:&unk_100324200 fields:&off_100324580 fieldCount:4 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AFB0];
    qword_10032ECC8 = (uint64_t)v2;
  }
  return v2;
}

@end
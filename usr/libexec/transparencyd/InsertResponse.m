@interface InsertResponse
+ (id)descriptor;
@end

@implementation InsertResponse

+ (id)descriptor
{
  id v2 = (id)qword_10032ECC0;
  if (!qword_10032ECC0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:InsertResponse messageName:@"InsertResponse" fileDescription:&unk_100324200 fields:&off_100324500 fieldCount:4 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AFA8];
    qword_10032ECC0 = (uint64_t)v2;
  }
  return v2;
}

@end
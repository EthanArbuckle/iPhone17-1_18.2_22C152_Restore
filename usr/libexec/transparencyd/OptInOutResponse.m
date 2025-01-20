@interface OptInOutResponse
+ (id)descriptor;
@end

@implementation OptInOutResponse

+ (id)descriptor
{
  id v2 = (id)qword_10032ECD0;
  if (!qword_10032ECD0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:OptInOutResponse messageName:@"OptInOutResponse" fileDescription:&unk_100324200 fields:&off_100324600 fieldCount:4 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AFB0];
    qword_10032ECD0 = (uint64_t)v2;
  }
  return v2;
}

@end
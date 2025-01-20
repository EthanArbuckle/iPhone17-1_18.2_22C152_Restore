@interface PerApplicationTreeConfigNode
+ (id)descriptor;
@end

@implementation PerApplicationTreeConfigNode

+ (id)descriptor
{
  id v2 = (id)qword_10032EDF0;
  if (!qword_10032EDF0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:PerApplicationTreeConfigNode messageName:@"PerApplicationTreeConfigNode" fileDescription:&unk_100324E10 fields:&off_100325368 fieldCount:3 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B3BC];
    qword_10032EDF0 = (uint64_t)v2;
  }
  return v2;
}

@end
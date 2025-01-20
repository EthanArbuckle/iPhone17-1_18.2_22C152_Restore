@interface TopLevelTreeConfigNode
+ (id)descriptor;
@end

@implementation TopLevelTreeConfigNode

+ (id)descriptor
{
  id v2 = (id)qword_10032EDF8;
  if (!qword_10032EDF8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TopLevelTreeConfigNode messageName:@"TopLevelTreeConfigNode" fileDescription:&unk_100324E10 fields:&off_1003253C8 fieldCount:2 storageSize:16 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B3D0];
    qword_10032EDF8 = (uint64_t)v2;
  }
  return v2;
}

@end
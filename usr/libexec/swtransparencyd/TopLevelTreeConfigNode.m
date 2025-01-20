@interface TopLevelTreeConfigNode
+ (id)descriptor;
@end

@implementation TopLevelTreeConfigNode

+ (id)descriptor
{
  id v2 = (id)qword_10015B260;
  if (!qword_10015B260)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TopLevelTreeConfigNode messageName:@"TopLevelTreeConfigNode" fileDescription:&unk_1001560A0 fields:&off_100156658 fieldCount:2 storageSize:16 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A290];
    qword_10015B260 = (uint64_t)v2;
  }
  return v2;
}

@end
@interface TopLevelTreeNode
+ (id)descriptor;
@end

@implementation TopLevelTreeNode

+ (id)descriptor
{
  id v2 = (id)qword_10015B250;
  if (!qword_10015B250)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TopLevelTreeNode messageName:@"TopLevelTreeNode" fileDescription:&unk_1001560A0 fields:&off_1001565D8 fieldCount:1 storageSize:16 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A273];
    qword_10015B250 = (uint64_t)v2;
  }
  return v2;
}

@end
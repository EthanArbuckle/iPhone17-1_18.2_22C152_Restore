@interface TopLevelTreeNode
+ (id)descriptor;
@end

@implementation TopLevelTreeNode

+ (id)descriptor
{
  id v2 = (id)qword_10032EDE8;
  if (!qword_10032EDE8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TopLevelTreeNode messageName:@"TopLevelTreeNode" fileDescription:&unk_100324E10 fields:&off_100325348 fieldCount:1 storageSize:16 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B3B7];
    qword_10032EDE8 = (uint64_t)v2;
  }
  return v2;
}

@end
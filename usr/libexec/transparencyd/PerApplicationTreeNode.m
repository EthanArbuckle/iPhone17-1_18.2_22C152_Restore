@interface PerApplicationTreeNode
+ (id)descriptor;
@end

@implementation PerApplicationTreeNode

+ (id)descriptor
{
  id v2 = (id)qword_10032EDE0;
  if (!qword_10032EDE0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:PerApplicationTreeNode messageName:@"PerApplicationTreeNode" fileDescription:&unk_100324E10 fields:&off_100325328 fieldCount:1 storageSize:16 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B3B2];
    qword_10032EDE0 = (uint64_t)v2;
  }
  return v2;
}

@end
@interface PerApplicationTreeNode
+ (id)descriptor;
@end

@implementation PerApplicationTreeNode

+ (id)descriptor
{
  id v2 = (id)qword_10015B248;
  if (!qword_10015B248)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:PerApplicationTreeNode messageName:@"PerApplicationTreeNode" fileDescription:&unk_1001560A0 fields:&off_1001565B8 fieldCount:1 storageSize:16 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A26E];
    qword_10015B248 = (uint64_t)v2;
  }
  return v2;
}

@end
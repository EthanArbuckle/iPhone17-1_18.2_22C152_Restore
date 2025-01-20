@interface ChangeLogNodeV2
+ (id)descriptor;
@end

@implementation ChangeLogNodeV2

+ (id)descriptor
{
  id result = (id)qword_10032EDD8;
  if (!qword_10032EDD8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:ChangeLogNodeV2 messageName:@"ChangeLogNodeV2" fileDescription:&unk_100324E10 fields:&off_100325308 fieldCount:1 storageSize:16 flags:v3];
    qword_10032EDD8 = (uint64_t)result;
  }
  return result;
}

@end
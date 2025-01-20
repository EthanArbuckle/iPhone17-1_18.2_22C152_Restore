@interface ChangeLogNodeV2
+ (id)descriptor;
@end

@implementation ChangeLogNodeV2

+ (id)descriptor
{
  id result = (id)qword_10015B240;
  if (!qword_10015B240)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:ChangeLogNodeV2 messageName:@"ChangeLogNodeV2" fileDescription:&unk_1001560A0 fields:&off_100156598 fieldCount:1 storageSize:16 flags:v3];
    qword_10015B240 = (uint64_t)result;
  }
  return result;
}

@end
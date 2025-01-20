@interface Gossip
+ (id)descriptor;
@end

@implementation Gossip

+ (id)descriptor
{
  id result = (id)qword_10032ED30;
  if (!qword_10032ED30)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:Gossip messageName:@"Gossip" fileDescription:&unk_100324D98 fields:&off_100324D58 fieldCount:2 storageSize:16 flags:v3];
    qword_10032ED30 = (uint64_t)result;
  }
  return result;
}

@end
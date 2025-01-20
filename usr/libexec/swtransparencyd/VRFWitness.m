@interface VRFWitness
+ (id)descriptor;
@end

@implementation VRFWitness

+ (id)descriptor
{
  id result = (id)qword_10015B1F0;
  if (!qword_10015B1F0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:VRFWitness messageName:@"VRFWitness" fileDescription:&unk_1001560A0 fields:&off_100156040 fieldCount:3 storageSize:24 flags:v3];
    qword_10015B1F0 = (uint64_t)result;
  }
  return result;
}

@end
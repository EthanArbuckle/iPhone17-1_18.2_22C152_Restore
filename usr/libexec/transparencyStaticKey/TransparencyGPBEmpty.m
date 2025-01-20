@interface TransparencyGPBEmpty
+ (id)descriptor;
@end

@implementation TransparencyGPBEmpty

+ (id)descriptor
{
  id result = (id)qword_1000A74C0;
  if (!qword_1000A74C0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBEmpty messageName:@"Empty" fileDescription:off_1000A5C38 fields:0 fieldCount:0 storageSize:4 flags:v3];
    qword_1000A74C0 = (uint64_t)result;
  }
  return result;
}

@end